// Created by technicat on 05/24/2024.
// Copyright (c) 2024. All rights reserved.

import Foundation

extension TootClient {

    /// Returns available source and target languages for automated text translation
    /// https://docs.akkoma.dev/stable/development/API/akkoma_api/
    public func getTranslationLanguagesAkkoma() async throws -> TranslationLanguagesAkkoma {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "akkoma", "translation", "languages"])
            $0.method = .get
        }
        return try await fetch(TranslationLanguagesAkkoma.self, req)
    }
}
