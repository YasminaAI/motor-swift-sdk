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
                  "custom_number": "custom_number",
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
                      "company_name_ar": "company_name_ar",
                      "type": "TPL",
                      "insurance_type_display": "insurance_type_display",
                      "insurance_type_display_ar": "insurance_type_display_ar",
                      "company_logo_url": "company_logo_url",
                      "square_company_logo_url": "square_company_logo_url",
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
            customNumber: Optional("custom_number"),
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
                    companyNameAr: Optional("company_name_ar"),
                    type: Optional(.tpl),
                    insuranceTypeDisplay: Optional("insurance_type_display"),
                    insuranceTypeDisplayAr: Optional("insurance_type_display_ar"),
                    companyLogoUrl: Optional("company_logo_url"),
                    squareCompanyLogoUrl: Optional("square_company_logo_url"),
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
                      "custom_number": "custom_number",
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
                  "total": 1,
                  "aggregates": {
                    "total_count": 24,
                    "by_month": {
                      "2026-06": 24
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
        let expectedResponse = PaginatedQuoteResponse(
            currentPage: Optional(1),
            data: Optional([
                QuoteResponse(
                    ownerId: Optional(1),
                    phone: Optional("phone"),
                    birthdate: Optional(CalendarDate("2023-01-15")!),
                    carSequenceNumber: Optional(1),
                    customNumber: Optional("custom_number"),
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
            aggregates: Optional(QuoteRequestAggregates(
                totalCount: Optional(24),
                byMonth: Optional([
                    "2026-06": 24
                ])
            ))
        )
        let response = try await client.quotes.listQuotes(
            dateFrom: CalendarDate("2026-06-01")!,
            dateTo: CalendarDate("2026-06-30")!,
            perPage: 10,
            includeAggregates: true,
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
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
                  "custom_number": "custom_number",
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
                      "company_name_ar": "company_name_ar",
                      "type": "TPL",
                      "insurance_type_display": "insurance_type_display",
                      "insurance_type_display_ar": "insurance_type_display_ar",
                      "company_logo_url": "company_logo_url",
                      "square_company_logo_url": "square_company_logo_url",
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
            customNumber: Optional("custom_number"),
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
                    companyNameAr: Optional("company_name_ar"),
                    type: Optional(.tpl),
                    insuranceTypeDisplay: Optional("insurance_type_display"),
                    insuranceTypeDisplayAr: Optional("insurance_type_display_ar"),
                    companyLogoUrl: Optional("company_logo_url"),
                    squareCompanyLogoUrl: Optional("square_company_logo_url"),
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
                otp: "123456",
                ownerId: "owner_id",
                phone: "phone",
                birthdate: CalendarDate("2023-01-15")!,
                carEstimatedCost: 1.1
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}