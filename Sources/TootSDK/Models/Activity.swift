// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Represents a weekly bucket of instance activity.
/// https://docs.joinmastodon.org/methods/instance/#activity
public struct Activity: Codable, Hashable {
    public init(week: Date, posts: Int, logins: Int, registrations: Int) {
        self.week = week
        self.posts = posts
        self.logins = logins
        self.registrations = registrations
    }

    /// Midnight at the first day of the week.
    public var week: Date
    /// posts created since the week began.
    public var posts: Int
    /// User logins since the week began.
    public var logins: Int
    /// User registrations since the week began.
    public var registrations: Int

    enum CodingKeys: String, CodingKey {
        case week
        case posts = "statuses"
        case logins
        case registrations
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // spec says these are strings
        // but Takahe return ints (which makes more sense)
        self.posts = try container.decodeIntFromString(forKey: .posts)
        self.logins = try container.decodeIntFromString(forKey: .logins)
        self.registrations = try container.decodeIntFromString(forKey: .registrations)

        self.week = try container.decodeUnixDate(forKey: .week)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(String(Int(week.timeIntervalSince1970)), forKey: .week)
        try container.encode(String(posts), forKey: .posts)
        try container.encode(String(logins), forKey: .logins)
        try container.encode(String(registrations), forKey: .registrations)
    }
}
