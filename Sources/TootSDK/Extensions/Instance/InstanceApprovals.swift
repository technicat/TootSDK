extension Instance {

    public var hasApprovals: Bool {
        approvalRequired ?? false
    }

}
