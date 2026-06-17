import Foundation

public final class PoliciesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Show a specific policy
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func showPolicy(carPolicy: String, requestOptions: RequestOptions? = nil) async throws -> Policy {
        return try await httpClient.performRequest(
            method: .get,
            path: "/policies/\(carPolicy)",
            requestOptions: requestOptions,
            responseType: Policy.self
        )
    }

    /// Listing requested policies
    ///
    /// - Parameter dateFrom: Inclusive lower bound for the policy date. For issued policies (`status=1`), this filters by `uploaded_at` (the provider policy issue timestamp) and falls back to `created_at` when `uploaded_at` is unavailable. For other statuses, this filters by `created_at`.
    /// - Parameter dateTo: Inclusive upper bound for the policy date. For issued policies (`status=1`), this filters by `uploaded_at` (the provider policy issue timestamp) and falls back to `created_at` when `uploaded_at` is unavailable. For other statuses, this filters by `created_at`.
    /// - Parameter includeAggregates: When true, includes policy totals, total price, and monthly buckets for the filtered result set.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listPolicies(quoteRequestId: Int? = nil, quotePriceId: String? = nil, providerPolicyId: Int? = nil, carSequenceNumber: String? = nil, newOwnerId: String? = nil, previousOwnerId: String? = nil, status: Int? = nil, minPrice: Double? = nil, maxPrice: Double? = nil, perPage: Int? = nil, dateFrom: CalendarDate? = nil, dateTo: CalendarDate? = nil, includeAggregates: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> PaginatedPolicyResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/policies",
            queryParams: [
                "quote_request_id": quoteRequestId.map { .int($0) }, 
                "quote_price_id": quotePriceId.map { .string($0) }, 
                "provider_policy_id": providerPolicyId.map { .int($0) }, 
                "car_sequence_number": carSequenceNumber.map { .string($0) }, 
                "new_owner_id": newOwnerId.map { .string($0) }, 
                "previous_owner_id": previousOwnerId.map { .string($0) }, 
                "status": status.map { .int($0) }, 
                "min_price": minPrice.map { .double($0) }, 
                "max_price": maxPrice.map { .double($0) }, 
                "per_page": perPage.map { .int($0) }, 
                "date_from": dateFrom.map { .calendarDate($0) }, 
                "date_to": dateTo.map { .calendarDate($0) }, 
                "include_aggregates": includeAggregates.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: PaginatedPolicyResponse.self
        )
    }

    /// For issuing a new policy
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func issuePolicy(request: Requests.PostPoliciesRequest, requestOptions: RequestOptions? = nil) async throws -> Policy {
        return try await httpClient.performRequest(
            method: .post,
            path: "/policies",
            body: request,
            requestOptions: requestOptions,
            responseType: Policy.self
        )
    }
}