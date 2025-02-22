import GRPC

internal struct OrdersServiceClientInterceptorFactory:
    Tinkoff_Public_Invest_Api_Contract_V1_OrdersServiceClientInterceptorFactoryProtocol {
    func makePostOrderAsyncInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PostOrderAsyncRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostOrderAsyncResponse>] {
        return []
    }
    
    func makeGetMaxLotsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetMaxLotsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetMaxLotsResponse>] {
        return []
    }
    
    func makeGetOrderPriceInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetOrderPriceRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetOrderPriceResponse>] {
        return []
    }
    
    
    func makePostOrderInterceptors() ->
        [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PostOrderRequest,
            Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse>]
    {
        return []
    }

    func makeCancelOrderInterceptors() ->
        [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderRequest,
            Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderResponse>]
    {
        return []
    }

    func makeGetOrderStateInterceptors() ->
        [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetOrderStateRequest,
            Tinkoff_Public_Invest_Api_Contract_V1_OrderState>]
    {
        return []
    }

    func makeGetOrdersInterceptors() ->
        [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersRequest,
            Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersResponse>]
    {
        return []
    }

    func makeReplaceOrderInterceptors() ->
        [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_ReplaceOrderRequest,
            Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse>]
    {
        return []
    }
}
