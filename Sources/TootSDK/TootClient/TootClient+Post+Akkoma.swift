//
//  TootClient+Post.swift
//
//
//  Created by technicat on 24/05/24.
//

import Foundation

extension TootClient {
    
    /// Translate the post content into some language.
    public func getPostTranslationAkkoma(id: String, language: String) async throws -> TranslationAkkoma {
        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "statuses", id, "translations",language])
            $0.method = .get
        }
        return try await fetch(TranslationAkkoma.self, req)
    }
    
}
