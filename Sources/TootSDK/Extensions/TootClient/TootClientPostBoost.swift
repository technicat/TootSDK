extension TootClient {

    /// https://docs.joinmastodon.org/methods/statuses/#boost
    @discardableResult
    public func boost(_ post: Post) async throws -> Post {
        try await boostPost(id: post.id)
    }

    @discardableResult
    public func boost(_ post: Post, visibility: Post.Visibility) async throws -> Post {
        try await boostPost(
            id: post.id,
            params: BoostPostParams(visibility: visibility))
    }

    /// https://docs.joinmastodon.org/methods/statuses/#unboost
    @discardableResult
    public func unBoost(_ post: Post) async throws -> Post {
        try await unboostPost(id: post.id)
    }

    /// https://docs.joinmastodon.org/methods/statuses/#reblogged_by
    public func getBoosters(
        of post: Post,
        _ page: PagedInfo? = nil,
        limit: Int? = nil
    ) async throws -> PagedResult<[Account]> {
        try await getAccountsBoosted(id: post.id, page, limit: limit)
    }

}
