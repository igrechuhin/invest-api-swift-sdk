/// Тип опционного контракта по стилю.
public enum OptionStyle: Int, Codable, Sendable {
    /// Значение не определено.
    case unspecified
    
    /// Американский стиль.
    case american
    
    /// Европейский стиль.
    case european
}
