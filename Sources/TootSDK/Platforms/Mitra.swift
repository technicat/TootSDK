open class Mitra: MastoAPI {
    open override var name: String { "Mitra" }
    
    open override var supportsFeaturedTags: Bool { false }
    open override var supportsInstanceExtendedDescription: Bool { false }
    open override var supportsTranslate: Bool { false }
    
    // limits

    open override var trendingLinksLimit: Int { 0 }
    open override var trendingPostsLimit: Int { 0 }
    open override var trendingTagsLimit: Int { 0 }
}
