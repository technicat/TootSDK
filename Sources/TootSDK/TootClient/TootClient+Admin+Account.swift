//
//  TootClient+Admin+Account.swift
//
//
//  Created by technicat on 05/17/24.
//

import Foundation

extension TootClient {

    /// View all accounts, optionally matching certain criteria for filtering, up to 100 at a time.
    /// https://docs.joinmastodon.org/methods/admin/accounts/#v1
    /// - Parameters
    ///     - pageInfo: PagedInfo object for max/min/since
    ///     - limit: Maximum number of results to return. Defaults to 40 accounts. Max 80 accounts.
    /// - Returns: the accounts requested, or an error if unable to retrieve
    /// todo - add params
    public func getAdminAccountsV1(_ pageInfo: PagedInfo? = nil, limit: Int? = nil)
        async throws -> PagedResult<[AdminAccount]>
    {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "accounts"])
            $0.method = .get
            $0.query = getQueryParams(pageInfo, limit: limit)
        }

        return try await fetchPagedResult(req)
    }

    /// View all accounts, optionally matching certain criteria for filtering, up to 100 at a time.
    /// https://docs.joinmastodon.org/methods/admin/accounts/#v2
    /// - Parameters
    ///     - pageInfo: PagedInfo object for max/min/since
    ///     - limit: Maximum number of results to return. Defaults to 40 accounts. Max 80 accounts.
    /// - Returns: the accounts requested, or an error if unable to retrieve
    /// todo  - add params
    public func getAdminAccountsV2(params: AdminAccountsV2Params = .init(), _ pageInfo: PagedInfo? = nil, limit: Int? = nil)
        async throws -> PagedResult<[AdminAccount]>
    {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v2", "admin", "accounts"])
            $0.method = .get
            $0.query = getQueryParams(pageInfo, limit: limit) + params.queryItems
        }

        return try await fetchPagedResult(req)
    }

    /// View admin-level information about the given account.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the account requested, or an error if unable to retrieve
    /// https://docs.joinmastodon.org/methods/admin/accounts/#get-one
    public func getAdminAccount(by id: String) async throws -> AdminAccount {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "accounts", id])
            $0.method = .get
        }
        return try await fetch(AdminAccount.self, req)
    }

    /// Approve the given local account if it is currently pending approval.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the account requested, or an error if unable to retrieve
    /// https://docs.joinmastodon.org/methods/admin/accounts/#approve
    public func approveAccount(by id: String) async throws -> AdminAccount {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "accounts", id, "approve"])
            $0.method = .post
        }
        return try await fetch(AdminAccount.self, req)
    }

    /// Reject the given local account if it is currently pending approval.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the account requested, or an error if unable to retrieve
    /// https://docs.joinmastodon.org/methods/admin/accounts/#reject
    public func rejectAccount(by id: String) async throws -> AdminAccount {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "accounts", id, "reject"])
            $0.method = .post
        }
        return try await fetch(AdminAccount.self, req)
    }

    /// Permanently delete data for a suspended account.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the account requested, or an error if unable to retrieve
    /// https://docs.joinmastodon.org/methods/admin/accounts/#delete
    public func deleteAccount(by id: String) async throws -> AdminAccount {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "accounts", id])
            $0.method = .delete
        }
        return try await fetch(AdminAccount.self, req)
    }

    /// Re-enable a local account whose login is currently disabled.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the account requested, or an error if unable to retrieve
    /// https://docs.joinmastodon.org/methods/admin/accounts/#enable
    public func enableAccount(by id: String) async throws -> AdminAccount {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "accounts", id, "enable"])
            $0.method = .post
        }
        return try await fetch(AdminAccount.self, req)
    }

    /// Unsilence an account if it is currently silenced.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the account requested, or an error if unable to retrieve
    /// https://docs.joinmastodon.org/methods/admin/accounts/#unsilence
    public func unsilenceAccount(by id: String) async throws -> AdminAccount {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "accounts", id, "unsilence"])
            $0.method = .post
        }
        return try await fetch(AdminAccount.self, req)
    }

    /// Unsuspend an account if it is currently suspended.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the account requested, or an error if unable to retrieve
    /// https://docs.joinmastodon.org/methods/admin/accounts/#unsuspend
    public func unsuspendAccount(by id: String) async throws -> AdminAccount {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "accounts", id, "unsuspend"])
            $0.method = .post
        }
        return try await fetch(AdminAccount.self, req)
    }

    /// Stops marking an account’s posts as sensitive, if it was previously flagged as sensitive.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the account requested, or an error if unable to retrieve
    /// https://docs.joinmastodon.org/methods/admin/accounts/#unsensitive
    public func unsensitiveAccount(by id: String) async throws -> AdminAccount {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "accounts", id, "unsensitive"])
            $0.method = .post
        }
        return try await fetch(AdminAccount.self, req)
    }
}
