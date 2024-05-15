import Foundation

extension InstanceV1: Instance {
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

}
