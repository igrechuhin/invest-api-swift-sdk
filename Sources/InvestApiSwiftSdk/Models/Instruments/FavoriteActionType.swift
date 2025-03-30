/// Тип действия со списком избранных инструментов.
public enum FavoriteActionType: Int, Codable, Sendable {
    /// Значение не определено.
    case unspecified
    
    /// Добавить в список.
    case add
    
    /// Удалить из списка.
    case delete
}
