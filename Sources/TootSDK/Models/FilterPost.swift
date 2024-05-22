// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// https://docs.joinmastodon.org/entities/FilterStatus/
/// Represents a status ID that, if matched, should cause the filter action to be taken.
public struct FilterPost: Codable, Hashable, Identifiable {
    /// The ID of the FilterStatus in the database.
    public var id: String
    /// The ID of the Post that will be filtered.
    public var postId: String

    enum CodingKeys: String, CodingKey {
        case id
        case postId = "status_id"
    }
}
