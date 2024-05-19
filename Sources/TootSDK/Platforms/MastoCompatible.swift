/// not Mastodon but with the API (more or less)
open class MastoCompatible: MastoAPI {
    
    public init(_ api: Version, _ build: String = "") {
        buildVersion = build.version.api
        super.init(api)
    }
    
    var buildVersion: Version
}
