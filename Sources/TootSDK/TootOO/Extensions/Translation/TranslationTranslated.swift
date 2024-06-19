extension Translation: Translated {
    public var translatedPoll: Poll? {
        poll
    }
    
    public var translatedAttachments: [MediaAttachment] {
        mediaAttachments
    }
    
    public var sourceLanguage: String? {
        detectedSourceLanguage
    }
    
    public var translator: String? {
        provider
    }
    
    public var targetLanguage: String? {
        targetLanguage
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
    
    public var sourceLanguage: String? {
        detectedLanguage
    }
    
    public var translator: String? {
        "Akkoma"
    }
    
    public var targetLanguage: String? {
        nil
    }
    
    public var html: String? {
        text
    }
    
    public var spoiler: String? {
        text
    }
    
}
