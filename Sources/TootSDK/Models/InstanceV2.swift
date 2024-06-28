import Foundation

/// General information about an instance
/// fields are listed in order of the spec
/// https://docs.joinmastodon.org/entities/Instance/
public struct InstanceV2: Codable, Hashable {
    public init(
        domain: String,
        title: String? = nil,
        version: String,
        sourceUrl: String,
        description: String? = nil,
        usage: Usage,
        thumbnail: Thumbnail? = nil,
        languages: [ISOCode]? = nil,
        configuration: Configuration,
        rules: [InstanceRule]? = nil,
        registrations: Registrations,
        contact: Contact,
        pleroma: PleromaInstance? = nil
    ) {
        self.domain = domain
        self.title = title
        self.version = version
        self.sourceUrl = sourceUrl
        self.description = description
        self.usage = usage
        self.thumbnail = thumbnail
        self.languages = languages
        self.configuration = configuration
        self.rules = rules
        self.registrations = registrations
        self.contact = contact
        self.pleroma = pleroma
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
    /// Usage data for this instance.
    public var usage: Usage
    // todo - add usage
    /// An image used to represent this instance.
    /// Not optional in spec but missing in Mitra
    public var thumbnail: Thumbnail?
    /// Primary languages of the website and its staff.
    public var languages: [ISOCode]?
    /// Configured values and limits for this website.
    /// Not optional in spec but consistent with V1
    public var configuration: Configuration?
    /// Information about registering for this website.
    public var registrations: Registrations
    /// Hints related to contacting a representative of the website.
    public var contact: Contact
    /// An itemized list of rules for users of the instance.
    public var rules: [InstanceRule]?
    /// Pleroma
    /// https://docs-develop.pleroma.social/backend/development/API/differences_in_mastoapi_responses/
    public var pleroma: PleromaInstance?

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

    public struct Usage: Codable, Hashable {
        /// Usage data related to users on this instance.
        public var users: Users

        public struct Users: Codable, Hashable {
            /// The number of active users in the past 4 weeks.
            public var activeMonth: Int

        }
    }

    public struct Contact: Codable, Hashable {
        /// An email address that can be messaged regarding inquiries or issues.
        public var email: String
        /// An account that can be contacted natively over the network regarding inquiries or issues.
        public var account: Account?  // causing crashes?
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domain = try container.decode(String.self, forKey: .domain)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.version = try container.decode(String.self, forKey: .version)
        self.sourceUrl = try container.decode(String.self, forKey: .sourceUrl)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.usage = try container.decode(Usage.self, forKey: .usage)
        self.thumbnail = try container.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
        self.languages = try container.decodeISOList(forKey: .languages)
        self.configuration = try container.decodeIfPresent(Configuration.self, forKey: .configuration)
        self.contact = try container.decode(Contact.self, forKey: .contact)
        self.registrations = try container.decode(Registrations.self, forKey: .registrations)
        self.rules = try container.decodeIfPresent([InstanceRule].self, forKey: .rules)
        self.pleroma = try container.decodeIfPresent(PleromaInstance.self, forKey: .pleroma)
    }

}
