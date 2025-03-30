/// Тип актива.
public enum AssetType: Int, Codable, Sendable {
    /// Значение не определено.
    case unspecified
    
    /// Валюта.
    case currency
    
    /// Товар.
    case commodity
    
    /// Индекс.
    case index
    
    /// Ценная бумага.
    case security
}
