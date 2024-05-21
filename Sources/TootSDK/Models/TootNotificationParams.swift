//
//  TootNotificationParams.swift
//
//
//  Created by Konstantin on 04/05/2023.
//

import Foundation

public struct TootNotificationParams: Codable, Sendable {

    public init(excludeTypes: [NotificationType]? = nil, types: [NotificationType]? = nil) {
        self.excludeTypes = excludeTypes != nil ? Set(excludeTypes!) : nil
        self.types = types != nil ? Set(types!) : nil
        self.includeTypes = includeTypes != nil ? Set(excludeTypes!) : nil
    }

    public init(
        excludeTypes: Set<NotificationType>? = nil,
        types: Set<NotificationType>? = nil,
        includeTypes: Set<NotificationType>? = nil
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
    public var excludeTypes: NotificationTypes?
    /// Types of notifications to include in the search results
    public var types: NotificationTypes?
    /// Pleroma, Akkoma
    public var includeTypes: NotificationTypes?
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
