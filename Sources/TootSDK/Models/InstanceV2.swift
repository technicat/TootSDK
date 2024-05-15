import Foundation

/// General information about an instance
/// https://docs.joinmastodon.org/entities/Instance/
/// todo - fill in
public struct InstanceV2: Codable, Hashable {
    public init(
        domain: String,
        title: String? = nil,
        version: String,
        sourceUrl: String,
        description: String? = nil,
        languages: [String]? = nil,
        configuration: Configuration? = nil,
        contactAccount: Account? = nil,
        rules: [InstanceRule]? = nil,
        thumbnail: Thumbnail? = nil
    ) {
        self.domain = domain
        self.title = title
        self.version = version
        self.sourceUrl = sourceUrl
        self.description = description
        self.languages = languages
        self.configuration = configuration
        self.rules = rules
        self.thumbnail = thumbnail
    }

    /// The domain name of the instance.
    public var domain: String
    /// The title of the website.
    public var title: String?
    /// The version of  the server installed on the instance.
    public var version: String
    /// The URL for the source code of the software running on this instance, in keeping with AGPL license requirements..
    public var sourceUrl: String
    /// Admin-defined description of the Fediverse site.
    public var description: String?
    /// Primary languages of the website and its staff.
    public var languages: [String]?
    public var configuration: Configuration?
    /// An itemized list of rules for users of the instance.
    public var rules: [InstanceRule]?
    /// An image used to represent this instance.
    /// Not optional in spec but missing in Mitra
    public var thumbnail: Thumbnail?

    public struct Thumbnail: Codable, Hashable {
        /// The URL for the thumbnail image.
        public var url: String
        /// A hash computed by the BlurHash algorithm, for generating colorful preview thumbnails when media has not been downloaded yet.
      //  public var blurhash: String? // causing crashes?
    }
}
