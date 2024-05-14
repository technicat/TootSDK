import RegexBuilder

// platform-specific portion has to be parsed on a platform-specific basis
// e.g. hometown uses + instead of () to separate from the API version
extension InstanceV1 {

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
            // if we can't find the version, make up something big
            // give all features a chance
            return Version(100, 0)
        }
    }
}
