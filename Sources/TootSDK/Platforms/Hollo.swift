open class Hollo: MastoCompatible {

    open override var name: String { "Hollo" }
    
    public init(_ build: Version) {
        super.init(Version(), build)
    }
}
