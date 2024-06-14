public protocol Spoilable {

    var spoiler: String? { get }
}

extension Spoilable {

    public var hasSpoiler: Bool {
        guard let spoiler else {
            return false
        }
        return !spoiler.isBlank
    }
}
