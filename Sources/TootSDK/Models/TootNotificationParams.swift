//
//  TootNotificationParams.swift
//
//
//  Created by Konstantin on 04/05/2023.
//

import Foundation

public struct TootNotificationParams: Codable, Sendable {

    public init(excludeTypes: [TootNotification.NotificationType]? = nil, types: [TootNotification.NotificationType]? = nil) {
        self.excludeTypes = excludeTypes != nil ? Set(excludeTypes!) : nil
        self.types = types != nil ? Set(types!) : nil
        self.includeTypes = includeTypes != nil ? Set(excludeTypes!) : nil
    }

    public init(
        excludeTypes: Set<TootNotification.NotificationType>? = nil,
        types: Set<TootNotification.NotificationType>? = nil,
        includeTypes: Set<TootNotification.NotificationType>? = nil
    ) {
        self.excludeTypes = excludeTypes
        self.types = types
    }

    public init() {
        self.excludeTypes = nil
        self.types = nil
        self.includeTypes = nil
    }

    /// Types of notifications to exclude from the search results
    public var excludeTypes: Set<TootNotification.NotificationType>?
    /// Types of notifications to include in the search results
    public var types: Set<TootNotification.NotificationType>?
    /// Pleroma, Akkoma
    public var includeTypes: Set<TootNotification.NotificationType>?
    // todo - with_muted (Pleroma/Akkoma/Friendica)
    // todo - include_all (Friendica)
    // todo - summary (Friendica)
    // todo - account_id (Friendica)

    enum CodingKeys: String, CodingKey {
        case excludeTypes = "exclude_types"
        case types = "types"
        case includeTypes = "include_types"
    }
}
