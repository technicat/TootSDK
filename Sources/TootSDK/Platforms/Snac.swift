// todo - udpate this to MastoCompatible
// when we can handle major.minor version
open class Snac: MastoAPI {
    open override var name: String { "Snac" }

    open override var supportsInstanceExtendedDescription: Bool { false }
    open override var supportsInstanceV2: Bool { false }
    
    /// profile directory requires auth
    open override func directoryLimit(_ auth: Bool) -> Int {
        auth ? super.directoryLimit(auth) : 0
    }
    
    // public trends not supported
    open override func trendingLinksLimit(_ auth: Bool) -> Int {
        auth ? super.trendingLinksLimit(auth) : 0
    }
    open override func trendingPostsLimit(_ auth: Bool) -> Int {
        auth ? super.trendingPostsLimit(auth) : 0
    }
    open override func trendingTagsLimit(_ auth: Bool) -> Int {
        auth ? super.trendingTagsLimit(auth) : 0
    }
    
    open override var supportsTranslate: Bool { false }
}
