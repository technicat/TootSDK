//
//  MutedAccount.swift
//
//
//  Created by Philip Chu on 6/18/24.
//

import Foundation

// https://docs.joinmastodon.org/entities/Account/#MutedAccount
/// An extra entity to be used with API methods to verify credentials and update credentials
public class MutedAccount: Account {

    /// When a timed mute will expire, if applicable.
    /// Only returned in getMutedAccounts
    public let muteExpiresAt: Date?

    public enum CodingKeys: String, CodingKey {
        case muteExpiresAt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.muteExpiresAt = try container.decodeIfPresent(Date.self, forKey: .muteExpiresAt)
        try super.init(from: decoder)
    }
}
