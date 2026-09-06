module Wiki.Main

import System
import Math.ActionPrinciple
import Wiki.PhysicsScaleTransformSpec
import Wiki.LawHomomorphismSpec
import Language.Reflection

%default total

0 prfAction1 : (Math.ActionPrinciple.auditDiscreteEulerLagrangeEquivalenceProof = True)
prfAction1 = auditDiscreteEulerLagrangeEquivalence

0 prfAction2 : (Math.ActionPrinciple.auditGeodesicLeastActionOptimalityProof = True)
prfAction2 = auditGeodesicLeastActionOptimality

main : IO ()
main = do
  putStrLn "========================================================"
  putStrLn "  IDRIS 2 PHYSICS WIKI VERIFICATION SUITE"
  putStrLn "========================================================"
  putStrLn "1. Discrete Action & Euler-Lagrange Geodesic Proof Audits:"
  if prop_eulerLagrangeGeodesicValid && prop_leastActionGeodesicValid
     then putStrLn "   [PASSED] Static Action & Geodesic Audits Clean!"
     else do
       putStrLn "   [FAILED] Geodesic Audits Failed!"
       exitWith (ExitFailure 1)
  putStrLn ""
  putStrLn "2. Physics ScaleTransform (Coord2D -> BoxInt) QuickCheck Specs:"
  p1 <- auditPhysicsScaleTransformSpecProof
  if p1
     then putStrLn "   [PASSED] ScaleTransform Metric Quadrance Verified!"
     else do
       putStrLn "   [FAILED] QuickCheck Specs Failed!"
       exitWith (ExitFailure 1)
  putStrLn ""
  putStrLn "3. Physical Law Functor & Category-Theoretic Homomorphism Specs:"
  p2 <- auditLawHomomorphismSpecProof
  if p2
     then putStrLn "   [PASSED] Physical Law Functor Category Laws Verified!"
     else do
       putStrLn "   [FAILED] Functor Category Laws Failed!"
       exitWith (ExitFailure 1)
  putStrLn "========================================================"
  putStrLn "  PHYSICS WIKI VERIFICATION COMPLETE: ALL PASSED!"
  putStrLn "========================================================"
