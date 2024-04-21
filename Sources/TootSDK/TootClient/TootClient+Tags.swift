//
//  TootClient+Tags.swift
//  Created by Łukasz Rutkowski on 21/04/2023.
//

import Foundation

extension TootClient {

    /// Get a tag.
    /// - Parameter id: Name of the tag.
    public func getTag(_ id: String) async throws -> Tag {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "tags", id])
            $0.method = .get
        }

        return try await fetch(Tag.self, req)
    }

    /// Follow a tag.
    ///
    /// - Parameter id: Name of the tag.
    /// - Note: Requires hashtag following feature to be available.
    @discardableResult
    public func followTag(_ id: String) async throws -> Tag {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "tags", id, "follow"])
            $0.method = .post
        }

        return try await fetch(Tag.self, req)
    }

    /// Unfollow a tag.
    ///
    /// - Parameter id: Name of the tag.
    /// - Note: Requires hashtag following feature to be available.
    @discardableResult
    public func unfollowTag(_ id: String) async throws -> Tag {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "tags", id, "unfollow"])
            $0.method = .post
        }

        return try await fetch(Tag.self, req)
    }

    /// Get all tags which the current account is following.
    /// - Parameters:
    ///     - pageInfo: PagedInfo object for max/min/since ids.
    ///     - limit: Maximum number of results to return. Defaults to 100 tags. Max 200 tags.
    /// - Returns: the tags requested
    /// - Note: Requires hashtag following feature to be available.
    public func getFollowedTags(_ pageInfo: PagedInfo? = nil, limit: Int? = nil) async throws -> PagedResult<[Tag]> {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "followed_tags"])
            $0.method = .get
            $0.query = getQueryParams(pageInfo, limit: limit)
        }

        return try await fetchPagedResult(req)
    }
}
