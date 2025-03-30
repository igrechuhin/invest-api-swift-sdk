/// Направление операции.
public enum OrderDirection: Int, Codable, Sendable {
    /// Направление не определено.
    case unspecified
    
    /// Покупка.
    case buy
    
    /// Продажа.
    case sell
}
