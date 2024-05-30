// consider this
// https://codeberg.org/fediverse/fep/src/branch/main/fep/9fde/fep-9fde.md
public protocol Platform {

    /// platform name, e.g. Mastodon, Pleroma...
    var name: String { get }

    // require

    // these are for pixelfed
    // and any others that require a post refresh to look right
    var requiresRefreshAfterBoost: Bool { get }
    var requiresRefreshAfterFave: Bool { get }

    // supports

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
    var supportsInstanceExtendedDescription: Bool { get }
    var supportsInstanceV2: Bool { get }
    // only need this because it's broken on Firefish and Sharkey
    var supportsIsBoosted: Bool { get }

    var supportsListReplyPolicy: Bool { get }
    var supportsListExclusive: Bool { get }

    var supportsMarkers: Bool { get }
    var supportsMutePost: Bool { get }

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

    var supportsProfileFields: Bool { get }
    /// delete profile avatar/header
    var supportsProfileImageDelete: Bool { get }

    var supportsPublicDirectory: Bool { get }
    var supportsPublicTimeline: Bool { get }

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

    var supportsTagStats: Bool { get }

    var supportsTranslate: Bool { get }
    var supportsTranslationLanguages: Bool { get }

    // rename to supportAccountUpdate
    var supportsUpdateAccount: Bool { get }

    // limits
    // maybe should be nil when unsupported
    // but handy to treat nil as default
    ///
    var blockedDomainsLimit: Int { get }
    ///
    var boosterPageLimit: Int { get }
    ///
    var faversPageLimit: Int { get }
    ///
    var blockedAccountsLimit: Int { get }
    ///
    var mutedAccountsLimit: Int { get }
    ///
    var directoryLimit: Int { get }
    ///
    var conversationsPageLimit: Int { get }
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
    ///
    var searchLimit: Int { get }
    ///
    var findAccountsLimit: Int { get }
    ///
    var suggestionsLimit: Int { get }
    ///
    var trendingLinksLimit: Int { get }
    ///
    var trendingPostsLimit: Int { get }
    ///
    var trendingTagsLimit: Int { get }
    /// alt text char limit
    var maxAltText: Int { get }
    /// here because pixelfed requires at least one, but could be true of other image-oriented platforms - or we could just have something like isImagePlatform
    var minAttachments: Int { get }
    ///
    func getLimit(for timeline: Timeline) -> Int

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

extension Platform {

    public var hasLanguages: Bool {
        !languages.isEmpty
    }

    public var canQueryNotificationTypes: Bool {
        !notificationTypes.isEmpty
    }

    public var hasReportCategories: Bool {
        !reportCats.isEmpty
    }

    public var hasSuggestions: Bool {
        !suggestionSources.isEmpty
    }

//    public var supportsSchedule: Bool {
//        scheduledPageLimit > 0
//    }

    // maybe supports(timeline:)
    public func supports(_ timeline: Timeline) -> Bool {
        getLimit(for: timeline) > 0
    }

}
