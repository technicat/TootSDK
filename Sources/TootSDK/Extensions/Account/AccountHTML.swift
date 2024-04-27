/// questionable, but why not
extension Account: HTML {

    public var html: String? {
        note.notBlank
    }
}
