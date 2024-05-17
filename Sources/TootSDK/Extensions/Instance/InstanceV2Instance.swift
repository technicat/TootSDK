extension InstanceV2: Instance {
    public var registrationEnabled: Bool? {
        registrations?.enabled
    }

    public var registrationApprovalRequired: Bool? {
        registrations?.approvalRequired
    }

    public var header: String? {
        thumbnail?.url
    }

    public var streaming: String? {
        configuration?.urls?.streaming
    }

}
