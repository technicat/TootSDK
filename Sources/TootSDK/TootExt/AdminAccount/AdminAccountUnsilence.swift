extension TootClient {
    
    /// https://docs.joinmastodon.org/methods/admin/accounts/#unsilence
    public func unsilence(_ account: AdminAccount) async throws -> AdminAccount {
        try await unsilenceAccount(by: account.id)
    }
}
