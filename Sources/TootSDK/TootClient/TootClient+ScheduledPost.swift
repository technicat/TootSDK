//  TootClient+ScheduledPost.swift
//  Created by dave on 7/12/22.

import Foundation

extension TootClient {

    /// Schedules a post based on the components provided
    /// - Parameters:
    ///   - ScheduledPostParams: post components to be published
    /// - Returns: the ScheduledPost, if successful, throws an error if not
    public func schedulePost(_ params: ScheduledPostParams) async throws -> ScheduledPost {
        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "statuses"])
            $0.method = .post
            // Mitra and Sharkey expect json
            $0.body = try .json(params, encoder: self.encoder)
            //$0.body = try .multipart(params, boundary: UUID().uuidString)
        }

        return try await fetch(ScheduledPost.self, req)
    }

    /// Gets scheduled posts
    /// - Returns: the scheduled posts requested, or an error if unable to retrieve
    public func getScheduledPosts(_ pageInfo: PagedInfo? = nil, limit: Int? = nil) async throws -> PagedResult<[ScheduledPost]> {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "scheduled_statuses"])
            $0.method = .get
            $0.query = getQueryParams(pageInfo, limit: limit)
        }

        return try await fetchPagedResult(req)
    }

    /// Gets a single Scheduled post by id
    ///
    /// - Parameter id: the ID of the post to be retrieved
    /// - Returns: the scheduled post retrieved, if successful, throws an error if not
    /// https://docs.joinmastodon.org/methods/scheduled_statuses/#get-one
    public func getScheduledPost(id: String) async throws -> ScheduledPost {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "scheduled_statuses", id])
            $0.method = .get
        }

        return try await fetch(ScheduledPost.self, req)
    }

    /// Edit a given post to change its text, sensitivity, media attachments, or poll. Note that editing a poll’s options will reset the votes.
    /// - Parameter id: the ID of the post to be changed
    /// - Parameter params: the updated content (publish date) of the post to be posted
    /// - Returns: the post after the update
    public func updateScheduledPostDate(id: String, _ params: ScheduledPostUpdateParams) async throws -> ScheduledPost {
        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "scheduled_statuses", id])
            $0.method = .put
            $0.body = try .json(params, encoder: self.encoder)
        }

        return try await fetch(ScheduledPost.self, req)
    }

    /// Deletes a single scheduled post
    /// - Parameter id: the ID of the post to be deleted
    /// - Returns: the post deleted (for delete and redraft), if successful, throws an error if not
    public func deleteScheduledPost(id: String) async throws {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "scheduled_statuses", id])
            $0.method = .delete
        }

        _ = try await fetch(req: req)
    }

}
