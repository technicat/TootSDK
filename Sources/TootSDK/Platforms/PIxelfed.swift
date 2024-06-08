// https://docs.pixelfed.org/technical-documentation/api/#differences-with-mastodon-api
open class Pixelfed: MastoCompatible {

    open override var name: String { "Pixelfed" }

    // requires

    open override var requiresRefreshAfterBoost: Bool { true }
    open override var requiresRefreshAfterFave: Bool { true }

    // supports

    open override var supportsBot: Bool { false }

    open override var supportsFeaturedTags: Bool { false }

    // changelog says it's added but doesn't seem to set
    // open override var supportsIndexable: Bool { build >= Version(0,11,10) }

    open override var supportsNote: Bool { false }
    open override var supportsNotificationDelete: Bool { false }
    open override var supportsNotificationDeleteAll: Bool { false }

    open override var supportsPostDefaultLanguage: Bool { false }
    open override var supportsPostDefaultSensitive: Bool { false }
    open override var supportsPostDefaultVisibility: Bool { false }

    open override var supportsPostEdit: Bool { false }
    open override var supportsPostHistory: Bool { false }

    open override var supportsPostSource: Bool { false }

    open override var supportsProfileFields: Bool { false }

    open override var supportsRevoke: Bool { false }

    /// doesn't support search in account
    open override var supportsSearchAccount: Bool { false }

    open override var supportsSearchPosts: Bool { false }

    open override var supportsTagStats: Bool { false }

    // limits

    // public timeline not supported
    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        auth ? super.getLimit(for: timeline, auth) : 0
    }

    /// trends not supported
    open override func trendingLinksLimit(_ auth: Bool) -> Int { 0 }
    open override func trendingPostsLimit(_ auth: Bool) -> Int { 0 }
    open override func trendingTagsLimit(_ auth: Bool) -> Int { 0 }

    /// lists not supported
    open override var listAccountsPageLimit: Int { 0 }
    /// followed tags support
    open override var followedTagsPageLimit: Int {
        build >= Version(0, 11, 7) ? 40 : 0  // check limit
    }
    /// scheduled posts not supported
    open override var scheduledPageLimit: Int { 0 }
    /// search for accounts not supported
    open override var findAccountsLimit: Int { 0 }

    /// default, this is on pixelfed.social
    open override var maxAltText: Int { 2000 }
    ///
    open override var minAttachments: Int { 1 }

    // lists

    open override var notificationTypes: NotificationTypes {
        []
    }

    // doesn't support .direct
    open override var postVis: PostVisibilities {
        [.public, .unlisted, .private]
    }

    open override var reportCats: ReportCats {
        [
            .spam,
            .copyright,
            .impersonation,
            .sensitive,
            .abusive,
            .underage,
            .violence,
            .scam,
            .terrorism,
        ]
    }

    // doesn't support suggestions
    open override var suggestionSources: SuggestionSources { [] }

}
