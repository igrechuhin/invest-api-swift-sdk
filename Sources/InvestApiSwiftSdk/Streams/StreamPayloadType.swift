/// Тип полезной нагрузки в сообщении полученном из потока.
public enum StreamPayloadType: Int, Codable, Sendable {
    /// Информация о подписке на поток.
    case subscriptionInfo
    
    /// Проверка активности потока.
    case ping
    
    /// Данные.
    case data
}
