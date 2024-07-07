///https://docs-develop.pleroma.social/backend/development/API/differences_in_mastoapi_responses/
open class Pleroma: MastoCompatible {

    open override var name: String { "Pleroma" }

    // supports

    // doesn't support featured tags
    open override var supportsFeaturedTags: Bool { false }
    // doesn't support instance activity stats
    open override var supportsInstanceActivity: Bool { false }
    // I've seen once instance support v2/instance
    // maybe can version check but leave off for now
    open override var supportsInstanceV2: Bool { build >= Version(2, 6, 52) }
    // can't mute notifications
    open override var supportsMuteNotifications: Bool { false }
    // can't update scheduled posts
    open override var supportsScheduleUpdate: Bool { false }
    // can't specify post default language
    //open override var supportsPostDefaultLanguage: Bool { false }
    // can't specify post default sensitivity
    open override var supportsPostDefaultSensitive: Bool { false }
    // can't revoke token
    open override var supportsRevoke: Bool { false }

    // lists

    open override var notificationTypes: NotificationTypes {
        var types: NotificationTypes = [
            .follow, .mention, .repost, .favourite,
        ]
        if build >= Version(2, 4, 1) {
            types.insert(.poll)
        }
        return types
    }

    open override var postVis: PostVisibilities {
        super.postVis.union([.local])
    }

    // limits

    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        switch timeline {
        case .direct: return 40  // todo - check limit
        default: return super.getLimit(for: timeline, auth)
        }
    }
}
