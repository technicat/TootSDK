open class Sharkey: MisskeyFork {

    open override var name: String { "Sharkey" }

    open override var supportsMutePost: Bool { false }

    open override var supportsTagStats: Bool { false }

    /// limits
    open override func getLimit(for timeline: Timeline) -> Int {
        switch timeline {
        case .favourites: return 0
        case .hashtag: return 0  // bug
        default: return super.getLimit(for: timeline)
        }
    }

    /// lists

    open override var notificationTypes: NotificationTypes {
        []
    }

}
