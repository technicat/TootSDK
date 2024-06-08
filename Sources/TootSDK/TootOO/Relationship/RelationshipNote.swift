extension Relationship {

    public var hasNote: Bool {
        guard let note else {
            return false
        }
        return !note.isBlank
    }
}
