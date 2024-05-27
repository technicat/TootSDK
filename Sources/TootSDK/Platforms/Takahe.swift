open class Takahe: MastoCompatible {

    open override var name: String { "Takahe" }

    public init(_ build: Version) {
        // arbitrary Mastodon api, adjust
        super.init(Version(3, 5), build)
    }
}
