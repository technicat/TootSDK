// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

public enum ReportCategory: String, CaseIterable, Codable, Sendable {
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
