import Foundation

internal extension Double {
  var int32Value: Int32 { Int32(self) }
  var int64Value: Int64 { Int64(self) }

  /// Returns the integer part of the double (rounded toward zero).
  var wholePart: Double {
    self >= 0 ? floor(self) : ceil(self)
  }

  /// Integer part of the value, truncated to `Int64`.
  var units: Int64 {
    Int64(wholePart)
  }

  /// Nanoseconds part, extracted from the fractional part (scaled to 9 digits).
  var nano: Int32 {
    let fractional = self - wholePart
    return Int32((fractional * nanoFactor).rounded(.towardZero))
  }
}

private let nanoFactor: Double = 1_000_000_000
