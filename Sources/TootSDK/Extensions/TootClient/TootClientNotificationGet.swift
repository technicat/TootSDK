extension TootClient {

    public func getNotifications(
        with types: NotificationTypes? = nil,
        without exclude: NotificationTypes? = nil,
        _ page: PagedInfo? = nil,
        limit: Int? = nil
    ) async throws -> PagedResult<[TootNotification]> {
        try await getNotifications(
            params:
                TootNotificationParams(
                    excludeTypes: exclude,
                    types: types),
            page,
            limit: limit)
    }
}
