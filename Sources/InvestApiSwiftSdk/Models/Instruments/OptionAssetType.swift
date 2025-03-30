/// Тип базового актива опционного контракта.
public enum OptionAssetType: String, Codable, Sendable {
    /// Товар.
    case commodity
    
    /// Валюта
    case currency
    
    /// Ценная бумага
    case security
    
    /// Индекс.
    case index
}
