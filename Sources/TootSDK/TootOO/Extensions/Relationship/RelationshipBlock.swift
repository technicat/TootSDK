extension Relationship {

    public var isBlockingDomain: Bool {
        domainBlocking ?? false
    }

    public var isBlockingYou: Bool {
        blockedBy ?? false
    }

    public var isBlocking: Bool {
        blocking ?? false
    }
}
