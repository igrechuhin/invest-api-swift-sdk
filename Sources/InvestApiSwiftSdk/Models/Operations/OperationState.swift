/// Статус запрашиваемых операций.
public enum OperationState: Int, Codable, Sendable {
    /// Не определён.
    case unspecified
    
    /// Исполнена.
    case executed
    
    /// Отменена.
    case canceled
    
    /// Исполняется.
    case progress
}
