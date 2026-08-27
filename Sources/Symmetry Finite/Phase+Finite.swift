internal import Cardinal
public import Finite
import Ordinal
public import Symmetry

extension Phase: Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { 4 }

    @inlinable
    public var ordinal: Ordinal { Ordinal(UInt(rawValue)) }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        guard let value = Phase(rawValue: Int(ordinal.rawValue)) else {
            preconditionFailure("Phase ordinal is always in 0...3")
        }
        self = value
    }
}
