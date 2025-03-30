/// Уровень доступа к счёту.
public enum AccessLevel: Int, Codable, Sendable {
    /// Уровень доступа не определён.
    case unspecified
    
    /// Полный доступ к счёту.
    case fullAccess
    
    /// Доступ с уровнем прав "только чтение".
    case readOnly
    
    /// Доступ отсутствует.
    case noAccess
}
