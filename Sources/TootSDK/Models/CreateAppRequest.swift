// Created by konstantin on 22/11/2022.
// Copyright (c) 2022. All rights reserved.

import Foundation

/// https://docs.joinmastodon.org/methods/apps/#create
struct CreateAppRequest: Hashable, Codable {
    let clientName: String
    let redirectUris: String
    // spec says this is optional
    let scopes: String?
    // leave null if not a webapp (breaks on iceshrimp.net)
    let website: String?
}
