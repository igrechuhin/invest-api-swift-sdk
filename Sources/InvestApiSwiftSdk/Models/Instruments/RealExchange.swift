/// Площадка исполнения расчётов (биржа).
public enum RealExchange: Int, Codable, Sendable {
    /// Значение не определено.
    case unspecified

    /// Московская биржа.
    case moex
    
    /// Санкт-Петербургская биржа.
    case rts
    
    /// Внебиржевой инструмент.
    case otc
    
    /// Инструмент, торгуемый на площадке брокера.
    case dealer
}
