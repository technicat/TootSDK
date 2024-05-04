open class Sharkey: MisskeyFork {

    open override var name: String { "Sharkey" }

    open override var supportsMutePost: Bool { false }

    open override var supportsTagStats: Bool { false }
    open override var supportsTagTimeline: Bool { false }  // bug
    
    /// limits
    open override func getLimit(for timeline: Timeline) -> Int {
        switch timeline {
        case .favourites: return 0
        default: return super.getLimit(for: timeline)
        }
    }

    /// lists

    open override var notificationTypes: NotificationTypes {
        []
    }

}
