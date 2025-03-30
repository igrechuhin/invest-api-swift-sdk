/// Тип заявки.
public enum StopOrderExpirationType: Int, Codable, Sendable {
    /// Значение не указано.
    case unspecified
    
    /// Действует до отмены.
    case goodTillCancel
    
    /// Действует до даты снятия.
    case goodTillDate
}
