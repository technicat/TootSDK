extension PostEdit: HTMLable {

    public var html: String? {
        guard !content.isEmpty else {
            return nil
        }
        return content
    }
}
