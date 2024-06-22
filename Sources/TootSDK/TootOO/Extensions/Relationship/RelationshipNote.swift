extension Relationship {

    public var hasNote: Bool {
        guard let note else {
            return false
        }
        return !note.isBlank
    }
    
    public var isFollowing: Bool {
        following ?? false
    }
    
    public var isFollowedBy: Bool {
        followedBy ?? false
    }
    
    public var isRequested: Bool {
        requested ?? false
    }
    
    public var isMuting: Bool {
        muting ?? false
    }
}
