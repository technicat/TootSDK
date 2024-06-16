// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// General information about an instance
/// https://docs.joinmastodon.org/entities/V1_Instance/
public struct InstanceV1: Codable, Hashable {
    public init(
        uri: String,
        title: String? = nil,
        description: String? = nil,
        shortDescription: String? = nil,
        email: String? = nil,
        version: String,
        languages: [String]? = nil,
        registrations: Bool? = nil,
        approvalRequired: Bool? = nil,
        invitesEnabled: Bool? = nil,
        urls: InstanceURLs,
        stats: Stats? = nil,
        thumbnail: String? = nil,
        configuration: Configuration? = nil,
        contactAccount: Account? = nil,
        rules: [InstanceRule]? = nil
    ) {
        self.uri = uri
        self.title = title
        self.description = description
        self.shortDescription = shortDescription
        self.email = email
        self.version = version
        self.languages = languages
        self.registrations = registrations
        self.approvalRequired = approvalRequired
        self.invitesEnabled = invitesEnabled
        self.urls = urls
        self.stats = stats
        self.thumbnail = thumbnail
        self.configuration = configuration
        self.contactAccount = contactAccount
        self.rules = rules
    }

    /// The domain name of the instance.
    public var uri: String
    /// The title of the website.
    public var title: String?
    /// Admin-defined description of the Fediverse site.
    public var description: String?
    /// A shorter description defined by the admin.
    public var shortDescription: String?
    /// An email that may be contacted for any inquiries.
    public var email: String?
    /// The version of  the server installed on the instance.
    public var version: String
    /// Primary languages of the website and its staff.
    public var languages: [String]?
    /// Whether registrations are enabled.
    public var registrations: Bool?
    /// Whether registrations require moderator approval.
    public var approvalRequired: Bool?
    /// Whether invites are enabled.
    public var invitesEnabled: Bool?
    /// URLs of interest for clients apps.
    public var urls: InstanceURLs?
    /// Statistics about how much information the instance contains.
    /// non-optional in spec but missing in microdotblog
    public var stats: Stats?
    /// Banner image for the website.
    public var thumbnail: String?
    /// Configured values and limits for this instance.
    public var configuration: Configuration?
    /// A user that can be contacted, as an alternative to email.
    public var contactAccount: Account?
    /// An itemized list of rules for users of the instance.
    public var rules: [InstanceRule]?

    public struct InstanceURLs: Codable, Hashable {
        /// Websockets address for push streaming. String (URL).
        public var streamingApi: String?
    }

    public struct Stats: Codable, Hashable {
        /// Users registered on this instance. Number.
        public var userCount: Int?
        /// Posts authored by users on instance. Number.
        public var postCount: Int?
        /// Domains federated with this instance. Number.
        public var domainCount: Int?

        enum CodingKeys: String, CodingKey {
            case userCount
            case postCount = "statusCount"
            case domainCount
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            // pixelfed returns postCount as a string
            self.userCount = try container.decodeIntFromString(forKey: .userCount)
            self.postCount = try container.decodeIntFromString(forKey: .postCount)
            self.domainCount = try container.decodeIntFromString(forKey: .domainCount)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uri = try container.decode(String.self, forKey: .uri)
        self.title = try? container.decodeIfPresent(String.self, forKey: .title)
        self.description = try? container.decodeIfPresent(String.self, forKey: .description)
        self.shortDescription = try? container.decodeIfPresent(String.self, forKey: .shortDescription)
        self.email = try? container.decodeIfPresent(String.self, forKey: .email)
        self.version = try container.decode(String.self, forKey: .version)
        self.languages = try? container.decodeIfPresent([String].self, forKey: .languages)
        self.registrations = try? container.decodeIfPresent(Bool.self, forKey: .registrations)
        self.approvalRequired = try? container.decodeIfPresent(Bool.self, forKey: .approvalRequired)
        self.invitesEnabled = try? container.decodeIfPresent(Bool.self, forKey: .invitesEnabled)
        self.urls = try? container.decodeIfPresent(InstanceURLs.self, forKey: .urls)
        self.stats = try container.decodeIfPresent(Stats.self, forKey: .stats)
        self.thumbnail = try? container.decodeIfPresent(String.self, forKey: .thumbnail)
        self.configuration = try? container.decodeIfPresent(Configuration.self, forKey: .configuration)
        // also handles some friendica instances returning []
        self.contactAccount = try? container.decodeIfPresent(Account.self, forKey: .contactAccount)
        self.rules = try? container.decodeIfPresent([InstanceRule].self, forKey: .rules)
    }

}
