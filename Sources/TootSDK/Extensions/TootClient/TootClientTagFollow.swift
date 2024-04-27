extension TootClient {

    /// https://docs.joinmastodon.org/methods/tags/#follow
    @discardableResult
    public func follow(tag name: String) async throws -> Tag {
        try await followTag(name)
    }

    /// https://docs.joinmastodon.org/methods/tags/#unfollow
    @discardableResult
    public func unFollow(tag name: String) async throws -> Tag {
        try await unfollowTag(name)
    }
}
