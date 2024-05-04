open class Sharkey: MisskeyFork {

    open override var name: String { "Sharkey" }

    open override var supportsFaveTimeline: Bool { false }

    open override var supportsMutePost: Bool { false }

    open override var supportsTagStats: Bool { false }
    open override var supportsTagTimeline: Bool { false }  // bug

    open override var suggestionSources: SuggestionSources {
        [
            .global
        ]
    }

    /// lists

    open override var notificationTypes: NotificationTypes {
        []
    }

}
