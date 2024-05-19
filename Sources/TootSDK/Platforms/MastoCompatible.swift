/// not Mastodon but with the API (more or less)
open class MastoCompatible: MastoAPI {
    
    public init(_ api: Version, _ build: String = "") {
        self.build = build.version.api
        super.init(api)
    }
    
    var build: Version
}
