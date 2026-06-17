import Foundation

/// Returned only when include_aggregates is true.
public struct QuoteRequestAggregates: Codable, Hashable, Sendable {
    public let totalCount: Int?
    /// Monthly quote request counts keyed by YYYY-MM.
    public let byMonth: [String: Int]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        totalCount: Int? = nil,
        byMonth: [String: Int]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.totalCount = totalCount
        self.byMonth = byMonth
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalCount = try container.decodeIfPresent(Int.self, forKey: .totalCount)
        self.byMonth = try container.decodeIfPresent([String: Int].self, forKey: .byMonth)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.totalCount, forKey: .totalCount)
        try container.encodeIfPresent(self.byMonth, forKey: .byMonth)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case totalCount = "total_count"
        case byMonth = "by_month"
    }
}