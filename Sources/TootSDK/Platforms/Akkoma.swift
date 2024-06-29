/// https://docs.akkoma.dev/stable/development/API/differences_in_mastoapi_responses/
/// https://docs.akkoma.dev/stable/development/API/akkoma_api/
open class Akkoma: Pleroma {

    open override var name: String { "Akkoma" }

    // supports

    // pleroma (sometimes?) supports v2/instance but not akkoma
    open override var supportsInstanceV2: Bool { false }

    /// akkoma has its own translate api
    open override var supportsTranslate: Bool { build >= Version(3, 11, 0) }
    open override var supportsTranslationLanguages: Bool { build >= Version(3, 11, 0) }

    // limits

    /// timelines
    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        switch timeline {
        case .bubble: return 40  // todo - check this number
        default: return super.getLimit(for: timeline, auth)
        }
    }

    // lists

    // all the two-letter codes
    // todo - check version 2023.02
    open override var languages: ISOCodes { ISOCode.iso6391 }
}
