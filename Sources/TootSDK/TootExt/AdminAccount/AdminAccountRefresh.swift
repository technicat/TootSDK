extension TootClient {
    
    /// https://docs.joinmastodon.org/methods/admin/accounts/#get-one
    public func refresh(_ account: AdminAccount) async throws -> Account {
        try await getAdminAccount(by: account.id)
    }
}
