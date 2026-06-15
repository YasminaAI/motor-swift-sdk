import Foundation

public struct QuotePrice: Codable, Hashable, Sendable {
    public let quotePriceId: String?
    public let deductible: Double?
    public let subtotal: Double?
    public let vatPercentage: Double?
    public let vat: Double?
    public let total: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        quotePriceId: String? = nil,
        deductible: Double? = nil,
        subtotal: Double? = nil,
        vatPercentage: Double? = nil,
        vat: Double? = nil,
        total: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.quotePriceId = quotePriceId
        self.deductible = deductible
        self.subtotal = subtotal
        self.vatPercentage = vatPercentage
        self.vat = vat
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.quotePriceId = try container.decodeIfPresent(String.self, forKey: .quotePriceId)
        self.deductible = try container.decodeIfPresent(Double.self, forKey: .deductible)
        self.subtotal = try container.decodeIfPresent(Double.self, forKey: .subtotal)
        self.vatPercentage = try container.decodeIfPresent(Double.self, forKey: .vatPercentage)
        self.vat = try container.decodeIfPresent(Double.self, forKey: .vat)
        self.total = try container.decodeIfPresent(Double.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.quotePriceId, forKey: .quotePriceId)
        try container.encodeIfPresent(self.deductible, forKey: .deductible)
        try container.encodeIfPresent(self.subtotal, forKey: .subtotal)
        try container.encodeIfPresent(self.vatPercentage, forKey: .vatPercentage)
        try container.encodeIfPresent(self.vat, forKey: .vat)
        try container.encodeIfPresent(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case quotePriceId = "quote_price_id"
        case deductible
        case subtotal
        case vatPercentage = "vat_percentage"
        case vat
        case total
    }
}