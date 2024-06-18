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
    /// not returned when part of FilterResult
    public var keywords: [FilterKeyword]?
    /// The posts grouped under this filter.
    /// not returned when part of FilterResult
    public var posts: [FilterPost]?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case context
        case expiresAt
        case filterAction
        case keywords
        case posts = "statuses"
    }
}
