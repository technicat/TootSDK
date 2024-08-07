// Created by konstantin on 02/11/2022.
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Represents display or publishing preferences of user's own account. Returned as an additional entity when verifying and updated credentials, as an attribute of CredentialAccount.
public struct TootSource: Codable, Hashable, Sendable {
    public init(
        note: String? = nil, fields: [TootField], privacy: PostVisibility? = nil, sensitive: Bool? = nil, language: ISOCode? = nil,
        followRequestsCount: Int? = nil, indexable: Bool? = nil, hideCollections: Bool? = nil, discoverable: Bool? = nil
    ) {
        self.note = note
        self.fields = fields
        self.privacy = privacy
        self.sensitive = sensitive
        self.language = language
        self.followRequestsCount = followRequestsCount
        self.indexable = indexable
        self.hideCollections = hideCollections
        self.discoverable = discoverable
    }

    /// Profile bio.
    public var note: String?
    /// Metadata about the account.
    public var fields: [TootField]
    /// The default post privacy to be used for new posts.
    public var privacy: PostVisibility?
    /// Whether new posts should be marked sensitive by default.
    public var sensitive: Bool?
    ///  The default posting language for new posts.
    public var language: ISOCode?
    /// The number of pending follow requests.
    public var followRequestsCount: Int?
    /// Whether public posts should be searchable to anyone.
    public let indexable: Bool?
    /// Whether to hide followers and followed accounts.
    public let hideCollections: Bool?
    /// Whether the account has opted into discovery features such as the profile directory
    public let discoverable: Bool?

    enum CodingKeys: String, CodingKey {
        case note
        case fields
        case privacy
        case sensitive
        case language
        case followRequestsCount
        case indexable
        case hideCollections
        case discoverable
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.fields = try container.decode([TootField].self, forKey: .fields)
        // sharkey can return ""
        self.privacy = try? container.decodeIfPresent(PostVisibility.self, forKey: .privacy)
        self.sensitive = try container.decodeIfPresent(Bool.self, forKey: .sensitive)
        // sharkey can return ""
        self.language = try? container.decodeIfPresent(ISOCode.self, forKey: .language)
        self.followRequestsCount = try container.decodeIfPresent(Int.self, forKey: .followRequestsCount)
        self.indexable = try container.decodeIfPresent(Bool.self, forKey: .indexable)
        self.hideCollections = try container.decodeIfPresent(Bool.self, forKey: .hideCollections)
        self.discoverable = try container.decodeIfPresent(Bool.self, forKey: .discoverable)
    }
}
