/// not Mastodon but with the API (more or less)
open class MastoCompatible: MastoAPI {

    public init(_ api: Version, _ build: Version) {
        self.build = build
        super.init(api)
    }

    // need something different (date-based) for misskey forks
    public var build: Version
}
