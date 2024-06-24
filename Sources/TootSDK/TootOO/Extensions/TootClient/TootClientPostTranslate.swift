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

    public func getAkkomaTranslation(of post: Post, to language: ISOCode) async throws
        -> AkkomaTranslation
    {
        try await getPostTranslation(id: post.id, params: AkkomaPostTranslationParams(language: language))
    }

}
