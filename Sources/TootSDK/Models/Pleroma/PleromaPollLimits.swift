//
//  PleromaPollLimits.swift
//
//
//  Created by Philip Chu on 6/30/24.
//

import Foundation

/// In Pleroma/Akkoma instances
/// https://docs-develop.pleroma.social/backend/development/API/differences_in_mastoapi_responses/
public struct PleromaPollLimits: Codable, Hashable {
    /// Each poll is allowed to have up to this many options.
    public var maxOptions: Int?
    /// Each poll option is allowed to have this many characters.
    public var maxOptionChars: Int?
    /// The shortest allowed poll duration, in seconds.
    public var minExpiration: Int?
    /// The longest allowed poll duration, in seconds.
    public var maxExpiration: Int?
}
