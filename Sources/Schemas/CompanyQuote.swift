import Foundation

public struct CompanyQuote: Codable, Hashable, Sendable {
    public let companyName: String?
    /// Arabic name of the insurance company. Use this field instead of `company_name` when rendering Arabic UIs.
    public let companyNameAr: String?
    /// Normalised insurance category used to group and filter quotes. Always one of `TPL`, `TPL +`, or `Comprehensive`.
    public let type: CompanyQuoteType?
    /// The insurance type label exactly as the insurance provider intends it to be displayed. While `type` normalises all non-TPL / non-Comprehensive values into `TPL +`, this field preserves the original provider string (e.g. "TPL Plus", "Third Party Plus") and should be shown in the UI wherever the provider's own wording is preferred.
    public let insuranceTypeDisplay: String?
    /// Arabic translation of `insurance_type_display`. Use this field for Arabic UIs. Falls back to the English value for provider-specific types that do not have a translation.
    public let insuranceTypeDisplayAr: String?
    /// CDN URL for the insurance company's logo.
    public let companyLogoUrl: String?
    /// CDN URL for the insurance company's square logo.
    public let squareCompanyLogoUrl: String?
    public let prices: [QuotePrice]?
    public let benefits: [Benefit]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        companyName: String? = nil,
        companyNameAr: String? = nil,
        type: CompanyQuoteType? = nil,
        insuranceTypeDisplay: String? = nil,
        insuranceTypeDisplayAr: String? = nil,
        companyLogoUrl: String? = nil,
        squareCompanyLogoUrl: String? = nil,
        prices: [QuotePrice]? = nil,
        benefits: [Benefit]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.companyName = companyName
        self.companyNameAr = companyNameAr
        self.type = type
        self.insuranceTypeDisplay = insuranceTypeDisplay
        self.insuranceTypeDisplayAr = insuranceTypeDisplayAr
        self.companyLogoUrl = companyLogoUrl
        self.squareCompanyLogoUrl = squareCompanyLogoUrl
        self.prices = prices
        self.benefits = benefits
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companyName = try container.decodeIfPresent(String.self, forKey: .companyName)
        self.companyNameAr = try container.decodeIfPresent(String.self, forKey: .companyNameAr)
        self.type = try container.decodeIfPresent(CompanyQuoteType.self, forKey: .type)
        self.insuranceTypeDisplay = try container.decodeIfPresent(String.self, forKey: .insuranceTypeDisplay)
        self.insuranceTypeDisplayAr = try container.decodeIfPresent(String.self, forKey: .insuranceTypeDisplayAr)
        self.companyLogoUrl = try container.decodeIfPresent(String.self, forKey: .companyLogoUrl)
        self.squareCompanyLogoUrl = try container.decodeIfPresent(String.self, forKey: .squareCompanyLogoUrl)
        self.prices = try container.decodeIfPresent([QuotePrice].self, forKey: .prices)
        self.benefits = try container.decodeIfPresent([Benefit].self, forKey: .benefits)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.companyName, forKey: .companyName)
        try container.encodeIfPresent(self.companyNameAr, forKey: .companyNameAr)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.insuranceTypeDisplay, forKey: .insuranceTypeDisplay)
        try container.encodeIfPresent(self.insuranceTypeDisplayAr, forKey: .insuranceTypeDisplayAr)
        try container.encodeIfPresent(self.companyLogoUrl, forKey: .companyLogoUrl)
        try container.encodeIfPresent(self.squareCompanyLogoUrl, forKey: .squareCompanyLogoUrl)
        try container.encodeIfPresent(self.prices, forKey: .prices)
        try container.encodeIfPresent(self.benefits, forKey: .benefits)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case companyName = "company_name"
        case companyNameAr = "company_name_ar"
        case type
        case insuranceTypeDisplay = "insurance_type_display"
        case insuranceTypeDisplayAr = "insurance_type_display_ar"
        case companyLogoUrl = "company_logo_url"
        case squareCompanyLogoUrl = "square_company_logo_url"
        case prices
        case benefits
    }
}