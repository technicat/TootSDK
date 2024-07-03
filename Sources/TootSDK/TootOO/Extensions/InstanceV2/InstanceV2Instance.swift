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

    // post limits

    public var maxPostChars: Int? {
        configuration?.posts?.maxCharacters
    }

    public var maxAttachments: Int? {
        configuration?.posts?.maxMediaAttachments
    }

    // poll limits

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
    
    // media limits
    
    public var imageSizeLimit: Int? {
      configuration?.mediaAttachments?.imageSizeLimit
    }
    
    public var videoSizeLimit: Int? {
      configuration?.mediaAttachments?.imageSizeLimit
    }

}
