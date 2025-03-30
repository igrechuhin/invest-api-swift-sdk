import Foundation

public protocol AssetReport: Sendable {
    /// Идентификатор инструмента.
    var instrumentID: String { get }
    
    /// Дата публикации отчета.
    var reportDate: Date { get }
    
    /// Год периода отчета.
    var periodYear: Int32 { get }
    
    /// Номер периода.
    var periodNum: Int32 { get }
    
    /// Тип отчета.
    var periodType: AssetReportPeriodType { get }
    
    /// Дата создания записи.
    var createdAt: Date { get }
}

internal struct AssetReportModel: AssetReport {
    var instrumentID: String
    
    var reportDate: Date
    
    var periodYear: Int32
    
    var periodNum: Int32
    
    var periodType: AssetReportPeriodType
    
    var createdAt: Date
}

internal extension AssetReportModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetAssetReportsResponse.GetAssetReportsEvent) {
        instrumentID = grpcModel.instrumentID
        
        reportDate = grpcModel.reportDate.date
        
        periodYear = grpcModel.periodYear
        
        periodNum = grpcModel.periodNum
        
        periodType = grpcModel.periodType
        
        createdAt = grpcModel.createdAt.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetAssetReportsResponse.GetAssetReportsEvent {
    func toModel() -> AssetReportModel {
        AssetReportModel(grpcModel: self)
    }
}
