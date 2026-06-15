import Foundation
import Testing
import Api

@Suite("QuotesClient Wire Tests") struct QuotesClientWireTests {
    @Test func showQuote1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Data(
                #"""
                {
                  "owner_id": 1,
                  "phone": "phone",
                  "birthdate": "2023-01-15",
                  "car_sequence_number": 1,
                  "is_ownership_transfer": true,
                  "car_estimated_cost": 1.1,
                  "car_model_year": 1,
                  "start_date": "2023-01-15",
                  "drivers": [
                    {
                      "owner_id": "owner_id",
                      "birthdate": "2023-01-15",
                      "driving_percentage": 1
                    }
                  ],
                  "quotes": [
                    {
                      "company_name": "company_name",
                      "prices": [
                        {
                          "vat_percentage": 15
                        }
                      ],
                      "benefits": [
                        {}
                      ]
                    }
                  ],
                  "client_id": "client_id",
                  "updated_at": "2024-01-15T09:30:00Z",
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": 1
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = QuoteResponse(
            ownerId: Optional(1),
            phone: Optional("phone"),
            birthdate: Optional(CalendarDate("2023-01-15")!),
            carSequenceNumber: Optional(1),
            isOwnershipTransfer: Optional(true),
            carEstimatedCost: Optional(1.1),
            carModelYear: Optional(1),
            startDate: Optional(CalendarDate("2023-01-15")!),
            drivers: Optional([
                QuoteResponseDriversItem(
                    ownerId: Optional("owner_id"),
                    birthdate: Optional(CalendarDate("2023-01-15")!),
                    drivingPercentage: Optional(1)
                )
            ]),
            quotes: Optional([
                QuoteResponseQuotesItem(
                    companyName: Optional("company_name"),
                    prices: Optional([
                        QuotePrice(
                            vatPercentage: Optional(15)
                        )
                    ]),
                    benefits: Optional([
                        Benefit(

                        )
                    ])
                )
            ]),
            clientId: Optional("client_id"),
            updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            id: Optional(1)
        )
        let response = try await client.quotes.showQuote(
            id: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deleteQuote1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Data(
                #"""
                {
                  "message": "Quote deleted successfully."
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteQuoteRequestsIdResponse(
            message: Optional("Quote deleted successfully.")
        )
        let response = try await client.quotes.deleteQuote(
            id: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listQuotes1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Data(
                #"""
                {
                  "current_page": 1,
                  "data": [
                    {
                      "owner_id": 1,
                      "phone": "phone",
                      "birthdate": "2023-01-15",
                      "car_sequence_number": 1,
                      "is_ownership_transfer": true,
                      "car_estimated_cost": 1.1,
                      "car_model_year": 1,
                      "start_date": "2023-01-15",
                      "drivers": [
                        {}
                      ],
                      "quotes": [
                        {
                          "prices": [
                            {
                              "vat_percentage": 15
                            }
                          ]
                        }
                      ],
                      "client_id": "client_id",
                      "updated_at": "2024-01-15T09:30:00Z",
                      "created_at": "2024-01-15T09:30:00Z",
                      "id": 1
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
                  "total": 1
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GetQuoteRequestsResponse(
            currentPage: Optional(1),
            data: Optional([
                QuoteResponse(
                    ownerId: Optional(1),
                    phone: Optional("phone"),
                    birthdate: Optional(CalendarDate("2023-01-15")!),
                    carSequenceNumber: Optional(1),
                    isOwnershipTransfer: Optional(true),
                    carEstimatedCost: Optional(1.1),
                    carModelYear: Optional(1),
                    startDate: Optional(CalendarDate("2023-01-15")!),
                    drivers: Optional([
                        QuoteResponseDriversItem(

                        )
                    ]),
                    quotes: Optional([
                        QuoteResponseQuotesItem(
                            prices: Optional([
                                QuotePrice(
                                    vatPercentage: Optional(15)
                                )
                            ])
                        )
                    ]),
                    clientId: Optional("client_id"),
                    updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    id: Optional(1)
                )
            ]),
            firstPageUrl: Optional("first_page_url"),
            from: Optional(Nullable<Int>.value(1)),
            lastPage: Optional(1),
            lastPageUrl: Optional("last_page_url"),
            links: Optional([
                GetQuoteRequestsResponseLinksItem(
                    url: Optional("url"),
                    label: Optional("label"),
                    active: Optional(true)
                )
            ]),
            nextPageUrl: Optional("next_page_url"),
            path: Optional("path"),
            perPage: Optional(1),
            prevPageUrl: Optional("prev_page_url"),
            to: Optional(Nullable<Int>.value(1)),
            total: Optional(1)
        )
        let response = try await client.quotes.listQuotes(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func requestQuotes1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Data(
                #"""
                {
                  "owner_id": 1,
                  "phone": "phone",
                  "birthdate": "2023-01-15",
                  "car_sequence_number": 1,
                  "is_ownership_transfer": true,
                  "car_estimated_cost": 1.1,
                  "car_model_year": 1,
                  "start_date": "2023-01-15",
                  "drivers": [
                    {
                      "owner_id": "owner_id",
                      "birthdate": "2023-01-15",
                      "driving_percentage": 1
                    }
                  ],
                  "quotes": [
                    {
                      "company_name": "company_name",
                      "prices": [
                        {
                          "vat_percentage": 15
                        }
                      ],
                      "benefits": [
                        {}
                      ]
                    }
                  ],
                  "client_id": "client_id",
                  "updated_at": "2024-01-15T09:30:00Z",
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": 1
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = QuoteResponse(
            ownerId: Optional(1),
            phone: Optional("phone"),
            birthdate: Optional(CalendarDate("2023-01-15")!),
            carSequenceNumber: Optional(1),
            isOwnershipTransfer: Optional(true),
            carEstimatedCost: Optional(1.1),
            carModelYear: Optional(1),
            startDate: Optional(CalendarDate("2023-01-15")!),
            drivers: Optional([
                QuoteResponseDriversItem(
                    ownerId: Optional("owner_id"),
                    birthdate: Optional(CalendarDate("2023-01-15")!),
                    drivingPercentage: Optional(1)
                )
            ]),
            quotes: Optional([
                QuoteResponseQuotesItem(
                    companyName: Optional("company_name"),
                    prices: Optional([
                        QuotePrice(
                            vatPercentage: Optional(15)
                        )
                    ]),
                    benefits: Optional([
                        Benefit(

                        )
                    ])
                )
            ]),
            clientId: Optional("client_id"),
            updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            id: Optional(1)
        )
        let response = try await client.quotes.requestQuotes(
            request: .init(
                ownerId: "owner_id",
                phone: "phone",
                birthdate: CalendarDate("2023-01-15")!,
                carSequenceNumber: "car_sequence_number",
                carEstimatedCost: 1.1
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}