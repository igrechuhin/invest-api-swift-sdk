import NIOCore
import Foundation

/// Сервис получения справочной информации о ценных бумагах
public protocol InstrumentsService {
    /// Получает расписание работы торговых площадок.
    ///
    /// - Parameters:
    ///     - exchange: Наименование биржи или расчетного календаря.
    ///     - from: Начало периода по часовому поясу UTC.
    ///     - to: Окончание периода по часовому поясу UTC.
    ///
    /// - Returns: Список торговых площадок и режимов торгов `[TradingSchedule]`.
    func tradingSchedules(exchange: String, from: Date, to: Date) -> EventLoopFuture<[TradingSchedule]>

    /// Получает облигацию по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация об облигации `Bond`.
    func bondBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Bond>

    /// Получает список облигаций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список облигаций `[Bond]`.
    func bonds(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Bond]>

    /// Получает график выплат купонов по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///
    /// - Returns: Массив объектов содержащих информацию о купоне облигации `[Coupon]`.
    func getBondCoupons(figi: String, from: Date, to: Date) throws -> EventLoopFuture<[Coupon]>

    /// Получает валюту по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация о валюте `Currency`.
    func currencyBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Currency>

    /// Получает список валют.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список валют `[Currency]`.
    func currencies(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Currency]>

    /// Получает инвестиционный фонд по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация об инвестиционном фонде `Etf`.
    func etfBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Etf>

    /// Получает список инвестиционных фондов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список инвестиционных фондов `[Etf]`.
    func etfs(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Etf]>

    /// Получает фьючерсный контракт по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация о фьючерсном контракте `Future`.
    func futureBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Future>

    /// Получает список фьючерсных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список фьючерсных контрактов `[Future]`.
    func futures(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Future]>

    /// Получает опционный контракт по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация об опционном контракте `Option`.
    func optionBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Option>
    
    /// Получает список опционных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список опционных контрактов `[Option]`.
    func options(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Option]>
    
    /// Получает список опционных контрактов.
    ///
    /// - Parameters:
    ///     - basicAssetUid: Идентификатор базового актива опциона (обязательный параметр).
    ///     - basicAssetPositionUid: Идентификатор позиции базового актива опционного контракта.
    ///
    /// - Returns: Список опционных контрактов `[Option]`.
    func optionsBy(basicAssetUid: String, basicAssetPositionUid: String) throws -> EventLoopFuture<[Option]>

    /// Получает акцию по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация об акции `Share`.
    func shareBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Share>
    
    /// Получает список акций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список акциий `[Share]`.
    func shares(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Share]>

    /// Получает накопленный купонный доход по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Список операций начисления купона `[AccruedInterest]`.
    func getAccruedInterests(figi: String, from: Date, to: Date) -> EventLoopFuture<[AccruedInterest]>

    /// Получает размер гарантийного обеспечения по фьючерсному контракту.
    ///
    /// - Parameter figi: Figi-идентификатор инструмента.
    ///
    /// - Returns: Размер гарантийного обеспечения по фьючерсному контракту `FutureContractMargin`.
    func getFutureContractMargin(figi: String) -> EventLoopFuture<FutureContractMargin>

    /// Получает основную информацию об инструменте.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Основная информация об инструменте `Instrument`.
    func getInstrumentBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Instrument>
    
    /// Получает события выплаты дивидендов по инструменту.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///
    /// - Returns: Список операций выплаты дивидендов `[Dividend]`.
    func getDividends(figi: String, from: Date, to: Date) -> EventLoopFuture<[Dividend]>

    /// Получает актив по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор актива.
    ///
    /// - Returns: Информация об активе `AssetFull`.
    func getAssetBy(uid: String) throws -> EventLoopFuture<AssetFull>

    /// Получает список активов (метод работает для всех инструментов, за исключением срочных - опционов и фьючерсов).
    ///
    /// - Parameter kind: Вид запрашиваемых инструментов.
    ///
    /// - Returns: Список активов `[Asset]`.
    func getAssets(kind: InstrumentKind) throws -> EventLoopFuture<[Asset]>

    /// Получает список избранных инструментов.
    ///
    /// - Returns: Список избранных инструментов `[FavoriteInstrument]`.
    func getFavorites() throws -> EventLoopFuture<[FavoriteInstrument]>

    /// Редактирует список избранных инструментов.
    ///
    /// - Parameters:
    ///     - figis: Список figi идентификаторов инструментов.
    ///     - action: Тип действия со списком.
    ///
    /// - Returns: Результат редактирования списка избранных инструментов `[FavoriteInstrument]`.
    func editFavorites(figis: [String], action: FavoriteActionType) throws -> EventLoopFuture<[FavoriteInstrument]>

    /// Получает список стран.
    ///
    /// - Returns: Список стран `[Country]`.
    func getCountries() throws -> EventLoopFuture<[Country]>

    /// Поиск инструмента.
    ///
    /// - Parameters:
    ///     - query: Строка поиска.
    ///     - kind: Фильтр по виду инструмента.
    ///     - apiTradeAvailableFlag: Фильтр для отображения только торговых инструментов.
    ///
    /// - Returns: Список инструментов `[InstrumentShort]`.
    func findInstrument(query: String, kind: InstrumentKind, apiTradeAvailableFlag: Bool) throws -> EventLoopFuture<[InstrumentShort]>
    
    /// Получает бренд по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор бренда.
    ///
    /// - Returns: Бренд `Brand`.
    func getBrandBy(uid: String) throws -> EventLoopFuture<Brand>

    /// Получает список брендов.
    ///
    /// - Returns: Список брендов `[Brand]`.
    func getBrands() throws -> EventLoopFuture<[Brand]>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Получает расписание работы торговых площадок.
    ///
    /// - Parameters:
    ///     - exchange: Наименование биржи или расчетного календаря.
    ///     - from: Начало периода по часовому поясу UTC.
    ///     - to: Окончание периода по часовому поясу UTC.
    ///
    /// - Returns: Список торговых площадок и режимов торгов `[TradingSchedule]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func tradingSchedules(exchange: String, from: Date, to: Date) async throws -> [TradingSchedule]

    /// Получает облигацию по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация об облигации `Bond`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func bondBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Bond

    /// Получает список облигаций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список облигаций `[Bond]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func bonds(instrumentStatus: InstrumentStatus) async throws -> [Bond]

    /// Получает график выплат купонов по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///
    /// - Returns: Массив объектов содержащих информацию о купоне облигации `[Coupon]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getBondCoupons(figi: String, from: Date, to: Date) async throws -> [Coupon]

    /// Получает валюту по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация о валюте `Currency`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func currencyBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Currency

    /// Получает список валют.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список валют `[Currency]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func currencies(instrumentStatus: InstrumentStatus) async throws -> [Currency]

    /// Получает инвестиционный фонд по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация об инвестиционном фонде `Etf`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func etfBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Etf

    /// Получает список инвестиционных фондов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список инвестиционных фондов `[Etf]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func etfs(instrumentStatus: InstrumentStatus) async throws -> [Etf]

    /// Получает фьючерсный контракт по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация о фьючерсном контракте `Future`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func futureBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Future

    /// Получает список фьючерсных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список фьючерсных контрактов `[Future]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func futures(instrumentStatus: InstrumentStatus) async throws -> [Future]

    /// Получает опционный контракт по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация об опционном контракте `Option`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func optionBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Option
    
    /// Получает список опционных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список опционных контрактов `[Option]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func options(instrumentStatus: InstrumentStatus) async throws -> [Option]
    
    /// Получает список опционных контрактов.
    ///
    /// - Parameters:
    ///     - basicAssetUid: Идентификатор базового актива опциона (обязательный параметр).
    ///     - basicAssetPositionUid: Идентификатор позиции базового актива опционного контракта.
    ///
    /// - Returns: Список опционных контрактов `[Option]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func optionsBy(basicAssetUid: String, basicAssetPositionUid: String) async throws -> [Option]

    /// Получает акцию по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Информация об акции `Share`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func shareBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Share
    
    /// Получает список акций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Список акциий `[Share]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func shares(instrumentStatus: InstrumentStatus) async throws -> [Share]

    /// Получает накопленный купонный доход по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Список операций начисления купона `[AccruedInterest]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getAccruedInterests(figi: String, from: Date, to: Date) async throws -> [AccruedInterest]

    /// Получает размер гарантийного обеспечения по фьючерсному контракту.
    ///
    /// - Parameter figi: Figi-идентификатор инструмента.
    ///
    /// - Returns: Размер гарантийного обеспечения по фьючерсному контракту `FutureContractMargin`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getFutureContractMargin(figi: String) async throws -> FutureContractMargin

    /// Получает основную информацию об инструменте.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Основная информация об инструменте `Instrument`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getInstrumentBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Instrument
    
    /// Получает события выплаты дивидендов по инструменту.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///
    /// - Returns: Список операций выплаты дивидендов `[Dividend]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getDividends(figi: String, from: Date, to: Date) async throws -> [Dividend]

    /// Получает актив по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор актива.
    ///
    /// - Returns: Информация об активе `AssetFull`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getAssetBy(uid: String) async throws -> AssetFull

    /// Получает список активов (метод работает для всех инструментов, за исключением срочных - опционов и фьючерсов).
    ///
    /// - Parameter kind: Вид запрашиваемых инструментов.
    ///
    /// - Returns: Список активов `[Asset]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getAssets(kind: InstrumentKind) async throws -> [Asset]

    /// Получает список избранных инструментов.
    ///
    /// - Returns: Список избранных инструментов `[FavoriteInstrument]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getFavorites() async throws -> [FavoriteInstrument]

    /// Редактирует список избранных инструментов.
    ///
    /// - Parameters:
    ///     - figis: Список figi идентификаторов инструментов.
    ///     - action: Тип действия со списком.
    ///
    /// - Returns: Результат редактирования списка избранных инструментов `[FavoriteInstrument]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func editFavorites(figis: [String], action: FavoriteActionType) async throws -> [FavoriteInstrument]

    /// Получает список стран.
    ///
    /// - Returns: Список стран `[Country]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getCountries() async throws -> [Country]

    /// Поиск инструмента.
    ///
    /// - Parameters:
    ///     - query: Строка поиска.
    ///     - kind: Фильтр по виду инструмента.
    ///     - apiTradeAvailableFlag: Фильтр для отображения только торговых инструментов.
    ///
    /// - Returns: Список инструментов `[InstrumentShort]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func findInstrument(query: String, kind: InstrumentKind, apiTradeAvailableFlag: Bool) async throws -> [InstrumentShort]
    
    /// Получает бренд по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор бренда.
    ///
    /// - Returns: Бренд `Brand`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getBrandBy(uid: String) async throws -> Brand

    /// Получает список брендов.
    ///
    /// - Returns: Список брендов `[Brand]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getBrands() async throws -> [Brand]
    
    /// Получить фундаментальные показатели по активу.
    ///
    /// - Returns: Список фундаментальных показателей `[AssetFundamentals]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getAssetFundamentals(assets: [String]) async throws -> [AssetFundamentals]
    
    /// Получить расписания выхода отчётностей эмитентов.
    ///
    /// - Returns: Массив событий по инструментам.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getAssetReports(uid: String, from: Date, to: Date) async throws -> [AssetReport]
    
    /// Запрос консенсус-прогнозов
    ///
    /// - Returns: Список консенсус прогнозов `[ConsensusForecasts]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getConsensusForecasts() async throws -> [ConsensusForecasts]
#endif
}

internal struct GrpcInstrumentsService: InstrumentsService {
    let client: InstrumentsServiceClient
    
    init(_ client: InstrumentsServiceClient) {
        self.client = client
    }
    
    func tradingSchedules(exchange: String, from: Date, to: Date) -> EventLoopFuture<[TradingSchedule]> {
        self.client
            .tradingSchedules(.new(exchange: exchange, from: from, to: to))
            .response
            .map {
                $0.exchanges.map { $0.toModel() }
            }
    }
    
    func bondBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Bond> {
        self.client
            .bondBy(try .new(idType: idType, classCode: classCode, id: id))
            .response
            .flatMapThrowing {
                try $0.instrument.toModel()
            }
    }
    
    func bonds(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Bond]> {
        self.client
            .bonds(try .new(instrumentStatus: instrumentStatus))
            .response
            .flatMapThrowing {
                try $0.instruments.map { try $0.toModel() }
            }
    }
    
    func getBondCoupons(figi: String, from: Date, to: Date) throws -> EventLoopFuture<[Coupon]> {
        self.client
            .getBondCoupons(.new(figi: figi, from: from, to: to))
            .response
            .flatMapThrowing {
                try $0.events.map { try $0.toModel() }
            }
    }
    
    func currencyBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Currency> {
        self.client
            .currencyBy(try .new(idType: idType, classCode: classCode, id: id))
            .response
            .flatMapThrowing {
                try $0.instrument.toModel()
            }
    }
    
    func currencies(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Currency]> {
        self.client
            .currencies(try .new(instrumentStatus: instrumentStatus))
            .response
            .flatMapThrowing {
                try $0.instruments.map { try $0.toModel() }
            }
    }
    
    func etfBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Etf> {
        self.client
            .etfBy(try .new(idType: idType, classCode: classCode, id: id))
            .response
            .flatMapThrowing {
                try $0.instrument.toModel()
            }
    }
    
    func etfs(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Etf]> {
        self.client
            .etfs(try .new(instrumentStatus: instrumentStatus))
            .response
            .flatMapThrowing {
                try $0.instruments.map { try $0.toModel() }
            }
    }
    
    func futureBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Future> {
        self.client
            .futureBy(try .new(idType: idType, classCode: classCode, id: id))
            .response
            .flatMapThrowing {
                try $0.instrument.toModel()
            }
    }
    
    func futures(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Future]> {
        self.client
            .futures(try .new(instrumentStatus: instrumentStatus))
            .response
            .flatMapThrowing {
                try $0.instruments.map { try $0.toModel() }
            }
    }
    
    func optionBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Option> {
        self.client
            .optionBy(try .new(idType: idType, classCode: classCode, id: id))
            .response
            .flatMapThrowing {
                try $0.instrument.toModel()
            }
    }
    
    func options(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Option]> {
        self.client
            .options(try .new(instrumentStatus: instrumentStatus))
            .response
            .flatMapThrowing {
                try $0.instruments.map { try $0.toModel() }
            }
    }
    
    func optionsBy(basicAssetUid: String, basicAssetPositionUid: String) throws -> EventLoopFuture<[Option]> {
        self.client
            .optionsBy(.new(basicAssetUid: basicAssetUid, basicAssetPositionUid: basicAssetPositionUid))
            .response
            .flatMapThrowing {
                try $0.instruments.map { try $0.toModel() }
            }
    }
    
    func shareBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Share> {
        self.client
            .shareBy(try .new(idType: idType, classCode: classCode, id: id))
            .response
            .flatMapThrowing {
                try $0.instrument.toModel()
            }
    }
    
    func shares(instrumentStatus: InstrumentStatus) throws -> EventLoopFuture<[Share]> {
        self.client
            .shares(try .new(instrumentStatus: instrumentStatus))
            .response
            .flatMapThrowing {
                try $0.instruments.map { try $0.toModel() }
            }
    }
    
    func getAccruedInterests(figi: String, from: Date, to: Date) -> EventLoopFuture<[AccruedInterest]> {
        self.client
            .getAccruedInterests(.new(figi: figi, from: from, to: to))
            .response
            .map {
                $0.accruedInterests.map { $0.toModel() }
            }
    }
    
    func getFutureContractMargin(figi: String) -> EventLoopFuture<FutureContractMargin> {
        self.client
            .getFuturesMargin(.new(figi: figi))
            .response
            .map { $0.toModel() }
    }
    
    func getInstrumentBy(idType: InstrumentIdType, classCode: String, id: String) throws -> EventLoopFuture<Instrument> {
        self.client
            .getInstrumentBy(try .new(idType: idType, classCode: classCode, id: id))
            .response
            .flatMapThrowing {
                try $0.instrument.toModel()
            }
    }
    
    func getDividends(figi: String, from: Date, to: Date) -> EventLoopFuture<[Dividend]> {
        self.client
            .getDividends(.new(figi: figi, from: from, to: to))
            .response
            .map {
                $0.dividends.map { $0.toModel() }
            }
    }
    
    func getAssetBy(uid: String) throws -> EventLoopFuture<AssetFull> {
        self.client
            .getAssetBy(.new(uid: uid))
            .response
            .flatMapThrowing {
                try $0.asset.toModel()
            }
    }
    
    func getAssets(kind: InstrumentKind) throws -> EventLoopFuture<[Asset]> {
        self.client
            .getAssets(try .new(kind: kind))
            .response
            .flatMapThrowing {
                try $0.assets.map { try $0.toModel() }
            }
    }
    
    func getFavorites() throws -> EventLoopFuture<[FavoriteInstrument]> {
        self.client
            .getFavorites(.new())
            .response
            .flatMapThrowing {
                try $0.favoriteInstruments.map { try $0.toModel() }
            }
    }
    
    func editFavorites(figis: [String], action: FavoriteActionType) throws -> EventLoopFuture<[FavoriteInstrument]> {
        self.client
            .editFavorites(try .new(figis: figis, action: action))
            .response
            .flatMapThrowing {
                try $0.favoriteInstruments.map { try $0.toModel() }
            }
    }
    
    func getCountries() throws -> EventLoopFuture<[Country]> {
        self.client
            .getCountries(.new())
            .response
            .map {
                $0.countries.map { $0.toModel() }
            }
    }
    
    func findInstrument(query: String, kind: InstrumentKind, apiTradeAvailableFlag: Bool) throws -> EventLoopFuture<[InstrumentShort]> {
        self.client
            .findInstrument(try .new(query: query, kind: kind, apiTradeAvailableFlag: apiTradeAvailableFlag))
            .response
            .flatMapThrowing {
                try $0.instruments.map { try $0.toModel() }
            }
    }
    
    func getBrandBy(uid: String) throws -> EventLoopFuture<Brand> {
        self.client
            .getBrandBy(.new(uid: uid))
            .response
            .map { $0.toModel() }
    }
    
    func getBrands() throws -> EventLoopFuture<[Brand]> {
        self.client
            .getBrands(.new())
            .response
            .map {
                $0.brands.map { $0.toModel() }
            }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func tradingSchedules(exchange: String, from: Date, to: Date) async throws -> [TradingSchedule] {
        try await self.client
            .tradingSchedules(.new(exchange: exchange, from: from, to: to))
            .exchanges
            .map { $0.toModel() }
    }
    
    func bondBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Bond {
        try await self.client
            .bondBy(try .new(idType: idType, classCode: classCode, id: id))
            .instrument
            .toModel()
    }
    
    func bonds(instrumentStatus: InstrumentStatus) async throws -> [Bond] {
        try await self.client
            .bonds(try .new(instrumentStatus: instrumentStatus))
            .instruments
            .map { try $0.toModel() }
    }
    
    func getBondCoupons(figi: String, from: Date, to: Date) async throws -> [Coupon] {
        try await self.client
            .getBondCoupons(.new(figi: figi, from: from, to: to))
            .events
            .map { try $0.toModel() }
    }
    
    func currencyBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Currency {
        try await self.client
            .currencyBy(try .new(idType: idType, classCode: classCode, id: id))
            .instrument
            .toModel()
    }
    
    func currencies(instrumentStatus: InstrumentStatus) async throws -> [Currency] {
        try await self.client
            .currencies(try .new(instrumentStatus: instrumentStatus))
            .instruments
            .map { try $0.toModel() }
    }
    
    func etfBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Etf {
        try await self.client
            .etfBy(try .new(idType: idType, classCode: classCode, id: id))
            .instrument
            .toModel()
    }
    
    func etfs(instrumentStatus: InstrumentStatus) async throws -> [Etf] {
        try await self.client
            .etfs(try .new(instrumentStatus: instrumentStatus))
            .instruments
            .map { try $0.toModel() }
    }
    
    func futureBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Future {
        try await self.client
            .futureBy(try .new(idType: idType, classCode: classCode, id: id))
            .instrument
            .toModel()
    }
    
    func futures(instrumentStatus: InstrumentStatus) async throws -> [Future] {
        try await self.client
            .futures(try .new(instrumentStatus: instrumentStatus))
            .instruments
            .map { try $0.toModel() }
    }
    
    func optionBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Option {
        try await self.client
            .optionBy(try .new(idType: idType, classCode: classCode, id: id))
            .instrument
            .toModel()
    }
    
    func options(instrumentStatus: InstrumentStatus) async throws -> [Option] {
        try await self.client
            .options(try .new(instrumentStatus: instrumentStatus))
            .instruments
            .map { try $0.toModel() }
    }
    
    func optionsBy(basicAssetUid: String, basicAssetPositionUid: String) async throws -> [Option] {
        try await self.client
            .optionsBy(.new(basicAssetUid: basicAssetUid, basicAssetPositionUid: basicAssetPositionUid))
            .instruments
            .map { try $0.toModel() }
    }
    
    func shareBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Share {
        try await self.client
            .shareBy(try .new(idType: idType, classCode: classCode, id: id))
            .instrument
            .toModel()
    }
    
    func shares(instrumentStatus: InstrumentStatus) async throws -> [Share] {
        try await self.client
            .shares(try .new(instrumentStatus: instrumentStatus))
            .instruments
            .map { try $0.toModel() }
    }
    
    func getAccruedInterests(figi: String, from: Date, to: Date) async throws -> [AccruedInterest] {
        try await self.client
            .getAccruedInterests(.new(figi: figi, from: from, to: to))
            .accruedInterests
            .map { $0.toModel() }
    }
    
    func getFutureContractMargin(figi: String) async throws -> FutureContractMargin {
        try await self.client
            .getFuturesMargin(.new(figi: figi))
            .toModel()
    }
    
    func getInstrumentBy(idType: InstrumentIdType, classCode: String, id: String) async throws -> Instrument {
        try await self.client
            .getInstrumentBy(try .new(idType: idType, classCode: classCode, id: id))
            .instrument
            .toModel()
    }
    
    func getDividends(figi: String, from: Date, to: Date) async throws -> [Dividend] {
        try await self.client
            .getDividends(.new(figi: figi, from: from, to: to))
            .dividends
            .map { $0.toModel() }
    }
    
    func getAssetBy(uid: String) async throws -> AssetFull {
        try await self.client
            .getAssetBy(.new(uid: uid))
            .asset
            .toModel()
    }
    
    func getAssets(kind: InstrumentKind) async throws -> [Asset] {
        try await self.client
            .getAssets(try .new(kind: kind))
            .assets
            .map { try $0.toModel() }
    }
    
    func getFavorites() async throws -> [FavoriteInstrument] {
        try await self.client
            .getFavorites(.new())
            .favoriteInstruments
            .map { try $0.toModel() }
    }
    
    func editFavorites(figis: [String], action: FavoriteActionType) async throws -> [FavoriteInstrument] {
        try await self.client
            .editFavorites(try .new(figis: figis, action: action))
            .favoriteInstruments
            .map { try $0.toModel() }
    }
    
    func getCountries() async throws -> [Country] {
        try await self.client
            .getCountries(.new())
            .countries
            .map { $0.toModel() }
    }
    
    func findInstrument(query: String, kind: InstrumentKind, apiTradeAvailableFlag: Bool) async throws -> [InstrumentShort] {
        try await self.client
            .findInstrument(try .new(query: query, kind: kind, apiTradeAvailableFlag: apiTradeAvailableFlag))
            .instruments
            .map { try $0.toModel() }
    }
    
    func getBrandBy(uid: String) async throws -> Brand {
        try await self.client
            .getBrandBy(.new(uid: uid))
            .toModel()
    }
    
    func getBrands() async throws -> [Brand] {
        try await self.client
            .getBrands(.new())
            .brands
            .map { $0.toModel() }
    }
    
    func getAssetFundamentals(assets: [String]) async throws -> [AssetFundamentals] {
        try await self.client
            .getAssetFundamentals(.new())
            .fundamentals
            .map { $0.toModel() }
    }
    
    func getAssetReports(uid: String, from: Date, to: Date) async throws -> [AssetReport] {
        try await self.client
            .getAssetReports(.new())
            .events
            .map { $0.toModel() }
    }
    
    func getConsensusForecasts() async throws -> [ConsensusForecasts] {
        typealias Request = Tinkoff_Public_Invest_Api_Contract_V1_GetConsensusForecastsRequest

        var result = [ConsensusForecasts]()
        
        var request = Request.new(
            limit: 10000,
            pageNumber: 0
        )
        
        var proceed = true
        while proceed {
            let response = try await self.client.getConsensusForecasts(request)
            result.append(contentsOf: response.items.map { $0.toModel() })
            proceed = result.count < response.page.totalCount
            request.paging.pageNumber += 1
        }

        return result
    }
#endif
}
