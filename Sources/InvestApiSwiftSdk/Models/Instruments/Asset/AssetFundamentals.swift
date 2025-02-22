import Foundation

public protocol AssetFundamentals {
    ///Идентификатор актива.
    var assetUid: String { get }
    
    ///Валюта.
    var currency: String { get }
    
    ///Рыночная капитализация.
    var marketCapitalization: Double { get }
    
    ///Максимум за год.
    var highPriceLast52Weeks: Double { get }
    
    ///Минимум за год.
    var lowPriceLast52Weeks: Double { get }
    
    ///Средний объем торгов за 10 дней.
    var averageDailyVolumeLast10Days: Double { get }
    
    ///Средний объем торгов за месяц.
    var averageDailyVolumeLast4Weeks: Double { get }
    
    var beta: Double { get }
    
    ///Доля акций в свободном обращении.
    var freeFloat: Double { get }
    
    ///Процент форвардной дивидендной доходности по отношению к цене акций.
    var forwardAnnualDividendYield: Double { get }
    
    ///Количество акций в обращении.
    var sharesOutstanding: Double { get }
    
    ///Выручка.
    var revenueTtm: Double { get }
    
    ///EBITDA — прибыль до вычета процентов, налогов, износа и амортизации.
    var ebitdaTtm: Double { get }
    
    ///Чистая прибыль.
    var netIncomeTtm: Double { get }
    
    ///EPS — величина чистой прибыли компании, которая приходится на каждую обыкновенную акцию.
    var epsTtm: Double { get }
    
    ///EPS компании с допущением, что все конвертируемые ценные бумаги компании были сконвертированы в обыкновенные акции.
    var dilutedEpsTtm: Double { get }
    
    ///Свободный денежный поток.
    var freeCashFlowTtm: Double { get }
    
    ///Среднегодовой  рocт выручки за 5 лет.
    var fiveYearAnnualRevenueGrowthRate: Double { get }
    
    ///Среднегодовой  рocт выручки за 3 года.
    var threeYearAnnualRevenueGrowthRate: Double { get }
    
    ///Соотношение рыночной капитализации компании к ее чистой прибыли.
    var peRatioTtm: Double { get }
    
    ///Соотношение рыночной капитализации компании к ее выручке.
    var priceToSalesTtm: Double { get }
    
    ///Соотношение рыночной капитализации компании к ее балансовой стоимости.
    var priceToBookTtm: Double { get }
    
    ///Соотношение рыночной капитализации компании к ее свободному денежному потоку.
    var priceToFreeCashFlowTtm: Double { get }
    
    ///Рыночная стоимость компании.
    var totalEnterpriseValueMrq: Double { get }
    
    ///Соотношение EV и EBITDA.
    var evToEbitdaMrq: Double { get }
    
    ///Маржа чистой прибыли.
    var netMarginMrq: Double { get }
    
    ///Рентабельность чистой прибыли.
    var netInterestMarginMrq: Double { get }
    
    ///Рентабельность собственного капитала.
    var roe: Double { get }
    
    ///Рентабельность активов.
    var roa: Double { get }
    
    ///Рентабельность активов.
    var roic: Double { get }
    
    ///Сумма краткосрочных и долгосрочных обязательств компании.
    var totalDebtMrq: Double { get }
    
    ///Соотношение долга к собственному капиталу.
    var totalDebtToEquityMrq: Double { get }
    
    ///Total Debt/EBITDA.
    var totalDebtToEbitdaMrq: Double { get }
    
    ///Отношение свободногоо кэша к стоимости.
    var freeCashFlowToPrice: Double { get }
    
    ///Отношение чистого долга к EBITDA.
    var netDebtToEbitda: Double { get }
    
    ///Коэффициент текущей ликвидности.
    var currentRatioMrq: Double { get }
    
    ///Коэффициент покрытия фиксированных платежей — FCCR.
    var fixedChargeCoverageRatioFy: Double { get }
    
    ///Дивидендная доходность за 12 месяцев.
    var dividendYieldDailyTtm: Double { get }
    
    ///Выплаченные дивиденды за 12 месяцев.
    var dividendRateTtm: Double { get }
    
    ///Значение дивидендов на акцию.
    var dividendsPerShare: Double { get }
    
    ///Средняя дивидендная доходность за 5 лет.
    var fiveYearsAverageDividendYield: Double { get }
    
    ///Среднегодовой рост дивидендов за 5 лет.
    var fiveYearAnnualDividendGrowthRate: Double { get }
    
    ///Процент чистой прибыли, уходящий на выплату дивидендов.
    var dividendPayoutRatioFy: Double { get }
    
    ///Деньги, потраченные на обратный выкуп акций.
    var buyBackTtm: Double { get }
    
    ///Рост выручки за 1 год.
    var oneYearAnnualRevenueGrowthRate: Double { get }
    
    ///Код страны.
    var domicileIndicatorCode: String { get }
    
    ///Соотношение депозитарной расписки к акциям.
    var adrToCommonShareRatio: Double { get }
    
    ///Количество сотрудников.
    var numberOfEmployees: Double { get }
    
    var exDividendDate: Date { get }
    
    ///Начало фискального периода.
    var fiscalPeriodStartDate: Date { get }

    ///Окончание фискального периода.
    var fiscalPeriodEndDate:  Date { get }

    ///Изменение общего дохода за 5 лет.
    var revenueChangeFiveYears: Double { get }
    
    ///Изменение EPS за 5 лет.
    var epsChangeFiveYears: Double { get }
    
    ///Изменение EBIDTA за 5 лет.
    var ebitdaChangeFiveYears: Double { get }
    
    ///Изменение общей задолжности за 5 лет.
    var totalDebtChangeFiveYears: Double { get }
    
    ///Отношение EV к выручке.
    var evToSales: Double { get }
}

internal struct AssetFundamentalsModel: AssetFundamentals {
    var assetUid: String
    
    var currency: String
    
    var marketCapitalization: Double
    
    var highPriceLast52Weeks: Double
    
    var lowPriceLast52Weeks: Double
    
    var averageDailyVolumeLast10Days: Double
    
    var averageDailyVolumeLast4Weeks: Double
    
    var beta: Double
    
    var freeFloat: Double
    
    var forwardAnnualDividendYield: Double
    
    var sharesOutstanding: Double
    
    var revenueTtm: Double
    
    var ebitdaTtm: Double
    
    var netIncomeTtm: Double
    
    var epsTtm: Double
    
    var dilutedEpsTtm: Double
    
    var freeCashFlowTtm: Double
    
    var fiveYearAnnualRevenueGrowthRate: Double
    
    var threeYearAnnualRevenueGrowthRate: Double
    
    var peRatioTtm: Double
    
    var priceToSalesTtm: Double
    
    var priceToBookTtm: Double
    
    var priceToFreeCashFlowTtm: Double
    
    var totalEnterpriseValueMrq: Double
    
    var evToEbitdaMrq: Double
    
    var netMarginMrq: Double
    
    var netInterestMarginMrq: Double
    
    var roe: Double
    
    var roa: Double
    
    var roic: Double
    
    var totalDebtMrq: Double
    
    var totalDebtToEquityMrq: Double
    
    var totalDebtToEbitdaMrq: Double
    
    var freeCashFlowToPrice: Double
    
    var netDebtToEbitda: Double
    
    var currentRatioMrq: Double
    
    var fixedChargeCoverageRatioFy: Double
    
    var dividendYieldDailyTtm: Double
    
    var dividendRateTtm: Double
    
    var dividendsPerShare: Double
    
    var fiveYearsAverageDividendYield: Double
    
    var fiveYearAnnualDividendGrowthRate: Double
    
    var dividendPayoutRatioFy: Double
    
    var buyBackTtm: Double
    
    var oneYearAnnualRevenueGrowthRate: Double
    
    var domicileIndicatorCode: String
    
    var adrToCommonShareRatio: Double
    
    var numberOfEmployees: Double
    
    var exDividendDate: Date
    
    var fiscalPeriodStartDate: Date
    
    var fiscalPeriodEndDate: Date
    
    var revenueChangeFiveYears: Double
    
    var epsChangeFiveYears: Double
    
    var ebitdaChangeFiveYears: Double
    
    var totalDebtChangeFiveYears: Double
    
    var evToSales: Double
    
}

internal extension AssetFundamentalsModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetAssetFundamentalsResponse.StatisticResponse) {
        assetUid = grpcModel.assetUid
        
        currency = grpcModel.currency
        
        marketCapitalization = grpcModel.marketCapitalization
        
        highPriceLast52Weeks = grpcModel.highPriceLast52Weeks
        
        lowPriceLast52Weeks = grpcModel.lowPriceLast52Weeks
        
        averageDailyVolumeLast10Days = grpcModel.averageDailyVolumeLast10Days
        
        averageDailyVolumeLast4Weeks = grpcModel.averageDailyVolumeLast4Weeks
        
        beta = grpcModel.beta
        
        freeFloat = grpcModel.freeFloat
        
        forwardAnnualDividendYield = grpcModel.forwardAnnualDividendYield
        
        sharesOutstanding = grpcModel.sharesOutstanding
        
        revenueTtm = grpcModel.revenueTtm
        
        ebitdaTtm = grpcModel.ebitdaTtm
        
        netIncomeTtm = grpcModel.netIncomeTtm
        
        epsTtm = grpcModel.epsTtm
        
        dilutedEpsTtm = grpcModel.dilutedEpsTtm
        
        freeCashFlowTtm = grpcModel.freeCashFlowTtm
        
        fiveYearAnnualRevenueGrowthRate = grpcModel.fiveYearAnnualRevenueGrowthRate
        
        threeYearAnnualRevenueGrowthRate = grpcModel.threeYearAnnualRevenueGrowthRate
        
        peRatioTtm = grpcModel.peRatioTtm
        
        priceToSalesTtm = grpcModel.priceToSalesTtm
        
        priceToBookTtm = grpcModel.priceToBookTtm
        
        priceToFreeCashFlowTtm = grpcModel.priceToFreeCashFlowTtm
        
        totalEnterpriseValueMrq = grpcModel.totalEnterpriseValueMrq
        
        evToEbitdaMrq = grpcModel.evToEbitdaMrq
        
        netMarginMrq = grpcModel.netMarginMrq
        
        netInterestMarginMrq = grpcModel.netInterestMarginMrq
        
        roe = grpcModel.roe
        
        roa = grpcModel.roa
        
        roic = grpcModel.roic
        
        totalDebtMrq = grpcModel.totalDebtMrq
        
        totalDebtToEquityMrq = grpcModel.totalDebtToEquityMrq
        
        totalDebtToEbitdaMrq = grpcModel.totalDebtToEbitdaMrq
        
        freeCashFlowToPrice = grpcModel.freeCashFlowToPrice
        
        netDebtToEbitda = grpcModel.netDebtToEbitda
        
        currentRatioMrq = grpcModel.currentRatioMrq
        
        fixedChargeCoverageRatioFy = grpcModel.fixedChargeCoverageRatioFy
        
        dividendYieldDailyTtm = grpcModel.dividendYieldDailyTtm
        
        dividendRateTtm = grpcModel.dividendRateTtm
        
        dividendsPerShare = grpcModel.dividendsPerShare
        
        fiveYearsAverageDividendYield = grpcModel.fiveYearsAverageDividendYield
        
        fiveYearAnnualDividendGrowthRate = grpcModel.fiveYearAnnualDividendGrowthRate
        
        dividendPayoutRatioFy = grpcModel.dividendPayoutRatioFy
        
        buyBackTtm = grpcModel.buyBackTtm
        
        oneYearAnnualRevenueGrowthRate = grpcModel.oneYearAnnualRevenueGrowthRate
        
        domicileIndicatorCode = grpcModel.domicileIndicatorCode
        
        adrToCommonShareRatio = grpcModel.adrToCommonShareRatio
        
        numberOfEmployees = grpcModel.numberOfEmployees
        
        exDividendDate = grpcModel.exDividendDate.date
        
        fiscalPeriodStartDate = grpcModel.fiscalPeriodStartDate.date

        fiscalPeriodEndDate = grpcModel.fiscalPeriodEndDate.date

        revenueChangeFiveYears = grpcModel.revenueChangeFiveYears
        
        epsChangeFiveYears = grpcModel.epsChangeFiveYears
        
        ebitdaChangeFiveYears = grpcModel.ebitdaChangeFiveYears
        
        totalDebtChangeFiveYears = grpcModel.totalDebtChangeFiveYears
        
        evToSales = grpcModel.evToSales
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetAssetFundamentalsResponse.StatisticResponse {
    func toModel() -> AssetFundamentalsModel {
        AssetFundamentalsModel(grpcModel: self)
    }
}
