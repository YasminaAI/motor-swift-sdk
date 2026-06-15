import Foundation

public struct QuoteResponseQuotesItem: Codable, Hashable, Sendable {
    public let companyName: String?
    /// An array representing each price. This will have the premium and the deductible
    public let prices: [QuotePrice]?
    /// An array representing the different benefits offered by the company. Some of them are free and comes with the insurance, some are paid and optional
    public let benefits: [Benefit]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        companyName: String? = nil,
        prices: [QuotePrice]? = nil,
        benefits: [Benefit]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.companyName = companyName
        self.prices = prices
        self.benefits = benefits
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companyName = try container.decodeIfPresent(String.self, forKey: .companyName)
        self.prices = try container.decodeIfPresent([QuotePrice].self, forKey: .prices)
        self.benefits = try container.decodeIfPresent([Benefit].self, forKey: .benefits)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.companyName, forKey: .companyName)
        try container.encodeIfPresent(self.prices, forKey: .prices)
        try container.encodeIfPresent(self.benefits, forKey: .benefits)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case companyName = "company_name"
        case prices
        case benefits
    }
}