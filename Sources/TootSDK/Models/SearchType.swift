//  Search.swift
//  Created by Łukasz Rutkowski on 12/02/2023.

import Foundation

public enum SearchType: String, Sendable {
    case accounts
    case hashtags
    case posts = "statuses"
}
