extension CredentialAccount {

    // ideally check on CredentialAccount source which works on 4.2
    // otherwise fallback to plain account which works on 4.3
    public var isHidingCollections: Bool {
        source?.hideCollections ?? false
        // ?? hideCollections ?? false
    }

}

// should rethink how the precedence works here
extension Account {

    public var isHidingFollowLists: Bool {
        isHidingFollows && isHidingFollowers
    }

    public var isHidingFollowCounts: Bool {
        isHidingFollowerCount && isHidingFollowCount
    }

    public var isHidingFollows: Bool {
        hideCollections ?? pleroma?.hideFollows ?? false
    }

    public var isHidingFollowers: Bool {
        hideCollections ?? pleroma?.hideFollowers ?? false
    }

    public var isHidingFollowerCount: Bool {
        hideCollections ?? pleroma?.hideFollowersCount ?? false
    }

    public var isHidingFollowCount: Bool {
        hideCollections ?? pleroma?.hideFollowsCount ?? false
    }

    // todo - move
    public var isHidingFaves: Bool {
        pleroma?.hideFavorites ?? false
    }
}
