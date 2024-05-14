extension InstanceV1 {

    public var hasContact: Bool {
        hasContactAccount || hasContactEmail
    }
}
