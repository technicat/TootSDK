extension TootClient {

    /// https://docs.joinmastodon.org/methods/lists/#accounts-add
    public func add(to list: List, accounts: [Account]) async throws {
        let params = AddAccountsToListParams(accountIds: accounts.map { $0.id })
        return try await addAccountsToList(
            id: list.id,
            params: params)
    }
}
