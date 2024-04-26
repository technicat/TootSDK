//
//  PostEdit.swift
//
//
//  Created by dave on 4/12/22.
//

@preconcurrency import struct Foundation.Date

public struct PostEdit: Codable, Hashable, Sendable {
    ///  The content of the post at this revision.
    public var content: String
    ///  The content of the subject or content warning at this revision
    public var spoilerText: String
    /// Whether the post was marked sensitive at this revision
    public var sensitive: Bool
    /// The timestamp of when the revision was published
    public var createdAt: Date?
    /// The account that published this revision
    public var account: Account
    /// The current state of the poll options at this revision
    public var poll: Poll?
    /// The current state of the media attachments at this revision
    public var mediaAttachments: [MediaAttachment]
    /// Any custom emoji that are used in the current revision
    public var emojis: [Emoji]

    public init(
        content: String, spoilerText: String, sensitive: Bool, createdAt: Date? = nil, account: Account, poll: Poll? = nil,
        mediaAttachments: [MediaAttachment], emojis: [Emoji]
    ) {
        self.content = content
        self.spoilerText = spoilerText
        self.sensitive = sensitive
        self.createdAt = createdAt
        self.account = account
        self.poll = poll
        self.mediaAttachments = mediaAttachments
        self.emojis = emojis
    }

    /// The current state of the poll options at this revision. Note that edits changing the poll options will be collapsed together into one edit, since this action resets the poll.
    public struct Poll: Codable, Hashable, Sendable {
        public init(
            options: [Poll.Option]
        ) {
            self.options = options
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.options = try container.decode([Option].self, forKey: .options)
        }
        /// The poll options at this revision.
        public var options: [Option]

        public struct Option: Codable, Hashable, Sendable {
            public init(title: String, votesCount: Int) {
                self.title = title
            }

            /// The text for a poll option.
            public var title: String
        }
    }

}
