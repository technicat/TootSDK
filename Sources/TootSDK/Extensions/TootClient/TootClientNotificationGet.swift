extension TootClient {

    public func getNotifications(
        types: NotificationTypes? = nil,
        with include: NotificationTypes? = nil, // pleroma, akkoma
        without exclude: NotificationTypes? = nil,
        _ page: PagedInfo? = nil,
        limit: Int? = nil
    ) async throws -> PagedResult<[TootNotification]> {
        try await getNotifications(
            params:
                TootNotificationParams(
                    excludeTypes: exclude,
                    types: types,
                    includeTypes: include),
            page,
            limit: limit)
    }
}
