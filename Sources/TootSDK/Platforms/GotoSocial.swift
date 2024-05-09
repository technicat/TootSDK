open class GotoSocial: MastoAPI {
    open override var name: String { "GotoSocial" }

    open override var supportsPublicTimeline: Bool { false }
    
    /// trends not supported
    open override var trendingLinksLimit: Int { 0 }
    open override var trendingPostsLimit: Int { 0 }
    open override var trendingTagsLimit: Int { 0 }
}
