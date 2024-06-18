open class Friendica: MastoAPI {

    open override var name: String { "Friendica" }

    open override var supportsPostDeleteAndEdit: Bool { false }
    open override var supportsFeaturedTags: Bool { false }
    // open override var supportsFollowTag: Bool { true }
    open override var supportsMuteNotifications: Bool { false }
    open override var supportsInstanceActivity: Bool { false }
    open override var supportsPollVote: Bool { false }
    open override var supportsProfileFields: Bool { false }
    open override var supportsScheduleUpdate: Bool { false }
    open override var supportsUpdateAccount: Bool { false }

    // lists

    open override var languages: ISOCodes { Set(ISOCode.allCases) }

    open override var notificationTypes: NotificationTypes {
        // setting this to empty (unsupported)
        // because excluded_types doesn't properly exclude reblogs
        return [
            // .follow, .mention, .repost, .favourite, .poll, .followRequest, .post, .update,
        ]
    }

    // limits
    // domain blocking not supported
    open override var blockedDomainsLimit: Int { 0 }
    // tag following supported
    open override var followedTagsPageLimit: Int { 200 }  // check this

    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        switch timeline {
        case .bookmarks: return 40  // todo - check this
        default: return super.getLimit(for: timeline, auth)
        }
    }

}
