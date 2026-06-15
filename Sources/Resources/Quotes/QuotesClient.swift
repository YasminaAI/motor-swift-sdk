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

    public func listQuotes(requestOptions: RequestOptions? = nil) async throws -> GetQuoteRequestsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/quote-requests",
            requestOptions: requestOptions,
            responseType: GetQuoteRequestsResponse.self
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