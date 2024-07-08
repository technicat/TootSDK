/// not Mastodon but with the API (more or less)
open class MastoCompatible: MastoAPI {

    public init(masto api: Version = Version.zero, platform build: Version = Version.zero) {
        self.build = build
        super.init(api)
    }

    // need something different (date-based) for misskey forks
    // todo - rename this, it's not a build number
    public var build: Version

    // so far as we know, only Mastodon supports their admin API
    open override var supportsAdmin: Bool { false }
}
