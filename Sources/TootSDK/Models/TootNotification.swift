// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Represents a notification of an event relevant to the user.
public struct TootNotification: Codable, Hashable, Identifiable, Sendable {
    public init(
        id: String,
        type: NotificationType,
        account: Account,
        createdAt: Date,
        post: Post? = nil,
        report: Report? = nil,
        relationshipSeveranceEvent: RelationshipSeveranceEvent? = nil
    ) {
        self.id = id
        self.type = type
        self.account = account
        self.createdAt = createdAt
        self.post = post
        self.report = report
        self.relationshipSeveranceEvent = relationshipSeveranceEvent
    }

    /// The id of the notification in the database.
    public var id: String
    /// The type of event that resulted in the notification.
    public var type: NotificationType
    /// The account that performed the action that generated the notification.
    public var account: Account
    /// The timestamp of the notification.
    public var createdAt: Date
    /// Post that was the object of the notification, e.g. in mentions, reposts, favourites, or polls.
    public var post: Post?
    /// Report that was the object of the notification. Attached when type of the notification is ``NotificationType/adminReport``.
    public var report: Report?
    /// Summary of the event that caused follow relationships to be severed. Attached when type of the notification is ``NotificationType/severedRelationships``.
    public var relationshipSeveranceEvent: RelationshipSeveranceEvent?

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case account
        case createdAt
        case post = "status"
        case report
        case relationshipSeveranceEvent = "relationship_severance_event"
    }
}
