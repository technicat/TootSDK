extension PostEdit: HTMLable {

    public var html: String? {
        guard !content.isBlank else {
            return nil
        }
        return content
    }
}
