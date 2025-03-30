/// Тип заявки.
public enum OrderType: Int, Codable, Sendable {
    /// Значение не указано.
    case unspecified
    
    /// Лимитная.
    case limit
    
    /// Рыночная.
    case market
    
    /// Лучшая цена.
    case bestPrice
}
