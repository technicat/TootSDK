// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

public struct FilterPost: Codable, Hashable, Identifiable {
    /// The ID of the FilterStatus in the database.
    public var id: String
    // swift-format-ignore: AlwaysUseLowerCamelCase
    /// The ID of the Post that will be filtered.
    public var status_id: String
}
