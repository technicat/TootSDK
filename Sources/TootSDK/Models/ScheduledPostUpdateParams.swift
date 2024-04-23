//
//  ScheduledPostUpdateParams.swift
//
//
//  Created by Philip Chu on 4/21/24.

import Foundation

/// ScheduledPostParams` suitable for multipart requests
internal struct ScheduledPostUpdateParams: Codable {
    /// UTC Datetime at which to schedule a post in ISO 8601 format
    public var scheduledAt: String

    enum CodingKeys: String, CodingKey {
        case scheduledAt = "scheduled_at"
    }
}
