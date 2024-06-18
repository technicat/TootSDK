import Foundation

extension Post {
    
    /// Convenience var for which post to display. This can be used by clients instead of if/then checking the repost value itself
    public var displayPost: Post {
        return self.repost ?? self
    }
    
    /// Indicates whether displayPost is a repost or not
//    public var displayingRepost: Bool {
//        return self.repost != nil
//    }
}
