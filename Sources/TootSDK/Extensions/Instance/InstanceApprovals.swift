extension InstanceV1 {

    public var hasApprovals: Bool {
        approvalRequired ?? false
    }

}
