extension Post: HTMLable {
    public var html: String? {
        guard let html = content else {
            return nil
        }
        // should check for whitespace
        guard !html.isBlank else {
            return nil
        }
        return html
    }
}
