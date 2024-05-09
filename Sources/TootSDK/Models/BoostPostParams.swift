import Foundation

/// Parameters to boost a post
public struct BoostPostParams: Codable, Sendable {

    ///  Creates an object to create a new post with
    /// - Parameters:
    ///   - visibility: Sets the visibility of the posted post to public, unlisted, private, direct.
    public init(visibility: Post.Visibility = .public) {
        self.init(visibility: visibility)
    }
}
