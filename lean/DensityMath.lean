/- Observation-point-pinning minimal build root.
   This is a trimmed root importing only the pinning-line files so that
   `lake build` reproduces the zero-sorry claims without the full 42-file library.
   Full library: density-math (in-framework repository).
   Toolchain: leanprover/lean4:v4.33.1 with Mathlib v4.33.1 (pinned in lakefile.toml). -/
import Mathlib
import DensityMath.DualityPairing
import DensityMath.DualityRatio
import DensityMath.DualityPinning
import DensityMath.DualityNet
import DensityMath.PinningDim
import DensityMath.ObservationDims
import DensityMath.DualityIdem
