extension TootClient {

    /// https://docs.joinmastodon.org/methods/lists/#accounts
    public func getAccounts(
        in list: List,
        _ page: PagedInfo? = nil,
        limit: Int? = nil
    ) async throws -> PagedResult<[Account]> {
        try await getListAccounts(
            id: list.id,
            page,
            limit: limit)
    }

}
