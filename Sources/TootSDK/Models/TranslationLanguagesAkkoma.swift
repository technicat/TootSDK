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
        public var code: ISOCode
        public var name: String

        enum CodingKeys: String, CodingKey {
            case code
            case name
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.code = try container.decodeISOCode(forKey: .code)
            self.name = try container.decode(String.self, forKey: .name)
        }
    }
}
