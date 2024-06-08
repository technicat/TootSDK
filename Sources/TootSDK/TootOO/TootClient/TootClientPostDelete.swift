import Foundation

/// https://docs.joinmastodon.org/methods/statuses/#delete
extension TootClient {

    public func deleteAndEdit(_ post: Post) async throws -> Post {
        try await deleteAndEditPost(id: post.id)
    }

    public func delete(_ post: Post) async throws {
        try await deletePost(id: post.id)
    }

}
