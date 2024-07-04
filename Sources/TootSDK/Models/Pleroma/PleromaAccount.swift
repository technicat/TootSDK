//
//  PleromaAccount.swift
//
//
//  Created by Philip Chu on 6/23/24.
//

import Foundation

/// Pleroma additions to account
///https://docs-develop.pleroma.social/backend/development/API/differences_in_mastoapi_responses/
public struct PleromaAccount: Codable, Hashable {

    /// ActivityPub id of the user
    public var apId: String?
    /// background image of the user
    public var backgroundImage: String?
    /// Lists an array of tags for the user
    public var tags: [String]
    /// Includes fields as documented for Mastodon API (can be empty)
    public var relationship: Relationship
    /// true if user is a moderator
    public var isModerator: Bool?
    /// true if user is an admin
    public var isAdmin: Bool?
    /// true if a new user account is waiting on email confirmation to be activated
    public var confirmationPending: Bool?
    /// true when the user has hiding favorites enabled
    public var hideFavorites: Bool
    ///true when the user has follower hiding enabled
    public var hideFollowers: Bool
    /// true when the user has follow hiding enabled
    public var hideFollows: Bool
    /// true when the user has hiding favorites enabled
    public var hideFollowersCount: Bool
    /// true when the user has follow stat hiding enabled
    public var hideFollowsCount: Bool
    /// true when the user is deactivated
    public var deactivated: Bool?
    /// true when the user allows automatically follow moved following accounts
    public var allowFollowingMove: Bool
    ///
    // public var notificationSettings // todo
    /// 
    public var acceptsChatStrings: Bool?
    /// Favicon image of the user's instance
    public var favicon: String?
    //  Only returned to the account owner
    /// The count of unread conversations.
    public var unreadConversationCount: Int?
    /// The count of unread notifications. Only returned to the account owner.
    public var unreadNotificationsCount: Int?
    // only in CredentialAccount
    /// A generic map of settings for frontends. Opaque to the backend
    // public var settingsStore // todo - check this
    ///  The token needed for Pleroma shoutbox. 
    public var chatToken: String?
   
}
