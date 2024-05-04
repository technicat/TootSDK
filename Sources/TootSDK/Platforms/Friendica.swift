open class Friendica: MastoAPI {

    open override var name: String { "Friendica" }
    //open override var supportsBookmark: Bool { true }
    open override var supportsDomainBlocks: Bool { false }
    open override var supportsFeaturedTags: Bool { false }
    open override var supportsFollowTag: Bool { true }
    open override var supportsPollVote: Bool { false }
    open override var supportsProfileFields: Bool { false }
    open override var supportsScheduleUpdate: Bool { false }
    open override var supportsUpdateAccount: Bool { false }

    // lists

    open override var languages: [ISOCode] { ISOCode.allCases }

    // limits

    open override func getLimit(for timeline: Timeline) -> Int {
        switch timeline {
        case .bookmarks: return 40  // todo - check this
        default: return super.getLimit(for: timeline)
        }
    }

}
