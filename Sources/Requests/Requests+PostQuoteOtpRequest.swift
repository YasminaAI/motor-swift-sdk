import Foundation

extension Requests {
    public struct PostQuoteOtpRequest: Codable, Hashable, Sendable {
        /// Email address of the car owner
        public let email: String
        /// Phone number starting with 05 and containing 10 digits
        public let phone: String
        /// National ID or Iqama ID of the car owner (10 digits)
        public let ownerId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            email: String,
            phone: String,
            ownerId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.email = email
            self.phone = phone
            self.ownerId = ownerId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.email = try container.decode(String.self, forKey: .email)
            self.phone = try container.decode(String.self, forKey: .phone)
            self.ownerId = try container.decode(String.self, forKey: .ownerId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.email, forKey: .email)
            try container.encode(self.phone, forKey: .phone)
            try container.encode(self.ownerId, forKey: .ownerId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case email
            case phone
            case ownerId = "owner_id"
        }
    }
}