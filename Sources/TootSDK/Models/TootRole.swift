import Foundation

/// The role assigned to the currently authorized user.
/// Added to Mastodon API version 4.0.0
/// https://docs.joinmastodon.org/entities/Role/
public struct TootRole: Codable, Hashable, Sendable {
    public init(
        id: String, name: String, color: String?, permissions: String, highlighted: Bool?
    ) {
        self.id = id
        self.name = name
        self.color = color
        self.permissions = permissions
        self.highlighted = highlighted
    }

    /// The ID of the Role in the database.
    public var id: String
    /// The name of the role.
    public var name: String
    /// The hex code assigned to this role. If no hex code is assigned, the string will be empty.
    /// Spec says not optional but not present in Mitra
    public var color: String?
    /// A bitmask that represents the sum of all permissions granted to the role.
    public var permissions: String
    /// Whether the role is publicly visible as a badge on user profiles.
    public var highlighted: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case color
        case permissions
        case highlighted
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // spec says these are strings
        // but Mitra return int
        self.id = try container.decodeStringFromInt(forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        // mitra returns an array
        self.permissions = (try? container.decode(String.self, forKey: .permissions)) ?? ""
        self.highlighted = try container.decodeIfPresent(Bool.self, forKey: .highlighted)
    }
}
