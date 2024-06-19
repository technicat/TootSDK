import Foundation

public protocol Translated: HTML, Spoilable {

    /// The translated poll options of the post.
    var translatedPoll: Translation.Poll? { get }
    /// The translated media descriptions of the post
    var translatedAttachments: [Translation.MediaAttachment] { get }
    /// The language of the source text, as auto-detected by the machine translation provider.
    /// ISO 639 language code
    var sourceLanguage: ISOCode? { get }
    /// The service that provided the machine translation.
    var translator: String? { get }
    /// The target language
    var targetLanguage: ISOCode? { get }
}
