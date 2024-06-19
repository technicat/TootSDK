import Foundation

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
            scopes: scopes)
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
