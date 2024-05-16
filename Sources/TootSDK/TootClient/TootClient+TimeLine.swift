//
//  TootClient+TimeLine.swift
//
//
//  Created by dave on 26/11/22.
//

import Foundation

extension TootClient {

    /// Provides the url paths as an array of strings, based on the type of timeline
    /// - Returns: the url paths creatd
    internal func getURLPaths(timeline: Timeline) -> [String] {
        switch timeline {
        case .home:
            return ["api", "v1", "timelines", "home"]
        case .local, .federated:
            return ["api", "v1", "timelines", "public"]
        case .favourites:
            return ["api", "v1", "favourites"]
        case .bookmarks:
            return ["api", "v1", "bookmarks"]
        case .hashtag(let hashtagTimelineQuery):
            return ["api", "v1", "timelines", "tag", hashtagTimelineQuery.tag]
        case .list(let listID):
            return ["api", "v1", "timelines", "list", listID]
        case .user(let query):
            return ["api", "v1", "accounts", query.userId, "statuses"]
            // for mitra, pleroma, akkoma
            case .direct:
                return ["api", "v1", "timelines", "direct"]
            // for akkoma
            case .bubble:
                return ["api", "v1", "timelines", "bubble"]
        }
    }

    /// Provides the a timeline query to be used by the get request
    /// - Returns: the timeline query created
    internal func getQuery(timeline: Timeline) -> (any TimelineQuery)? {
        switch timeline {
        case .local(let localTimelineQuery):
            return localTimelineQuery
        case .federated(let federatedTimelineQuery):
            return federatedTimelineQuery
        case .hashtag(let hashtagTimelineQuery):
            return hashtagTimelineQuery
        case .user(let query):
            return query
        default:
            return nil
        }
    }

    /// Retrieves a timeline
    /// - Parameters:
    ///   - timeline: The timeline being requested
    ///   - pageInfo: a PageInfo struct that tells the API how to page the response, typically with a minId set of the highest id you last saw
    ///   - limit: Maximum number of results to return (defaults to 20 on Mastodon with a max of 40)
    /// - Returns: a PagedResult containing the posts retrieved
    public func getTimeline(_ timeline: Timeline, pageInfo: PagedInfo? = nil, limit: Int? = nil) async throws -> PagedResult<[Post]> {
        let urlPaths = getURLPaths(timeline: timeline)
        let timelineQuery = getQuery(timeline: timeline)

        let req = HTTPRequestBuilder {
            $0.url = getURL(urlPaths)
            $0.method = .get
            $0.query = getQueryParams(pageInfo, limit: limit, query: timelineQuery)
        }
        return try await fetchPagedResult(req)
    }

}
