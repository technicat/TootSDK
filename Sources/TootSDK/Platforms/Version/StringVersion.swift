import RegexBuilder

// platform-specific portion has to be parsed on a platform-specific basis
// e.g. hometown uses + instead of () to separate from the API version
//extension Instance {
extension String {

    var version: (api: Version, build: String) {
        let regex = Regex {
            Capture(OneOrMore(.digit))
            "."
            Capture(OneOrMore(.digit))
            "."
            Capture(OneOrMore(.digit))
            Capture(ZeroOrMore(.any))
        }
        if let match = firstMatch(of: regex) {
            return (Version(Int(match.1) ?? 0, Int(match.2) ?? 0, Int(match.3) ?? 0), String(match.4))
        } else {
            // if we can't find the version, make up something big
            // give all features a chance
            return (Version(0, 0), "")
        }
    }
}
