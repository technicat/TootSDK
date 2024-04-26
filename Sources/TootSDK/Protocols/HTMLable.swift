public protocol HTMLable {

    var html: String? { get }
}

extension HTMLable {
    public var hasHTML: Bool {
        html != nil
    }
}
