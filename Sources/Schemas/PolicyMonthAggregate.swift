import Foundation

public struct PolicyMonthAggregate: Codable, Hashable, Sendable {
    public let count: Int?
    public let totalPrice: Float?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        count: Int? = nil,
        totalPrice: Float? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.count = count
        self.totalPrice = totalPrice
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decodeIfPresent(Int.self, forKey: .count)
        self.totalPrice = try container.decodeIfPresent(Float.self, forKey: .totalPrice)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.count, forKey: .count)
        try container.encodeIfPresent(self.totalPrice, forKey: .totalPrice)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case count
        case totalPrice = "total_price"
    }
}