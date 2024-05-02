open class Sharkey: MastoAPI {

    open override var name: String { "Sharkey" }

    open override var supportsFaveTimeline: Bool { false }
    open override var supportsFeaturedTags: Bool { false }

    open override var supportsMutePost: Bool { false }

    open override var supportsNotificationDelete: Bool { false }
    open override var supportsNotificationDeleteAll: Bool { false }

    open override var supportsPostDefaultLanguage: Bool { false }
    open override var supportsPostDefaultSensitive: Bool { false }
    open override var supportsPostDefaultVisibility: Bool { false }

    open override var supportsRevoke: Bool { false }

    open override var supportsSchedule: Bool { false }

    open override var supportsTagStats: Bool { false }
    open override var supportsTagTimeline: Bool { false }  // bug

    open override var suggestionSources: SuggestionSources {
        [
            .global
        ]
    }

    open override var notificationTypes: NotificationTypes {
        []
    }

}
