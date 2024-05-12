//
//  TootClient+Reports.swift
//
//
//  Created by Łukasz Rutkowski on 26/10/2023.
//

import Foundation

extension TootClient {

    /// Report problematic users or posts to moderators.
    public func report(_ params: ReportParams) async throws {
        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "reports"])
            $0.method = .post
            $0.body = try .form(queryItems: createQuery(from: params))
        }

        _ = try await fetch(req: req)
    }
}

extension TootClient {
    internal func createQuery(from params: ReportParams) -> [URLQueryItem] {
        var queryItems = [
            URLQueryItem(name: "account_id", value: params.accountId)
        ]
        for postId in params.postIds {
            queryItems.append(URLQueryItem(name: "status_ids[]", value: postId))
        }
        if let comment = params.comment {
            queryItems.append(.init(name: "comment", value: comment))
        }
        if let forward = params.forward {
            queryItems.append(.init(name: "forward", value: String(forward).lowercased()))
        }
        queryItems.append(.init(name: "category", value: params.category.rawValue))
        for ruleId in params.ruleIds {
            queryItems.append(.init(name: "rule_ids[]", value: String(ruleId)))
        }
        return queryItems
    }
}
