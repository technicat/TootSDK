open class Mitra: MastoAPI {
    open override var name: String { "Mitra" }
    
    open override var supportsFeaturedTags: Bool { false }
    open override var supportsInstanceExtendedDescription: Bool { false }
    open override var supportsTranslate: Bool { false }
    
    // limits

    /// trends not supported
    open override var trendingLinksLimit: Int { 0 }
    open override var trendingPostsLimit: Int { 0 }
    open override var trendingTagsLimit: Int { 0 }
    
    /// lists not supported
    open override var listAccountsPageLimit: Int { 0 }

    open override func getLimit(for timeline: Timeline) -> Int {
        switch timeline {
        case .bookmarks: return 0 // bookmarks not supported
        default: return super.getLimit(for: timeline)
        }
    }
}
