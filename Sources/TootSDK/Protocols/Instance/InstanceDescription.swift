extension Instance {

    public var hasDescription: Bool {
        guard let description else {
            return false
        }
        return !description.isBlank
    }
}
