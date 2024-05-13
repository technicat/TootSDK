// Created by konstantin on 21/12/2022.
// Copyright (c) 2022. All rights reserved.

import Foundation

extension TootClient {

    /// Pleroma Specific. This follows an account by URI and returns the account relationship being followed
    /// - Parameter uri: account name on the instance you're on or a users URI (e.g @test@instance.test)
    /// - Returns: the Relationship being followed
    public func followAccountURI(params: PleromaFollowByURIParams) async throws -> Relationship {

        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "follows"])
            $0.method = .post
            $0.body = try .json(params)
        }
        return try await fetch(Relationship.self, req)
    }
}
