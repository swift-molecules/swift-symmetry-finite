# swift-symmetry-finite

Use this package when you need `Phase` to be a `Finite.Enumerable`, for example to number its values, enumerate them through the finite protocol, or hold one in a type that uses `@Finite`. For `Phase` itself, use swift-symmetry.

## Laws

- `Phase` has four values, and its ordinals are its quarter turns: `Phase.zero` is 0, `Phase.quarter` is 1, `Phase.half` is 2 and `Phase.threeQuarter` is 3.
- Making a `Phase` from an ordinal of 4 or more gives nil.
