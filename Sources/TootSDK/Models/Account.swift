// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Represents a user  and their associated profile.
/// Has a recursive reference (moved) so must be a class
public class Account: Codable, Identifiable, @unchecked Sendable {

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.username = try? container.decodeIfPresent(String.self, forKey: .username)
        self.acct = try container.decode(String.self, forKey: .acct)
        self.url = try container.decode(String.self, forKey: .url)
        self.displayName = try? container.decodeIfPresent(String.self, forKey: .displayName)
        self.note = try container.decode(String.self, forKey: .note)
        self.avatar = try? container.decodeIfPresent(String.self, forKey: .avatar)
        self.avatarStatic = try? container.decodeIfPresent(String.self, forKey: .avatarStatic)
        self.header = try container.decodeIfPresent(String.self, forKey: .header)
        self.headerStatic = try container.decodeIfPresent(String.self, forKey: .headerStatic)
        self.locked = try container.decode(Bool.self, forKey: .locked)
        // pixelfed doesn't include emojis in block/mute lists
        self.emojis = (try? container.decodeIfPresent([Emoji].self, forKey: .emojis)) ?? []
        self.discoverable = try? container.decodeIfPresent(Bool.self, forKey: .discoverable)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.lastPostAt = try? container.decodeIfPresent(Date.self, forKey: .lastPostAt)
        self.postsCount = try container.decodeIfPresent(Int.self, forKey: .postsCount)
        self.followersCount = try container.decode(Int.self, forKey: .followersCount)
        self.followingCount = try container.decode(Int.self, forKey: .followingCount)
        self.noindex = try? container.decodeIfPresent(Bool.self, forKey: .noindex)
        self.indexable = try? container.decodeIfPresent(Bool.self, forKey: .indexable)
        self.hideCollections = try? container.decodeIfPresent(Bool.self, forKey: .hideCollections)
        self.moved = try? container.decodeIfPresent(Account.self, forKey: .moved)
        self.suspended = try? container.decodeIfPresent(Bool.self, forKey: .suspended)
        self.limited = try? container.decodeIfPresent(Bool.self, forKey: .limited)
        // pixelfed doesn't include fields in block/mute lists
        self.fields = (try? container.decodeIfPresent([TootField].self, forKey: .fields)) ?? []
        self.bot = try? container.decodeIfPresent(Bool.self, forKey: .bot)
        self.group = try? container.decodeIfPresent(Bool.self, forKey: .group)
    }

    /// The account id.
    public let id: String
    /// The username of the account, not including domain.
    public let username: String?
    /// The Webfinger account URI. Equal to username for local users, or username@domain for remote users.
    public let acct: String
    /// The location of the user's profile page
    public let url: String
    /// The profile's display name.
    public let displayName: String?
    /// The profile's bio / description
    public let note: String
    /// An image icon that is shown next to posts and in the profile
    /// Non-optional in Mastodon spec but can be missing in Mitra
    public let avatar: String?
    /// A static version of the avatar.
    public let avatarStatic: String?
    /// An image banner that is shown above the profile and in profile cards
    /// Pixelfed stubs with missing.png or leaves nil
    public let header: String?
    /// A static version of the header
    /// /// Pixelfed stubs with missing.png or leaves nil
    public let headerStatic: String?
    /// Whether the account manually approves follow requests
    public let locked: Bool
    /// Custom emoji entities to be used when rendering the profile. If none, an empty array will be returned
    public let emojis: [Emoji]
    /// Whether the account has opted into discovery features such as the profile directory
    public let discoverable: Bool?
    /// Whether to hide followers and followed accounts.
    public let hideCollections: Bool?
    /// Whether public posts should be searchable to anyone.
    public let indexable: Bool?
    /// When the account was created
    public let createdAt: Date
    /// When the most recent post was posted
    public let lastPostAt: Date?
    /// How many posts are attached to this account.
    /// Firefish doesn't return this in a post this is reposting
    public let postsCount: Int?
    /// The reported followers of this profile
    public let followersCount: Int
    /// The reported follows of this profile
    public let followingCount: Int
    /// Whether the local user has opted out of being indexed by search engines.
    public let noindex: Bool?
    /// Indicates that the profile is currently inactive and that its user has moved to a new account
    public let moved: Account?
    /// An extra attribute returned only when an account is suspended.
    public let suspended: Bool?
    /// An extra attribute returned only when an account is silenced. If true, indicates that the account should be hidden behing a warning screen.
    public let limited: Bool?
    /// Additional metadata attached to a profile as name-value pairs
    public let fields: [TootField]
    /// A presentational flag.
    /// Indicates that the account may perform automated actions, may not be monitored, or identifies as a robot
    public let bot: Bool?
    /// Indicates that the account represents a Group actor.
    public let group: Bool?
}

extension Account {
    public enum CodingKeys: String, CodingKey {
        case id
        case username
        case acct
        case url
        case displayName
        case note
        case avatar
        case avatarStatic
        case header
        case headerStatic
        case locked
        case emojis
        case discoverable
        case hideCollections
        case indexable
        case createdAt
        case lastPostAt = "lastStatusAt"
        case postsCount = "statusesCount"
        case followersCount
        case followingCount
        case noindex
        case moved
        case suspended
        case limited
        case fields
        case bot
        case group
    }
}

extension Account: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(username)
        hasher.combine(acct)
        hasher.combine(url)
        hasher.combine(displayName)
        hasher.combine(note)
        hasher.combine(avatar)
        hasher.combine(avatarStatic)
        hasher.combine(header)
        hasher.combine(headerStatic)
        hasher.combine(locked)
        hasher.combine(emojis)
        hasher.combine(discoverable)
        hasher.combine(hideCollections)
        hasher.combine(indexable)
        hasher.combine(createdAt)
        hasher.combine(lastPostAt)
        hasher.combine(postsCount)
        hasher.combine(followersCount)
        hasher.combine(followingCount)
        hasher.combine(noindex)
        hasher.combine(moved)
        hasher.combine(suspended)
        hasher.combine(limited)
        hasher.combine(fields)
        hasher.combine(bot)
        hasher.combine(group)
    }

    public static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

}

extension Account: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Account with id: \(id)"
    }
}

// https://docs.joinmastodon.org/entities/Account/#CredentialAccount
/// An extra entity to be used with API methods to verify credentials and update credentials
public class CredentialAccount: Account {

    public let source: TootSource?
    /// The role assigned to the currently authorized user.
    public let role: TootRole?
    
    public enum CodingKeys: String, CodingKey {
        case source
        case role
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try? container.decodeIfPresent(TootSource.self, forKey: .source)
        self.role = try? container.decodeIfPresent(TootRole.self, forKey: .role)
        try super.init(from: decoder)
    }
}
