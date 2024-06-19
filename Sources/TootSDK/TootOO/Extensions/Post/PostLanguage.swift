import Foundation

extension Post {

    public var hasLanguage: Bool {
        language != nil  // should we validate?
    }

    // not sure we should have a use for this as ISOCode is preferrerd
    //  public var languageCode: Locale.LanguageCode? {
    //    guard let language else {
    //      return nil
    //    }
    //    return Locale.LanguageCode(language)  // preprocess string?
    //  }

    public var languageCode: ISOCode {
        return language ?? .und
    }

    public var languageName: String? {
        return language?.localizedName
    }

}
