/// Тип опционного контракта по способу исполнения.
public enum OptionContractType: Int, Codable, Sendable {
    /// Значение не определено.
    case unspecified
    
    /// Поставочный.
    case physicalDelivery
    
    /// Расчётный.
    case cashSettlement
}
