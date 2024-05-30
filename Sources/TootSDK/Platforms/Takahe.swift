open class Takahe: MastoCompatible {

    open override var name: String { "Takahe" }

    public init(_ api: Version) {
        super.init(Version(3, 5), api)
    }
}
