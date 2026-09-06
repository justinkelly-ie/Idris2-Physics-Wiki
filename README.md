# Idris 2 Physics-Wiki

[![Idris 2 Verification](https://img.shields.io/badge/Idris_2-0.8.0-blue.svg)](https://www.idris-lang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Verification suite and literate documentation chapter for **Idris2-Physics**, implementing constructive physical laws and compile-time macro reflection proofs.

## Overview

`Idris2-Physics-Wiki` formalizes 44 fundamental constructive physical laws:

- **Discrete Action & Least Action Geodesics**: Euler-Lagrange residuals $g \cdot \Delta^2 x + \nabla V(x_k) = (0, 0)$ evaluated via `%macro` reflection tactics.
- **Metric ScaleTransforms**: Mapping discrete $2D/3D$ lattice coordinates to integer quadrance and metric entries without float approximation.
- **Category-Theoretic Law Functors**: Homomorphic law transforms $f_* \dashv f^*$ across multi-scale physical domains.

## Verification & Build

To compile the literate verification suite and execute the test runner binary:

```bash
idris2 --build Idris2-Physics-Wiki.ipkg
./build/exec/lphysics-wiki
```

## Related Repositories

- [Idris2-Physics](https://github.com/justinkelly-ie/Idris2-Physics)
- [Idris2-Hadron-Wiki](https://github.com/justinkelly-ie/Idris2-Hadron-Wiki)
- [Idris2-Universe-Wiki](https://github.com/justinkelly-ie/Idris2-Universe-Wiki)
