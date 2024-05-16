extension Instance {

    public var hasApprovals: Bool {
        registrationApprovalRequired ?? false
    }

}
