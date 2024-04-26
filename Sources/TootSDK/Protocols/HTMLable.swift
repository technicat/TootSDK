public protocol HTMLable {

    var html: String? { get }
}

extension HTMLable {
    public var hasHTML: Bool {
        guard let html else {
            return false
        }
        // check for whitespace?
        return !html.isEmpty
    }
}
