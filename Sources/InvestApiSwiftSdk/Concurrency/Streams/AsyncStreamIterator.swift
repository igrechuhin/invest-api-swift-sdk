#if compiler(>=5.5) && canImport(_Concurrency)
import GRPC

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct AsyncStreamIterator<
    StreamResponse: Sendable,
    ServiceResponse
>: AsyncIteratorProtocol {
    public typealias Element = ServiceResponse
    
    private let mapper: (StreamResponse?) -> ServiceResponse
    private var iterator: GRPCAsyncResponseStream<StreamResponse>.Iterator

    init(
        iterator: GRPCAsyncResponseStream<StreamResponse>.Iterator,
        mapper: @escaping (StreamResponse?) -> ServiceResponse
    ) {
        self.iterator = iterator
        self.mapper = mapper
    }
    
    public mutating func next() async throws -> ServiceResponse? {
        // Check for cancellation
        if Task.isCancelled {
            return nil
        }

        do {
            let response = try await iterator.next()
            return mapper(response)
        } catch is CancellationError {
            return nil
        } catch {
            throw error
        }
    }
}
#endif
