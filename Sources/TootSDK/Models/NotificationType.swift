// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

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
