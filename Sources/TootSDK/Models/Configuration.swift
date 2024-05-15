//
//  InstanceConfiguration.swift
//
//
//  Created by Phil Chu on 5/14/24.
//

/// Configured values and limits for this website (instance)
/// https://docs.joinmastodon.org/entities/Instance/#configuration
public struct Configuration: Codable, Hashable {
    /// Limits related to accounts.
    public var accounts: Accounts?
    /// Limits related to authoring posts.
    public var posts: Posts?
    /// Hints for which attachments will be accepted.
    public var mediaAttachments: MediaAttachments?
    /// Limits related to polls.
    public var polls: Polls?

    enum CodingKeys: String, CodingKey {
        case accounts
        case posts = "statuses"
        case mediaAttachments
        case polls
    }

    public struct Accounts: Codable, Hashable {
        /// The maximum number of featured tags allowed for each account.
        public var maxFeaturedTags: Int?
    }

    public struct Posts: Codable, Hashable {
        /// The maximum number of allowed characters per post.
        public var maxCharacters: Int?
        /// The maximum number of media attachments that can be added to a post.
        public var maxMediaAttachments: Int?
        /// Each URL in a post will be assumed to be exactly this many characters.
        public var charactersReservedPerUrl: Int?
    }

    public struct MediaAttachments: Codable, Hashable {
        /// Contains MIME types that can be uploaded.
        public var supportedMimeTypes: [String]?
        /// The maximum size of any uploaded image, in bytes.
        public var imageSizeLimit: Int?
        /// The maximum number of pixels (width times height) for image uploads.
        public var imageMatrixLimit: Int?
        /// The maximum size of any uploaded video, in bytes.
        public var videoSizeLimit: Int?
        /// The maximum frame rate for any uploaded video.
        public var videoFrameRateLimit: Int?
        /// The maximum number of pixels (width times height) for video uploads.
        public var videoMatrixLimit: Int?
    }

    public struct Polls: Codable, Hashable {
        /// Each poll is allowed to have up to this many options.
        public var maxOptions: Int?
        /// Each poll option is allowed to have this many characters.
        public var maxCharactersPerOption: Int?
        /// The shortest allowed poll duration, in seconds.
        public var minExpiration: Int?
        /// The longest allowed poll duration, in seconds.
        public var maxExpiration: Int?
    }

}
