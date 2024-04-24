import RegexBuilder

// platform-specific portion has to be parsed on a platform-specific basis
// e.g. hometown uses + instead of () to separate from the API version
extension Instance {

    @available(macOS 13.0, *)
    @available(iOS 16.0, *)
    public var apiVersion: Version {
        let regex = Regex {
            Capture(OneOrMore(.digit))
            "."
            Capture(OneOrMore(.digit))
            "."
            Capture(OneOrMore(.digit))
        }
        if let match = version.firstMatch(of: regex) {
            return Version(Int(match.1) ?? 0, Int(match.2) ?? 0, Int(match.3) ?? 0)
        } else {
            return Version(0, 0)
        }
    }
}
