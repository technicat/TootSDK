//
//  CredentialAccount.swift
//
//
//  Created by Philip Chu on 6/17/24.
//

import Foundation

// https://docs.joinmastodon.org/entities/Account/#CredentialAccount
/// An extra entity to be used with API methods to verify credentials and update credentials
final public class CredentialAccount: Account {

    public let source: TootSource?
    /// The role assigned to the currently authorized user.
    public let role: TootRole?

    public enum CodingKeys: String, CodingKey {
        case source
        case role
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decodeIfPresent(TootSource.self, forKey: .source)
        self.role = try container.decodeIfPresent(TootRole.self, forKey: .role)
        try super.init(from: decoder)
    }
}
