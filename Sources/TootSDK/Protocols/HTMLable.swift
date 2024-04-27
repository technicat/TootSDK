/// anything that (potentially) has HTML content
public protocol HTMLable {
    var html: String? { get }
}

extension HTMLable {
    public var hasHTML: Bool {
        guard let html else {
            return false
        }
        return !html.isBlank
    }
}
