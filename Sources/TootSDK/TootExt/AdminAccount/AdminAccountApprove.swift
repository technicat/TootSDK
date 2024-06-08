extension TootClient {

    /// https://docs.joinmastodon.org/methods/admin/accounts/#approve
    public func approve(_ account: AdminAccount) async throws -> AdminAccount {
        try await approveAccount(by: account.id)
    }
}
