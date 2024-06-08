extension TootClient {

    /// https://docs.joinmastodon.org/methods/admin/accounts/#unsuspend
    public func unsuspend(_ account: AdminAccount) async throws -> AdminAccount {
        try await unsuspendAccount(by: account.id)
    }
}
