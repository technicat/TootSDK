//
//  TootClient+Preferences.swift
//  
//
//  Created by Philip Chu on 5/21/24.
//

import Foundation

/// Preferences defined by the user in their account settings.
/// - Returns: Preferences by key and value
public func getPreferences() async throws -> Preferences {
    let req = HTTPRequestBuilder {
        $0.url = getURL(["api", "v1", "preferences"])
        $0.method = .get
    }
    return try await fetch(Preferences.self, req)
}
