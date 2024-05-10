///https://docs-develop.pleroma.social/backend/development/API/differences_in_mastoapi_responses/
open class Pleroma: MastoAPI {

    open override var name: String { "Pleroma" }
    open override var supportsFeaturedTags: Bool { false }

    open override var supportsScheduleUpdate: Bool { false }

    open override var supportsPostDefaultLanguage: Bool { false }
    open override var supportsPostDefaultSensitive: Bool { false }

    open override var supportsRevoke: Bool { false }
}
