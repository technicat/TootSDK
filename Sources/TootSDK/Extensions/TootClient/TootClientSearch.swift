extension TootClient {
    public func findAccounts(
        _ query: String,
        offset: Int? = nil,
        limit: Int? = 80,
        order: ProfileDirectoryParams.Order? = nil,
        local: Bool? = nil
    ) async throws -> [Account] {
        try await searchAccounts(
            // should trim?
            params: SearchAccountsParams(query: query),
            limit: limit, offset: offset
        )
    }
}
