extension TootClient {

    /// https://docs.joinmastodon.org/methods/statuses/#mute
    @discardableResult
    public func mute(_ post: Post) async throws -> Post {
        try await mutePost(id: post.id)
    }

    /// https://docs.joinmastodon.org/methods/statuses/#unmute
    @discardableResult
    public func unMute(_ post: Post) async throws -> Post {
        try await unmutePost(id: post.id)
    }
}
