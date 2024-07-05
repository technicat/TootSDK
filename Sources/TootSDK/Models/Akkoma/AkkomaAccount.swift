//
//  AkkomaAccount.swift
//
//
//  Created by Philip Chu on 6/23/24.
//

import Foundation

/// Akkoma additions to account
/// https://docs.akkoma.dev/stable/development/API/differences_in_mastoapi_responses/
public struct AkkomaAccount: Codable, Hashable {

    /// metadata about the user’s instance
    // public var instance:
    /// default time after which statuses are deleted
    public var statusTtlDays: Int?
    /// whether follows from followed accounts are auto-approved
    public var permitFollowback: Bool

}
