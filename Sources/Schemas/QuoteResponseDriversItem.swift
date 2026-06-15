import Foundation

public struct QuoteResponseDriversItem: Codable, Hashable, Sendable {
    /// Driver's national ID (10 digits starting with 1, 2, or 7)
    public let ownerId: String?
    /// Driver's birthdate in YYYY-MM-DD format
    public let birthdate: CalendarDate?
    /// Percentage of driving for this driver (25, 50, 75, or 100)
    public let drivingPercentage: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ownerId: String? = nil,
        birthdate: CalendarDate? = nil,
        drivingPercentage: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ownerId = ownerId
        self.birthdate = birthdate
        self.drivingPercentage = drivingPercentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ownerId = try container.decodeIfPresent(String.self, forKey: .ownerId)
        self.birthdate = try container.decodeIfPresent(CalendarDate.self, forKey: .birthdate)
        self.drivingPercentage = try container.decodeIfPresent(Int.self, forKey: .drivingPercentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ownerId, forKey: .ownerId)
        try container.encodeIfPresent(self.birthdate, forKey: .birthdate)
        try container.encodeIfPresent(self.drivingPercentage, forKey: .drivingPercentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ownerId = "owner_id"
        case birthdate
        case drivingPercentage = "driving_percentage"
    }
}