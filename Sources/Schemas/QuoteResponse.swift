import Foundation

public struct QuoteResponse: Codable, Hashable, Sendable {
    /// The owner’s national ID or Iqama ID
    public let ownerId: Int?
    /// The owner's phone number
    public let phone: String?
    /// The owner's birthdate. Hijri for Saudi nationals, Gregorian for others
    public let birthdate: CalendarDate?
    /// The car sequence number from 9 digits
    public let carSequenceNumber: Int?
    /// Custom car number for newly imported cars (present when `custom_number` was used in the request)
    public let customNumber: String?
    /// Whether it was a car transfer or not
    public let isOwnershipTransfer: Bool?
    /// The estimated cost of the car
    public let carEstimatedCost: Double?
    /// The car model year
    public let carModelYear: Int?
    /// Requested policy start date in YYYY-MM-DD. Returned if provided in the quote request.
    public let startDate: CalendarDate?
    /// List of drivers associated with this quote request. Returned if drivers were provided in the request.
    public let drivers: [QuoteResponseDriversItem]?
    /// An array representing each insurance company quote. Each item has the company name, the prices, and the benefits.
    public let quotes: [QuoteResponseQuotesItem]?
    /// Your own client ID
    public let clientId: String?
    /// In case of an update on this quote, this date will change
    public let updatedAt: Date?
    /// When was the quote requested
    public let createdAt: Date?
    /// Yasmina ID for the quote. You can use it to delete items or showing it again to the customer
    public let id: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ownerId: Int? = nil,
        phone: String? = nil,
        birthdate: CalendarDate? = nil,
        carSequenceNumber: Int? = nil,
        customNumber: String? = nil,
        isOwnershipTransfer: Bool? = nil,
        carEstimatedCost: Double? = nil,
        carModelYear: Int? = nil,
        startDate: CalendarDate? = nil,
        drivers: [QuoteResponseDriversItem]? = nil,
        quotes: [QuoteResponseQuotesItem]? = nil,
        clientId: String? = nil,
        updatedAt: Date? = nil,
        createdAt: Date? = nil,
        id: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ownerId = ownerId
        self.phone = phone
        self.birthdate = birthdate
        self.carSequenceNumber = carSequenceNumber
        self.customNumber = customNumber
        self.isOwnershipTransfer = isOwnershipTransfer
        self.carEstimatedCost = carEstimatedCost
        self.carModelYear = carModelYear
        self.startDate = startDate
        self.drivers = drivers
        self.quotes = quotes
        self.clientId = clientId
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ownerId = try container.decodeIfPresent(Int.self, forKey: .ownerId)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.birthdate = try container.decodeIfPresent(CalendarDate.self, forKey: .birthdate)
        self.carSequenceNumber = try container.decodeIfPresent(Int.self, forKey: .carSequenceNumber)
        self.customNumber = try container.decodeIfPresent(String.self, forKey: .customNumber)
        self.isOwnershipTransfer = try container.decodeIfPresent(Bool.self, forKey: .isOwnershipTransfer)
        self.carEstimatedCost = try container.decodeIfPresent(Double.self, forKey: .carEstimatedCost)
        self.carModelYear = try container.decodeIfPresent(Int.self, forKey: .carModelYear)
        self.startDate = try container.decodeIfPresent(CalendarDate.self, forKey: .startDate)
        self.drivers = try container.decodeIfPresent([QuoteResponseDriversItem].self, forKey: .drivers)
        self.quotes = try container.decodeIfPresent([QuoteResponseQuotesItem].self, forKey: .quotes)
        self.clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        self.updatedAt = try container.decodeIfPresent(Date.self, forKey: .updatedAt)
        self.createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ownerId, forKey: .ownerId)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.birthdate, forKey: .birthdate)
        try container.encodeIfPresent(self.carSequenceNumber, forKey: .carSequenceNumber)
        try container.encodeIfPresent(self.customNumber, forKey: .customNumber)
        try container.encodeIfPresent(self.isOwnershipTransfer, forKey: .isOwnershipTransfer)
        try container.encodeIfPresent(self.carEstimatedCost, forKey: .carEstimatedCost)
        try container.encodeIfPresent(self.carModelYear, forKey: .carModelYear)
        try container.encodeIfPresent(self.startDate, forKey: .startDate)
        try container.encodeIfPresent(self.drivers, forKey: .drivers)
        try container.encodeIfPresent(self.quotes, forKey: .quotes)
        try container.encodeIfPresent(self.clientId, forKey: .clientId)
        try container.encodeIfPresent(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.createdAt, forKey: .createdAt)
        try container.encodeIfPresent(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ownerId = "owner_id"
        case phone
        case birthdate
        case carSequenceNumber = "car_sequence_number"
        case customNumber = "custom_number"
        case isOwnershipTransfer = "is_ownership_transfer"
        case carEstimatedCost = "car_estimated_cost"
        case carModelYear = "car_model_year"
        case startDate = "start_date"
        case drivers
        case quotes
        case clientId = "client_id"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
}