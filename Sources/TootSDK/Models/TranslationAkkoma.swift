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
    public var detectedLanguage: ISOCode

    enum CodingKeys: String, CodingKey {
        case text
        case detectedLanguage
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.detectedLanguage = try container.decodeISOCode(forKey: .detectedLanguage) ?? .und  // improve this
    }
}
