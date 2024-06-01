open class Takahe: MastoCompatible {

    open override var name: String { "Takahe" }

    public init(_ api: Version) {
        // arbitrary mastodon api
        super.init(Version(3, 5), api)
    }
}
