//
//  TranslatePostParams.swift
//
//
//  Created by Philip Chu on 1/30/24.
//

import Foundation

/// Params to translate a post in Akkoma
public struct PostTranslationParamsAkkoma: Codable {
    /// (ISO 639 language code).
    /// The post content will be translated into this language.
    public var language: ISOCode

    public init(language: ISOCode) {
        self.language = language
    }
}
