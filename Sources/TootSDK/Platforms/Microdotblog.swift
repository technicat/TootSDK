open class Microdotblog: MastoCompatible {

    open override var name: String { "Micro.blog" }

    public init() {
        // non-zero so it doesn't get overriden
        super.init(masto: Version(0, 0, 1), platform: Version(2,1))
    }

    // only supports instanceV1 and peers

}
