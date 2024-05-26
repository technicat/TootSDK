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
        confirmed: Bool? = nil,
        approved: Bool? = nil,
        disabled: Bool? = nil,
        silenced: Bool,
        suspended: Bool,
        account: Account,
        createdByApplicationId: String? = nil,
        invitedByAccountId: String? = nil
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
        self.confirmed = confirmed
        self.approved = approved
        self.disabled = disabled
        self.silenced = silenced
        self.suspended = suspended
        self.account = account
        self.createdByApplicationId = createdByApplicationId
        self.invitedByAccountId = invitedByAccountId
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
    /// Whether the account has confirmed their email address.
    /// spec says non-null but actually sometimes is explicitly null
    public let confirmed: Bool?
    /// Whether the account is currently approved.
    /// spec says non-null but actually sometimes is explicitly null
    public let approved: Bool?
   /// Whether the account is currently disabled.
    /// spec says non-null but actually sometimes is explicitly null
    public let disabled: Bool?
    /// Whether the account is currently silenced
    public let silenced: Bool
    /// Whether the account is currently suspended.
    public let suspended: Bool
    /// User-level information about the account.
    public let account: Account
    /// The ID of the Application that created this account, if applicable.
    public let createdByApplicationId: String?
    /// The ID of the Account that invited this user, if applicable.
    public let invitedByAccountId: String?
}
