import GRPC

internal struct MarketDataStreamServiceClientInterceptorFactory:
        Tinkoff_Public_Invest_Api_Contract_V1_MarketDataStreamServiceClientInterceptorFactoryProtocol {
    
    func makeMarketDataStreamInterceptors() ->
        [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest,
            Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse>]
    {
        return []
    }

    func makeMarketDataServerSideStreamInterceptors() ->
        [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_MarketDataServerSideStreamRequest,
            Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse>]
    {
        return []
    }
}
