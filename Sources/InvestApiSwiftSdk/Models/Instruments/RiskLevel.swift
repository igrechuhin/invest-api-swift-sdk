/// Уровень риска облигации.
public enum RiskLevel: Int, Codable, Sendable {
    /// Значение не определено.
    case unspecified
    
    /// Низкий уровень.
    case low
    
    /// Средний уровень.
    case moderate
    
    /// Высокий уровень.
    case high
}
