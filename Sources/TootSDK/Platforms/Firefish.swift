open class Firefish: MastoAPI {

    open override var name: String { "Firefish" }

    open override var reportCats: [ReportCategory] { [] }
    open override var suggestionSources: SuggestionSources {
        [
            .global
        ]
    }

    open override var supportsDomainBlocks: Bool { false }
    open override var supportsFeaturedTags: Bool { false }

    open override var supportsIsBoosted: Bool { false }

    open override var supportsNote: Bool { false }
    open override var supportsNotificationDelete: Bool { false }
    open override var supportsNotificationDeleteAll: Bool { false }

    open override var supportsPostDefaultLanguage: Bool { false }
    open override var supportsPostDefaultSensitive: Bool { false }
    open override var supportsPostDefaultVisibility: Bool { false }
    open override var supportsPublicTimeline: Bool { false }

    open override var supportsRevoke: Bool { false }

    open override var supportsSchedule: Bool { false }
    open override var supportsSearchAccounts: Bool { false }

    open override var supportsTranslate: Bool { false }
    open override var supportsTranslationLanguages: Bool { false }

    /// limits
    ///
    open override var trendingTagsLimit: Int { 0 }

    /// lists

    open override var notificationTypes: NotificationTypes {
        [.follow, .mention, .repost, .favourite, .poll, .followRequest]
    }
}
