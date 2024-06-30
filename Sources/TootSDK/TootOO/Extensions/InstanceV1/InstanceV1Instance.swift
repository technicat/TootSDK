import Foundation

extension InstanceV1: Instance {

    public var contactEmail: String? {
        email
    }

    public var registrationEnabled: Bool? {
        registrations
    }

    public var registrationApprovalRequired: Bool? {
        approvalRequired
    }

    public var domain: String {
        // some platforms (Friendica) return whole URL
        // maybe just remove https:// with hasPrefix, dropFirsts
        // could also check for pleroma, akkoma, firefish...
        let url = URL(string: uri)
        return url?.host ?? uri
    }

    public var header: String? {
        thumbnail
    }

    public var streaming: String? {
        urls?.streamingApi
    }
    
    // post limits

    public var maxPostChars: Int? {
        configuration?.posts?.maxCharacters ?? maxTootChars
    }
    
    public var maxAttachments: Int? {
        configuration?.posts?.maxMediaAttachments ?? maxMediaAttachments
    }
    
    // poll limits

    public var maxPollOptions: Int? {
        configuration?.polls?.maxOptions ?? 
        pollLimits?.maxOptions
    }

    public var maxPollChars: Int? {
        configuration?.polls?.maxCharactersPerOption ?? 
        pollLimits?.maxOptionChars
    }

    public var minPollExpiration: Int? {
        configuration?.polls?.minExpiration ??
        pollLimits?.minExpiration
    }

    public var maxPollExpiration: Int? {
        configuration?.polls?.maxExpiration ??
        pollLimits?.maxExpiration
    }


}
