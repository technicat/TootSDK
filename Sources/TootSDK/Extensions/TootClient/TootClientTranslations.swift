extension TootClient {

    public func getTranslationCodes() async throws -> Translations {
        let map = try await getTranslationLanguages()
        var translations: Translations = [:]
        for (key, value) in map {
            if let source = ISOCode(rawValue: key) {
                translations[source] = value.compactMap { ISOCode(rawValue: $0) }
            }
        }
        return translations
    }
    
    /// return Akkoma translation codes in Mastodon's translations source-target format
    public func getTranslationCodesAkkoma() async throws -> Translations {
        let trans = try await getTranslationLanguagesAkkoma()
        var translations: Translations = [:]
        for lang in trans.source {
            if let source = ISOCode(rawValue: lang.code) {
                translations[source] = trans.target.compactMap { ISOCode(rawValue: $0.code) }
            }
        }
        return translations
    }
}

public typealias Translations = [ISOCode: [ISOCode]]
