// consider this
// https://codeberg.org/fediverse/fep/src/branch/main/fep/9fde/fep-9fde.md
public protocol Platform {

    /// platform name, e.g. Mastodon, Pleroma...
    var name: String { get }

    var needsUpdate: Bool { get }

    // require

    // these are for pixelfed
    // and any others that require a post refresh to look right
    var requiresRefreshAfterBoost: Bool { get }
    var requiresRefreshAfterFave: Bool { get }

    // supports

    /// admin functions
    var supportsAdmin: Bool { get }
    ///
    var supportsAnnouncements: Bool { get }
    /// mark announcement as read
    var supportsAnnouncementMark: Bool { get }

    ///  specify account is a bot
    var supportsBot: Bool { get }

    /// listed in instance profile directory
    var supportsDiscoverable: Bool { get }

    var supportsFamiliarFollowers: Bool { get }
    var supportsFeaturedTags: Bool { get }
    var supportsFilter: Bool { get }

    var supportsFollowLanguages: Bool { get }
    var supportsFollowNotify: Bool { get }

    /// hide followers/followees
    var supportsHideCollections: Bool { get }

    /// turn post searchability on/off
    var supportsIndexable: Bool { get }
    /// instance usage stats
    var supportsInstanceActivity: Bool { get }
    ///
    var supportsInstanceExtendedDescription: Bool { get }
    /// query for rules (separate from instance v1/v2)
    var supportsInstanceRules: Bool { get }
    // we assume every Platform has Instance V1
    // but should probably have it here
    // if we want to handle anything with nodeinfo
    ///
    var supportsInstanceV2: Bool { get }
    // only need this because it's broken on Firefish and Sharkey
    var supportsIsBoosted: Bool { get }

    var supportsListReplyPolicy: Bool { get }
    var supportsListExclusive: Bool { get }

    var supportsLogin: Bool { get }

    var supportsMarkers: Bool { get }
    var supportsMutePost: Bool { get }
    var supportsMuteExpire: Bool { get }
    var supportsMuteNotifications: Bool { get }

    /// private note for account
    var supportsNote: Bool { get }
    /// delete single notification
    var supportsNotificationDelete: Bool { get }
    /// delete all notifications
    var supportsNotificationDeleteAll: Bool { get }

    var supportsPins: Bool { get }

    var supportsPollVote: Bool { get }
    var supportsPostDefaultLanguage: Bool { get }
    var supportsPostDefaultSensitive: Bool { get }
    var supportsPostDefaultVisibility: Bool { get }

    var supportsPostDeleteAndEdit: Bool { get }
    var supportsPostEdit: Bool { get }
    var supportsPostEditLanguage: Bool { get }
    var supportsPostHistory: Bool { get }
    var supportsPostSource: Bool { get }

    /// delete profile avatar/header
    var supportsProfileImageDelete: Bool { get }

    var supportsRelationshipWithSuspended: Bool { get }
    var supportsRemoveFollower: Bool { get }

    var supportsReport: Bool { get }
    var supportsReportRules: Bool { get }

    var supportsRevoke: Bool { get }

    var supportsScheduleUpdate: Bool { get }

    var supportsSearchAccount: Bool { get }
    // could be limits
    var supportsSearchAccounts: Bool { get }
    var supportsSearchPosts: Bool { get }
    var supportsSearchTags: Bool { get }

    var supportsSpoiler: Bool { get }
    /// websockets - should this be finer grained?
    var supportsStreaming: Bool { get }

    var supportsTagStats: Bool { get }

    var supportsTranslate: Bool { get }
    var supportsTranslationLanguages: Bool { get }

    // rename to supportAccountUpdate
    var supportsUpdateAccount: Bool { get }

    // limits
    // 0 indicate the feature is not supported
    ///
    var blockedAccountsLimit: Int { get }
    ///
    var blockedDomainsLimit: Int { get }
    ///
    var boosterPageLimit: Int { get }
    ///
    func directoryLimit(_ auth: Bool) -> Int
    ///
    var findAccountsLimit: Int { get }
    /// maximum number of queried muted accounts
    var mutedAccountsLimit: Int { get }
    /// maximum number of profile fields
    var profileFieldsLimit: Int { get }
    /// maximum number of queried search results
    var searchLimit: Int { get }
    /// maximum number of queried suggestions
    var suggestionsLimit: Int { get }
    /// maximum number of queried trending links
    func trendingLinksLimit(_ auth: Bool) -> Int
    /// maximum number of queried trending posts
    func trendingPostsLimit(_ auth: Bool) -> Int
    /// maximum number of queried trending tags
    func trendingTagsLimit(_ auth: Bool) -> Int

    ///
    var adminAccountsV2PageLimit: Int { get }
    ///
    var conversationsPageLimit: Int { get }
    ///
    var endorsementsPageLimit: Int { get }
    ///
    var faversPageLimit: Int { get }
    ///
    var followedAccountsPageLimit: Int { get }
    ///
    var followRequestPageLimit: Int { get }
    ///
    var followersPageLimit: Int { get }
    ///
    var followedTagsPageLimit: Int { get }
    ///
    var listAccountsPageLimit: Int { get }
    ///
    var notificationsPageLimit: Int { get }
    ///
    var scheduledPageLimit: Int { get }

    /// alt text char limit
    var maxAltText: Int { get }
    /// here because pixelfed requires at least one, but could be true of other image-oriented platforms - or we could just have something like isImagePlatform
    var minAttachments: Int { get }
    ///
    func getLimit(for timeline: Timeline, _ auth: Bool) -> Int

    // lists

    /// post languages (maybe rename)
    var languages: ISOCodes { get }
    /// notification types that can be queried (not all that can be received)
    var notificationTypes: NotificationTypes { get }
    /// supported post visibilities
    var postVis: PostVisibilities { get }
    /// supported boost visibilities
    var boostVis: PostVisibilities { get }
    /// (problem) report categories
    var reportCats: ReportCats { get }
    /// suggestion sources
    var suggestionSources: SuggestionSources { get }

}
