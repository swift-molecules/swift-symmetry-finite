import Cardinal
import Finite_Ordinal
import Ordinal
import Symmetry
import Symmetry_Finite
import Testing

@Suite
struct `Symmetry Finite Tests` {

    @Test
    func `Phase reports its finite cardinality`() {
        #expect(Phase.count == Cardinal(4))
        #expect(Phase.allCases.count == 4)
    }

    @Test
    func `Phase cases map to consecutive ordinals`() {
        #expect(Phase.zero.ordinal == Ordinal(0))
        #expect(Phase.quarter.ordinal == Ordinal(1))
        #expect(Phase.half.ordinal == Ordinal(2))
        #expect(Phase.threeQuarter.ordinal == Ordinal(3))
    }

    @Test
    func `valid ordinals reconstruct Phase cases`() {
        #expect(Phase(Ordinal(0)) == .zero)
        #expect(Phase(Ordinal(1)) == .quarter)
        #expect(Phase(Ordinal(2)) == .half)
        #expect(Phase(Ordinal(3)) == .threeQuarter)
    }

    @Test
    func `out of range ordinal is rejected`() {
        #expect(Phase(Ordinal(4)) == nil)
    }
}
