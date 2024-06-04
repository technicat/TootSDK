open class Hollo: MastoCompatible {

    open override var name: String { "Hollo" }
    
    public init(platform: Version = Version.zero) {
        // just made up masto api
        super.init(masto: Version(0,1), platform: platform)
    }
}
