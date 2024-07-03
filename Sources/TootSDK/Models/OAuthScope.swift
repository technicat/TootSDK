//
//  OAuthScope.swift
//
//
//  Created by Philip Chu on 6/18/24.
//

/// https://docs.joinmastodon.org/api/oauth-scopes/
public enum OAuthScope: String {
    case read
    case readAccounts = "read:accounts"
    case readBlocks = "read:blocks"
    case readBookmarks = "read:bookmarks"
    case readFavourites = "read:favourites"
    case readFilters = "read:filters"
    case readFollows = "read:follows"
    case readLists = "read:lists"
    case readMutes = "read:mutes"
    case readNotifications = "read:notifications"
    case readSearch = "read:search"
    case readPosts = "read:statuses"
    case write
    case writeAccounts = "write:accounts"
    case writeBlocks = "write:blocks"
    case writeBookmarks = "write:bookmarks"
    case writeConversations = "write:conversations"
    case writeFavourites = "write:favourites"
    case writeFilters = "write:filters"
    case writeFollows = "write:follows"
    case writeLists = "write:lists"
    case writeMedia = "write:media"
    case writeMutes = "write:mutes"
    case writeNotifications = "write:notifications"
    case writePosts = "write:statuses"
    case writeReports = "write:reports"
    case follow  // deprecated in 3.5
    case push
    case adminRead = "admin:read"
    case adminReadAccounts = "admin:read:accounts"
    case adminReadCanonicalEmailBlocks = "admin:read:canonical_email_blocks"
    case adminReadDomainAllows = "admin:read:domain_allows"
    case adminReadDomainBlocks = "admin:read:domain_blocks"
    case adminReadEmailDomainBlocks = "admin:read:email_domain_blocks"
    case adminReadIPBlocks = "admin:read:ip_blocks"
    case adminReadReports = "admin:read:reports"
    case adminWrite = "admin:write"
    case adminWriteAccounts = "admin:write:accounts"
    case adminWriteCanonicalEmailBlocks = "admin:write:canonical_email_blocks"
    case adminWriteDomainAllows = "admin:write:domain_allows"
    case adminWriteDomainBlocks = "admin:write:domain_blocks"
    case adminWriteEmailDomainBlocks = "admin:write:email_domain_blocks"
    case adminWriteIPBlocks = "admin:write:ip_blocks"
    case adminWriteReports = "admin:write:reports"
}
