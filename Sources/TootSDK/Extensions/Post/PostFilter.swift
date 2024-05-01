extension Post {

    public var isFiltered: Bool {
        guard let filtered else {
            return false
        }
        return !filtered.isEmpty
    }
}
