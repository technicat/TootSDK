//
//  TranslationAkkoma.swift
//
//
//  Created by Philip Chu on 5/24/24.
//

import Foundation

public struct TranslationAkkoma: Codable {

    /// HTML-encoded translated content of the post.
    public var text: String
    /// The target language
    /// Not in the Mastodon spec, but in the Mastodon code
    public var detectedLanguage: String
}
