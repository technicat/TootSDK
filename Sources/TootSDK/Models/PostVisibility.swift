// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.
import Foundation

public enum PostVisibility: String, Codable, CaseIterable, Sendable {
    /// Visible to everyone, shown in public timelines.
    case `public`
    /// Visible to public, but not included in public timelines.
    case unlisted
    /// Visible to followers only, and to any mentioned users.
    case `private`
    /// Visible only to mentioned users.
    case direct
    /// Pleroma
    //case list
    /// Pleroma/Akkoma - local-only
    case local
    /// gotosocial - mutualsOnly
    case mutualsOnly = "mutuals_only"
}
