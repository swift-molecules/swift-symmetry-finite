public import Cardinal
public import Finite
public import Finite_Ordinal
public import Ordinal
public import Symmetry

extension Phase: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { Cardinal(UInt(4)) }

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
