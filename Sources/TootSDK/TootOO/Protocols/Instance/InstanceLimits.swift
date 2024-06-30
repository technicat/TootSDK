extension Instance {

    // posts

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

    public var profileFieldsLimit: Int? {
        pleroma?.metadata.fieldsLimits.maxFields
    }
}
