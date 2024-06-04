/// https://github.com/superseriousbusiness/gotosocial/blob/main/docs/api/swagger.yaml
open class GotoSocial: MastoCompatible {

    open override var name: String { "GotoSocial" }

    // todo - mapping between masto api and gotosocial version
    public init(platform: Version) {
        // current hardcoded masto api
        // instanceMastodonVersion in internalfrontend.go
        super.init(masto: Version(3, 5), platform: platform)
    }

    public init(masto: Version) {
        // current hardcoded masto api
        // instanceMastodonVersion in internalfrontend.go
        // todo - mastodon api should depend on build
        super.init(masto: masto, platform: Version(0, 15))
    }

    // supports

    /// blocking domains not supported
    open override var blockedDomainsLimit: Int { 0 }
    /// doesn't support featured tags
    open override var supportsFeaturedTags: Bool { false }
    /// supports Instance V2
    open override var supportsInstanceV2: Bool { true }
    /// doesn't support deleting a notifitation
    open override var supportsNotificationDelete: Bool { false }
    /// doesn't support post revision history
    open override var supportsPostHistory: Bool { false }
    /// supports profile avatar/header delete
    open override var supportsProfileImageDelete: Bool {
        build >= Version(0, 15, 0)
    }
    /// doesn't support remove from followers
    open override var supportsRemoveFollower: Bool { false }
    /// doesn't support oauth revoke revoke
    open override var supportsRevoke: Bool { false }
    /// doesn't support search in account
    open override var supportsSearchAccount: Bool { false }
    /// doesn't support post results in search (without > prefix)
    open override var supportsSearchPosts: Bool { false }
    /// doesn't support tag results in search (without # prefix)
    open override var supportsSearchTags: Bool { false }
    /// doesn't support tag statistics
    open override var supportsTagStats: Bool { false }
    /// doesn't support post translations
    open override var supportsTranslate: Bool { false }

    // limits

    /// conversations not supported
    open override var conversationsPageLimit: Int { 0 }

    /// muted accounts not supported
    open override var mutedAccountsLimit: Int { 0 }

    // scheduled posts not supported
    open override var scheduledPageLimit: Int { 0 }

    /// trends not supported
    open override func trendingLinksLimit(_ auth: Bool) -> Int { 0 }
    open override func trendingPostsLimit(_ auth: Bool) -> Int { 0 }
    open override func trendingTagsLimit(_ auth: Bool) -> Int { 0 }
    
    // public timeline not supported
    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        auth ? super.getLimit(for: timeline, auth) : 0
    }

    // lists

    open override var postVis: PostVisibilities {
        super.postVis.union([.mutualsOnly])
    }

    open override var notificationTypes: NotificationTypes {
        []
    }
}
