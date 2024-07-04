extension CredentialAccount {

    // ideally check on CredentialAccount source which works on 4.2
    // otherwise fallback to plain account which works on 4.3
    public var isHidingCollections: Bool {
        source?.hideCollections ?? false 
        // ?? hideCollections ?? false
    }

}

extension Account {
    
    public var isHidingFollowLists: Bool {
        isHidingFollows &&
        isHidingFollowers
      //  isHidingFollowerCount &&
      //  isHidingFollowCount
    }
    
    public var isHidingFollowCounts: Bool {
        isHidingFollowerCount &&
        isHidingFollowCount
    }
    
    public var isHidingFollows: Bool {
        hideCollections ?? pleroma?.hideFollows ?? false
    }
    
    public var isHidingFollowers: Bool {
        hideCollections ?? pleroma?.hideFollowers ?? false
    }
    
    public var isHidingFollowerCount: Bool {
        pleroma?.hideFollowersCount ?? false
    }
    
    public var isHidingFollowCount: Bool {
        pleroma?.hideFollowsCount ?? false
    }
    
    public var isHidingFaves: Bool {
        pleroma?.hideFavorites ?? false
    }
}
