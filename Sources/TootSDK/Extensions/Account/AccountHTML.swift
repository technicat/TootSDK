/// questionable, but why not
extension Account: HTMLable {

    public var html: String? {
        note.notBlank
    }
}
