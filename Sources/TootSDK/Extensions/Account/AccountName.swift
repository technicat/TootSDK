extension Account {

    public var name: String {
        displayName ?? userName
    }

    public var userName: String {
        username ?? ""
    }
}

extension Account: Accted {
}

