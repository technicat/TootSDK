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
    case unexpectedError(_ description: String)
    /// The remote instance did not respond with the expected payload during authorization
    case clientAuthorizationFailed
    /// A "this should never happen" assertion has failed
    case internalError(_ description: String)
    /// A specific error message was returned from the server
    case serverError(_ message: String)
    /// The server does not have a streaming endpoint.
    case streamingUnsupported
    /// The streaming API is unhealthy.
    case streamingEndpointUnhealthy
    /// Cannot start streaming because there are no subscriptions to any streaming timelines.
    case noSubscriptions
    /// Unable to start streaming becasue the parent ``TootClient`` of a ``StreamingClient`` has already been deinitialized. Make sure you aren't storing a reference to the ``StreamingClient`` past the end of the ``TootClient`` lifecycle.
    case clientDeinited
    case streamingClientReachedMaxRetries(lastFailureReason: String)
    case streamingClientReachedMaxConnectionAttempts(lastFailureReason: String)
    case nodeInfoUnsupported

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
        case .unexpectedError(let description):
            return "Unexpected error: \(description)"
        case .clientAuthorizationFailed:
            return "The remote instance did not respond with the expected payload during authorization."
        case .internalError(let description):
            return "[TootSDK bug] " + description + "."
        case .serverError(let message):
            return message
        case .streamingUnsupported:
            return "The remote instance does not provide a streaming endpoint."
        case .streamingEndpointUnhealthy:
            return "The streaming endpoint is not alive."
        case .noSubscriptions:
            return "Cannot start streaming because there are no subscriptions to any streaming timelines."
        case .clientDeinited:
            return "The parent TootClient of the streaming client has already been deinitialized."
        case .streamingClientReachedMaxRetries(let lastFailureReason):
            return "Streaming client reached retry limit. Most recent attempt failed with reason: \(lastFailureReason)"
        case .streamingClientReachedMaxConnectionAttempts(let lastFailureReason):
            return "Streaming client reached connection attempt limit. Most recent connection failed with reason: \(lastFailureReason)"
        case .nodeInfoUnsupported:
            return "The remote instance doesn't support nodeinfo endpoint."
        }
    }
}
