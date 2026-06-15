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
                [
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
                    "updated_at": "updated_at",
                    "client_id": "client_id",
                    "canceled_at": "canceled_at",
                    "invoice": "invoice",
                    "cancellation_document": "cancellation_document"
                  }
                ]
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
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
                updatedAt: Optional("updated_at"),
                clientId: Optional("client_id"),
                canceledAt: Optional(Nullable<String>.value("canceled_at")),
                invoice: Optional("invoice"),
                cancellationDocument: Optional("cancellation_document")
            )
        ]
        let response = try await client.policies.listPolicies(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
            updatedAt: Optional("updated_at"),
            clientId: Optional("client_id"),
            canceledAt: Optional(Nullable<String>.value("canceled_at")),
            invoice: Optional("invoice"),
            cancellationDocument: Optional("cancellation_document")
        )
        let response = try await client.policies.issuePolicy(
            request: .init(
                quoteRequestId: 123,
                quoteReferenceId: "550e8400-e29b-41d4-a716-446655440000",
                quotePriceId: "550e8400-e29b-41d4-a716-446655440001"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}