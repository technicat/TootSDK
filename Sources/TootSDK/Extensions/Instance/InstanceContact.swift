extension Instance {

    public var hasContact: Bool {
        hasContactAccount || hasContactEmail
    }
}
