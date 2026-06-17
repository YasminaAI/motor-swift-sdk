import Foundation

extension Requests {
    public struct PostQuoteRequestsRequest: Codable, Hashable, Sendable {
        /// The OTP received by the customer from the Request OTP API
        public let otp: String
        /// Owner ID must be 10 digits starting with 1, 2, or 7
        public let ownerId: String
        /// Email address must be valid and belongs to the customer
        public let email: String?
        /// Phone number must start with 05 and be 10 digits
        public let phone: String
        /// Birthdate in YYYY-MM-DD format
        public let birthdate: CalendarDate
        /// Car sequence number must be 8 or 9 digits
        public let carSequenceNumber: String?
        /// Custom car number between 1000000 and 9999999999 (for newly imported cars)
        public let customNumber: String?
        /// Indicates if the ownership is being transferred
        public let isOwnershipTransfer: Bool?
        /// Required if is_ownership_transfer is true; 10 digits starting with 1,2,7
        public let currentCarOwnerId: String?
        /// Estimated cost of the car
        public let carEstimatedCost: Double
        /// Car model year between 1950 and next year
        public let carModelYear: Int?
        /// Desired policy start date in YYYY-MM-DD. Must be between tomorrow and 28 days from today (inclusive). The platform validates this range server-side.
        public let startDate: CalendarDate?
        /// List of drivers for the vehicle. When provided, the sum of all driving_percentage values must equal 100, and the owner must be included among the drivers.
        public let drivers: [PostQuoteRequestsRequestDriversItem]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            otp: String,
            ownerId: String,
            email: String? = nil,
            phone: String,
            birthdate: CalendarDate,
            carSequenceNumber: String? = nil,
            customNumber: String? = nil,
            isOwnershipTransfer: Bool? = nil,
            currentCarOwnerId: String? = nil,
            carEstimatedCost: Double,
            carModelYear: Int? = nil,
            startDate: CalendarDate? = nil,
            drivers: [PostQuoteRequestsRequestDriversItem]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.otp = otp
            self.ownerId = ownerId
            self.email = email
            self.phone = phone
            self.birthdate = birthdate
            self.carSequenceNumber = carSequenceNumber
            self.customNumber = customNumber
            self.isOwnershipTransfer = isOwnershipTransfer
            self.currentCarOwnerId = currentCarOwnerId
            self.carEstimatedCost = carEstimatedCost
            self.carModelYear = carModelYear
            self.startDate = startDate
            self.drivers = drivers
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.otp = try container.decode(String.self, forKey: .otp)
            self.ownerId = try container.decode(String.self, forKey: .ownerId)
            self.email = try container.decodeIfPresent(String.self, forKey: .email)
            self.phone = try container.decode(String.self, forKey: .phone)
            self.birthdate = try container.decode(CalendarDate.self, forKey: .birthdate)
            self.carSequenceNumber = try container.decodeIfPresent(String.self, forKey: .carSequenceNumber)
            self.customNumber = try container.decodeIfPresent(String.self, forKey: .customNumber)
            self.isOwnershipTransfer = try container.decodeIfPresent(Bool.self, forKey: .isOwnershipTransfer)
            self.currentCarOwnerId = try container.decodeIfPresent(String.self, forKey: .currentCarOwnerId)
            self.carEstimatedCost = try container.decode(Double.self, forKey: .carEstimatedCost)
            self.carModelYear = try container.decodeIfPresent(Int.self, forKey: .carModelYear)
            self.startDate = try container.decodeIfPresent(CalendarDate.self, forKey: .startDate)
            self.drivers = try container.decodeIfPresent([PostQuoteRequestsRequestDriversItem].self, forKey: .drivers)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.otp, forKey: .otp)
            try container.encode(self.ownerId, forKey: .ownerId)
            try container.encodeIfPresent(self.email, forKey: .email)
            try container.encode(self.phone, forKey: .phone)
            try container.encode(self.birthdate, forKey: .birthdate)
            try container.encodeIfPresent(self.carSequenceNumber, forKey: .carSequenceNumber)
            try container.encodeIfPresent(self.customNumber, forKey: .customNumber)
            try container.encodeIfPresent(self.isOwnershipTransfer, forKey: .isOwnershipTransfer)
            try container.encodeIfPresent(self.currentCarOwnerId, forKey: .currentCarOwnerId)
            try container.encode(self.carEstimatedCost, forKey: .carEstimatedCost)
            try container.encodeIfPresent(self.carModelYear, forKey: .carModelYear)
            try container.encodeIfPresent(self.startDate, forKey: .startDate)
            try container.encodeIfPresent(self.drivers, forKey: .drivers)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case otp
            case ownerId = "owner_id"
            case email
            case phone
            case birthdate
            case carSequenceNumber = "car_sequence_number"
            case customNumber = "custom_number"
            case isOwnershipTransfer = "is_ownership_transfer"
            case currentCarOwnerId = "current_car_owner_id"
            case carEstimatedCost = "car_estimated_cost"
            case carModelYear = "car_model_year"
            case startDate = "start_date"
            case drivers
        }
    }
}