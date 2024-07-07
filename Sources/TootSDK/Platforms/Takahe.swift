open class Takahe: MastoCompatible {

    open override var name: String { "Takahe" }

    public init(_ api: Version = Version.zero) {
        // arbitrary mastodon api
        super.init(masto: Version(3, 5), platform: api)
    }
    
    /// doesn't support bot indicator in account settings
    open override var supportsBot: Bool { false }
}
