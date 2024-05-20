extension Instance {

    public var platform: Platform {
        let version = version.version
        let api = version.api
        let build = version.build
        /// 2.7.2  (compatible; Akkoma 3.13.1-0-gc02e343)
        if build.lowercased().contains("akkoma") {
            return Akkoma(api)
        }
        /// 4.2.1 (compatible; Catodon 24.04-dev.2)
        if build.lowercased().contains("catodon") {
            return Catodon(api)
        }
        /// 3.0.0 (compatible; Firefish 20240504)
        if build.lowercased().contains("firefish") {
            return Firefish(api)
        }
        /// 2.8.0 (compatible; Friendica 2024.03)
        if build.lowercased().contains("friendica") {
            return Friendica(api)
        }
        /// 4.3.0+nightly.2024-03-01+glitch
        if build.lowercased().contains("glitch") {
            return Glitch(api)
        }
        /// 4.0.15+hometown-1.1.1
        if build.lowercased().contains("hometown") {
            return Hometown(api)
        }
        /// 4.2.1 (compatible; Iceshrimp 2023.12.7)
        if build.lowercased().contains("iceshrimp") {
            return Iceshrimp(api)
        }
        /// 4.0.0 (compatible; Mitra 2.18.0)
        if build.lowercased().contains("mitra") {
            return Mitra(api, build)
        }
        /// 3.5.3 (compatible; Pixelfed 0.11.13)
        if build.lowercased().contains("pixelfed") {
            return Pixelfed(api, build)
        }
        /// 3.0.0 (compatible; Pleroma 2.6.52-725-g987f44d8-2-6-2)
        if build.lowercased().contains("pleroma") {
            return Pleroma(api, build)
        }
        /// 3.0.0 (compatible; Sharkey 2024.3.3)
        if build.lowercased().contains("sharkey") {
            return Sharkey(api)
        }
        /// 4.0.0 (not true; really snac/2.52)
        if build.lowercased().contains("snac") {
            return Snac(api)
        }
        // kludge - GotoSocial version string is missing GotoSocial name
        // and Mastodon API version
        // (except when it's set to display the Mastodon version
        // and doesn't display any GotoSocial info)
        // just a git version
        // so let's just say it's the latest and see what happens
        /// 0.15.0+git-1573cd
        if build.lowercased().contains("git") {
            // instanceMastodonVersion in internalfrontend.go
            return GotoSocial(Version(3, 5, 3))
        }
        return Mastodon(api)
    }
}
