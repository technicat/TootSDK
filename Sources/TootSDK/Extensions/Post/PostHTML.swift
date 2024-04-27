extension Post: HTMLable {
    public var html: String? {
        guard let html = content else {
            return nil
        }
        return html.notBlank
    }
}
