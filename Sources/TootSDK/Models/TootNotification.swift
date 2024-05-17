// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Represents a notification of an event relevant to the user.
public struct TootNotification: Codable, Hashable, Identifiable, Sendable {
    public init(
        id: String,
        type: TootNotification.NotificationType,
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

    public enum NotificationType: String, Codable, Sendable, CaseIterable {
        /// Someone followed you
        case follow
        /// Someone mentioned you in their post
        case mention
        /// Someone reposted one of your posts
        case repost = "reblog"
        /// Someone favourited one of your posts
        case favourite
        /// A poll you have voted in or created has ended
        case poll
        /// Someone requested to follow you
        case followRequest = "follow_request"
        /// Someone you enabled notifications for has posted a post
        case post = "status"
        /// A post you interacted with has been edited
        case update = "update"
        /// Someone signed up
        case adminSignUp = "admin.sign_up"
        /// A new report has been filed
        case adminReport = "admin.report"
        /// Some of your follow relationships have been severed as a result of a moderation or block event
        case severedRelationships = "severed_relationships"

    }

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

extension TootNotification.NotificationType: Identifiable {
    public var id: Self { self }
}
