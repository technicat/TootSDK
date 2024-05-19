//
//  TootClient+Admin+Account.swift
//
//
//  Created by technicat on 05/17/24.
//

import Foundation
import MultipartKitTootSDK

extension TootClient {

    /// View all accounts, optionally matching certain criteria for filtering, up to 100 at a time.
    /// https://docs.joinmastodon.org/methods/admin/accounts/#v1
    /// - Parameters
    ///     - pageInfo: PagedInfo object for max/min/since
    ///     - limit: Maximum number of results to return. Defaults to 40 accounts. Max 80 accounts.
    /// - Returns: the accounts requested, or an error if unable to retrieve
    /// todo - add params
    public func getAccountsV1(_ pageInfo: PagedInfo? = nil, limit: Int? = nil)
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
    public func getAccountsV2(_ pageInfo: PagedInfo? = nil, limit: Int? = nil)
        async throws -> PagedResult<[AdminAccount]>
    {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v2", "admin", "accounts"])
            $0.method = .get
            $0.query = getQueryParams(pageInfo, limit: limit)
        }

        return try await fetchPagedResult(req)
    }
}
