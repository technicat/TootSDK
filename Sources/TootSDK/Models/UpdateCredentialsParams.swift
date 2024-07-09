//
//  UpdateCredentialsParams.swift
//
//
//  Created by Philip Chu on 6/26/23.
//

import Foundation

/// https://docs-p.joinmastodon.org/methods/accounts/#update_credentials
public struct UpdateCredentialsParams: Codable {
    /// The display name to use for the profile.
    public var displayName: String?
    /// The account bio.
    public var note: String?
    /// Avatar image encoded using multipart/form-data
    public var avatar: Data?
    public var avatarMimeType: MIMEType?
    /// Header image encoded using multipart/form-data
    public var header: Data?
    public var headerMimeType: MIMEType?
    /// Whether manual approval of follow requests is required.
    public var locked: Bool?
    /// Whether the account has a bot flag.
    public var bot: Bool?
    /// Whether he account should be shown in the profile directory.
    public var discoverable: Bool?
    /// Whether to hide followers and followed accounts.
    public var hideCollections: Bool?
    /// Whether public posts should be searchable to anyone.
    public var indexable: Bool?
    /// The profile fields to be set. Inside this hash, the key is an integer cast to a string (although the exact integer does not matter), and the value is another hash including name and value. By default, max 4 fields.
    public let fieldsAttributes: [Field]?
    /// An extra entity to be used with API methods to verify credentials and update credentials
    public let source: Source?
    // gotosocial
    /// Description of avatar image, for alt-text.
    public let avatarDescription: String?
    /// Description of header image, for alt-text.
    public let headerDescription: String?

    public init(
        displayName: String? = nil, note: String? = nil, avatar: Data? = nil, avatarMimeType: MIMEType? = nil, header: Data? = nil,
        headerMimeType: MIMEType? = nil, locked: Bool? = nil, bot: Bool? = nil, discoverable: Bool? = nil, hideCollections: Bool? = nil,
        indexable: Bool? = nil,
        fieldsAttributes: [Field]? = nil,
        source: Source? = nil,
        avatarDescription: String? = nil,
        headerDescription: String? = nil
    ) {
        self.displayName = displayName
        self.note = note
        self.avatar = avatar
        self.avatarMimeType = avatarMimeType
        self.header = header
        self.headerMimeType = headerMimeType
        self.locked = locked
        self.bot = bot
        self.discoverable = discoverable
        self.hideCollections = hideCollections
        self.indexable = indexable
        self.fieldsAttributes = fieldsAttributes
        self.source = source
        self.avatarDescription = avatarDescription
        self.headerDescription = headerDescription
    }

    /// Represents a profile field as a name-value pair
    public struct Field: Codable, Hashable, Sendable {
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

        /// The name of the profile field. By default, max 255 characters.
        public var name: String
        /// The value of the profile field. By default, max 255 characters.
        public var value: String
    }

    public struct Source: Codable, Hashable, Sendable {
        public init(privacy: PostVisibility? = nil, sensitive: Bool? = nil, language: ISOCode? = nil) {
            self.privacy = privacy
            self.sensitive = sensitive
            self.language = language
        }
        /// The default post privacy to be used for new posts.
        public var privacy: PostVisibility?
        /// Whether new posts should be marked sensitive by default.
        public var sensitive: Bool?
        ///  The default posting language for new posts.
        public var language: ISOCode?
    }
}
