extension TootClient {

    /// https://docs.joinmastodon.org/methods/statuses/#translate
    public func getTranslation(of post: Post, to language: ISOCode? = nil) async throws
        -> Translation
    {
        if let language {
            try await getPostTranslation(
                id: post.id,
                params: PostTranslationParams(lang: language))
        } else {
            try await getPostTranslation(id: post.id)
        }
    }

    public func getTranslationAkkoma(of post: Post, to language: ISOCode) async throws
        -> TranslationAkkoma
    {
        try await getPostTranslation(id: post.id, params: PostTranslationParamsAkkoma(language: language))
    }

}
