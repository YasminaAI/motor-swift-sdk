import Foundation

extension Requests {
    public struct PostIssueOtpRequest: Codable, Hashable, Sendable {
        /// Email address of the car owner
        public let email: String
        /// Phone number starting with 05 and containing 10 digits
        public let phone: String
        /// National ID or Iqama ID of the car owner (10 digits)
        public let ownerId: String
        /// ID of the car quote request
        public let quoteRequestId: Int
        /// Unique identifier for the quote reference ID (coming from POST /quote-requests)
        public let quoteReferenceId: String
        /// Unique identifier for the quote price ID that exists inside a quote item (coming from POST /quote-requests)
        public let quotePriceId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            email: String,
            phone: String,
            ownerId: String,
            quoteRequestId: Int,
            quoteReferenceId: String,
            quotePriceId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.email = email
            self.phone = phone
            self.ownerId = ownerId
            self.quoteRequestId = quoteRequestId
            self.quoteReferenceId = quoteReferenceId
            self.quotePriceId = quotePriceId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.email = try container.decode(String.self, forKey: .email)
            self.phone = try container.decode(String.self, forKey: .phone)
            self.ownerId = try container.decode(String.self, forKey: .ownerId)
            self.quoteRequestId = try container.decode(Int.self, forKey: .quoteRequestId)
            self.quoteReferenceId = try container.decode(String.self, forKey: .quoteReferenceId)
            self.quotePriceId = try container.decode(String.self, forKey: .quotePriceId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.email, forKey: .email)
            try container.encode(self.phone, forKey: .phone)
            try container.encode(self.ownerId, forKey: .ownerId)
            try container.encode(self.quoteRequestId, forKey: .quoteRequestId)
            try container.encode(self.quoteReferenceId, forKey: .quoteReferenceId)
            try container.encode(self.quotePriceId, forKey: .quotePriceId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case email
            case phone
            case ownerId = "owner_id"
            case quoteRequestId = "quote_request_id"
            case quoteReferenceId = "quote_reference_id"
            case quotePriceId = "quote_price_id"
        }
    }
}