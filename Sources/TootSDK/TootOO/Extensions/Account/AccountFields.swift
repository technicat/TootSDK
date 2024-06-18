extension Account {

    public var hasFields: Bool {
        guard let fields else {
            return false
        }
        return !fields.isEmpty
    }
}
