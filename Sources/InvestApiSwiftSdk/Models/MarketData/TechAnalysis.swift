import Foundation

/// Значения технического анализа.
public protocol TechAnalysis: Sendable {

    /// Временная метка по UTC, для которой были рассчитаны значения индикатора.
    var time: Date { get }
    
    /// Значение простого скользящего среднего (средней линии).
    var middleBand: Quotation { get }

    /// Значение верхней линии Боллинджера.
    var upperBand: Quotation { get }

    /// Значение нижней линии Боллинджера.
    var lowerBand: Quotation { get }

    /// Значение сигнальной линии.
    var signal: Quotation { get }

    /// Значение линии MACD.
    var macd: Quotation { get }
}

internal struct TechAnalysisModel: TechAnalysis {
    let time: Date
    
    let middleBand: Quotation

    let upperBand: Quotation

    let lowerBand: Quotation

    let signal: Quotation
    
    let macd: Quotation
}

internal extension TechAnalysisModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetTechAnalysisResponse.TechAnalysisItem) {
        self.time = grpcModel.timestamp.date
        self.middleBand = grpcModel.middleBand.toModel()
        self.upperBand = grpcModel.upperBand.toModel()
        self.lowerBand = grpcModel.lowerBand.toModel()
        self.signal = grpcModel.signal.toModel()
        self.macd = grpcModel.macd.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetTechAnalysisResponse.TechAnalysisItem {
    func toModel() -> TechAnalysisModel {
        TechAnalysisModel(grpcModel: self)
    }
}
