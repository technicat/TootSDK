extension Instance {

    // posts

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

    // configurable overrides platform default
    public var profileFieldsLimit: Int? {
        pleroma?.metadata.fieldsLimits.maxFields
    }
}
