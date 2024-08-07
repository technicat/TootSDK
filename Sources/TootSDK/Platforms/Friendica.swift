/// https://github.com/friendica/friendica/blob/2024.06-rc/doc/API-Mastodon.md
open class Friendica: MastoAPI {

    open override var name: String { "Friendica" }

    open override var supportsPostDeleteAndEdit: Bool { false }
    open override var supportsFeaturedTags: Bool { false }
    // open override var supportsFollowTag: Bool { true }
    open override var supportsMuteNotifications: Bool { false }
    open override var supportsInstanceActivity: Bool { false }
    // instance v2 available but need to version check
    open override var supportsInstanceV2: Bool { false }
    // does not support voting on polls
    open override var supportsPoll: Bool { false }
    open override var supportsScheduleUpdate: Bool { false }
    /// doesn't support streaming via websockets
    open override var supportsStreaming: Bool { false }
    open override var supportsUpdateAccount: Bool { false }

    // lists

    // all the two-letter codes
    open override var languages: ISOCodes { ISOCode.iso6391 }

    open override var notificationTypes: NotificationTypes {
        // setting this to empty (unsupported)
        // because excluded_types doesn't properly exclude reblogs
        return [
            // .follow, .mention, .repost, .favourite, .poll, .followRequest, .post, .update,
        ]
    }

    // limits
    /// domain blocking not supported
    open override var blockedDomainsLimit: Int { 0 }
    /// profile fields not supported
    open override var profileFieldsLimit: Int { 0 }
    /// tag following supported
    open override var followedTagsPageLimit: Int { 200 }  // check this

    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        switch timeline {
        case .bookmarks: return 40  // todo - check this
        default: return super.getLimit(for: timeline, auth)
        }
    }

}
