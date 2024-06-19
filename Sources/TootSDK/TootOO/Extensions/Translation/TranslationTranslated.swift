extension Translation: Translated {
    public var translatedPoll: Poll? {
        poll
    }

    public var translatedAttachments: [MediaAttachment] {
        mediaAttachments
    }

    public var sourceLanguage: ISOCode? {
        detectedSourceLanguage
    }

    public var translator: String? {
        provider
    }

    public var targetLanguage: ISOCode? {
        language
    }

    public var html: String? {
        content
    }

    public var spoiler: String? {
        spoilerText
    }

}

extension TranslationAkkoma: Translated {
    public var translatedPoll: Translation.Poll? {
        nil
    }

    public var translatedAttachments: [Translation.MediaAttachment] {
        []
    }

    public var sourceLanguage: ISOCode? {
        detectedLanguage
    }

    public var translator: String? {
        "Akkoma"
    }

    public var targetLanguage: ISOCode? {
        nil
    }

    public var html: String? {
        text
    }

    public var spoiler: String? {
        text
    }

}
