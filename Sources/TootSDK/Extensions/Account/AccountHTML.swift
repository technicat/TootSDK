/// questionable, but why not
extension Account: HTMLable {

    public var html: String? {
        // todo - check whitespace
        guard !note.isEmpty else {
            return nil
        }
        return note
    }
}
