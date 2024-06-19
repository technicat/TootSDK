//
//  TranslatePostParams.swift
//
//
//  Created by Philip Chu on 1/30/24.
//

import Foundation

/// Params to translate a post
/// https://docs.joinmastodon.org/methods/statuses/#form-data-parameters-1
public struct PostTranslationParams: Codable {
    /// (ISO 639 language code).
    /// The post content will be translated into this language.
    /// Defaults to the user’s current locale.
    public var lang: ISOCode

    public init(lang: ISOCode) {
        self.lang = lang
    }
}
