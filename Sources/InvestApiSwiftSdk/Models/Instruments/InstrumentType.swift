/// Тип инструмента.
public enum InstrumentType: String, Codable, Sendable {
    /// Значение не установлено.
    case unspecified = ""

    /// Облигация.
    case bond

    /// Акция.
    case share
    
    /// Валюта.
    case currency

    /// Фонд.
    case etf
    
    /// Фьючерс.
    case future = "futures"

    /// Опцион.
    case option
}
