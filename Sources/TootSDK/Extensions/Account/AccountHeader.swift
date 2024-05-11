extension Account {

    // should verify it's a URL
    public var hasHeader: Bool {
        guard let header else {
            return false
        }
        return !header.isBlank && !header.hasSuffix("missing.png")
    }
}
