//
//  OAuthScope.swift
//
//
//  Created by Philip Chu on 6/18/24.
//

/// https://docs.joinmastodon.org/api/oauth-scopes/
public enum OAuthScope: String {
    case read
    case write
    case follow
    case push
    case adminRead = "admin:read"
    case adminWrite = "admin:write"
    // todo - add granular scopes
}
