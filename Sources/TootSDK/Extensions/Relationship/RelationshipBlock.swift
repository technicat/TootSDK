extension Relationship {

    public var isBlockingDomain: Bool {
        domainBlocking ?? false
    }

    public var isBlockingYou: Bool {
        blockedBy ?? false
    }
}
