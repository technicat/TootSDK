extension TootClient {

    /// https://docs.joinmastodon.org/methods/admin/accounts/#unsensitive
    public func unsensitive(_ account: AdminAccount) async throws -> AdminAccount {
        try await unsensitiveAccount(by: account.id)
    }
}
