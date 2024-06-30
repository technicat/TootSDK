extension Instance {
    
    // posts

    public var maxPostChars: Int? {
        configuration?.posts?.maxCharacters
    }

    public var maxAttachments: Int? {
        configuration?.posts?.maxMediaAttachments
    }
    
    public var charsPerURL: Int? {
        configuration?.posts?.charactersReservedPerUrl
    }
    
    // accounts
    
    public var maxFeaturedTags: Int? {
        configuration?.accounts?.maxFeaturedTags
    }
    
    public var maxPins: Int? {
        configuration?.accounts?.maxPinnedStatuses
    }
    
    // polls
    
    public var maxPollOptions: Int? {
        configuration?.polls?.maxOptions
    }
    
    public var maxPollChars: Int? {
        configuration?.polls?.maxCharactersPerOption
    }
    
    public var minPollExpiration: Int? {
        configuration?.polls?.minExpiration
    }
    
    public var maxPollExpiration: Int? {
        configuration?.polls?.maxExpiration
    }
    
}
