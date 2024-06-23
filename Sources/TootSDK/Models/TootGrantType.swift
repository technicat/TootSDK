//
//  TootGrantType.swift
//
//
//  Created by Konstantin on 11/03/2023.
//

import Foundation

/// https://docs.joinmastodon.org/spec/oauth/#token
public enum TootGrantType: String {
    case login = "authorization_code"
    case register = "client_credentials"
    // https://docs-develop.pleroma.social/backend/development/API/differences_in_mastoapi_responses/
    case refreshToken = "refresh_token"
}
