//
//  TranslationAkkoma.swift
//
//
//  Created by Philip Chu on 5/24/24.
//

import Foundation

/// https://docs.akkoma.dev/stable/development/API/akkoma_api/
public struct TranslationLanguagesAkkoma: Codable {

    public var source: [Language]? = nil
    public var target: [Language]? = nil

    public struct Language: Codable {
        public var code: String
        public var name: String
    }
}
