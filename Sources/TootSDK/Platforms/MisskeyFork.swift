open class MisskeyFork: MastoAPI {

    open override var name: String { "MisskeyFork" }

    open override var supportsFeaturedTags: Bool { false }

    open override var supportsInstanceActivity: Bool { false }

    open override var supportsIsBoosted: Bool { false }

    open override var supportsMuteNotifications: Bool { false }

    open override var supportsNote: Bool { false }

    open override var supportsNotificationDelete: Bool { false }
    open override var supportsNotificationDeleteAll: Bool { false }

    open override var supportsPostDeleteAndEdit: Bool { false }

    open override var supportsPostDefaultLanguage: Bool { false }
    open override var supportsPostDefaultSensitive: Bool { false }
    open override var supportsPostDefaultVisibility: Bool { false }

    open override var supportsRevoke: Bool { false }
    
    /// doesn't support streaming via websockets
    open override var supportsStreaming: Bool { false }

    open override var supportsTranslate: Bool { false }
    open override var supportsTranslationLanguages: Bool { false }

    // limits

    /// domain blocking not supported
    open override var blockedDomainsLimit: Int { 0 }
    /// profile directories not supported
    open override func directoryLimit(_ auth: Bool) -> Int { 0 }
    /// profile fields have no limit?
    open override var profileFieldsLimit: Int { 100 }
    /// followed tags not supported
    open override var followedTagsPageLimit: Int { 0 }
    /// scheduled posts not supported
    open override var scheduledPageLimit: Int { 0 }

    // lists

    /// report categories not supported
    open override var reportCats: ReportCats { [] }

    ///
    open override var suggestionSources: SuggestionSources {
        [
            .global
        ]
    }

}
