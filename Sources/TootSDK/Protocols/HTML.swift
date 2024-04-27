/// anything that (potentially) has HTML content
public protocol HTML {
    var html: String? { get }
}

extension HTML {
    public var hasHTML: Bool {
        guard let html else {
            return false
        }
        return !html.isBlank
    }
}
