

extension TootClient {

  /// https://docs.joinmastodon.org/methods/accounts/#mute
  public func mute(
    _ account: Account,
    notifications: Bool = true,
    duration: Int = 0
  ) async throws -> Relationship {
    let params = MuteAccountParams(
      notifications: notifications,
      duration: duration)
    return try await muteAccount(by: account.id, params: params)
  }

  /// https://docs.joinmastodon.org/methods/accounts/#unmute
  public func unMute(_ account: Account) async throws -> Relationship {
    try await unmuteAccount(by: account.id)
  }
}
