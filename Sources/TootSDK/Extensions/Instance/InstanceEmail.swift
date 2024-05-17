extension Instance {

    public var hasContactEmail: Bool {
        guard let contactEmail else {
            return false
        }
        return !contactEmail.isBlank
    }

}
