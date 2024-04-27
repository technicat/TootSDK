extension TootClient {

    /// https://docs.joinmastodon.org/methods/lists/#get
    public func getLists(containing account: Account) async throws -> [List] {
        try await getListsContainingAccount(id: account.id)
    }

}
