extension CredentialAccount {

    public var hasRole: Bool {
        role != nil
    }

    public var highlightedRole: TootRole? {
        guard let role else {
            return nil
        }
        guard role.highlighted else {
            return nil
        }
        return role
    }

}
