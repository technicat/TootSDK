// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Reports filed against users and/or posts, to be taken action on by moderators.
/// https://docs.joinmastodon.org/entities/Report/
public struct Report: Codable, Hashable, Identifiable, Sendable {
    // added in 1.1
    /// The ID of the report in the database.
    public var id: String
    /// Whether an action was taken yet.
    public var actionTaken: Bool?
    // added in 4.0
    /// When an action was taken against the report.
    public var actionTakenAt: Date?
    /// The generic reason for the report.
    public var category: Category?
    /// The reason for the report.
    public var comment: String?
    /// Whether the report was forwarded to a remote domain.
    public var forwarded: Bool?
    /// When the report was created.
    public var createdAt: Date?
    /// IDs of statuses that have been attached to this report for additional context.
    public var statusIds: [String]?
        /// IDs of the rules that have been cited as a violation by this report.
    public var ruleIds: [String]?
    /// The account that was reported.
    public var targetAccount: Account?
}

extension Report {
    
    public enum Category: String, CaseIterable, Codable {
        /// Unwanted or repetitive content
        case spam
        /// A specific rule was violated
        case violation
        /// Some other reason
        case other
        /// Content that is illegal in the user's or the instance's country.
        case legal
        // pixelfed
        case sensitive
        case abusive
        case underage
        case violence
        case copyright
        case impersonation
        case scam
        case terrorism
    }
}
