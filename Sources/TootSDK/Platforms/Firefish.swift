open class Firefish: MisskeyFork {

    open override var name: String { "Firefish" }

    /// doesn't support search in account
    open override var supportsSearchAccount: Bool { false }

    /// limits
    /// 
    ///  // public timeline not supported
    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        auth ? super.getLimit(for: timeline, auth) : 0
    }

    // only support trending posts
    open override var trendingTagsLimit: Int { 0 }
    open override var trendingLinksLimit: Int { 0 }
    open override var trendingPostsLimit: Int { 40 }  // check this

    // search for accounts not supported
    open override var findAccountsLimit: Int { 0 }

    /// lists

    open override var notificationTypes: NotificationTypes {
        [.follow, .mention, .repost, .favourite, .poll, .followRequest]
    }
}
