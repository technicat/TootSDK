// maybe should be a protocol
// not everything here is in Platform
// include as needed
// https://docs.joinmastodon.org/
open class MastoAPI: Platform {

    var api: Version

    public init(_ api: Version) {
        self.api = api
    }

    open var name: String { "Mastodon API" }

    // requires

    open var requiresInstanceAuth: Bool { api >= Version(3, 0) }
    open var requiresRefreshAfterBoost: Bool { false }
    open var requiresRefreshAfterFave: Bool { false }

    // supports

    open var supportsAnnouncements: Bool { api >= Version(3, 1) }
    open var supportsAnnouncementMark: Bool { api >= Version(3, 1) }

    open var supportsBot: Bool { api >= Version(2, 4) }

    open var supportsDiscoverable: Bool { api >= Version(4, 2) }

    open var supportsFamiliarFollowers: Bool { api >= Version(3, 5) }
    open var supportsFeaturedTags: Bool { api >= Version(3, 0) }
    open var supportsFilter: Bool { api >= Version(4, 0) }
    open var supportsFollowLanguages: Bool { api >= Version(4, 0) }
    open var supportsFollowNotify: Bool { api >= Version(3, 3) }
    // open var supportsFollowTag: Bool { api >= Version(4, 0) }

    /// https://docs.joinmastodon.org/methods/accounts/#update_credentials
    open var supportsHideCollections: Bool { api >= Version(4, 1) }
    /// https://docs.joinmastodon.org/methods/accounts/#update_credentials
    open var supportsIndexable: Bool { api >= Version(4, 2) }

    /// V1 instance
    open var supportsInstance: Bool { api >= Version(1, 1) }
    open var supportsInstanceConfig: Bool { api >= Version(3, 4, 2) }
    open var supportsInstanceConfigAccount: Bool { api >= Version(4, 0) }
    open var supportsInstanceExtendedDescription: Bool { api >= Version(4, 0) }
    open var supportsInstanceInvites: Bool { api >= Version(3, 1, 4) }
    open var supportsInstanceRules: Bool { api >= Version(3, 4) }

    open var supportsInstanceV2: Bool { api >= Version(4, 0) }
    open var supportsIsBoosted: Bool { true }

    open var supportsListReplyPolicy: Bool { api >= Version(3, 3) }
    open var supportsListExclusive: Bool { api >= Version(4, 2) }

    open var supportsMarkers: Bool { api >= Version(3, 0) }
    open var supportsMutePost: Bool { api >= Version(1, 4, 2) }

    /// https://docs.joinmastodon.org/methods/accounts/#note
    open var supportsNote: Bool { api >= Version(3, 2) }

    /// https://docs.joinmastodon.org/methods/notifications/#dismiss
    open var supportsNotificationDelete: Bool { api >= Version(1, 3) }
    /// https://docs.joinmastodon.org/methods/notifications/#clear
    open var supportsNotificationDeleteAll: Bool { true }

    /// https://docs.joinmastodon.org/methods/accounts/#statuses
    open var supportsPins: Bool { api >= Version(1, 6) }

    open var supportsPollVote: Bool { api >= Version(2, 8) }  // supportsPoll

    open var supportsPostDeleteAndEdit: Bool { api >= Version(2, 9) }
    /// https://docs.joinmastodon.org/methods/statuses/#edit
    open var supportsPostEdit: Bool { api >= Version(3, 5) }
    open var supportsPostEditLanguage: Bool { api >= Version(4, 0) }
    /// https://docs.joinmastodon.org/methods/statuses/#history
    open var supportsPostHistory: Bool { api >= Version(3, 5) }

    open var supportsPostDefaultLanguage: Bool { api >= Version(2, 4, 2) }
    open var supportsPostDefaultSensitive: Bool { api >= Version(2, 4) }
    open var supportsPostDefaultVisibility: Bool { api >= Version(2, 4) }

    /// https://docs.joinmastodon.org/methods/statuses/#source
    open var supportsPostSource: Bool { api >= Version(3, 5) }

    /// https://docs.joinmastodon.org/methods/preferences/
    open var supportsPreferences: Bool { api >= Version(2, 8) }

    open var supportsProfileFields: Bool { api >= Version(2, 4) }
    open var supportsProfileImageDelete: Bool { api >= Version(4, 2) }

    open var supportsPublicDirectory: Bool { true }
    // private public timeline supported with 3.0.90
    open var supportsPublicTimeline: Bool { true }

    open var supportsRelationshipWithSuspended: Bool { api >= Version(4, 3) }
    ///https://docs.joinmastodon.org/methods/accounts/#remove_from_followers
    open var supportsRemoveFollower: Bool { api >= Version(3, 5) }

    open var supportsReport: Bool { api >= Version(1, 1) }
    open var supportsReportRules: Bool { api >= Version(4, 0) }

    /// https://docs.joinmastodon.org/methods/oauth/#revoke
    open var supportsRevoke: Bool { true }

    open var supportsScheduleUpdate: Bool { api >= Version(2, 7) }
    open var supportsSensitive: Bool { api >= Version(0, 9, 9) }

    /// https://docs.joinmastodon.org/methods/search/#v2
    open var supportsSearchAccount: Bool { api >= Version(2, 8) }
    open var supportsSearchAccounts: Bool { api >= Version(2, 4, 1) }
    open var supportsSearchPosts: Bool { api >= Version(2, 4, 1) }
    open var supportsSearchTags: Bool { api >= Version(2, 4, 1) }

    open var supportsSpoiler: Bool { api >= Version(1, 0) }

    open var supportsTagStats: Bool { api >= Version(2, 4, 1) }

    open var supportsTranslate: Bool { api >= Version(4, 0) }
    open var supportsTranslationLanguages: Bool { api >= Version(4, 2) }

    open var supportsUpdateAccount: Bool { api >= Version(1, 4, 1) }

    // limits
    // zero indicates the feature is not supported

    ///
    open var blockedDomainsLimit: Int {
        api >= Version(0, 4) ? 200 : 0
    }
    ///
    open var boosterPageLimit: Int { 80 }
    ///
    open var faversPageLimit: Int { 80 }
    ///
    open var listAccountsPageLimit: Int {
        api >= Version(2, 1) ? 80 : 0
    }
    ///
    open var blockedAccountsLimit: Int { 80 }
    ///
    open var mutedAccountsLimit: Int { 80 }
    ///
    open var directoryLimit: Int {
        api >= Version(4, 0) ? 80 : 0
    }
    /// https://docs.joinmastodon.org/methods/search/#v2
    open var searchLimit: Int { 40 }
    /// https://docs.joinmastodon.org/methods/accounts/#search
    open var findAccountsLimit: Int { 80 }
    ///
    open var suggestionsLimit: Int { 80 }
    ///
    open var trendingLinksLimit: Int {
        api >= Version(3, 5) ? 20 : 0
    }
    ///
    open var trendingPostsLimit: Int {
        api >= Version(3, 5) ? 40 : 0
    }
    ///
    open var trendingTagsLimit: Int {
        api >= Version(3, 5) ? 20 : 0
    }

    open func getLimit(for timeline: Timeline) -> Int {
        switch timeline {
        case .bookmarks:
            api >= Version(3, 1) ? 40 : 0
        // removed from mastodon in 3.0
        case .direct:
            api < Version(3, 0) ? 40 : 0
        case .home, .favourites, .local, .federated, .hashtag, .list, .user:
            40
        default:
            0
        }
    }

    ///
    open var conversationsPageLimit: Int {
        api >= Version(2, 6) ? 40 : 0
    }
    ///
    open var followersPageLimit: Int { 40 }
    //
    open var followedTagsPageLimit: Int {
        api >= Version(4, 0) ? 200 : 0
    }

    ///https://docs.joinmastodon.org/methods/notifications/
    open var notificationsPageLimit: Int {
        api >= Version(4, 1) ? 80 : 30
    }

    /// https://docs.joinmastodon.org/methods/scheduled_statuses/
    open var scheduledPageLimit: Int {
        api >= Version(2, 7) ? 40 : 0
    }

    // harcoded in Mastodon
    // same for firefish and forks
    // todo - check other platforms
    open var maxAltText: Int { 1500 }
    //
    open var minAttachments: Int { 0 }

    // lists

    open var languages: ISOCodes { [] }

    /// https://docs.joinmastodon.org/methods/notifications/#get
    open var notificationTypes: NotificationTypes {
        let noteTypes31: NotificationTypes = [.followRequest]
        let noteTypes33: NotificationTypes = [.post]
        let noteTypes35: NotificationTypes = [.update, .adminSignUp]
        let noteTypes40: NotificationTypes = [.adminReport]
        var types: NotificationTypes = [
            .follow, .mention, .repost, .favourite, .poll,
        ]
        if api >= Version(3, 1) {
            types = types.union(noteTypes31)
        }
        if api >= Version(3, 3) {
            types = types.union(noteTypes33)
        }
        if api >= Version(3, 5) {
            types = types.union(noteTypes35)
        }
        if api >= Version(4, 0) {
            types = types.union(noteTypes40)
        }
        return types
    }

    open var postVis: PostVisibilities {
        [.public, .unlisted, .private, .direct]
    }

    open var boostVis: PostVisibilities {
        api >= Version(2, 8) ? [.public, .unlisted, .private] : []
    }

    let reportCats35: ReportCats = [
        .spam,
        .violation,
        .other,
    ]

    let reportCats42: ReportCats = [
        .legal
    ]

    open var reportCats: ReportCats {
        var cats: ReportCats = []
        if api >= Version(3, 5) {
            cats = reportCats35
        }
        if api >= Version(4, 2) {
            cats = reportCats42.union(cats)
        }
        return cats
    }

    // v2
    open var suggestionSources: SuggestionSources {
        api >= Version(3, 4, 0)
            ? [
                .staff,
                .pastInteractions,
                .global,
            ] : []
    }

}
