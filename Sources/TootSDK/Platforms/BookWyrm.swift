open class BookWyrm: MastoCompatible {

    open override var name: String { "BookWyrm" }
    
    public init(_ build: Version) {
        super.init(Version(0,0), build)
    }
    
    // only supports instanceV1 and peers

}

