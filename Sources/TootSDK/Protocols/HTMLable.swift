/// anything that (potentially) has HTML content
public protocol HTMLable {
    var html: String? { get }
}

extension HTMLable {
    public var hasHTML: Bool {
        guard let html else {
            return false
        }
        // ideally all implementors would convert empty html to nil
        // todo - check for whitespace
        return !html.isEmpty
    }
}
