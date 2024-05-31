open class BookWyrm: MastoCompatible {

    open override var name: String { "BookWyrm" }

    public init(_ build: Version) {
        super.init(Version(), build)
    }

    // only supports instanceV1 and peers

}
