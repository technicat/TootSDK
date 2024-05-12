///https://docs-develop.pleroma.social/backend/development/API/differences_in_mastoapi_responses/
open class Pleroma: MastoAPI {

    open override var name: String { "Pleroma" }

    // supports

    open override var supportsFeaturedTags: Bool { false }

    open override var supportsScheduleUpdate: Bool { false }

    open override var supportsPostDefaultLanguage: Bool { false }
    open override var supportsPostDefaultSensitive: Bool { false }

    open override var supportsRevoke: Bool { false }

    // limits

    open override func getLimit(for timeline: Timeline) -> Int {
        switch timeline {
        case .direct: return 40  // todo - check limit
        default: return super.getLimit(for: timeline)
        }
    }
}
