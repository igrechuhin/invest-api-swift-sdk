/// Текущий статус биржевой заявки (поручения).
public enum OrderStatus: Int, Codable, Sendable {
    /// Значение не указано.
    case unspecified
    
    /// Исполнена.
    case fill
    
    /// Отклонена.
    case rejected
    
    /// Отменена пользователем.
    case cancelled
    
    /// Новая.
    case new
    
    /// Частично исполнена.
    case partiallyFill
}
