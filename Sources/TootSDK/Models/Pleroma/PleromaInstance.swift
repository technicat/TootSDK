//
//  PleromaInstance.swift
//
//
//  Created by Philip Chu on 6/23/24.
//

import Foundation

public struct PleromaInstance: Codable, Hashable {

    public var vapidPublicKey: String

    public var stats: Stats
    public var metadata: Metadata

    public struct Stats: Codable, Hashable {
        public var mau: Int
    }
    
    public struct Metadata: Codable, Hashable {
    // todo fill in
    }
}
