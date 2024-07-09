import Foundation

extension TootClient {

    /// https://docs.joinmastodon.org/methods/accounts/#verify_credentials
    public func getAccount() async throws -> CredentialAccount {
        try await verifyCredentials()
    }

    /// https://docs.joinmastodon.org/methods/accounts/#update_credentials
    @discardableResult
    public func updateAccountSettings(
        locked: Bool? = nil,
        bot: Bool? = nil,
        discoverable: Bool? = nil,
        hideCollections: Bool? = nil,
        indexable: Bool? = nil,
        avatarText: String? = nil,
        headerText: String? = nil
    ) async throws -> CredentialAccount {
        let params = UpdateCredentialsParams(
            locked: locked,
            bot: bot,
            discoverable: discoverable,
            hideCollections: hideCollections,
            indexable: indexable,
            avatarDescription: avatarText,
            headerDescription: headerText)
        return try await updateCredentials(params: params)
    }

    /// check ApiV1Controller.php
    @discardableResult
    public func updatePixelfedAccountSettings(
        locked: Bool? = nil
    ) async throws -> CredentialAccount {
        let params = PixelfedUpdateCredentialsParams(
            locked: locked)
        return try await updateCredentials(params: params)
    }

    public func updatePostDefaults(
        privacy: PostVisibility? = nil,
        sensitive: Bool? = nil,
        language: ISOCode? = nil
    ) async throws -> CredentialAccount {
        let source = UpdateCredentialsParams.Source(
            privacy: privacy,
            sensitive: sensitive,
            language: language)
        let params = UpdateCredentialsParams(
            source: source)
        return try await updateCredentials(params: params)
    }

    @discardableResult
    public func updateProfile(
        displayName: String? = nil,
        note: String? = nil,
        avatar: Data? = nil,
        avatarMimeType: MIMEType? = nil,
        avatarText: String? = nil,
        header: Data? = nil,
        headerMimeType: MIMEType? = nil,
        headerText: String? = nil,
        fields: [UpdateCredentialsParams.Field]? = nil
    ) async throws -> CredentialAccount {
        let params = UpdateCredentialsParams(
            displayName: displayName,
            note: note,
            avatar: avatar,
            avatarMimeType: avatarMimeType,
            header: header,
            headerMimeType: headerMimeType,
            fieldsAttributes: fields,
            avatarDescription: avatarText,
            headerDescription: headerText
        )
        return try await updateCredentials(params: params)
    }

    @discardableResult
    public func updateProfilePixelfed(
        displayName: String? = nil,
        note: String? = nil,
        avatar: Data? = nil
    ) async throws -> CredentialAccount {
        let params = PixelfedUpdateCredentialsParams(
            displayName: displayName,
            note: note,
            avatar: avatar)
        return try await updateCredentials(params: params)
    }

    /// https://docs.joinmastodon.org/methods/profile/#delete-profile-avatar
    public func deleteAvatar() async throws -> CredentialAccount {
        try await deleteProfileAvatar()
    }

    /// https://docs.joinmastodon.org/methods/profile/#delete-profile-header
    public func deleteHeader() async throws -> CredentialAccount {
        try await deleteProfileHeader()
    }

}
