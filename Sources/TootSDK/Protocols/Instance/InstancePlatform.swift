extension Instance {

    // todo - should use regex to capture all the version info
    // including both the api and build info
    public var platform: Platform {
        let api = platformVersion.api
        let plat = platformVersion.platform
        if version.lowercased().contains("akkoma") {
            return Akkoma(api)
        }
        if version.lowercased().contains("catodon") {
            return Catodon(api)
        }
        if version.lowercased().contains("firefish") {
            return Firefish(api)
        }
        if version.lowercased().contains("friendica") {
            return Friendica(api)
        }
        if version.lowercased().contains("glitch") {
            return Glitch(api)
        }
        if version.lowercased().contains("hometown") {
            return Hometown(api)
        }
        if version.lowercased().contains("iceshrimp") {
            return Iceshrimp(api)
        }
        if version.lowercased().contains("mitra") {
            return Mitra(api)
        }
        if version.lowercased().contains("pixelfed") {
            return Pixelfed(api)
        }
        if version.lowercased().contains("pleroma") {
            return Pleroma(api)
        }
        if version.lowercased().contains("sharkey") {
            return Sharkey(api)
        }
        if version.lowercased().contains("snac") {
            return Snac(api)
        }
        // kludge - GotoSocial version string is missing GotoSocial name
        // and Mastodon API version
        // (except when it's set to display the Mastodon version
        // and doesn't display any GotoSocial info)
        // just a git version
        // so let's just say it's the latest and see what happens
        if version.lowercased().contains("git") {
            // instanceMastodonVersion in internalfrontend.go
            return GotoSocial(Version(3, 5, 3))
        }
        return Mastodon(api)
    }
}
