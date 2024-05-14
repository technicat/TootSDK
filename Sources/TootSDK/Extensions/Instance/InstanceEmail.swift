extension InstanceV1 {

    public var hasContactEmail: Bool {
        guard let email else {
            return false
        }
        return !email.isBlank
    }

}
