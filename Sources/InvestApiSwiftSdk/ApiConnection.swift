import GRPC
import NIOCore

internal struct ApiConnection {
    let target: ApiTarget
    let group: EventLoopGroup
    let channel: GRPCChannel
    
    init(target: ApiTarget) throws {
        self.target = target
        self.group = PlatformSupport.makeEventLoopGroup(loopCount: System.coreCount)
        self.channel = try GRPCChannelPool.with(
            target: .host(target.host, port: target.port),
            transportSecurity: .tls(.makeClientConfigurationBackedByNIOSSL()),
            eventLoopGroup: self.group
        ) { config in
            // Максимальный объём данных в сообщении, принимаемом от сервера
            config.maximumReceiveMessageLength = 8 * 1000000 // 8 МБ

            // Connection lifecycle management to prevent memory leaks
            config.idleTimeout = .seconds(30)
            config.keepalive = ClientConnectionKeepalive(
                interval: .seconds(15),
                timeout: .seconds(5),
                permitWithoutCalls: false
            )
        }
    }
    
    func close() {
        // Close the channel first
        _ = self.channel.close()
        
        // Properly shutdown the EventLoopGroup with error handling
        do {
            try self.group.syncShutdownGracefully()
        } catch {
            print("Error during EventLoopGroup shutdown: \(error)")
        }
    }
}
