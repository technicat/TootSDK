open class BookWyrm: MastoCompatible {

    open override var name: String { "BookWyrm" }

    public init(_ build: Version) {
        // non-zero so it doesn't get overriden
        super.init(masto: Version(0, 0, 1), platform: build)
    }

    // only supports instanceV1 and peers

}
