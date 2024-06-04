open class IceshrimpNET: Iceshrimp {

    open override var name: String { "Iceshrimp.NET" }
    
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
   
}
