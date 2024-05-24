// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

public enum ExpandMedia: String, Codable {
    /// Hide media marked as sensitive
    case `default`
    /// Always show all media by default, regardless of sensitivity
    case showAll = "show_all"
    /// Always hide all media by default, regardless of sensitivity
    case hideAll = "hide_all"
}
