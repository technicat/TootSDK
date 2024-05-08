open class MisskeyFork: MastoAPI {

    open override var name: String { "MisskeyFork" }

    open override var supportsFeaturedTags: Bool { false }

    open override var supportsIsBoosted: Bool { false }

    open override var supportsNote: Bool { false }

    open override var supportsNotificationDelete: Bool { false }
    open override var supportsNotificationDeleteAll: Bool { false }
    
    open override var supportsPostDeleteAndEdit: Bool { false }

    open override var supportsPostDefaultLanguage: Bool { false }
    open override var supportsPostDefaultSensitive: Bool { false }
    open override var supportsPostDefaultVisibility: Bool { false }

    open override var supportsRevoke: Bool { false }

    open override var supportsTranslate: Bool { false }
    open override var supportsTranslationLanguages: Bool { false }

    // limits

    /// domain blocking not supported
    open override var blockedDomainsLimit: Int { 0 }
    /// profile directories not supported
    open override var directoryLimit: Int { 0 }
    /// followed tags not supported
    open override var followedTagsPageLimit: Int { 0 }
    /// scheduled posts not supported
    open override var scheduledPageLimit: Int { 0 }

    // lists

    /// report categories not supported
    open override var reportCats: [ReportCategory] { [] }

    ///
    open override var suggestionSources: SuggestionSources {
        [
            .global
        ]
    }

}
