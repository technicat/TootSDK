extension Account {
    
    // should verify it's a URL
    public var hasHeader: Bool {
        !header.isBlank && !header.hasSuffix("missing.png")
    }
}
