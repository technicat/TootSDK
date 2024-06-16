//
//  TootClient+Admin+Trends.swift
//  
//
//  Created by Philip Chu on 6/16/24.
//

import Foundation

extension TootClient {
    
    /// Links that have been shared more than others, including unapproved and unreviewed links.
    ///
    /// - Returns: Array of ``TrendingLink``.
    /// https://docs.joinmastodon.org/methods/admin/trends/#links
    public func getAdminTrendingLinks() async throws -> [TrendingLink] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "trends", "links"])
            $0.method = .get
        }
        
        return try await fetch([TrendingLink].self, req)
    }
    
    /// Posts that have been shared more than others, including unapproved and unreviewed posts.
    ///
    /// - Returns: Array of ``Post``.
    /// https://docs.joinmastodon.org/methods/admin/trends/#statuses
    public func getAdminTrendingPosts() async throws -> [Post] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "admin", "trends", "statuses"])
            $0.method = .get
        }
        
        return try await fetch([Post].self, req)
    }
}
