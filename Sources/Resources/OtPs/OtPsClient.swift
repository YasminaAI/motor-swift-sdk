import Foundation

public final class OtPsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// This endpoint sends a one-time password (OTP) to the provided email and phone number for quote verification. It should be called before creating a quote request.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func requestOtpForQuoteVerification(request: Requests.PostQuoteOtpRequest, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/quote-otp",
            body: request,
            requestOptions: requestOptions
        )
    }

    /// This endpoint sends a one-time password (OTP). It should be called before issuing a policy.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func requestOtpForIssuingPolicy(request: Requests.PostIssueOtpRequest, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/issue-otp",
            body: request,
            requestOptions: requestOptions
        )
    }
}