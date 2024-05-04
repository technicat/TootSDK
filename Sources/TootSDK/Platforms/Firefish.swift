open class Firefish: MisskeyFork {

    open override var name: String { "Firefish" }

    open override var reportCats: [ReportCategory] { [] }
    open override var suggestionSources: SuggestionSources {
        [
            .global
        ]
    }

    open override var supportsDomainBlocks: Bool { false }

    open override var supportsNote: Bool { false }

    open override var supportsPublicTimeline: Bool { false }

    open override var supportsSearchAccounts: Bool { false }

    /// limits
    ///
    open override var trendingTagsLimit: Int { 0 }

    /// lists

    open override var notificationTypes: NotificationTypes {
        [.follow, .mention, .repost, .favourite, .poll, .followRequest]
    }
}
