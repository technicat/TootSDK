// Created by konstantin on 05/11/2022.
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Represents daily usage history of a hashtag.
public struct TagHistory: Codable, Hashable, Sendable {
    public init(
        day: Date,
        uses: Int,
        accounts: Int
    ) {
        self.day = day
        self.uses = uses
        self.accounts = accounts
    }

    /// UNIX timestamp on midnight of the given day.
    public var day: Date
    /// the counted usage of the hashtag within that day.
    public var uses: Int
    /// the total of accounts using the hashtag within that day.
    public var accounts: Int

    enum CodingKeys: String, CodingKey {
        case day
        case uses
        case accounts
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // spec says these are strings
        // but Takahe return ints (which makes more sense)
        self.uses = try container.decodeIntFromString(forKey: .uses)
        self.accounts = try container.decodeIntFromString(forKey: .accounts)
        self.day = try container.decodeUnixDate(forKey: .day)
    }
}
