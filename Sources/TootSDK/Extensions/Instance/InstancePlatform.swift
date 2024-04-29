extension Instance {

    // todo - should use regex to capture all the version info
    // including both the api and build info
    @available(macOS 13.0, *)
    @available(iOS 16.0, *)
    public var platform: Platform {
        if version.lowercased().contains("akkoma") {
            return Akkoma(apiVersion)
        }
        if version.lowercased().contains("catodon") {
            return Catodon(apiVersion)
        }
        if version.lowercased().contains("firefish") {
            return Firefish(apiVersion)
        }
        if version.lowercased().contains("friendica") {
            return Friendica(apiVersion)
        }
        if version.lowercased().contains("glitch") {
            return Glitch(apiVersion)
        }
        if version.lowercased().contains("hometown") {
            return Hometown(apiVersion)
        }
        if version.lowercased().contains("iceshrimp") {
            return Iceshrimp(apiVersion)
        }
        if version.lowercased().contains("pixelfed") {
            return Pixelfed(apiVersion)
        }
        if version.lowercased().contains("pleroma") {
            return Pleroma(apiVersion)
        }
        if version.lowercased().contains("sharkey") {
            return Sharkey(apiVersion)
        }
        if version.lowercased().contains("snac") {
            return Snac(apiVersion)
        }
        // kludge - GotoSocial version string is missing GotoSocial name
        // and Mastodon API version
        // so let's just say it's the latest and see what happens
        if version.lowercased().contains("git") {
            // instanceMastodonVersion in internalfrontend.go
            return GotoSocial(Version(3, 5, 3))
        }
        return Mastodon(apiVersion)
    }
}
