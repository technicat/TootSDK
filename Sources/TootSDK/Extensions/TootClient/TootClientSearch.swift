extension TootClient {

    // todo - page
    public func search(
        for query: String,
        following: Bool = false,
        excludeUnreviewed: Bool = false,
        offset: Int? = nil,
        limit: Int? = nil
    ) async throws -> Search {
        let params = SearchParams(
            query: query,  // trim?
            resolve: false,
            following: following,
            excludeUnreviewed: excludeUnreviewed)
        return try await search(
            params: params,
            limit: limit,
            offset: offset)
    }
    
    public func search(for query: String, in account: Account) async throws -> Search {
      try await search(
        params: SearchParams(
          query: query, // trim?
          type: .posts,
          accountId: account.id))
    }

    /// https://docs.joinmastodon.org/methods/accounts/#search
    public func findAccounts(
        with query: String,
        offset: Int? = nil,
        limit: Int? = nil,
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
