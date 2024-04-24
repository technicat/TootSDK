//
//  ScheduledPostUpdateParams.swift
//
//
//  Created by Philip Chu on 4/21/24.

import Foundation

/// for use in updating a ScheduledPost publication date
public struct ScheduledPostUpdateParams: Codable {
    /// UTC Datetime at which to schedule a post in ISO 8601 format
    public var scheduledAt: String

    enum CodingKeys: String, CodingKey {
        case scheduledAt = "scheduled_at"
    }

    public init(scheduledDate: Date) {
        scheduledAt = TootEncoder.dateFormatter.string(from: scheduledDate)
    }
}
