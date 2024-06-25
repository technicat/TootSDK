// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

// MARK: - Initialization
final public class TootClient: @unchecked Sendable {

    // MARK: - Public properties
    /// The URL of the instance we're connected to
    public var instanceURL: URL
    /// The application info retrieved from the instance
    public var currentApplicationInfo: TootApplication?
    /// Set this to `true` to see a `print()` of outgoing requests.
    public var debugRequests: Bool = false
    /// Set this to `true` to see a `print()` of request response.
    public var debugResponses: Bool = false
    /// Set this to `true` to see a `print()` for instance information.
    public var debugInstance: Bool = false
    /// The authorization scopes the client was initialized with
    public var scopes: [OAuthScope]? = nil
    /// Data streams that the client can subscribe to
    public lazy var data = TootDataStream(client: self)
    /// The clientName the client was initialized with
    public let clientName: String

    // MARK: - Internal properties
    internal var decoder: JSONDecoder = TootDecoder()
    internal var encoder: JSONEncoder = TootEncoder()
    internal var session: URLSession
    internal let validStatusCodes = 200..<300
    /// The current accessToken in use
    internal var accessToken: String?

    #if canImport(AuthenticationServices) && !os(tvOS) && !os(watchOS)
        internal lazy var defaultPresentationAnchor: TootPresentationAnchor = TootPresentationAnchor()
    #endif

    /// Initialize a new instance of `TootClient` by optionally providing an access token for authentication.
    ///
    /// - Parameters:
    ///   - clientName: Name of the client to be used in outgoing HTTP requests. Defaults to `TootSDK`
    ///   - session: the URLSession being used internally, defaults to shared
    ///   - instanceURL: the instance you are connecting to
    ///   - accessToken: the existing access token; if you already have one
    ///   - scopes: An array of authentication scopes, defaults to `"read", "write", "follow", "push"`
    public init(
        clientName: String = "TootSDK",
        session: URLSession = URLSession.shared,
        instanceURL: URL,
        accessToken: String? = nil,
        scopes: [OAuthScope]? = nil
    ) {
        self.session = session
        self.instanceURL = instanceURL
        self.accessToken = accessToken
        self.scopes = scopes
        self.clientName = clientName
    }

    /// Prints extra debug details like outgoing requests and responses
    public func debugOn() {
        self.debugRequests = true
        self.debugResponses = true
        self.debugInstance = true
    }

    /// Stops printing debug details
    public func debugOff() {
        self.debugRequests = false
        self.debugResponses = false
        self.debugInstance = false
    }
}

// MARK: - Encoding/Decoding and fetching data
extension TootClient {

    internal func decode<T: Decodable>(_ decodable: T.Type, from data: Data) throws -> T {
        do {
            return try decoder.decode(decodable, from: data)
        } catch {
            let description = fetchError(T.self, data: data)

            if debugResponses {
                print(description)
            }

            throw TootSDKError.decodingError(description)
        }
    }

    /// Fetch data asynchronously and return the decoded `Decodable` object.
    internal func fetch<T: Decodable>(_ decode: T.Type, _ req: HTTPRequestBuilder) async throws -> T {
        let (data, _) = try await fetch(req: req)

        do {
            return try decoder.decode(decode, from: data)
        } catch {
            let description = fetchError(T.self, data: data)

            if debugResponses {
                print(description)
            }

            throw TootSDKError.decodingError(description)
        }
    }

    private func fetchError<T: Decodable>(_ decode: T.Type, data: Data) -> String {
        var description: String = "Unknown decoding error"

        do {
            _ = try decoder.decode(decode, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            description = "context: \(context)"
        } catch let DecodingError.keyNotFound(key, context) {
            description = "Key '\(key)' not found:\(context.debugDescription)\n codingPath:\(context.codingPath)"
        } catch let DecodingError.valueNotFound(value, context) {
            description = "Value '\(value)' not found:\(context.debugDescription)\n codingPath:\(context.codingPath)"
        } catch let DecodingError.typeMismatch(type, context) {
            description = "Type '\(type)' mismatch:\(context.debugDescription)\n codingPath:\(context.codingPath)"
        } catch {
            description = error.localizedDescription
        }

        return description
    }

    /// Fetch data asynchronously and return the raw response.
    internal func fetch(req: HTTPRequestBuilder) async throws -> (Data, HTTPURLResponse) {
        // this should be set appropriately already
        // if req.headers.index(forKey: "Content-Type") == nil {
        //     req.headers["Content-Type"] = "application/json"
        // }

        // need this for Sharkey but seems to be generally correct
        if req.body == nil {
            req.headers["Content-Type"] = nil
            if req.method != .get {
                req.headers["Content-Length"] = "0"
            }
        }

        if req.headers.index(forKey: "Accept") == nil {
            req.headers["Accept"] = "application/json"
        }

        if req.headers.index(forKey: "User-Agent") == nil {
            req.headers["User-Agent"] = clientName
        }

        if let accessToken = accessToken {
            req.headers["Authorization"] = "Bearer \(accessToken)"
        }

        let request = try req.build()
        return try await dataTask(request)
    }

    internal func dataTask(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        if debugRequests {
            print("➡️ 🌏 \(request.httpMethod ?? "-") \(request.url?.absoluteString ?? "-")")
            for (k, v) in request.allHTTPHeaderFields ?? [:] {
                print("➡️ 🏷️ '\(k)': '\(v)'")
            }
            if let httpBody = request.httpBody {
                print("➡️ 💿", httpBody.prettyPrintedJSONString ?? String(data: httpBody, encoding: .utf8) ?? "Undecodable")
            }
        }
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw TootSDKError.nonHTTPURLResponse(data: data, response: response)
        }

        if debugResponses {
            print("⬅️ 🌍 \(httpResponse.url?.absoluteString ?? "-")")
            print("⬅️ 🚦 HTTP \(httpResponse.statusCode)")
            for (k, v) in httpResponse.allHeaderFields {
                print("⬅️ 🏷️ '\(k)': '\(v)'")
            }
            print("⬅️ 💿", data.prettyPrintedJSONString ?? String(data: data, encoding: .utf8) ?? "Undecodable")
        }

        guard validStatusCodes.contains(httpResponse.statusCode) else {
            throw TootSDKError.invalidStatusCode(data: data, response: httpResponse)
        }

        return (data, httpResponse)
    }

    /// Performs a request that returns paginated arrays
    /// - Parameters:
    ///   - req: the HTTP request to execute
    /// - Returns: the fetched paged array and page info
    internal func fetchPagedResult<T: Decodable>(_ req: HTTPRequestBuilder) async throws -> PagedResult<[T]> {

        let (data, response) = try await fetch(req: req)
        let decoded = try decode([T].self, from: data)
        var pagination: Pagination?

        if let links = response.value(forHTTPHeaderField: "Link") {
            pagination = Pagination(links: links)
        }

        let info = PagedInfo(maxId: pagination?.maxId, minId: pagination?.minId, sinceId: pagination?.sinceId)

        return PagedResult(result: decoded, info: info)
    }

}

extension TootClient: Equatable {
    public static func == (lhs: TootClient, rhs: TootClient) -> Bool {
        if lhs.instanceURL == rhs.instanceURL {
            return lhs.accessToken == rhs.accessToken
        } else {
            return false
        }
    }
}

extension TootClient {

    /// Provides the URL for authorizing with the current instanceURL
    /// - Returns: A URL which can be browsed to continue authorization
    public func createAuthorizeURL(callbackURI: String) async throws -> URL {
        return try await self.createAuthorizeURL(server: instanceURL, callbackURI: callbackURI)
    }

    /// Provides the URL for authorizing, with a custom server URL.
    /// - Returns: A URL which can be browsed to continue authorization
    public func createAuthorizeURL(server: URL, callbackURI: String) async throws -> URL {
        let authInfo = try await self.getAuthorizationInfo(callbackURI: callbackURI, scopes: self.scopes)
        currentApplicationInfo = authInfo.application
        return authInfo.url
    }

    /// Facility method to complete authentication by processing the response from the authorization step.
    /// Exchange the callback authorization code for an accessToken
    /// - Parameters:
    ///   - returnUrl: The full url including query parameters received by the service following the redirect after successfull authorizaiton
    ///   - callbackURI: The callback URI  (`redirect_uri`) which was used to initiate the authorization flow. Must match one of the redirect_uris declared during app registration.
    public func collectToken(returnUrl: URL, callbackURI: String) async throws -> String {

        guard
            let code = getCodeFrom(returnUrl: returnUrl),
            let clientId = currentApplicationInfo?.clientId,
            let clientSecret = currentApplicationInfo?.clientSecret
        else {
            throw TootSDKError.missingCodeOrClientSecrets
        }

        return try await collectToken(code: code, clientId: clientId, clientSecret: clientSecret, callbackURI: callbackURI)
    }

    private func getCodeFrom(returnUrl: URL) -> String? {
        var components = URLComponents()
        components.query = returnUrl.query
        return components.queryItems?.first(where: { $0.name == "code" })?.value
    }

    /// Exchange the callback authorization code for an accessToken.
    /// - Parameters:
    ///   - code: The authorization code returned by the server
    ///   - clientId: The client id of the application
    ///   - clientSecret: The client secret of the application
    ///   - callbackURI: The callback URL (`redirect_uri`) which was used to initiate the authorization flow.  Must match one of the redirect_uris declared during app registration.
    public func collectToken(code: String, clientId: String, clientSecret: String, callbackURI: String) async throws -> String {

        let info = try await getAccessToken(
            code: code, clientId: clientId,
            clientSecret: clientSecret,
            callbackURI: callbackURI,
            grantType: .login,
            scopes: scopes)

//        guard let accessToken = info.accessToken else {
//            throw TootSDKError.clientAuthorizationFailed
//        }

        self.accessToken = info.accessToken

        return info.accessToken
    }

    public func collectRegistrationToken(clientId: String, clientSecret: String, callbackURI: String) async throws -> String {

        let info = try await getAccessToken(
            code: nil, clientId: clientId,
            clientSecret: clientSecret,
            callbackURI: callbackURI,
            grantType: .register,
            scopes: scopes)

//        guard let accessToken = info.accessToken else {
//            throw TootSDKError.clientAuthorizationFailed
//        }

        self.accessToken = info.accessToken

        return info.accessToken
    }
}

extension TootClient {

    /// Returns `true` if this instance of `TootClient` has no `accessToken`.
    public var isAnonymous: Bool {
        accessToken == nil
    }
}
