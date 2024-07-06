// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

public enum FilterContext: String, Codable, Sendable, Hashable {
    /// home timeline and lists
    case home
    /// notifications timeline
    case notifications
    /// public timelines
    case `public`
    /// expanded thread of a detailed post
    case thread
    /// when viewing a profile
    case account
}
