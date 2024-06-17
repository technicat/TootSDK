import Foundation

public protocol Translated: HTML, Spoilable {
    
    /// The translated poll options of the post.
    public var translatedPoll: Translation.Poll?
    /// The translated media descriptions of the post
    public var translatedAttachments: [Translation.MediaAttachment]
    /// The language of the source text, as auto-detected by the machine translation provider.
    /// ISO 639 language code
    public var sourceLanguage: String? // use ISOCode
    /// The service that provided the machine translation.
    public var translator: String?
    /// The target language
    public var targetLanguage: String?
}
