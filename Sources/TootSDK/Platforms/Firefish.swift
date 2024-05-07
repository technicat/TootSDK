open class Firefish: MisskeyFork {

    open override var name: String { "Firefish" }

    open override var supportsPublicTimeline: Bool { false }

    open override var supportsSearchAccounts: Bool { false }
    
    /// limits
    
    // only support trending posts
    open override var trendingTagsLimit: Int { 0 }
    open override var trendingLinksLimit: Int { 0 }
    open override var trendingPostsLimit: Int { 40 } // check this

    /// lists

    open override var notificationTypes: NotificationTypes {
        [.follow, .mention, .repost, .favourite, .poll, .followRequest]
    }
}
