extension InstanceV2: Instance {
    public var contactEmail: String? {
        contact.email
    }

    public var contactAccount: Account? {
        contact.account
    }

    public var registrationEnabled: Bool? {
        registrations.enabled
    }

    public var registrationApprovalRequired: Bool? {
        registrations.approvalRequired
    }

    public var header: String? {
        thumbnail?.url
    }

    public var streaming: String? {
        configuration?.urls?.streaming
    }

    public var backgroundImage: String? {
        pleroma?.backgroundImage
    }

    public var maxPostChars: Int? {
        configuration?.posts?.maxCharacters
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
