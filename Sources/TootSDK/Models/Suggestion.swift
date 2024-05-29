//
//  Suggestion.swift
//
//
//  Created by Philip Chu on 5/17/23.
//

import Foundation

/// An account suggested by the server.
public struct Suggestion: Codable, Hashable, Sendable {
    public init(source: SuggestionSource, account: Account) {
        self.source = source
        self.account = account
    }

    /// The reason this account is being suggested.
    public var source: SuggestionSource
    /// The account being recommended to follow.
    public var account: Account
}
