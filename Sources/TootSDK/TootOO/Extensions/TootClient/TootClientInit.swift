import Foundation

/// https://docs.joinmastodon.org/api/oauth-scopes/
public enum OAuthScope: String {
    case read
    case write
    case follow
    case push
    case adminRead = "admin:read"
    case adminWrite = "admin:write"
    // todo - add granular scopes
}

extension TootClient {

    /// for login
    public convenience init(
        _ url: URL,
        client: String,
        scopes: [OAuthScope] = [],
        log: Bool = false
    ) throws {
        self.init(
            clientName: client,
            instanceURL: url,
            scopes: scopes.map { $0.rawValue })
        self.debug = log
    }

    /// to resume session
    public convenience init(
        _ url: URL,
        client: String,
        token: String
    ) throws {
        self.init(
            clientName: client,
            instanceURL: url,
            accessToken: token)
    }
}
