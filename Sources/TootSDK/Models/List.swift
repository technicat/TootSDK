// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Represents a list of some users that the authenticated user follows.
public struct List: Codable, Hashable, Identifiable {

    /// The internal database ID of the list.
    public var id: String

    /// The user-defined title of the list.
    public var title: String

    /// Which replies should be shown in the list.
    public var repliesPolicy: ListRepliesPolicy?

    /// Whether members of this list need to get removed from the “Home” feed.
    public var exclusive: Bool?

    public init(id: String, title: String, repliesPolicy: ListRepliesPolicy, exclusive: Bool? = nil) {
        self.id = id
        self.title = title
        self.repliesPolicy = repliesPolicy
        self.exclusive = exclusive
    }
}
