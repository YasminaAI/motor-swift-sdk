import Foundation

public struct Policy: Codable, Hashable, Sendable {
    public let id: Int?
    public let metaData: [String: JSONValue]?
    public let startDate: String?
    public let providerPolicyId: Int?
    public let providerPolicy: String?
    public let orderStatus: Int?
    public let approvalStatus: Int?
    public let endDate: String?
    public let isClaimed: Bool?
    public let createdAt: String?
    public let updatedAt: String?
    public let clientId: String?
    public let canceledAt: Nullable<String>?
    public let invoice: String?
    public let cancellationDocument: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: Int? = nil,
        metaData: [String: JSONValue]? = nil,
        startDate: String? = nil,
        providerPolicyId: Int? = nil,
        providerPolicy: String? = nil,
        orderStatus: Int? = nil,
        approvalStatus: Int? = nil,
        endDate: String? = nil,
        isClaimed: Bool? = nil,
        createdAt: String? = nil,
        updatedAt: String? = nil,
        clientId: String? = nil,
        canceledAt: Nullable<String>? = nil,
        invoice: String? = nil,
        cancellationDocument: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.metaData = metaData
        self.startDate = startDate
        self.providerPolicyId = providerPolicyId
        self.providerPolicy = providerPolicy
        self.orderStatus = orderStatus
        self.approvalStatus = approvalStatus
        self.endDate = endDate
        self.isClaimed = isClaimed
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.clientId = clientId
        self.canceledAt = canceledAt
        self.invoice = invoice
        self.cancellationDocument = cancellationDocument
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.metaData = try container.decodeIfPresent([String: JSONValue].self, forKey: .metaData)
        self.startDate = try container.decodeIfPresent(String.self, forKey: .startDate)
        self.providerPolicyId = try container.decodeIfPresent(Int.self, forKey: .providerPolicyId)
        self.providerPolicy = try container.decodeIfPresent(String.self, forKey: .providerPolicy)
        self.orderStatus = try container.decodeIfPresent(Int.self, forKey: .orderStatus)
        self.approvalStatus = try container.decodeIfPresent(Int.self, forKey: .approvalStatus)
        self.endDate = try container.decodeIfPresent(String.self, forKey: .endDate)
        self.isClaimed = try container.decodeIfPresent(Bool.self, forKey: .isClaimed)
        self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        self.updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        self.clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        self.canceledAt = try container.decodeNullableIfPresent(String.self, forKey: .canceledAt)
        self.invoice = try container.decodeIfPresent(String.self, forKey: .invoice)
        self.cancellationDocument = try container.decodeIfPresent(String.self, forKey: .cancellationDocument)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.metaData, forKey: .metaData)
        try container.encodeIfPresent(self.startDate, forKey: .startDate)
        try container.encodeIfPresent(self.providerPolicyId, forKey: .providerPolicyId)
        try container.encodeIfPresent(self.providerPolicy, forKey: .providerPolicy)
        try container.encodeIfPresent(self.orderStatus, forKey: .orderStatus)
        try container.encodeIfPresent(self.approvalStatus, forKey: .approvalStatus)
        try container.encodeIfPresent(self.endDate, forKey: .endDate)
        try container.encodeIfPresent(self.isClaimed, forKey: .isClaimed)
        try container.encodeIfPresent(self.createdAt, forKey: .createdAt)
        try container.encodeIfPresent(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.clientId, forKey: .clientId)
        try container.encodeNullableIfPresent(self.canceledAt, forKey: .canceledAt)
        try container.encodeIfPresent(self.invoice, forKey: .invoice)
        try container.encodeIfPresent(self.cancellationDocument, forKey: .cancellationDocument)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case metaData = "meta_data"
        case startDate = "start_date"
        case providerPolicyId = "provider_policy_id"
        case providerPolicy = "provider_policy"
        case orderStatus = "order_status"
        case approvalStatus = "approval_status"
        case endDate = "end_date"
        case isClaimed = "is_claimed"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case clientId = "client_id"
        case canceledAt = "canceled_at"
        case invoice
        case cancellationDocument = "cancellation_document"
    }
}