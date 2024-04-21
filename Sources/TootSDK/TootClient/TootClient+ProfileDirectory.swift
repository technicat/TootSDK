//
//  TootClient+Directory.swift
//
//
//  Created by Philip Chu on 5/29/23.
//

import Foundation

extension TootClient {

    /// List accounts visible in the directory.
    ///
    /// - Parameters:
    ///   - offset. Skip the first n results.
    ///   - limit: How many accounts to load. Defaults to 40 accounts. Max 80 accounts.
    ///   - params: Includes order and local parameters.
    /// - Returns: Array of ``Account``.
    public func getProfileDirectory(params: ProfileDirectoryParams, offset: Int? = nil, limit: Int? = nil) async throws -> [Account] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "directory"])
            $0.method = .get
            $0.query = getQueryParams(limit: limit, offset: offset) + params.queryItems
        }

        return try await fetch([Account].self, req)
    }
}
