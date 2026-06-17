import Foundation

public struct Benefit: Codable, Hashable, Sendable {
    public let quoteBenefitId: String?
    public let id: String?
    public let name: String?
    /// Arabic name of the benefit. Use this field instead of `name` when rendering Arabic UIs.
    public let nameAr: String?
    public let amount: Double?
    public let vat: Double?
    public let url: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        quoteBenefitId: String? = nil,
        id: String? = nil,
        name: String? = nil,
        nameAr: String? = nil,
        amount: Double? = nil,
        vat: Double? = nil,
        url: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.quoteBenefitId = quoteBenefitId
        self.id = id
        self.name = name
        self.nameAr = nameAr
        self.amount = amount
        self.vat = vat
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.quoteBenefitId = try container.decodeIfPresent(String.self, forKey: .quoteBenefitId)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.nameAr = try container.decodeIfPresent(String.self, forKey: .nameAr)
        self.amount = try container.decodeIfPresent(Double.self, forKey: .amount)
        self.vat = try container.decodeIfPresent(Double.self, forKey: .vat)
        self.url = try container.decodeNullableIfPresent(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.quoteBenefitId, forKey: .quoteBenefitId)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.nameAr, forKey: .nameAr)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.vat, forKey: .vat)
        try container.encodeNullableIfPresent(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case quoteBenefitId = "quote_benefit_id"
        case id
        case name
        case nameAr = "name_ar"
        case amount
        case vat
        case url
    }
}