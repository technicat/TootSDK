import Foundation

/// https://docs.joinmastodon.org/methods/statuses/#delete
extension TootClient {

    @discardableResult
    public func delete(_ post: Post) async throws -> Post {
        try await deletePost(id: post.id)
    }

    @discardableResult
    public func delete(withoutReturn post: Post) async throws {
        try await deletePostNoReturn(id: post.id)
    }

}
