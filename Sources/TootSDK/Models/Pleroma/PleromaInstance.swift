//
//  PleromaInstance.swift
//
//
//  Created by Philip Chu on 6/23/24.
//

import Foundation

/// Pleroma additions to instance v1 and v2
/// Some fields are at the instance level in v1
///https://docs-develop.pleroma.social/backend/development/API/differences_in_mastoapi_responses/
public struct PleromaInstance: Codable, Hashable {

    public var vapidPublicKey: String

    public var backgroundImage: String?

    public var stats: Stats
    public var metadata: Metadata

    public struct Stats: Codable, Hashable {
        public var mau: Int
    }

    public struct Metadata: Codable, Hashable {
        public var accountActivationRequired: Bool
        public var birthdayRequired: Bool?
        public var birthdayMinAge: Int?
        public var features: [String]
        public var postFormats: [MIMEType]
        public var fieldsLimits: FieldsLimits
        public var federation: Federation
        // v2
        public var chatLimit: Int?
        public var descriptionLimit: Int?
        public var shoutLimit: Int?
        public var avatarUploadLimit: Int?
        public var bannerUploadLimit: Int?
        public var backgroundUploadLimit: Int?

    }

    public struct FieldsLimits: Codable, Hashable {
        public var nameLength: Int
        public var valueLength: Int
        public var maxFields: Int
        public var maxRemoteFields: Int
    }

    public struct Federation: Codable, Hashable {
        // todo - fill in
    }
}
