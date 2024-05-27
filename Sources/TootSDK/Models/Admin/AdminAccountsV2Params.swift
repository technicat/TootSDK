//  AdminAccountParams.swift
//  Created by Phil Chu on 05/25/2024.

import Foundation

/// https://docs.joinmastodon.org/methods/admin/accounts/#v2
public struct AdminAccountsV2Params: Sendable {
    /// Filter for local or remote accounts.
    public var origin: AdminAccountOrigin?
    /// Filter for active, pending, disabled, silenced, or suspended accounts.
    /// todo - use enums
    public var status: String?
    /// Filter for accounts with staff permissions (users that can manage reports).
    public var permissions: String?
    /// Filter for users with these roles..
    public var roleIds: [String]?
    /// Lookup users invited by the account with this ID.
    public var invitedBy: String?
    /// Search for the given username.
    public var username: String?
    /// Search for the given display name.
    public var displayName: String?
    /// Filter by the given domain.
    public var byDomain: String?
    /// Lookup a user with this email.
    public var email: String?
    /// Lookup users with this IP address.
    public var ip: String?

    public init(
        origin: AdminAccountOrigin? = nil,
        status: String? = nil,
        permissions: String? = nil,
        roleIds: [String]? = nil,
        invitedBy: String? = nil,
        username: String? = nil,
        displayName: String? = nil,
        byDomain: String? = nil,
        email: String? = nil,
        ip: String? = nil
    ) {
        self.origin = origin
        self.status = status
        self.permissions = permissions
        self.roleIds = roleIds
        self.invitedBy = invitedBy
        self.username = username
        self.displayName = displayName
        self.byDomain = byDomain
        self.email = email
        self.ip = ip
    }
}

extension AdminAccountsV2Params {
    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "origin", value: origin?.rawValue),
            URLQueryItem(name: "status", value: status),
            URLQueryItem(name: "permissions", value: permissions),
            URLQueryItem(name: "invited_by", value: invitedBy),
            URLQueryItem(name: "username", value: username),
            URLQueryItem(name: "display_name", value: displayName),
            URLQueryItem(name: "by_domain", value: byDomain),
            URLQueryItem(name: "email", value: email),
            URLQueryItem(name: "ip", value: ip),

        ].filter { $0.value != nil }
    }
}

public enum AdminAccountOrigin: String {
    case local
    case remote
}
