

extension Account {

  public var defaultVisibility: Post.Visibility {
    source?.privacy ?? .public
  }

  public var defaultSensitive: Bool {
    source?.sensitive ?? false
  }

  public var defaultLanguage: ISOCode {
    guard let lang = source?.language else {
      return .en
    }
    return ISOCode(rawValue: lang) ?? .en
  }
}
