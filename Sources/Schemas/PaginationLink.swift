import Foundation

public struct PaginationLink: Codable, Hashable, Sendable {
    public let url: Nullable<String>?
    public let label: String?
    public let active: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        url: Nullable<String>? = nil,
        label: String? = nil,
        active: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.url = url
        self.label = label
        self.active = active
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decodeNullableIfPresent(String.self, forKey: .url)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encodeIfPresent(self.active, forKey: .active)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case label
        case active
    }
}