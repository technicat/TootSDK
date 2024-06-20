extension TootClient {

    /// return Akkoma translation codes in Mastodon's translations source-target format
    public func getTranslationCodesAkkoma() async throws -> Translations {
        let trans = try await getTranslationLanguagesAkkoma()
        var translations: Translations = [:]
        if let sources = trans.source {
            for lang in sources {
                translations[lang.code] = trans.target?.map { $0.code } ?? []
            }
        }
        return translations
    }
}
