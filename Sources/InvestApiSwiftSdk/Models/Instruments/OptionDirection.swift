/// Тип опционного контракта по направлению сделки.
public enum OptionDirection: Int, Codable, Sendable {
    /// Значение не определено.
    case unspecified
    
    /// Контракт на продажу.
    case put
    
    /// Контракт на покупку.
    case call
}
