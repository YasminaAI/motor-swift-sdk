import Foundation

/// Returned only when include_aggregates is true.
public struct PolicyAggregates: Codable, Hashable, Sendable {
    public let totalCount: Int?
    public let totalPrice: Float?
    /// Monthly policy counts and sales totals keyed by YYYY-MM. For issued policies (`status=1`), buckets use `uploaded_at` and fall back to `created_at`.
    public let byMonth: [String: PolicyMonthAggregate]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        totalCount: Int? = nil,
        totalPrice: Float? = nil,
        byMonth: [String: PolicyMonthAggregate]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.totalCount = totalCount
        self.totalPrice = totalPrice
        self.byMonth = byMonth
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalCount = try container.decodeIfPresent(Int.self, forKey: .totalCount)
        self.totalPrice = try container.decodeIfPresent(Float.self, forKey: .totalPrice)
        self.byMonth = try container.decodeIfPresent([String: PolicyMonthAggregate].self, forKey: .byMonth)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.totalCount, forKey: .totalCount)
        try container.encodeIfPresent(self.totalPrice, forKey: .totalPrice)
        try container.encodeIfPresent(self.byMonth, forKey: .byMonth)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case totalCount = "total_count"
        case totalPrice = "total_price"
        case byMonth = "by_month"
    }
}