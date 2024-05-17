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
        configuration: Configuration,
        rules: [InstanceRule]? = nil,
        thumbnail: Thumbnail? = nil,
        registrations: Registrations,
        contact: Contact
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
        self.registrations = registrations
        self.contact = contact
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
    /// Configured values and limits for this website.
    /// Not optional in spec but consistent with V1
    public var configuration: Configuration?
    /// An itemized list of rules for users of the instance.
    public var rules: [InstanceRule]?
    /// An image used to represent this instance.
    /// Not optional in spec but missing in Mitra
    public var thumbnail: Thumbnail?
    /// Information about registering for this website.
    public var registrations: Registrations
    /// Hints related to contacting a representative of the website.
    public var contact: Contact

    public struct Thumbnail: Codable, Hashable {
        /// The URL for the thumbnail image.
        public var url: String
        /// A hash computed by the BlurHash algorithm, for generating colorful preview thumbnails when media has not been downloaded yet.
        public var blurhash: String?  // causing crashes?
        // todo - add 1x/2x
    }

    public struct Registrations: Codable, Hashable {
        /// Whether registrations are enabled.
        public var enabled: Bool
        /// Whether registrations require moderator approval.
        public var approvalRequired: Bool
        /// A custom message to be shown when registrations are closed.
        public var message: String?
    }
    
    public struct Contact: Codable, Hashable {
        /// An email address that can be messaged regarding inquiries or issues.
        public var email: String
        /// An account that can be contacted natively over the network regarding inquiries or issues.
        public var account: Account?  // causing crashes?
    }
}
