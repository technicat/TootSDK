/// https://docs.jointakahe.org/en/latest/features/
open class Takahe: MastoCompatible {

    open override var name: String { "Takahe" }

    public init(_ api: Version = Version.zero) {
        // arbitrary mastodon api
        super.init(masto: Version(3, 5), platform: api)
    }
    
    // support

    /// doesn't support bot indicator in account settings
    open override var supportsBot: Bool { false }
    
    // limits
    
    /// lists not supported (can get but not create)
    open override var listAccountsPageLimit: Int { 0 }
    /// scheduled posts not supported
    open override var scheduledPageLimit: Int { 0 }
}
