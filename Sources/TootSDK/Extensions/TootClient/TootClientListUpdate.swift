extension TootClient {

    /// https://docs.joinmastodon.org/methods/lists/#update
    @discardableResult
    public func update(
        _ list: List,
        name: String? = nil,
        repliesPolicy: ListRepliesPolicy? = nil,
        exclusive: Bool? = nil
    ) async throws -> List {
        let params = ListParams(
            title: name ?? list.title,
            repliesPolicy: repliesPolicy,
            exclusive: exclusive)
        return try await createList(
            id: list.id,
            params: params)
    }

}
