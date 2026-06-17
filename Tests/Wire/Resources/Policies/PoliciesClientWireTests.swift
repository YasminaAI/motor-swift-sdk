import Foundation
import Testing
import Api

@Suite("PoliciesClient Wire Tests") struct PoliciesClientWireTests {
    @Test func showPolicy1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Data(
                #"""
                {
                  "id": 1,
                  "meta_data": {
                    "key": "value"
                  },
                  "start_date": "start_date",
                  "provider_policy_id": 1,
                  "provider_policy": "provider_policy",
                  "order_status": 1,
                  "approval_status": 1,
                  "end_date": "end_date",
                  "is_claimed": true,
                  "created_at": "created_at",
                  "uploaded_at": "2024-01-15T09:30:00Z",
                  "updated_at": "updated_at",
                  "client_id": "client_id",
                  "canceled_at": "canceled_at",
                  "invoice": "invoice",
                  "cancellation_document": "cancellation_document"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Policy(
            id: Optional(1),
            metaData: Optional([
                "key": JSONValue.string("value")
            ]),
            startDate: Optional("start_date"),
            providerPolicyId: Optional(1),
            providerPolicy: Optional("provider_policy"),
            orderStatus: Optional(1),
            approvalStatus: Optional(1),
            endDate: Optional("end_date"),
            isClaimed: Optional(true),
            createdAt: Optional("created_at"),
            uploadedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
            updatedAt: Optional("updated_at"),
            clientId: Optional("client_id"),
            canceledAt: Optional(Nullable<String>.value("canceled_at")),
            invoice: Optional("invoice"),
            cancellationDocument: Optional("cancellation_document")
        )
        let response = try await client.policies.showPolicy(
            carPolicy: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listPolicies1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Data(
                #"""
                {
                  "current_page": 1,
                  "data": [
                    {
                      "id": 1,
                      "meta_data": {
                        "key": "value"
                      },
                      "start_date": "start_date",
                      "provider_policy_id": 1,
                      "provider_policy": "provider_policy",
                      "order_status": 1,
                      "approval_status": 1,
                      "end_date": "end_date",
                      "is_claimed": true,
                      "created_at": "created_at",
                      "uploaded_at": "2024-01-15T09:30:00Z",
                      "updated_at": "updated_at",
                      "client_id": "client_id",
                      "canceled_at": "canceled_at",
                      "invoice": "invoice",
                      "cancellation_document": "cancellation_document"
                    }
                  ],
                  "first_page_url": "first_page_url",
                  "from": 1,
                  "last_page": 1,
                  "last_page_url": "last_page_url",
                  "links": [
                    {
                      "url": "url",
                      "label": "label",
                      "active": true
                    }
                  ],
                  "next_page_url": "next_page_url",
                  "path": "path",
                  "per_page": 1,
                  "prev_page_url": "prev_page_url",
                  "to": 1,
                  "total": 1,
                  "aggregates": {
                    "total_count": 12,
                    "total_price": 42850.75,
                    "by_month": {
                      "2026-06": {
                        "count": 12,
                        "total_price": 42850.75
                      }
                    }
                  }
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaginatedPolicyResponse(
            currentPage: Optional(1),
            data: Optional([
                Policy(
                    id: Optional(1),
                    metaData: Optional([
                        "key": JSONValue.string("value")
                    ]),
                    startDate: Optional("start_date"),
                    providerPolicyId: Optional(1),
                    providerPolicy: Optional("provider_policy"),
                    orderStatus: Optional(1),
                    approvalStatus: Optional(1),
                    endDate: Optional("end_date"),
                    isClaimed: Optional(true),
                    createdAt: Optional("created_at"),
                    uploadedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    updatedAt: Optional("updated_at"),
                    clientId: Optional("client_id"),
                    canceledAt: Optional(Nullable<String>.value("canceled_at")),
                    invoice: Optional("invoice"),
                    cancellationDocument: Optional("cancellation_document")
                )
            ]),
            firstPageUrl: Optional("first_page_url"),
            from: Optional(Nullable<Int>.value(1)),
            lastPage: Optional(1),
            lastPageUrl: Optional("last_page_url"),
            links: Optional([
                PaginationLink(
                    url: Optional(Nullable<String>.value("url")),
                    label: Optional("label"),
                    active: Optional(true)
                )
            ]),
            nextPageUrl: Optional(Nullable<String>.value("next_page_url")),
            path: Optional("path"),
            perPage: Optional(1),
            prevPageUrl: Optional(Nullable<String>.value("prev_page_url")),
            to: Optional(Nullable<Int>.value(1)),
            total: Optional(1),
            aggregates: Optional(PolicyAggregates(
                totalCount: Optional(12),
                totalPrice: Optional(42850.75),
                byMonth: Optional([
                    "2026-06": PolicyMonthAggregate(
                        count: Optional(12),
                        totalPrice: Optional(42850.75)
                    )
                ])
            ))
        )
        let response = try await client.policies.listPolicies(
            dateFrom: CalendarDate("2026-06-01")!,
            dateTo: CalendarDate("2026-06-30")!,
            includeAggregates: true,
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func issuePolicy1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Data(
                #"""
                {
                  "id": 1,
                  "meta_data": {
                    "key": "value"
                  },
                  "start_date": "start_date",
                  "provider_policy_id": 1,
                  "provider_policy": "provider_policy",
                  "order_status": 1,
                  "approval_status": 1,
                  "end_date": "end_date",
                  "is_claimed": true,
                  "created_at": "created_at",
                  "uploaded_at": "2024-01-15T09:30:00Z",
                  "updated_at": "updated_at",
                  "client_id": "client_id",
                  "canceled_at": "canceled_at",
                  "invoice": "invoice",
                  "cancellation_document": "cancellation_document"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Policy(
            id: Optional(1),
            metaData: Optional([
                "key": JSONValue.string("value")
            ]),
            startDate: Optional("start_date"),
            providerPolicyId: Optional(1),
            providerPolicy: Optional("provider_policy"),
            orderStatus: Optional(1),
            approvalStatus: Optional(1),
            endDate: Optional("end_date"),
            isClaimed: Optional(true),
            createdAt: Optional("created_at"),
            uploadedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
            updatedAt: Optional("updated_at"),
            clientId: Optional("client_id"),
            canceledAt: Optional(Nullable<String>.value("canceled_at")),
            invoice: Optional("invoice"),
            cancellationDocument: Optional("cancellation_document")
        )
        let response = try await client.policies.issuePolicy(
            request: .init(
                otp: "123456",
                quoteRequestId: 123,
                quoteReferenceId: "550e8400-e29b-41d4-a716-446655440000",
                quotePriceId: "550e8400-e29b-41d4-a716-446655440001"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}