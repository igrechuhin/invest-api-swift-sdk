/// Направление сделки.
public enum TradeDirection: Int, Codable, Sendable {
    /// Интервал не определён.
    case unspecified
    
    /// Покупка.
    case buy
    
    /// Продажа.
    case sell
}
