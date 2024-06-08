import Foundation

extension TootClient {

    /// https://docs.joinmastodon.org/methods/accounts/#verify_credentials
    public func getAccount() async throws -> Account {
        try await verifyCredentials()
    }

    /// https://docs.joinmastodon.org/methods/accounts/#update_credentials
    @discardableResult
    public func updateAccountSettings(
        locked: Bool? = nil,
        bot: Bool? = nil,
        discoverable: Bool? = nil,
        hideCollections: Bool? = nil,
        indexable: Bool? = nil
    ) async throws -> Account {
        let params = UpdateCredentialsParams(
            locked: locked,
            bot: bot,
            discoverable: discoverable,
            hideCollections: hideCollections,
            indexable: indexable)
        return try await updateCredentials(params: params)
    }

    /// check ApiV1Controller.php
    @discardableResult
    public func updatePixelfedAccountSettings(
        locked: Bool? = nil
    ) async throws -> Account {
        let params = UpdateCredentialsParamsPixelfed(
            locked: locked)
        return try await updateCredentials(params: params)
    }

    public func updatePostDefaults(
        privacy: PostVisibility? = nil,
        sensitive: Bool? = nil,
        language: ISOCode? = nil
    ) async throws -> Account {
        let source = UpdateCredentialsParams.Source(
            privacy: privacy,
            sensitive: sensitive,
            language: language?.rawValue)
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
        header: Data? = nil,
        headerMimeType: MIMEType? = nil,
        fields: [String: UpdateCredentialsParams.Field]? = nil
    ) async throws -> Account {
        let params = UpdateCredentialsParams(
            displayName: displayName,
            note: note,
            avatar: avatar,
            avatarMimeType: avatarMimeType?.rawValue,
            header: header,
            headerMimeType: headerMimeType?.rawValue,
            fieldsAttributes: fields)
        return try await updateCredentials(params: params)
    }

    @discardableResult
    public func updateProfilePixelfed(
        displayName: String? = nil,
        note: String? = nil,
        avatar: Data? = nil
    ) async throws -> Account {
        let params = UpdateCredentialsParamsPixelfed(
            displayName: displayName,
            note: note,
            avatar: avatar)
        return try await updateCredentials(params: params)
    }

    /// https://docs.joinmastodon.org/methods/profile/#delete-profile-avatar
    public func deleteAvatar() async throws -> Account {
        try await deleteProfileAvatar()
    }

    /// https://docs.joinmastodon.org/methods/profile/#delete-profile-header
    public func deleteHeader() async throws -> Account {
        try await deleteProfileHeader()
    }

}