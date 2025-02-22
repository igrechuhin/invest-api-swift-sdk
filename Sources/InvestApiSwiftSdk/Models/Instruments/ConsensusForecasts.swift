import Foundation

public protocol ConsensusForecasts {
    /// UID-идентификатор.
    var uid: String { get }

    /// UID-идентификатор актива.
    var assetUid: String { get }
    
    /// Дата и время создания записи.
    var createdAt: Date { get }

    /// Целевая цена на 12 месяцев.
    var bestTargetPrice: Quotation { get }
    
    /// Минимальная прогнозная цена.
    var bestTargetLow: Quotation { get }

    /// Максимальная прогнозная цена.
    var bestTargetHigh: Quotation { get }
    
    /// Количество аналитиков рекомендующих покупать.
    var totalBuyRecommend: Int32 { get }
    
    /// Количество аналитиков рекомендующих держать.
    var totalHoldRecommend: Int32 { get }
    
    /// Количество аналитиков рекомендующих продавать.
    var totalSellRecommend: Int32 { get }
    
    /// Валюта прогнозов инструмента.
    var currency: String { get }
    
    /// Консенсус-прогноз.
    var consensus: Recommendation { get }
    
    /// Дата прогноза.
    var prognosisDate: Date { get }
}

internal struct ConsensusForecastsModel: ConsensusForecasts {
    var uid: String
    
    var assetUid: String
    
    var createdAt: Date
    
    var bestTargetPrice: Quotation
    
    var bestTargetLow: Quotation
    
    var bestTargetHigh: Quotation
    
    var totalBuyRecommend: Int32
    
    var totalHoldRecommend: Int32
    
    var totalSellRecommend: Int32
    
    var currency: String
    
    var consensus: Recommendation
    
    var prognosisDate: Date
}

internal extension ConsensusForecastsModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetConsensusForecastsResponse.ConsensusForecastsItem) {
        uid = grpcModel.uid
        
        assetUid = grpcModel.assetUid
        
        createdAt = grpcModel.createdAt.date
        
        bestTargetPrice = grpcModel.bestTargetPrice.toModel()
        
        bestTargetLow = grpcModel.bestTargetLow.toModel()
        
        bestTargetHigh = grpcModel.bestTargetHigh.toModel()
        
        totalBuyRecommend = grpcModel.totalBuyRecommend
        
        totalHoldRecommend = grpcModel.totalHoldRecommend
        
        totalSellRecommend = grpcModel.totalSellRecommend
        
        currency = grpcModel.currency
        
        consensus = grpcModel.consensus
        
        prognosisDate = grpcModel.prognosisDate.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetConsensusForecastsResponse.ConsensusForecastsItem {
    func toModel() -> ConsensusForecastsModel {
        ConsensusForecastsModel(grpcModel: self)
    }
}
