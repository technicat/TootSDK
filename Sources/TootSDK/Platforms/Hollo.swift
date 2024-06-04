open class Hollo: MastoCompatible {

    open override var name: String { "Hollo" }
    
    public init(platform: Version = Version.zero) {
        // just made up masto api
        super.init(masto: Version(0,1), platform: platform)
    }
    
    // public timeline not supported
    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        auth ? super.getLimit(for: timeline, auth) : 0
    }
}
