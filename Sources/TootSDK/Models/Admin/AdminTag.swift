//
//  AdminTag.swift
//
//
//  Created by Philip Chu on 6/16/24.
//

import Foundation

/// Represents a hashtag used within the content of a post.
/// https://docs.joinmastodon.org/entities/Tag/
/// todo - make this a subclass of Tag?
public struct AdminTag: Codable, Hashable, Sendable, Identifiable {
    public init(
        name: String, url: String, history: [TagHistory]? = nil, following: Bool? = nil, id: String, trendable: Bool, usable: Bool,
        requiresReview: Bool
    ) {
        self.name = name
        self.url = url
        self.history = history
        self.following = following
        self.id = id
        self.trendable = trendable
        self.usable = usable
        self.requiresReview = requiresReview
    }

    /// The value of the hashtag after the # sign.
    public let name: String
    /// A link to the hashtag on the instance.
    public let url: String
    /// Usage statistics for given days.
    public let history: [TagHistory]?
    /// Are you following this tag?
    public let following: Bool?
    // admin stuff
    /// The ID of the Tag in the database.
    public let id: String
    /// Whether the hashtag has been approved to trend.
    public let trendable: Bool
    /// Whether the hashtag has not been disabled from auto-linking.
    public let usable: Bool
    /// Whether the hashtag has not been reviewed yet to approve or deny its trending.
    public let requiresReview: Bool
}
