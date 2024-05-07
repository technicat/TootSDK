open class Mitra: MastoAPI {
    open override var name: String { "Mitra" }

    open override var supportsFamiliarFollowers: Bool { false }
    open override var supportsFeaturedTags: Bool { false }
    open override var supportsFilter: Bool { false }
    open override var supportsInstanceExtendedDescription: Bool { false }
    open override var supportsNote: Bool { false }
    open override var supportsProfileFields: Bool { false }
    open override var supportsPublicTimeline: Bool { false }
    open override var supportsTranslate: Bool { false }

    // limits

    // blocking accounts not supported
    open override var blockedAccountsLimit: Int { 0 }
    // blocking accounts not supported
    open override var mutedAccountsLimit: Int { 0 }
    // blocking domains not supported
    open override var blockedDomainsLimit: Int { 0 }
    // followed tags not supported
    open override var followedTagsPageLimit: Int { 0 }
    // scheduled posts not supported
    open override var scheduledPageLimit: Int { 0 }
    /// querying boosters not supported
    open override var boosterPageLimit: Int { 0 }
    /// querying favers not supported
    open override var faversPageLimit: Int { 0 }

    /// trends not supported
    open override var trendingLinksLimit: Int { 0 }
    open override var trendingPostsLimit: Int { 0 }
    open override var trendingTagsLimit: Int { 0 }

    /// lists not supported
    open override var listAccountsPageLimit: Int { 0 }

    open override func getLimit(for timeline: Timeline) -> Int {
        switch timeline {
        case .bookmarks: return 0  // not supported
        case .favourites: return 0  // not supported
        default: return super.getLimit(for: timeline)
        }
    }

    open override var notificationTypes: NotificationTypes {
        []
    }
}
