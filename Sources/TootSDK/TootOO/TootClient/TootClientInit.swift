import Foundation

public enum OAuthScope: String {
  case read
  case write
  case follow
  case adminRead = "admin:read"
    case adminWrite = "admin:write"
}

extension TootClient {

  /// for login
  convenience init(
    _ url: URL,
    client: String,
    scopes: [OAuthScope],
    log: Bool = false
  ) throws {
    self.init(
      clientName: client,
      instanceURL: url,
      scopes: scopes.map { $0.rawValue })
    self.debug = log
  }

  /// to resume session
  convenience init(
    _ url: URL,
    client: String,
    token: String
  ) throws {
    self.init(
      clientName: client,
      instanceURL: url,
      accessToken: token)
  }
}
