//
//  TootNotificationParams.swift
//
//
//  Created by Konstantin on 04/05/2023.
//

import Foundation

public struct TootNotificationParams: Codable, Sendable {
    public init(
        excludeTypes: Set<TootNotification.NotificationType>? = nil,
        types: Set<TootNotification.NotificationType>? = nil
    ) {
        self.excludeTypes = excludeTypes
        self.types = types
    }

    public init() {
        self.excludeTypes = nil
        self.types = nil
    }

    /// Types of notifications to exclude from the search results
    public var excludeTypes: Set<TootNotification.NotificationType>?
    /// Types of notifications to include in the search results
    public var types: Set<TootNotification.NotificationType>?

    enum CodingKeys: String, CodingKey {
        case excludeTypes = "exclude_types"
        case types = "types"
    }
}

extension TootNotificationParams {
    func corrected(for flavour: TootSDKFlavour) -> TootNotificationParams {
        guard flavour == .friendica else { return self }
        var params = self
        if let types = params.types {
            var correctedExcludeTypes = Set(TootNotification.NotificationType.allCases).subtracting(types)
            if let excludeTypes = params.excludeTypes {
                correctedExcludeTypes.formUnion(excludeTypes)
            }
            params.excludeTypes = correctedExcludeTypes
            params.types = nil
        }
        return params
    }
}
