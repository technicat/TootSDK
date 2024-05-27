extension Instance {

    public var platform: Platform {
        let vs = version.version
        let api = vs.api
        let buildapi = vs.build.version.api
        /// 2.7.2  (compatible; Akkoma 3.13.1-0-gc02e343)
        if version.lowercased().contains("akkoma") {
            return Akkoma(api, buildapi)
        }
        /// 4.2.1 (compatible; Catodon 24.04-dev.2)
        if version.lowercased().contains("catodon") {
            return Catodon(api)
        }
        /// 3.0.0 (compatible; Firefish 20240504)
        if version.lowercased().contains("firefish") {
            return Firefish(api)
        }
        /// 2.8.0 (compatible; Friendica 2024.03)
        if version.lowercased().contains("friendica") {
            return Friendica(api)
        }
        /// 4.3.0+nightly.2024-03-01+glitch
        if version.lowercased().contains("glitch") {
            return Glitch(api)
        }
        /// 4.0.15+hometown-1.1.1
        if version.lowercased().contains("hometown") {
            return Hometown(api)
        }
        /// 4.2.1 (compatible; Iceshrimp 2023.12.7)
        if version.lowercased().contains("iceshrimp") {
            return Iceshrimp(api)
        }
        /// 4.0.0 (compatible; Mitra 2.18.0)
        if version.lowercased().contains("mitra") {
            return Mitra(api, buildapi)
        }
        /// 3.5.3 (compatible; Pixelfed 0.11.13)
        if version.lowercased().contains("pixelfed") {
            return Pixelfed(api, buildapi)
        }
        /// 3.0.0 (compatible; Pleroma 2.6.52-725-g987f44d8-2-6-2)
        if version.lowercased().contains("pleroma") {
            return Pleroma(api, buildapi)
        }
        /// 3.0.0 (compatible; Sharkey 2024.3.3)
        if version.lowercased().contains("sharkey") {
            return Sharkey(api)
        }
        /// 4.0.0 (not true; really snac/2.52)
        if version.lowercased().contains("snac") {
            return Snac(api)
        }
        /// Takahe doesn't display the Mastodon api
        ///  Start with something arbitrary then adjust
        if version.lowercased().contains("takahe") {
            return Takahe(Version(3, 5, 3), api)
        }
        // kludge - GotoSocial version string is missing GotoSocial name
        // and Mastodon API version
        // (except when it's set to display the Mastodon version
        // and doesn't display any GotoSocial info)
        // just a git version
        // so let's just say it's the latest and see what happens
        /// 0.15.0+git-1573cd
        if version.lowercased().contains("git") {
            // instanceMastodonVersion in internalfrontend.go
            return GotoSocial(Version(3, 5, 3), api)
        }
        return Mastodon(api)
    }
}
