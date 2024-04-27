extension Account {

    /// to avoid confusion with Relationship.note
    /// which is a private note by you re another account
    public var bio: String {
        note
    }

    public var hasBio: Bool {
        !note.isBlank
    }
}
