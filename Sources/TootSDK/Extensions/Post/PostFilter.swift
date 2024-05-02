extension Post {

    public var isFiltered: Bool {
        guard let filtered else {
            return false
        }
        return !filtered.isEmpty
    }
    
    public var firstFilterResult: FilterResult? {
        guard let filtered else {
            return nil
        }
        guard !filtered.isEmpty else {
            return nil
        }
        return filtered[0]
    }
    
    public var firstFilter: Filter? {
        firstFilterResult?.filter
    }
}
