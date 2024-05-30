import Foundation

public struct Version {
    public var major: Int
    public var minor: Int
    public var patch: Int

    public init(_ major: Int, _ minor: Int, _ patch: Int = 0) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    public init() {
        self.major = 0
        self.minor = 0
        self.patch = 0
    }
}

extension Version {
    public var dot: String { "\(major).\(minor).\(patch)" }
}
