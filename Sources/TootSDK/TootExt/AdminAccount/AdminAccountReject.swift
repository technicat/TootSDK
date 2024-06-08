extension TootClient {
    
    /// https://docs.joinmastodon.org/methods/admin/accounts/#reject
    public func approve(_ account: AdminAccount) async throws -> AdminAccount {
        try await rejectAccount(by: account.id)
    }
}
