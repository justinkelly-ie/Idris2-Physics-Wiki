# Physics ScaleTransform & Metric Quadrance Homomorphism Verification

```idris
module Wiki.PhysicsScaleTransformSpec

import Core.BoxInt
import Core.ScaleTransform
import Math.ActionPrinciple
import Math.FourGeometries
import Math.PhysicsScaleTransforms
import Wiki.Generators
import public QuickCheck

%default total
```

## QuickCheck Verification Properties

```idris
public export
prop_coordQuadranceNonNegative : Coord2D -> Bool
prop_coordQuadranceNonNegative c =
  let q : BoxInt = scaleTransform c
  in unwrapBox q >= 0

public export
prop_coordQuadranceMatchesFormula : Coord2D -> Bool
prop_coordQuadranceMatchesFormula coord@(MkCoord2D x y) =
  let q : BoxInt = scaleTransform coord
      expected = (x * x) + (y * y)
  in q == expected

public export
prop_eulerLagrangeGeodesicValid : Bool
prop_eulerLagrangeGeodesicValid = auditDiscreteEulerLagrangeEquivalenceProof

public export
prop_leastActionGeodesicValid : Bool
prop_leastActionGeodesicValid = auditGeodesicLeastActionOptimalityProof

public export
auditPhysicsScaleTransformSpecProof : IO Bool
auditPhysicsScaleTransformSpecProof = do
  let r1 = qc prop_coordQuadranceNonNegative
  let r2 = qc prop_coordQuadranceMatchesFormula
  pure (r1.pass == Just True && r2.pass == Just True)
```
