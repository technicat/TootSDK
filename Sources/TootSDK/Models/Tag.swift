// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Represents a hashtag used within the content of a post.
/// https://docs.joinmastodon.org/entities/Tag/
public struct Tag: Codable, Hashable, Sendable {
    public init(name: String, url: String, history: [TagHistory]? = nil, following: Bool? = nil) {
        self.name = name
        self.url = url
        self.history = history
        self.following = following
    }

    /// The value of the hashtag after the # sign.
    public let name: String
    /// A link to the hashtag on the instance.
    public let url: String
    /// Usage statistics for given days.
    public let history: [TagHistory]?
    /// Are you following this tag?
    public let following: Bool?
}
