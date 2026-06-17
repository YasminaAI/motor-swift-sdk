# Reference
## Quotes
<details><summary><code>client.quotes.<a href="/Sources/Resources/Quotes/QuotesClient.swift">showQuote</a>(id: String, requestOptions: RequestOptions?) -> QuoteResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Api

private func main() async throws {
    let client = ApiClient(token: "<token>")

    _ = try await client.quotes.showQuote(id: "1")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.quotes.<a href="/Sources/Resources/Quotes/QuotesClient.swift">deleteQuote</a>(id: String, requestOptions: RequestOptions?) -> DeleteQuoteRequestsIdResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Api

private func main() async throws {
    let client = ApiClient(token: "<token>")

    _ = try await client.quotes.deleteQuote(id: "1")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.quotes.<a href="/Sources/Resources/Quotes/QuotesClient.swift">listQuotes</a>(dateFrom: CalendarDate?, dateTo: CalendarDate?, perPage: Int?, includeAggregates: Bool?, requestOptions: RequestOptions?) -> PaginatedQuoteResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Api

private func main() async throws {
    let client = ApiClient(token: "<token>")

    _ = try await client.quotes.listQuotes(
        dateFrom: CalendarDate("2026-06-01")!,
        dateTo: CalendarDate("2026-06-30")!,
        perPage: 10,
        includeAggregates: true
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**dateFrom:** `CalendarDate?` — Inclusive lower bound for quote request creation date.
    
</dd>
</dl>

<dl>
<dd>

**dateTo:** `CalendarDate?` — Inclusive upper bound for quote request creation date.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `Int?` — Number of quote requests to return per page.
    
</dd>
</dl>

<dl>
<dd>

**includeAggregates:** `Bool?` — When true, includes quote request totals and monthly buckets for the filtered result set.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.quotes.<a href="/Sources/Resources/Quotes/QuotesClient.swift">requestQuotes</a>(request: Requests.PostQuoteRequestsRequest, requestOptions: RequestOptions?) -> QuoteResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

For getting prices with benefits. 
The Quote IDs can be used later to issue a policy
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Api

private func main() async throws {
    let client = ApiClient(token: "<token>")

    _ = try await client.quotes.requestQuotes(request: .init(
        otp: "123456",
        ownerId: "owner_id",
        phone: "phone",
        birthdate: CalendarDate("2023-01-15")!,
        carEstimatedCost: 1.1
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.PostQuoteRequestsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Policies
<details><summary><code>client.policies.<a href="/Sources/Resources/Policies/PoliciesClient.swift">showPolicy</a>(carPolicy: String, requestOptions: RequestOptions?) -> Policy</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Show a specific policy
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Api

private func main() async throws {
    let client = ApiClient(token: "<token>")

    _ = try await client.policies.showPolicy(carPolicy: "1")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**carPolicy:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.policies.<a href="/Sources/Resources/Policies/PoliciesClient.swift">listPolicies</a>(quoteRequestId: Int?, quotePriceId: String?, providerPolicyId: Int?, carSequenceNumber: String?, newOwnerId: String?, previousOwnerId: String?, status: Int?, minPrice: Double?, maxPrice: Double?, perPage: Int?, dateFrom: CalendarDate?, dateTo: CalendarDate?, includeAggregates: Bool?, requestOptions: RequestOptions?) -> PaginatedPolicyResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Listing requested policies
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Api

private func main() async throws {
    let client = ApiClient(token: "<token>")

    _ = try await client.policies.listPolicies(
        dateFrom: CalendarDate("2026-06-01")!,
        dateTo: CalendarDate("2026-06-30")!,
        includeAggregates: true
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**quoteRequestId:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**quotePriceId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**providerPolicyId:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**carSequenceNumber:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**newOwnerId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**previousOwnerId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**minPrice:** `Double?` 
    
</dd>
</dl>

<dl>
<dd>

**maxPrice:** `Double?` 
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**dateFrom:** `CalendarDate?` — Inclusive lower bound for the policy date. For issued policies (`status=1`), this filters by `uploaded_at` (the provider policy issue timestamp) and falls back to `created_at` when `uploaded_at` is unavailable. For other statuses, this filters by `created_at`.
    
</dd>
</dl>

<dl>
<dd>

**dateTo:** `CalendarDate?` — Inclusive upper bound for the policy date. For issued policies (`status=1`), this filters by `uploaded_at` (the provider policy issue timestamp) and falls back to `created_at` when `uploaded_at` is unavailable. For other statuses, this filters by `created_at`.
    
</dd>
</dl>

<dl>
<dd>

**includeAggregates:** `Bool?` — When true, includes policy totals, total price, and monthly buckets for the filtered result set.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.policies.<a href="/Sources/Resources/Policies/PoliciesClient.swift">issuePolicy</a>(request: Requests.PostPoliciesRequest, requestOptions: RequestOptions?) -> Policy</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

For issuing a new policy
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Api

private func main() async throws {
    let client = ApiClient(token: "<token>")

    _ = try await client.policies.issuePolicy(request: .init(
        otp: "123456",
        quoteRequestId: 123,
        quoteReferenceId: "550e8400-e29b-41d4-a716-446655440000",
        quotePriceId: "550e8400-e29b-41d4-a716-446655440001"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.PostPoliciesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## OtPs
<details><summary><code>client.otPs.<a href="/Sources/Resources/OtPs/OtPsClient.swift">requestOtpForQuoteVerification</a>(request: Requests.PostQuoteOtpRequest, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint sends a one-time password (OTP) to the provided email and phone number for quote verification. It should be called before creating a quote request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Api

private func main() async throws {
    let client = ApiClient(token: "<token>")

    _ = try await client.otPs.requestOtpForQuoteVerification(request: .init(
        email: "someone@example.com",
        phone: "0501234567",
        ownerId: "1012345678"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.PostQuoteOtpRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.otPs.<a href="/Sources/Resources/OtPs/OtPsClient.swift">requestOtpForIssuingPolicy</a>(request: Requests.PostIssueOtpRequest, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint sends a one-time password (OTP). It should be called before issuing a policy.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Api

private func main() async throws {
    let client = ApiClient(token: "<token>")

    _ = try await client.otPs.requestOtpForIssuingPolicy(request: .init(
        email: "someone@example.com",
        phone: "0501234567",
        ownerId: "1012345678",
        quoteRequestId: 123,
        quoteReferenceId: "550e8400-e29b-41d4-a716-446655440000",
        quotePriceId: "550e8400-e29b-41d4-a716-446655440001"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.PostIssueOtpRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

