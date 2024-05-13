// Created by konstantin on 21/12/2022.
// Copyright (c) 2022. All rights reserved.

import Foundation

extension TootClient {
    /// Follow the given account. Can also be used to update whether to show reposts or enable notifications.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func followAccount(by id: String, params: FollowAccountParams? = nil) async throws -> Relationship {
        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "follow"])
            $0.method = .post
            $0.body = try .json(params)
        }
        return try await fetch(Relationship.self, req)
    }

    /// Follow the given account; can be be the account name on the instance you're on, or the user's URI
    /// - Parameter uri: account name on the instance you're on or a users URI (e.g @test@instance.test)
    /// - Returns: your relationship with that account after following
    public func followAccountURI(by uri: String) async throws -> Relationship {

        // Do the webfinger lookup first, then go and follow by account afterwards
        let accountLookup = try await lookupAccount(uri: uri)
        return try await followAccount(by: accountLookup.id)
    }

    /// Unfollow the given account.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func unfollowAccount(by id: String) async throws -> Relationship {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "unfollow"])
            $0.method = .post
        }
        return try await fetch(Relationship.self, req)
    }

    /// Remove the given account from your followers.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func removeAccountFromFollowers(by id: String) async throws -> Relationship {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "remove_from_followers"])
            $0.method = .post
        }
        return try await fetch(Relationship.self, req)
    }

    /// Block the given account. Clients should filter posts from this account if received (e.g. due to a boost in the Home timeline)
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func blockAccount(by id: String) async throws -> Relationship {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "block"])
            $0.method = .post
        }
        return try await fetch(Relationship.self, req)
    }

    /// Unblock the given account
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func unblockAccount(by id: String) async throws -> Relationship {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "unblock"])
            $0.method = .post
        }
        return try await fetch(Relationship.self, req)
    }

    /// Get all accounts which the current account is blocking
    /// - Parameters:
    ///     - pageInfo: PagedInfo object for max/min/since
    ///     - limit: Maximum number of results to return. Defaults to 40 accounts. Max 80 accounts.
    /// - Returns: the accounts requested
    public func getBlockedAccounts(_ pageInfo: PagedInfo? = nil, limit: Int? = nil) async throws -> PagedResult<[Account]> {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "blocks"])
            $0.method = .get
            $0.query = getQueryParams(pageInfo, limit: limit)
        }
        return try await fetchPagedResult(req)
    }

    /// Mute the given account. Clients should filter posts and notifications from this account, if received (e.g. due to a boost in the Home timeline).
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func muteAccount(by id: String, params: MuteAccountParams? = nil) async throws -> Relationship {
        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "mute"])
            $0.method = .post
            $0.body = try .json(params)
        }
        return try await fetch(Relationship.self, req)
    }

    /// Unmute the given account.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func unmuteAccount(by id: String) async throws -> Relationship {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "unmute"])
            $0.method = .post
        }
        return try await fetch(Relationship.self, req)
    }

    /// Get all accounts which the current account is blocking
    /// - Parameters:
    ///     - pageInfo: PagedInfo object for max/min/since
    ///     - limit: Maximum number of results to return. Defaults to 40 accounts. Max 80 accounts.
    /// - Returns: the accounts requested
    public func getMutedAccounts(_ pageInfo: PagedInfo? = nil, limit: Int? = nil) async throws -> PagedResult<[Account]> {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "mutes"])
            $0.method = .get
            $0.query = getQueryParams(pageInfo, limit: limit)
        }
        return try await fetchPagedResult(req)
    }

    /// Add the given account to the user’s featured profiles. (Featured profiles are currently shown on the user’s own public profile.)
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func pinAccount(by id: String) async throws -> Relationship {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "pin"])
            $0.method = .post
        }
        return try await fetch(Relationship.self, req)
    }

    /// Remove the given account from the user’s featured profiles.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func unpinAccount(by id: String) async throws -> Relationship {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "unpin"])
            $0.method = .post
        }
        return try await fetch(Relationship.self, req)
    }

    /// Accounts that the user is currently featuring on their profile.
    /// - Parameters:
    ///     - pageInfo: PagedInfo object for max/min/since
    ///     - limit: Maximum number of results to return. Defaults to 40 accounts. Max 80 accounts.
    /// - Returns: the accounts requested
    public func getEndorsements(_ pageInfo: PagedInfo? = nil, limit: Int? = nil) async throws -> PagedResult<[Account]> {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "endorsements"])
            $0.method = .get
            $0.query = getQueryParams(pageInfo, limit: limit)
        }
        return try await fetchPagedResult(req)
    }

    /// Sets a private note on a user.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested (including the note), or an error if unable to retrieve
    public func setNoteForAccount(by id: String, params: SetNoteForAccountParams? = nil) async throws -> Relationship {
        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", id, "note"])
            $0.method = .post
            $0.body = try .json(params)
        }
        return try await fetch(Relationship.self, req)
    }

    /// Find out whether a given account is followed, blocked, muted, etc.
    /// - Parameter id: the ID of the Account in the instance database.
    /// - Returns: the relationship to the account requested, or an error if unable to retrieve
    public func getRelationships(by ids: [String], params: RelationshipParams = .init()) async throws -> [Relationship] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", "relationships"])
            $0.method = .get
            $0.query = ids.map({ URLQueryItem(name: "id[]", value: $0) }) + params.queryItems
        }
        return try await fetch([Relationship].self, req)
    }

    /// Obtain a list of all accounts that follow a given account, filtered for accounts you follow.
    /// - Parameter ids: Find familiar followers for the provided account IDs.
    /// - Returns: array of FamiliarFollowers
    public func getFamiliarFollowers(by ids: [String]) async throws -> [FamiliarFollowers] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", "familiar_followers"])
            $0.method = .get
            $0.query = ids.map({ URLQueryItem(name: "id[]", value: $0) })
        }
        return try await fetch([FamiliarFollowers].self, req)
    }

}
