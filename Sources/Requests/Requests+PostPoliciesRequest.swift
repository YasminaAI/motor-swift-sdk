import Foundation

extension Requests {
    public struct PostPoliciesRequest: Codable, Hashable, Sendable {
        /// ID of the car quote request
        public let quoteRequestId: Int
        /// Unique identifier for the quote reference ID (coming from POST /quote-requests)
        public let quoteReferenceId: String
        /// Unique identifier for the quote price ID that exists inside a quote item (coming from POST /quote-requests)
        public let quotePriceId: String
        /// List of benefit UUIDs
        public let benefits: [String]?
        /// Optional free-form object with additional fields. Total JSON-encoded size must not exceed 255 characters.
        public let extraFields: [String: JSONValue]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            quoteRequestId: Int,
            quoteReferenceId: String,
            quotePriceId: String,
            benefits: [String]? = nil,
            extraFields: [String: JSONValue]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.quoteRequestId = quoteRequestId
            self.quoteReferenceId = quoteReferenceId
            self.quotePriceId = quotePriceId
            self.benefits = benefits
            self.extraFields = extraFields
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.quoteRequestId = try container.decode(Int.self, forKey: .quoteRequestId)
            self.quoteReferenceId = try container.decode(String.self, forKey: .quoteReferenceId)
            self.quotePriceId = try container.decode(String.self, forKey: .quotePriceId)
            self.benefits = try container.decodeIfPresent([String].self, forKey: .benefits)
            self.extraFields = try container.decodeIfPresent([String: JSONValue].self, forKey: .extraFields)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.quoteRequestId, forKey: .quoteRequestId)
            try container.encode(self.quoteReferenceId, forKey: .quoteReferenceId)
            try container.encode(self.quotePriceId, forKey: .quotePriceId)
            try container.encodeIfPresent(self.benefits, forKey: .benefits)
            try container.encodeIfPresent(self.extraFields, forKey: .extraFields)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case quoteRequestId = "quote_request_id"
            case quoteReferenceId = "quote_reference_id"
            case quotePriceId = "quote_price_id"
            case benefits
            case extraFields = "extra_fields"
        }
    }
}