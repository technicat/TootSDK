extension CredentialAccount {

    public var defaultVisibility: PostVisibility {
        source?.privacy ?? .public
    }

    public var defaultSensitive: Bool {
        source?.sensitive ?? false
    }

    // should be optional?
    public var defaultLanguage: ISOCode {
        source?.language ?? .en
    }
}
