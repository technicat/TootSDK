// https://docs.pixelfed.org/technical-documentation/api/#differences-with-mastodon-api
open class Pixelfed: MastoAPI {

    open override var name: String { "Pixelfed" }

    open override var supportsBot: Bool { false }

    open override var supportsFeaturedTags: Bool { false }

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
    open override var supportsProfileHeader: Bool { false }

    open override var supportsPublicTimeline: Bool { false }

    open override var supportsRevoke: Bool { false }

    open override var supportsSearchAccounts: Bool { false }
    open override var supportsSearchPosts: Bool { false }

    open override var supportsTagStats: Bool { false }

    // limits

    /// trends not supported
    open override var trendingLinksLimit: Int { 0 }
    open override var trendingPostsLimit: Int { 0 }
    open override var trendingTagsLimit: Int { 0 }

    /// lists not supported
    open override var listAccountsPageLimit: Int { 0 }
    /// followed tags not supported
    open override var followedTagsPageLimit: Int { 0 }
    /// scheduled posts not supported
    open override var scheduledPageLimit: Int { 0 }

    /// default, this is on pixelfed.social
    open override var maxAltText: Int { 2000 }
    ///
    open override var minAttachments: Int { 1 }

    // lists

    open override var notificationTypes: NotificationTypes {
        []
    }

    // doesn't support .direct
    open override var postVis: [Post.Visibility] {
        [.public, .unlisted, .private]
    }

    // subset of accepted types
    // matching the ones displayed by the pixelfed.social web ui
    open override var reportCats: [ReportCategory] {
        [
            .spam,
            .copyright,
            .impersonation,
            .sensitive,
            .abusive,
            .underage,
            //    .violence,
            //    .scam,
            //     .terrorism,
        ]
    }

    // doesn't support suggestions
    open override var suggestionSources: SuggestionSources { [] }

}
