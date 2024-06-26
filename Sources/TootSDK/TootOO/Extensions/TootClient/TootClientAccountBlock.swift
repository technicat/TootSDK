extension TootClient {

    /// https://docs.joinmastodon.org/methods/accounts/#block
    @discardableResult
    public func block(_ account: Account) async throws -> Relationship {
        try await blockAccount(by: account.id)
    }

    /// https://docs.joinmastodon.org/methods/accounts/#unblock
    @discardableResult
    public func unBlock(_ account: Account) async throws -> Relationship {
        try await unblockAccount(by: account.id)
    }
}
