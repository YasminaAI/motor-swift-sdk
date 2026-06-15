import Foundation

public struct GetQuoteRequestsResponse: Codable, Hashable, Sendable {
    public let currentPage: Int?
    public let data: [QuoteResponse]?
    public let firstPageUrl: String?
    public let from: Nullable<Int>?
    public let lastPage: Int?
    public let lastPageUrl: String?
    public let links: [GetQuoteRequestsResponseLinksItem]?
    public let nextPageUrl: String?
    public let path: String?
    public let perPage: Int?
    public let prevPageUrl: String?
    public let to: Nullable<Int>?
    public let total: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currentPage: Int? = nil,
        data: [QuoteResponse]? = nil,
        firstPageUrl: String? = nil,
        from: Nullable<Int>? = nil,
        lastPage: Int? = nil,
        lastPageUrl: String? = nil,
        links: [GetQuoteRequestsResponseLinksItem]? = nil,
        nextPageUrl: String? = nil,
        path: String? = nil,
        perPage: Int? = nil,
        prevPageUrl: String? = nil,
        to: Nullable<Int>? = nil,
        total: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currentPage = currentPage
        self.data = data
        self.firstPageUrl = firstPageUrl
        self.from = from
        self.lastPage = lastPage
        self.lastPageUrl = lastPageUrl
        self.links = links
        self.nextPageUrl = nextPageUrl
        self.path = path
        self.perPage = perPage
        self.prevPageUrl = prevPageUrl
        self.to = to
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
        self.data = try container.decodeIfPresent([QuoteResponse].self, forKey: .data)
        self.firstPageUrl = try container.decodeIfPresent(String.self, forKey: .firstPageUrl)
        self.from = try container.decodeNullableIfPresent(Int.self, forKey: .from)
        self.lastPage = try container.decodeIfPresent(Int.self, forKey: .lastPage)
        self.lastPageUrl = try container.decodeIfPresent(String.self, forKey: .lastPageUrl)
        self.links = try container.decodeIfPresent([GetQuoteRequestsResponseLinksItem].self, forKey: .links)
        self.nextPageUrl = try container.decodeIfPresent(String.self, forKey: .nextPageUrl)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.perPage = try container.decodeIfPresent(Int.self, forKey: .perPage)
        self.prevPageUrl = try container.decodeIfPresent(String.self, forKey: .prevPageUrl)
        self.to = try container.decodeNullableIfPresent(Int.self, forKey: .to)
        self.total = try container.decodeIfPresent(Int.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.currentPage, forKey: .currentPage)
        try container.encodeIfPresent(self.data, forKey: .data)
        try container.encodeIfPresent(self.firstPageUrl, forKey: .firstPageUrl)
        try container.encodeNullableIfPresent(self.from, forKey: .from)
        try container.encodeIfPresent(self.lastPage, forKey: .lastPage)
        try container.encodeIfPresent(self.lastPageUrl, forKey: .lastPageUrl)
        try container.encodeIfPresent(self.links, forKey: .links)
        try container.encodeIfPresent(self.nextPageUrl, forKey: .nextPageUrl)
        try container.encodeIfPresent(self.path, forKey: .path)
        try container.encodeIfPresent(self.perPage, forKey: .perPage)
        try container.encodeIfPresent(self.prevPageUrl, forKey: .prevPageUrl)
        try container.encodeNullableIfPresent(self.to, forKey: .to)
        try container.encodeIfPresent(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currentPage = "current_page"
        case data
        case firstPageUrl = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageUrl = "last_page_url"
        case links
        case nextPageUrl = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageUrl = "prev_page_url"
        case to
        case total
    }
}