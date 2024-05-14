extension InstanceV1 {

    public var hasRules: Bool {
        guard let rules else {
            return false
        }
        return !rules.isEmpty
    }

}
