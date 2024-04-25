import Foundation

public protocol Spoilable {

    var spoiler: String? { get }
}

extension Spoilable {

    public var hasSpoiler: Bool {
        spoiler != nil
    }
}
