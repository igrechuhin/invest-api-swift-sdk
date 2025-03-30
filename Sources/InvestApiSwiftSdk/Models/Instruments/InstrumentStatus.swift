/// Статус запрашиваемых инструментов.
public enum InstrumentStatus: Int, Codable, Sendable {
    /// Значение не определено.
    case unspecified
    
    /// Базовый список инструментов (по умолчанию). Инструменты доступные для торговли через API.
    case base
    
    /// Список всех инструментов.
    case all
}
