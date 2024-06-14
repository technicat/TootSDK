extension TootClient {

    /// https://docs.joinmastodon.org/methods/accounts/#follow
    @discardableResult
    public func follow(
        _ account: Account,
        includeBoosts: Bool = true,
        onlyLanguages: [ISOCode]? = nil,
        notifyPosts: Bool = false
    ) async throws -> Relationship {
        let params = FollowAccountParams(
            reposts: includeBoosts,
            notify: notifyPosts,
            languages: onlyLanguages?.map { $0.rawValue })
        return try await followAccount(by: account.id, params: params)
    }

    /// https://docs.joinmastodon.org/methods/accounts/#unfollow
    public func unFollow(_ account: Account) async throws -> Relationship {
        try await unfollowAccount(by: account.id)
    }

    /// Follow the given account; can be be the account name on the instance you're on, or the user's URI
    /// - Parameter uri: account name on the instance you're on or a users URI (e.g @test@instance.test)
    /// - Returns: your relationship with that account after following
    public func followAccount(uri: String) async throws -> Relationship? {
        // lookupAccount doesn't resolve
        guard let account = try await findAccount(uri: uri) else {
            return nil
        }
        return try await follow(account)
    }

    /// followAccount seems to work fine on Pleroma
    /// so this is just here for completeness
    public func pleromaFollowAccount(uri: String) async throws -> Relationship {
        try await followAccount(params: PleromaFollowByURIParams(uri: uri))
    }
}
