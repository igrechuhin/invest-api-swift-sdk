/// Тип структурной ноты.
public enum StructuredProductType: Int, Codable, Sendable {
    /// Значение не определено.
    case unspecified
    
    /// Поставочный.
    case deliverable
    
    /// Беспоставочный.
    case nonDeliverable
}
