//
//  TranslationAkkoma.swift
//
//
//  Created by Philip Chu on 5/24/24.
//

import Foundation

// in status_operation.ex
public struct TranslationAkkoma: Codable {

    /// HTML-encoded translated content of the post.
    public var text: String
    /// The source language
    public var detectedLanguage: String
}
