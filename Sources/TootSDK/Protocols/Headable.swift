public protocol Headable {
    var header: String? { get }
}

extension Headable {

    // should verify it's a URL
    public var hasHeader: Bool {
        guard let header else {
            return false
        }
        return !header.isBlank && !header.isBlankImage
    }
}
