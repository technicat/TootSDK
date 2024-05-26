//
//  AdminAccount.swift
//
//
//  Created by Philip Chu on 5/18/24.
//

import Foundation

/// https://docs.joinmastodon.org/entities/Admin_Account/
public struct AdminAccount: Codable, Hashable, Identifiable {
    public init(
        id: String,
        username: String,
        domain: String? = nil,
        createdAt: Date,
        email: String? = nil,
        ip: String? = nil,
        // ips
        locale: String? = nil,
        inviteRequest: String? = nil,
        role: TootRole? = nil,
        account: Account
    ) {
        self.id = id
        self.username = username
        self.domain = domain
        self.createdAt = createdAt
        self.email = email
        self.ip = ip
        self.locale = locale
        self.inviteRequest = inviteRequest
        self.role = role
        self.account = account
    }

    public let id: String
    /// The username of the account.
    public let username: String
    /// The domain of the account, if it is remote.
    public let domain: String?
    /// When the account was first discovered.
    public let createdAt: Date
    /// The email address associated with the account.
    /// spec says non-null but actually sometimes is explicitly null
    public let email: String?
    /// The IP address last used to login to this account.
    public let ip: String?
    /// ips
    /// The locale of the account.
    /// /// spec says non-null but actually sometimes is explicitly null
    public let locale: String?
    /// The reason given when requesting an invite
    /// (for instances that require manual approval of registrations)
    public let inviteRequest: String?
    /// The current role of the account.
    /// spec says non-null but actually sometimes is explicitly null
    public let role: TootRole?
    /// User-level information about the account.
    public let account: Account
}
