/// Тип фьючерсного контракта.
public enum FutureContractType: String, Codable, Sendable {
    /// Поставочный.
    case physicalDelivery = "DELIVERY_TYPE_PHYSICAL_DELIVERY"
    
    /// Расчётный.
    case cashSettlement = "DELIVERY_TYPE_CASH_SETTLEMENT"
}
