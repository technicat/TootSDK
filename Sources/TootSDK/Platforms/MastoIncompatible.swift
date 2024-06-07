open class MastoIncompatible: MastoAPI {

    public init() {
        super.init(Version(0,0,1))
    }
    
    open override var supportsAdmin: Bool { false }
    
    open override var supportsLogin: Bool { false }
    
    // public timeline not supported
    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        auth ? super.getLimit(for: timeline, auth) : 0
    }
}
