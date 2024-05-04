open class MisskeyFork: MastoAPI {

    open override var name: String { "MisskeyFork" }

    open override var supportsFeaturedTags: Bool { false }

    open override var supportsIsBoosted: Bool { false }

    open override var supportsNotificationDelete: Bool { false }
    open override var supportsNotificationDeleteAll: Bool { false }

    open override var supportsPostDefaultLanguage: Bool { false }
    open override var supportsPostDefaultSensitive: Bool { false }
    open override var supportsPostDefaultVisibility: Bool { false }

    open override var supportsRevoke: Bool { false }
    
    open override var supportsTranslate: Bool { false }
    open override var supportsTranslationLanguages: Bool { false }

    // limits
    ///
    open override var scheduledPageLimit: Int {
        0
    }

}
