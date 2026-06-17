import Foundation

public final class QuotesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func showQuote(id: String, requestOptions: RequestOptions? = nil) async throws -> QuoteResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/quote-requests/\(id)",
            requestOptions: requestOptions,
            responseType: QuoteResponse.self
        )
    }

    public func deleteQuote(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteQuoteRequestsIdResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/quote-requests/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteQuoteRequestsIdResponse.self
        )
    }

    public func listQuotes(dateFrom: CalendarDate? = nil, dateTo: CalendarDate? = nil, perPage: Int? = nil, includeAggregates: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> PaginatedQuoteResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/quote-requests",
            queryParams: [
                "date_from": dateFrom.map { .calendarDate($0) }, 
                "date_to": dateTo.map { .calendarDate($0) }, 
                "per_page": perPage.map { .int($0) }, 
                "include_aggregates": includeAggregates.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: PaginatedQuoteResponse.self
        )
    }

    /// For getting prices with benefits. 
    /// The Quote IDs can be used later to issue a policy
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func requestQuotes(request: Requests.PostQuoteRequestsRequest, requestOptions: RequestOptions? = nil) async throws -> QuoteResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/quote-requests",
            body: request,
            requestOptions: requestOptions,
            responseType: QuoteResponse.self
        )
    }
}