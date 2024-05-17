//
//  InstanceConfiguration.swift
//
//
//  Created by Phil Chu on 5/14/24.
//

import Foundation

/// https://docs.joinmastodon.org/methods/statuses/#form-data-parameters-2
public struct BoostPostParams: Codable, Sendable {
    
    public var visibility: Post.Visibility

    /// Parameters to boost a post
    /// - Parameters:
    ///   - visibility: Any visibility except limited or direct (i.e. public, unlisted, private). Defaults to public. 
    public init(visibility: Post.Visibility = .public) {
        self.visibility = visibility
    }
}
