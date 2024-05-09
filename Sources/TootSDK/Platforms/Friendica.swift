open class Friendica: MastoAPI {

    open override var name: String { "Friendica" }

    open override var supportsPostDeleteAndEdit: Bool { false }
    open override var supportsFeaturedTags: Bool { false }
    // open override var supportsFollowTag: Bool { true }
    open override var supportsPollVote: Bool { false }
    open override var supportsProfileFields: Bool { false }
    open override var supportsScheduleUpdate: Bool { false }
    open override var supportsUpdateAccount: Bool { false }

    // lists

    open override var languages: [ISOCode] { ISOCode.allCases }

    // limits
    // domain blocking not supported
    open override var blockedDomainsLimit: Int { 0 }
    // tag following supported
    open override var followedTagsPageLimit: Int { 200 }  // check this

    open override func getLimit(for timeline: Timeline) -> Int {
        switch timeline {
        case .bookmarks: return 40  // todo - check this
        default: return super.getLimit(for: timeline)
        }
    }

}
