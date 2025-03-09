import NIOCore

/// Протокол для взаимодействия с Tinkoff API
public protocol ApiClient {
    associatedtype UsersService: SandboxUsersService
    
    /// Сервис предоставления справочной информации о пользователе.
    var user: UsersService { get }

    /// Сервис предоставления справочной информации о ценных бумагах.
    var instruments: InstrumentsService { get }
    
    /// Сервис котировок.
    var marketData: MarketDataService { get }
    
    /// Сервис получения информации о позициях и доходности портфеля в реальном времени.
    var operationsStream: OperationsStreamService { get }
        
    /// Сервис получения биржевой информации в реальном времени.
    var marketDataStream: MarketDataStreamService { get }
    
    /// Сервис получения информации о торговых поручениях в реальном времени.
    var ordersStream: OrdersStreamService { get }
}
