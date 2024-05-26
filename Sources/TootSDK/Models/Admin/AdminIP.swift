//
//  AdminIP.swift
//
//
//  Created by Philip Chu on 5/25/24.
//

import Foundation

/// https://docs.joinmastodon.org/entities/Admin_Ip/
public struct AdminIP: Codable, Hashable {
    public init(
        ip: String,
        usedAt: Date
    ) {
        self.ip = ip
        self.usedAt = usedAt
    }

    /// The IP address
    public let ip: String
    /// The timestamp of when the IP address was last used for this account.
    public let usedAt: Date
}
