/// https://github.com/superseriousbusiness/gotosocial/blob/main/docs/api/swagger.yaml
open class GotoSocial: MastoAPI {
    open override var name: String { "GotoSocial" }

    // supports

    /// doesn't support featured tags
    open override var supportsFeaturedTags: Bool { false }
    /// doesn't support deleting a notifitation
    open override var supportsNotificationDelete: Bool { false }
    /// doesn't support post revision history
    open override var supportsPostHistory: Bool { false }
    /// doesn't support public (no auth) timeline
    open override var supportsPublicTimeline: Bool { false }
    /// doesn't support remove from followers
    open override var supportsRemoveFollower: Bool { false }
    /// doesn't support oauth revoke revoke
    open override var supportsRevoke: Bool { false }
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
    open override var trendingLinksLimit: Int { 0 }
    open override var trendingPostsLimit: Int { 0 }
    open override var trendingTagsLimit: Int { 0 }
}
