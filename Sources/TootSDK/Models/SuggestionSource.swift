//
//  SuggestionSource.swift
//
//
//  Created by Philip Chu on 5/17/23.
//

import Foundation

public enum SuggestionSource: String, Codable, Sendable {
    /// This account was manually recommended by your administration team
    case staff
    /// You have interacted with this account previously
    case pastInteractions = "past_interactions"
    /// This account has many reblogs, favourites, and active local followers within the last 30 days
    case global
}
