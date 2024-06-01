open class Fedibird: Mastodon {

    open override var name: String { "Fedibird" }

    public init() {
        // hardcode the mastodon api
        // it's not in the nodeinfo
        // it's in the instance version string
        // but doesn't list the platform name
        // it's not getting updated, anyway
        super.init(Version(3, 4, 1))
    }

}
