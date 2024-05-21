// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Identifies a timeline for which a position can be saved.
public enum MarkerTimeline: String, Hashable, Codable, CodingKeyRepresentable {
    /// Information about the user's position in the home timeline.
    case home
    /// Information about the user's position in their notifications.
    case notifications
}
