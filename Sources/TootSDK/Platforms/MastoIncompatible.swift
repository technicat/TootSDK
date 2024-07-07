// todo - separate from MastoAPI
// todo - rename (just supports instance v1)
//open class MastoIncompatible: MastoAPI {
//
//    public init() {
//        super.init(Version(0, 0, 1))
//    }
//
//    open override var supportsAdmin: Bool { false }
//
//    open override var supportsLogin: Bool { false }
//
//    // public timeline not supported
//    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
//        auth ? super.getLimit(for: timeline, auth) : 0
//    }
//}

// just supports instance v1
open class MastoIncompatible: Platform {

    public init() {}

    public var name: String { "" }

    public var needsUpdate: Bool { false }

    public var requiresRefreshAfterBoost: Bool { false }

    public var requiresRefreshAfterFave: Bool { false }

    public var supportsAdmin: Bool { false }

    public var supportsAnnouncements: Bool { false }

    public var supportsAnnouncementMark: Bool { false }

    public var supportsBot: Bool { false }

    public var supportsDiscoverable: Bool { false }

    public var supportsFamiliarFollowers: Bool { false }

    public var supportsFeaturedTags: Bool { false }

    public var supportsFilter: Bool { false }

    public var supportsFollowLanguages: Bool { false }

    public var supportsFollowNotify: Bool { false }

    public var supportsHideCollections: Bool { false }

    public var supportsIndexable: Bool { false }

    public var supportsInstanceActivity: Bool { false }

    public var supportsInstanceExtendedDescription: Bool { false }

    public var supportsInstanceRules: Bool { false }

    public var supportsInstanceV2: Bool { false }

    public var supportsIsBoosted: Bool { false }

    public var supportsListReplyPolicy: Bool { false }

    public var supportsListExclusive: Bool { false }

    public var supportsLogin: Bool { false }

    public var supportsMarkers: Bool { false }

    public var supportsMutePost: Bool { false }

    public var supportsMuteExpire: Bool { false }

    public var supportsMuteNotifications: Bool { false }

    public var supportsNote: Bool { false }

    public var supportsNotificationDelete: Bool { false }

    public var supportsNotificationDeleteAll: Bool { false }

    public var supportsPins: Bool { false }

    public var supportsPoll: Bool { false }

    public var supportsPostDefaultLanguage: Bool { false }

    public var supportsPostDefaultSensitive: Bool { false }

    public var supportsPostDefaultVisibility: Bool { false }

    public var supportsPostDeleteAndEdit: Bool { false }

    public var supportsPostEdit: Bool { false }

    public var supportsPostEditLanguage: Bool { false }

    public var supportsPostHistory: Bool { false }

    public var supportsPostSource: Bool { false }

    public var supportsProfileImageDelete: Bool { false }

    public var supportsRelationshipWithSuspended: Bool { false }

    public var supportsRemoveFollower: Bool { false }

    public var supportsReport: Bool { false }

    public var supportsReportRules: Bool { false }

    public var supportsRevoke: Bool { false }

    public var supportsScheduleUpdate: Bool { false }

    public var supportsSearchAccount: Bool { false }

    public var supportsSearchAccounts: Bool { false }

    public var supportsSearchPosts: Bool { false }

    public var supportsSearchTags: Bool { false }

    public var supportsSpoiler: Bool { false }

    public var supportsStreaming: Bool { false }

    public var supportsTagStats: Bool { false }

    public var supportsTranslate: Bool { false }

    public var supportsTranslationLanguages: Bool { false }

    public var supportsUpdateAccount: Bool { false }

    public var blockedAccountsLimit: Int { 0 }

    public var blockedDomainsLimit: Int { 0 }

    public var boosterPageLimit: Int { 0 }

    public func directoryLimit(_ auth: Bool) -> Int {
        0
    }

    public var findAccountsLimit: Int { 0 }

    public var mutedAccountsLimit: Int { 0 }

    public var profileFieldsLimit: Int { 0 }

    public var searchLimit: Int { 0 }

    public var suggestionsLimit: Int { 0 }

    public func trendingLinksLimit(_ auth: Bool) -> Int {
        0
    }

    public func trendingPostsLimit(_ auth: Bool) -> Int {
        0
    }

    public func trendingTagsLimit(_ auth: Bool) -> Int {
        0
    }

    public var adminAccountsV2PageLimit: Int { 0 }

    public var conversationsPageLimit: Int { 0 }

    public var endorsementsPageLimit: Int { 0 }

    public var faversPageLimit: Int { 0 }

    public var followedAccountsPageLimit: Int { 0 }

    public var followRequestPageLimit: Int { 0 }

    public var followersPageLimit: Int { 0 }

    public var followedTagsPageLimit: Int { 0 }

    public var listAccountsPageLimit: Int { 0 }

    public var notificationsPageLimit: Int { 0 }

    public var scheduledPageLimit: Int { 0 }

    public var maxAltText: Int { 0 }

    public var minAttachments: Int { 0 }

    public func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        0
    }

    public var languages: ISOCodes { [] }

    public var notificationTypes: NotificationTypes { [] }

    public var postVis: PostVisibilities { [] }

    public var boostVis: PostVisibilities { [] }

    public var reportCats: ReportCats { [] }

    public var suggestionSources: SuggestionSources { [] }

}
