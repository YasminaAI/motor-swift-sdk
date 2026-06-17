import Foundation

/// Normalised insurance category used to group and filter quotes. Always one of `TPL`, `TPL +`, or `Comprehensive`.
public enum QuoteResponseQuotesItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case tpl = "TPL"
    case comprehensive = "Comprehensive"
}