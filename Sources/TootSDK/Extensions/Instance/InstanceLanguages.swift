extension InstanceV1 {

    public var hasLanguages: Bool {
        guard let languages else {
            return false
        }
        return !languages.isEmpty
    }
}
