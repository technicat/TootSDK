import Foundation

extension String {

    public var localizedLanguageName: String {
        Locale.current.localizedString(forIdentifier: self) ?? self
    }
}

extension ISOCode {
    
    public var localizedName: String {
        rawValue.localizedLanguageName
    }
}
