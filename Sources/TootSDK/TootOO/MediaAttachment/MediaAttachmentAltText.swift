extension MediaAttachment {

    public var hasAltText: Bool {
        description?.notBlank != nil
    }
}
