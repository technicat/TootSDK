// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

public struct Filter: Codable, Hashable, Identifiable {

    /// The ID of the Filter in the database.
    public var id: String
    /// A title given by the user to name the filter.
    public var title: String
    /// The contexts in which the filter should be applied.
    public var context: [FilterContext]
    /// When the filter should no longer be applied.
    public var expiresAt: Date?
    /// The action to be taken when a post matches this filter.
    public var filterAction: FilterAction
    /// The keywords grouped under this filter.
    public var keywords: [FilterKeyword]
    /// The posts grouped under this filter.
    public var posts: [FilterPost]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case context
        case expiresAt
        case filterAction
        case keywords
        case posts = "statuses"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.context = try container.decode([FilterContext].self, forKey: .context)
        self.expiresAt = try? container.decodeIfPresent(Date.self, forKey: .expiresAt)
        self.filterAction = try container.decode(FilterAction.self, forKey: .filterAction)
        // not returned when part of FilterResult
        self.keywords = (try? container.decodeIfPresent([FilterKeyword].self, forKey: .keywords)) ?? []
        // not returned when part of FilterResult
        self.posts = (try? container.decodeIfPresent([FilterPost].self, forKey: .posts)) ?? []
    }
}
