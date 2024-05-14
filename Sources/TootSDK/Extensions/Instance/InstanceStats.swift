extension InstanceV1.Stats {

    public var isEmpty: Bool {
        !(hasStat(postCount) || hasStat(userCount) || hasStat(domainCount))
    }

    func hasStat(_ stat: Int?) -> Bool {
        stat != nil && stat != 0
    }
}
