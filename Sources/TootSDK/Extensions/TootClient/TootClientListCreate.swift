extension TootClient {

    /// https://docs.joinmastodon.org/methods/lists/#create
    public func create(
        list name: String, repliesPolicy: ListRepliesPolicy? = nil, exclusive: Bool? = nil
    )
        async throws -> List
    {
        let params = ListParams(
            title: name,
            repliesPolicy: repliesPolicy,
            exclusive: exclusive)
        return try await createList(params: params)
    }

}
