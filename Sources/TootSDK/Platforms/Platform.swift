public protocol Platform {

    /// platform name, e.g. Mastodon, Pleroma...
    var name: String { get }

    var supportsAnnouncements: Bool { get }
    /// mark announcement as read
    var supportsAnnouncementMark: Bool { get }

    /// bookmark posts
    //var supportsBookmark: Bool { get }
    ///  specify account is a bot
    var supportsBot: Bool { get }

    /// listed in instance profile directory
    var supportsDiscoverable: Bool { get }
    /// block domains
  //  var supportsDomainBlocks: Bool { get }

    var supportsFamiliarFollowers: Bool { get }
    var supportsFeaturedTags: Bool { get }
    var supportsFilter: Bool { get }

    var supportsFollowLanguages: Bool { get }
    var supportsFollowNotify: Bool { get }
    var supportsFollowTag: Bool { get }

    /// hide followers/followees
    var supportsHideCollections: Bool { get }

    /// turn post searchability on/off
    var supportsIndexable: Bool { get }
    var supportsInstanceExtendedDescription: Bool { get }
    // only need this because it's broken on Firefish and Sharkey
    var supportsIsBoosted: Bool { get }

    var supportsList: Bool { get }
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

    var supportsPostEdit: Bool { get }
    var supportsPostEditLanguage: Bool { get }
    var supportsPostHistory: Bool { get }
    var supportsPostSource: Bool { get }

    var supportsProfileFields: Bool { get }
    var supportsProfileDirectory: Bool { get }
    var supportsProfileHeader: Bool { get }
    var supportsProfileImageDelete: Bool { get }

    var supportsPublicTimeline: Bool { get }

    var supportsRelationshipWithSuspended: Bool { get }
    var supportsRemoveFollower: Bool { get }
    var supportsReportRules: Bool { get }
    var supportsRevoke: Bool { get }

    var supportsScheduleUpdate: Bool { get }
    var supportsSearchAccounts: Bool { get }
    var supportsSearchPosts: Bool { get }

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
    var notificationsPageLimit: Int { get }
    ///
    var scheduledPageLimit: Int { get }
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
    ///
    func getLimit(for timeline: Timeline) -> Int

    // lists

    /// post languages (maybe rename)
    var languages: [ISOCode] { get }
    ///
    var notificationTypes: NotificationTypes { get }
    /// post visibilities
    var postVis: [Post.Visibility] { get }
    /// (problem) report categories
    var reportCats: [ReportCategory] { get }
    /// suggestion sources
    var suggestionSources: SuggestionSources { get }

}

extension Platform {

    public var hasLanguages: Bool {
        !languages.isEmpty
    }

    public var hasNotificationTypes: Bool {
        !notificationTypes.isEmpty
    }

    public var hasReportCategories: Bool {
        !reportCats.isEmpty
    }

    public var hasSuggestions: Bool {
        !suggestionSources.isEmpty
    }

    public var supportsConversations: Bool {
        conversationsPageLimit > 0
    }
    
    public var supportsDomainBlocks: Bool { 
        blockedDomainsLimit > 0
    }

    public var supportsSchedule: Bool {
        scheduledPageLimit > 0
    }

    public var supportsTrendingPosts: Bool {
        trendingPostsLimit > 0
    }

    public var supportsTrendingTags: Bool {
        trendingTagsLimit > 0
    }

    public var supportsTrendingLinks: Bool {
        trendingLinksLimit > 0
    }

    public func supports(_ timeline: Timeline) -> Bool {
        getLimit(for: timeline) > 0
    }

}
