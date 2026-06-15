import Foundation

public struct PostQuoteRequestsRequestDriversItem: Codable, Hashable, Sendable {
    /// Driver's national ID. Must be 10 digits starting with 1, 2, or 7.
    public let ownerId: String
    /// Driver's birthdate in YYYY-MM-DD format.
    public let birthdate: CalendarDate
    /// Percentage of driving for this driver. Valid values are 25, 50, 75, or 100. The sum of all drivers' percentages must equal 100.
    public let drivingPercentage: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ownerId: String,
        birthdate: CalendarDate,
        drivingPercentage: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ownerId = ownerId
        self.birthdate = birthdate
        self.drivingPercentage = drivingPercentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ownerId = try container.decode(String.self, forKey: .ownerId)
        self.birthdate = try container.decode(CalendarDate.self, forKey: .birthdate)
        self.drivingPercentage = try container.decode(Int.self, forKey: .drivingPercentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.ownerId, forKey: .ownerId)
        try container.encode(self.birthdate, forKey: .birthdate)
        try container.encode(self.drivingPercentage, forKey: .drivingPercentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ownerId = "owner_id"
        case birthdate
        case drivingPercentage = "driving_percentage"
    }
}