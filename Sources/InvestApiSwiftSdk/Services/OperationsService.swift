import NIOCore
import Foundation

/// Сервис получения списка операций, портфеля, позиций ценных бумаг и т.д.
public protocol OperationsService: Sendable {
    
    typealias GenerateBrokerReportResult = (id: String, report: BrokerReport)
    
    typealias GenerateDividendsForeignIssuerReportResult = (id: String, report: DividendsForeignIssuerReport)
    
    /// Получает список операций по счёту.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - state: Статус запрашиваемых операций.
    ///     - figi: Figi идентификатор инструмента для фильтрации.
    ///
    /// - Returns: Список операций по счёту `[Operation]`.
    func getOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) throws -> EventLoopFuture<[Operation]>
    
    /// Получает портфель по счёту.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта.
    ///     - currency: Валюта представления портфеля.
    ///
    /// - Returns: Портфель по счёту `Portfolio`.
    func getPortfolio(accountId: String, currency: CurrencyType) throws -> EventLoopFuture<Portfolio>
    
    /// Получает список позиций по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Позиции по счёту `PositionsCollection`.
    func getPositions(accountId: String) throws -> EventLoopFuture<PositionsCollection>
    
    /// Получает доступный остаток для вывода средств.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Доступный остаток для вывода средств `WithdrawLimits`.
    func getWithdrawLimits(accountId: String) throws -> EventLoopFuture<WithdrawLimits>
    
    /// Отправляет запрос на формирование брокерского отчёта.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Идентификатор задачи формирования брокерского отчёта `String`, или отчёт `BrokerReport`, если за данный период запрашивался ранее.
    func generateBrokerReport(accountId: String, from: Date, to: Date) throws -> EventLoopFuture<GenerateBrokerReportResult>
    
    /// Получает брокерский отчёт.
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 0), значение по умолчанию: 0.
    ///
    /// - Returns: Брокерский отчёт `BrokerReport`.
    func getBrokerReport(taskId: String, page: Int32) throws -> EventLoopFuture<BrokerReport>
    
    /// Отправляет запрос на формирование отчёта "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Идентификатор задачи формирования брокерского отчёта `String`, или отчёт `DividendsForeignIssuerReport`, если за данный период запрашивался ранее.
    func generateDivForeignIssuerReport(accountId: String, from: Date, to: Date) throws ->
    EventLoopFuture<GenerateDividendsForeignIssuerReportResult>
    
    /// Получает отчёт "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 0), значение по умолчанию: 0.
    ///
    /// - Returns: Отчёт "Справка о доходах за пределами РФ" `DividendsForeignIssuerReport`.
    func getDivForeignIssuerReport(taskId: String, page: Int32) throws -> EventLoopFuture<DividendsForeignIssuerReport>
    
    /// Получает список операций по счёту с пагинацией.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - cursor: Идентификатор элемента, с которого формируется начало списка.
    ///     - limit: Лимит количества операций. По умолчанию устанавливается значение 100, максимальное значение 1000.
    ///     - types: Типы операций.
    ///     - state: Статус запрашиваемых операций.
    ///     - withCommissions: Включить комиссии.
    ///     - withTrades: Включить массив сделок.
    ///     - withOvernights: Вкличить overnight операции.
    ///
    /// - Returns: Список операций по счёту с пагинацией `OperationsByCursor`.
    func getOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) throws -> EventLoopFuture<OperationsByCursor>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Получает список операций по счёту.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - state: Статус запрашиваемых операций.
    ///     - figi: Figi идентификатор инструмента для фильтрации.
    ///
    /// - Returns: Список операций по счёту `[Operation]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) async throws -> [Operation]
    
    /// Получает портфель по счёту.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта.
    ///     - currency: Валюта представления портфеля.
    ///
    /// - Returns: Портфель по счёту `Portfolio`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getPortfolio(accountId: String, currency: CurrencyType) async throws -> Portfolio
    
    /// Получает список позиций по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Позиции по счёту `PositionsCollection`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getPositions(accountId: String) async throws -> PositionsCollection
    
    /// Получает доступный остаток для вывода средств.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Доступный остаток для вывода средств `WithdrawLimits`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getWithdrawLimits(accountId: String) async throws -> WithdrawLimits
    
    /// Отправляет запрос на формирование брокерского отчёта.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Идентификатор задачи формирования брокерского отчёта `String`, или отчёт `BrokerReport`, если за данный период запрашивался ранее.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func generateBrokerReport(accountId: String, from: Date, to: Date) async throws -> GenerateBrokerReportResult
    
    /// Получает брокерский отчёт.
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 0), значение по умолчанию: 0.
    ///
    /// - Returns: Брокерский отчёт `BrokerReport`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getBrokerReport(taskId: String, page: Int32) async throws -> BrokerReport
    
    /// Отправляет запрос на формирование отчёта "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Идентификатор задачи формирования брокерского отчёта `String`, или отчёт `DividendsForeignIssuerReport`, если за данный период запрашивался ранее.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func generateDivForeignIssuerReport(accountId: String, from: Date, to: Date) async throws ->
    GenerateDividendsForeignIssuerReportResult
    
    /// Получает отчёт "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 0), значение по умолчанию: 0.
    ///
    /// - Returns: Отчёт "Справка о доходах за пределами РФ" `DividendsForeignIssuerReport`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getDivForeignIssuerReport(taskId: String, page: Int32) async throws -> DividendsForeignIssuerReport
    
    /// Получает список операций по счёту с пагинацией.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - cursor: Идентификатор элемента, с которого формируется начало списка.
    ///     - limit: Лимит количества операций. По умолчанию устанавливается значение 100, максимальное значение 1000.
    ///     - types: Типы операций.
    ///     - state: Статус запрашиваемых операций.
    ///     - withCommissions: Включить комиссии.
    ///     - withTrades: Включить массив сделок.
    ///     - withOvernights: Вкличить overnight операции.
    ///
    /// - Returns: Список операций по счёту с пагинацией `OperationsByCursor`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) async throws -> OperationsByCursor
#endif
}

internal struct GrpcOperationsService: OperationsService {
    let client: OperationsServiceClient
    
    init(_ client: OperationsServiceClient) {
        self.client = client
    }
    
    func getOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) throws -> EventLoopFuture<[Operation]> {
        self.client
            .getOperations(try .new(accountId: accountId, from: from, to: to, state: state, figi: figi))
            .response
            .flatMapThrowing {
                try $0.operations.map { try $0.toModel() }
            }
    }
    
    func getPortfolio(accountId: String, currency: CurrencyType) throws -> EventLoopFuture<Portfolio> {
        self.client
            .getPortfolio(try .new(accountId: accountId, currency: currency))
            .response
            .map { $0.toModel() }
    }
    
    func getPositions(accountId: String) throws -> EventLoopFuture<PositionsCollection> {
        self.client
            .getPositions(.new(accountId: accountId))
            .response
            .map { $0.toModel() }
    }
    
    func getWithdrawLimits(accountId: String) throws -> EventLoopFuture<WithdrawLimits> {
        self.client
            .getWithdrawLimits(.new(accountId: accountId))
            .response
            .map { $0.toModel() }
    }
    
    func generateBrokerReport(accountId: String, from: Date, to: Date) throws -> EventLoopFuture<GenerateBrokerReportResult> {
        self.client
            .getBrokerReport(.generate(accountId: accountId, from: from, to: to))
            .response
            .map {
                GenerateBrokerReportResult(
                    id: $0.generateBrokerReportResponse.taskID,
                    report: $0.getBrokerReportResponse.toModel()
                )
            }
    }
    
    func getBrokerReport(taskId: String, page: Int32) throws -> EventLoopFuture<BrokerReport> {
        self.client
            .getBrokerReport(.get(taskId: taskId, page: page))
            .response
            .map { $0.getBrokerReportResponse.toModel() }
    }
    
    func generateDivForeignIssuerReport(accountId: String, from: Date, to: Date) throws ->
    EventLoopFuture<GenerateDividendsForeignIssuerReportResult> {
        self.client
            .getDividendsForeignIssuer(.generate(accountId: accountId, from: from, to: to))
            .response
            .map {
                GenerateDividendsForeignIssuerReportResult(
                    id: $0.generateDivForeignIssuerReportResponse.taskID,
                    report: $0.divForeignIssuerReport.toModel()
                )
            }
    }
    
    func getDivForeignIssuerReport(taskId: String, page: Int32) throws -> EventLoopFuture<DividendsForeignIssuerReport> {
        self.client
            .getDividendsForeignIssuer(.get(taskId: taskId, page: page))
            .response
            .map { $0.divForeignIssuerReport.toModel() }
    }
    
    func getOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32 = 100, types: [OperationType], state: OperationState,
        withCommissions: Bool, withTrades: Bool, withOvernights: Bool
    ) throws -> EventLoopFuture<OperationsByCursor> {
        self.client
            .getOperationsByCursor(
                try .new(
                    accountId: accountId, instrumentId: instrumentId, from: from, to: to,
                    cursor: cursor, limit: limit, types: types, state: state,
                    withCommissions: withCommissions, withTrades: withTrades, withOvernights: withOvernights
                )
            )
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func getOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) async throws -> [Operation] {
        try await self.client
            .getOperations(try .new(accountId: accountId, from: from, to: to, state: state, figi: figi))
            .operations
            .map { try $0.toModel() }
    }
    
    func getPortfolio(accountId: String, currency: CurrencyType) async throws -> Portfolio {
        try await self.client
            .getPortfolio(try .new(accountId: accountId, currency: currency))
            .toModel()
    }
    
    func getPositions(accountId: String) async throws -> PositionsCollection {
        try await self.client
            .getPositions(.new(accountId: accountId))
            .toModel()
    }
    
    func getWithdrawLimits(accountId: String) async throws -> WithdrawLimits {
        try await self.client
            .getWithdrawLimits(.new(accountId: accountId))
            .toModel()
    }
    
    func generateBrokerReport(accountId: String, from: Date, to: Date) async throws -> GenerateBrokerReportResult {
        let response = try await self.client
            .getBrokerReport(.generate(accountId: accountId, from: from, to: to))
        return GenerateBrokerReportResult(
            id: response.generateBrokerReportResponse.taskID,
            report: response.getBrokerReportResponse.toModel()
        )
    }
    
    func getBrokerReport(taskId: String, page: Int32) async throws -> BrokerReport {
        try await self.client
            .getBrokerReport(.get(taskId: taskId, page: page))
            .getBrokerReportResponse
            .toModel()
    }
    
    func generateDivForeignIssuerReport(accountId: String, from: Date, to: Date) async throws ->
    GenerateDividendsForeignIssuerReportResult {
        let response = try await self.client
            .getDividendsForeignIssuer(.generate(accountId: accountId, from: from, to: to))
        return GenerateDividendsForeignIssuerReportResult(
            id: response.generateDivForeignIssuerReportResponse.taskID,
            report: response.divForeignIssuerReport.toModel()
        )
    }
    
    func getDivForeignIssuerReport(taskId: String, page: Int32) async throws -> DividendsForeignIssuerReport {
        try await self.client
            .getDividendsForeignIssuer(.get(taskId: taskId, page: page))
            .divForeignIssuerReport
            .toModel()
    }
    
    func getOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) async throws -> OperationsByCursor {
        try await self.client
            .getOperationsByCursor(
                try .new(
                    accountId: accountId, instrumentId: instrumentId, from: from, to: to,
                    cursor: cursor, limit: limit, types: types, state: state,
                    withCommissions: withCommissions, withTrades: withTrades, withOvernights: withOvernights
                )
            )
            .toModel()
    }
#endif
}
