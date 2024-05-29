// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

public enum ListRepliesPolicy: String, Hashable, Codable {
    /// Show replies to any followed user
    case followed
    /// Show replies to members of the list
    case list
    /// Show replies to no one
    case none
}
