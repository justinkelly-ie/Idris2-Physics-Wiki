# Physical Law Functor & Homomorphism Verification

```idris
module Wiki.LawHomomorphismSpec

import Core.BoxInt
import Core.ScaleTransform
import Math.ActionPrinciple
import Math.FourGeometries
import Math.PhysicsScaleTransforms
import Math.LawFunctor
import Math.ApplicativeHomomorphism
import Wiki.Generators
import public QuickCheck
import Math.Multiset

import Language.Reflection

%default total

public export
%macro
auditInvariant : (prop : Bool) -> Elab (prop = True)
auditInvariant True = pure Refl
auditInvariant False = fail "Compile-time invariant audit failed!"

public export
0 staticProofApplicativeHomomorphismMaybeMultiset : prop_purePreservedOnMaybeToMultiset 42 = True
staticProofApplicativeHomomorphismMaybeMultiset = auditInvariant (prop_purePreservedOnMaybeToMultiset 42)

public export
0 staticProofApplicativeHomomorphismComposed : prop_purePreservedOnComposedIdMaybeMultiset 42 = True
staticProofApplicativeHomomorphismComposed = auditInvariant (prop_purePreservedOnComposedIdMaybeMultiset 42)
```

## QuickCheck Verification Properties

```idris
public export
prop_lawFunctorIdentityOnMultiset : List (Integer, Integer) -> Bool
prop_lawFunctorIdentityOnMultiset pairs =
  let ms = Math.Multiset.fromList (map (\(k, v) => (k, intToBoxInt v)) pairs)
  in prop_functorIdentity ms

public export
prop_lawFunctorCompositionOnMultiset : List (Integer, Integer) -> Bool
prop_lawFunctorCompositionOnMultiset pairs =
  let ms = Math.Multiset.fromList (map (\(k, v) => (k, intToBoxInt v)) pairs)
      f = (+ 1)
      g = (* 2)
  in prop_functorComposition g f ms

public export
prop_applicativeHomomorphismPureMaybeMultiset : Integer -> Bool
prop_applicativeHomomorphismPureMaybeMultiset x =
  prop_purePreservedOnMaybeToMultiset x

public export
prop_applicativeHomomorphismPureIdMultiset : Integer -> Bool
prop_applicativeHomomorphismPureIdMultiset x =
  prop_purePreservedOnIdToMultiset x

public export
prop_applicativeHomomorphismPureComposed : Integer -> Bool
prop_applicativeHomomorphismPureComposed x =
  prop_purePreservedOnComposedIdMaybeMultiset x

public export
auditLawHomomorphismSpecProof : IO Bool
auditLawHomomorphismSpecProof = do
  let r1 = qc prop_lawFunctorIdentityOnMultiset
  let r2 = qc prop_lawFunctorCompositionOnMultiset
  let r3 = qc prop_applicativeHomomorphismPureMaybeMultiset
  let r4 = qc prop_applicativeHomomorphismPureIdMultiset
  let r5 = qc prop_applicativeHomomorphismPureComposed
  pure (r1.pass == Just True && r2.pass == Just True && r3.pass == Just True && r4.pass == Just True && r5.pass == Just True)
```
