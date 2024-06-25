// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// https://docs.joinmastodon.org/entities/Token/
public struct AccessToken: Codable {
    public let scope: String?
    public let tokenType: String?
    public let accessToken: String
    public let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case scope
        case tokenType
        case accessToken
        case createdAt
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.scope = try container.decodeIfPresent(String.self, forKey: .scope)
        self.tokenType = try container.decodeIfPresent(String.self, forKey: .tokenType)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        self.createdAt = try container.decodeUnixDate(forKey: .createdAt)
    }
}
