// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

public enum FilterAction: String, Codable {
    /// show a warning that identifies the matching filter by title, and allow the user to expand the filtered post. This is the default (and unknown values should be treated as equivalent to warn).
    case warn
    /// do not show this post if it is received
    case hide
}
