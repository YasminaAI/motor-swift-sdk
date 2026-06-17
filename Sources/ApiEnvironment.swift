import Foundation

public enum ApiEnvironment: String, CaseIterable {
    case sandbox = "https://sandbox.yasmina.ai/api/v1/car-comp"
    case production = "https://production.yasmina.ai/api/v1/car-comp"
}