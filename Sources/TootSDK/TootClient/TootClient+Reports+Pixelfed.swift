//
//  TootClient+Reports+Pixelfed.swift
//
//
//  Created by technicat on 12/05/2024.
//

import Foundation

extension TootClient {

    public func report(_ params: PixelfedReportParams) async throws {
        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1.1", "report"])
            $0.method = .post
            $0.body = try .json(params)
        }
        _ = try await fetch(req: req)
    }
}
