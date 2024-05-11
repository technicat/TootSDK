//
//  PixelfedUpdateCredentialsParams.swift
//
//
//  Created by Philip Chu on 5/11/26.
//

import Foundation

// todo - add website
public struct PixelfedUpdateCredentialsParams: Codable {
    /// The display name to use for the profile.
    public var displayName: String?
    /// The account bio.
    public var note: String?
    /// Avatar image encoded using multipart/form-data
    public var avatar: Data?
    public var avatarMimeType: String?
    /// Whether manual approval of follow requests is required.
    public var locked: Bool?
    /// Whether the account has a bot flag.
    public var bot: Bool?
    /// An extra entity to be used with API methods to verify credentials and update credentials
    public let source: Source?

    public init(
        displayName: String? = nil, note: String? = nil, avatar: Data? = nil, avatarMimeType: String? = nil, locked: Bool? = nil,
        source: Source? = nil
    ) {
        self.displayName = displayName
        self.note = note
        self.avatar = avatar
        self.avatarMimeType = avatarMimeType
        self.locked = locked
        self.source = source
    }

    /// Represents a profile field as a name-value pair
    public struct Field: Codable, Hashable, Sendable {
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

        /// The key of a given field's key-value pair.
        public var name: String
        /// The value associated with the name key.
        public var value: String
    }

    public struct Source: Codable, Hashable, Sendable {
        public init(language: String? = nil) {
            self.language = language
        }
        ///  The default posting language for new posts.
        public var language: String?
    }
}
