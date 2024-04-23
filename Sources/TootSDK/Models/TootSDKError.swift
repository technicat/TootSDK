// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

public enum TootSDKError: Error, LocalizedError, Equatable {
    case decodingError(_ description: String)
    case missingCodeOrClientSecrets
    case nonHTTPURLResponse(data: Data, response: URLResponse)
    case invalidStatusCode(data: Data, response: HTTPURLResponse)
    case requiredURLNotSet
    case missingParameter(parameterName: String)
    case unexpectedError(_ description: String)
    /// The remote instance did not respond with the expected payload during authorization
    case clientAuthorizationFailed
    /// A specific error message was returned from the server
    case serverError(_ message: String)
    /// post can't be scheduled less than five minutes from now
    case scheduledTooSoon(_ date: Date)

    public var errorDescription: String? {
        switch self {
        case .decodingError(let description):
            return "[TootSDK bug] There was an error decoding incoming data:\n" + description + "."
        case .missingCodeOrClientSecrets:
            return "Unable to complete authorization: the client id, client secret and authorization code must be set."
        case .nonHTTPURLResponse:
            return "Unexpected response."
        case .invalidStatusCode(let data, let response):
            return
                "HTTP \(response.statusCode) \(HTTPURLResponse.localizedString(forStatusCode: response.statusCode)) \(data.prettyPrintedJSONString ??  "Undecodable")"
        case .requiredURLNotSet:
            return "[TootSDK bug] HTTPRequestBuilder was used without setting a url."
        case .missingParameter(let parameterName):
            return "A required parameter is not provided: \(parameterName)."
        case .unexpectedError(let description):
            return "Unexpected error: \(description)"
        case .clientAuthorizationFailed:
            return "The remote instance did not respond with the expected payload during authorization."
        case .serverError(let message):
            return message
        case .scheduledTooSoon(_):
            return "Scheduled publish date is too soon."
        }
    }
}
