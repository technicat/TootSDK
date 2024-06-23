extension Relationship {

    public var isFollowing: Bool {
        following ?? false
    }

    public var isFollowedBy: Bool {
        followedBy ?? false
    }

    public var isRequested: Bool {
        requested ?? false
    }
}
