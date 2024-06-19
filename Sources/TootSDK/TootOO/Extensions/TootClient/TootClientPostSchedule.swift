import Foundation

extension TootClient {

    /// todo - handle poll
    /// todo - handle pleroma params (contentType and replyToConversationId)
    /// todo - handle idempotency
    /// todo - option to enforce minimum delay (mastodon is five minutes)
    /// https://docs.joinmastodon.org/methods/statuses/#create
    @discardableResult
    public func schedule(
        text: String,
        replyTo: Post? = nil,
        media: [UploadedMediaAttachment]? = nil,
        sensitive: Bool? = nil,
        spoilerText: String? = nil,
        visibility: PostVisibility,
        language: ISOCode,
        scheduledAt: Date
    ) async throws -> ScheduledPost {
        try await schedulePost(
            ScheduledPostParams(
                text: text,
                mediaIds: media?.map { $0.id },
                sensitive: sensitive,
                spoilerText: spoilerText,
                visibility: visibility,
                language: language,
                scheduledAt: scheduledAt,
                inReplyToId: replyTo?.id
            ))
    }
}
