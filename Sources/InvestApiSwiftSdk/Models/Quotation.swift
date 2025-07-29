import Foundation

/// Котировка - денежная сумма без указания валюты.
public struct Quotation: Codable, Sendable {
    /// Целая часть суммы, может быть отрицательным числом.
    public let units: Int64
    
    /// Дробная часть суммы, может быть отрицательным числом.
    public let nano: Int32
    
    public init(units: Int64, nano: Int32) {
        self.units = units
        self.nano = nano
    }
    
    public init(doubleValue: Double) {
        self.init(units: doubleValue.units, nano: doubleValue.nano)
    }
}

public extension Quotation {
    func toDouble() -> Double {
        return Double(units) + Double(nano) / nanoFactor;
    }
}

public extension Quotation {
    /// Направление округления.
    enum RoundingMode {
        case up
        case down
    }
    
    fileprivate enum Operation {
        case increase
        case decrease
    }
    
    /// Увеличивает данную сумму на указанный процент.
    ///
    /// - Parameter percentage: Величина процента, на которую необходимо увеличить данную сумму.
    ///
    /// - Returns: Сумма увеличенная на указанный процент `Quotation`.
    func increaseBy(percentage: Double) -> Self {
        increaseBy(percentage: percentage, priceStep: 0)
    }
    
    /// Увеличивает данную сумму на указанный процент.
    ///
    /// - Parameters:
    ///     - percentage: Величина процента, на которую необходимо увеличить данную сумму.
    ///     - priceStep: Минимальный шаг цены, с учетом которого необходимо произвести округление результата.
    ///     - rounding: Направление округления (по умолчанию .down).
    ///
    /// - Returns: Сумма увеличенная на указанный процент `Quotation`.
    func increaseBy(percentage: Double, priceStep: Quotation, rounding: RoundingMode = .down) -> Self {
        return increaseBy(percentage: percentage, priceStep: priceStep.toDouble(), rounding: rounding)
    }
    
    /// Увеличивает данную сумму на указанный процент.
    ///
    /// - Parameters:
    ///     - percentage: Величина процента, на которую необходимо увеличить данную сумму.
    ///     - priceStep: Минимальный шаг цены, с учетом которого необходимо произвести округление результата.
    ///     - rounding: Направление округления (по умолчанию .down).
    ///
    /// - Returns: Сумма увеличенная на указанный процент `Quotation`.
    func increaseBy(percentage: Double, priceStep: Double, rounding: RoundingMode = .down) -> Self {
        let doubleValue = applyOperation(operation: .increase, percentage: percentage)
        if priceStep == 0 {
            return Quotation(doubleValue: doubleValue)
        }
        return roundValue(doubleValue: doubleValue, priceStep: priceStep, rounding: rounding)
    }
    
    /// Уменьшает данную сумму на указанный процент.
    ///
    /// - Parameter percentage: Величина процента, на которую необходимо уменьшить данную сумму.
    ///
    /// - Returns: Сумма уменьшенная на указанный процент `Quotation`.
    func decreaseBy(percentage: Double) -> Self {
        decreaseBy(percentage: percentage, priceStep: 0)
    }
    
    /// Уменьшает данную сумму на указанный процент.
    ///
    /// - Parameters:
    ///     - percentage: Величина процента, на которую необходимо уменьшить данную сумму.
    ///     - priceStep: Минимальный шаг цены, с учетом которого необходимо произвести округление результата.
    ///     - rounding: Направление округления (по умолчанию .down).
    ///
    /// - Returns: Сумма уменьшенная на указанный процент `Quotation`.
    func decreaseBy(percentage: Double, priceStep: Quotation, rounding: RoundingMode = .down) -> Self {
        return decreaseBy(percentage: percentage, priceStep: priceStep.toDouble(), rounding: rounding)
    }
    
    /// Уменьшает данную сумму на указанный процент.
    ///
    /// - Parameters:
    ///     - percentage: Величина процента, на которую необходимо уменьшить данную сумму.
    ///     - priceStep: Минимальный шаг цены, с учетом которого необходимо произвести округление результата.
    ///     - rounding: Направление округления (по умолчанию .down).
    ///
    /// - Returns: Сумма уменьшенная на указанный процент `Quotation`.
    func decreaseBy(percentage: Double, priceStep: Double, rounding: RoundingMode = .down) -> Self {
        let doubleValue = applyOperation(operation: .decrease, percentage: percentage)
        if priceStep == 0 {
            return Quotation(doubleValue: doubleValue)
        }
        return roundValue(doubleValue: doubleValue, priceStep: priceStep, rounding: rounding)
    }
    
    private func applyOperation(operation: Quotation.Operation, percentage: Double) -> Double {
        let doubleValue = toDouble()
        let secondValue = (doubleValue / 100 * percentage)
        return operation == .increase ? doubleValue + secondValue : doubleValue - secondValue
    }
    
    private func roundValue(doubleValue: Double, priceStep: Double, rounding: RoundingMode) -> Quotation {
        let units = doubleValue.units
        let nano = doubleValue.nano
        let newNano = rounding == .down ? nano - nano % priceStep.nano : nano + (priceStep.nano - nano % priceStep.nano)
        return Quotation(
            units: newNano < 0 ? units - 1 : newNano < 1000000000 ? units : units + 1,
            nano: newNano < 0 ? 1000000000 + newNano : newNano < 1000000000 ? newNano : newNano - 1000000000
        )
    }
}

extension Quotation: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.units == rhs.units && lhs.nano == rhs.nano
    }
}

extension Quotation: Comparable {
    public static func < (lhs: Quotation, rhs: Quotation) -> Bool {
        lhs.units < rhs.units || lhs.units == rhs.units && lhs.nano < rhs.nano
    }
}

public extension Quotation {
    static func zero() -> Self {
        Quotation(units: 0, nano: 0)
    }
}

extension Quotation: CustomStringConvertible {
    public var description: String {
        return "\(toDouble())"
    }
}

internal extension Quotation {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Quotation) {
        self.units = grpcModel.units
        self.nano = grpcModel.nano
    }
    
    func forRequest() throws -> Tinkoff_Public_Invest_Api_Contract_V1_Quotation {
        try Tinkoff_Public_Invest_Api_Contract_V1_Quotation(
            jsonUTF8Data: JSONEncoder().encode(self)
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Quotation {
    func toModel() -> Quotation {
        Quotation(grpcModel: self)
    }
}

private let nanoFactor: Double = 1_000_000_000;
