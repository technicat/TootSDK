// Created by konstantin on 10/02/2023.
// Copyright (c) 2023. All rights reserved.

import Foundation

extension TootClient {

    /// https://docs.akkoma.dev/stable/development/API/akkoma_api/
    public func getTranslationLanguagesAkkoma() async throws -> TranslationLanguagesAkkoma {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "akkoma", "translation", "languages"])
            $0.method = .get
        }
        return try await fetch(TranslationLanguagesAkkoma.self, req)
    }
}
