//
//  TootClient+Post.swift
//
//
//  Created by technicat on 24/05/24.
//

import Foundation

extension TootClient {

    /// Translate the post content into some language.
    public func getPostTranslation(id: String, params: AkkomaPostTranslationParams) async throws -> AkkomaTranslation {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "statuses", id, "translations", params.language.rawValue])
            $0.method = .get
        }
        return try await fetch(AkkomaTranslation.self, req)
    }

}
