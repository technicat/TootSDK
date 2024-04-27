extension PostEdit: HTMLable {

    public var html: String? {
        content.notBlank
    }
}
