extension TootClient {

    /// https://docs.joinmastodon.org/methods/statuses/#bookmark
    @discardableResult
    public func bookmark(_ post: Post) async throws -> Post {
        try await bookmarkPost(id: post.id)
    }

    /// https://docs.joinmastodon.org/methods/statuses/#unbookmark
    @discardableResult
    public func unBookmark(_ post: Post) async throws -> Post {
        try await unbookmarkPost(id: post.id)
    }
}
