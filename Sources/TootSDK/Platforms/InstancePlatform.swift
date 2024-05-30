extension Instance {

    public var platform: Platform? {
        version.platform
    }
}

extension String {

    public var platform: Platform? {
        let vs = version
        let api = vs.api
        let buildapi = vs.build.version.api
        let lc = lowercased()
        /// 2.7.2  (compatible; Akkoma 3.13.1-0-gc02e343)
        if lc.contains("akkoma") {
            return Akkoma(api, buildapi)
        }
        /// 4.2.1 (compatible; Catodon 24.04-dev.2)
        if lc.contains("catodon") {
            return Catodon(api)
        }
        /// 3.0.0 (compatible; Firefish 20240504)
        if lc.contains("firefish") {
            return Firefish(api)
        }
        /// 2.8.0 (compatible; Friendica 2024.03)
        if lc.contains("friendica") {
            return Friendica(api)
        }
        /// 4.3.0+nightly.2024-03-01+glitch
        if lc.contains("glitch") {
            return Glitch(api)
        }
        /// 4.0.15+hometown-1.1.1
        if lc.contains("hometown") {
            return Hometown(api)
        }
        /// 4.2.1 (compatible; Iceshrimp 2023.12.7)
        if lc.contains("iceshrimp") {
            return Iceshrimp(api)
        }
        /// 4.0.0 (compatible; Mitra 2.18.0)
        if lc.contains("mitra") {
            return Mitra(api, buildapi)
        }
        /// 3.5.3 (compatible; Pixelfed 0.11.13)
        if lc.contains("pixelfed") {
            return Pixelfed(api, buildapi)
        }
        /// 3.0.0 (compatible; Pleroma 2.6.52-725-g987f44d8-2-6-2)
        if lc.contains("pleroma") {
            return Pleroma(api, buildapi)
        }
        /// 3.0.0 (compatible; Sharkey 2024.3.3)
        if lc.contains("sharkey") {
            return Sharkey(api)
        }
        /// 4.0.0 (not true; really snac/2.52)
        if lc.contains("snac") {
            return Snac(api)
        }
        /// Takahe doesn't display the Mastodon api versio
        ///  So this is the takahi version
        if lc.contains("takahe") {
            return Takahe(api)
        }
        // kludge - GotoSocial version string is missing GotoSocial name
        // and Mastodon API version
        // (except when it's set to display the Mastodon version
        // so just pass the GotoSocial version
        /// 0.15.0+git-1573cd
        //        if lc.lowercased().contains("git") {
        //            // instanceMastodonVersion in internalfrontend.go
        //            return GotoSocial(api)
        //        }
        return nil
    }
}
