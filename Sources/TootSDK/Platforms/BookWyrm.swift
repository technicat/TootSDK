open class BookWyrm: MastoCompatible {

    open override var name: String { "BookWyrm" }
    
    public init(_ build: Version) {
        // non-zero so it doesn't get overriden
            super.init(Version(0,0,1), build)
        }

    // only supports instanceV1 and peers

}
