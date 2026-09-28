# observation-point-pinning

Replication package for the paper:

**观察点钉扎：静参考架从确认网络的显化——公理化构造 / Observation-Point Pinning: The Static Reference Frame as Manifested from a Confirming Network — An Axiomatic Construction**

- Paper (CN + EN): DOI [10.5281/zenodo.23015246](https://doi.org/10.5281/zenodo.23015246) (concept 10.5281/zenodo.23015245)
- Predecessor (Pairing structure): DOI [10.5281/zenodo.23013940](https://doi.org/10.5281/zenodo.23013940)

## What is formalized

The static reference frame as a structure manifested from a network of observation points:
each observation point is an instance of the pairing structure (idempotent confirming
action x discrete constraint readout); mutual reading = pairwise commutation; the fixed
points of the network's joint composition are the manifested static. Four formalized faces:

| Lean file | Paper section | Content | Items |
|---|---|---|---|
| `DualityPairing.lean` | predecessor [2] | Pairing structure (axiom form) | predecessor |
| `DualityRatio.lean` | predecessor | readout-ratio bridge (T_chi3 dependency) | dependency |
| `DualityPinning.lean` | §3 | pinning core T_P1–T_P5 + derivable-chain-two T_L1/T_L2 ("1 point: all moving" formal core) | 7 |
| `DualityNet.lean` | §4–§5 | network core T_N0–T_N9 (order independence: a network is a set, not a sequence) + discrete chain [8,4,2,1,1] | 25 (proposition-item accounting) |
| `PinningDim.lean` | §7.1 | dimension semantics: pinning dim = k−1, saturation at k = dim+1, chirality via det sign | 6 |
| `ObservationDims.lean` | §7.2 | ℝ² instantiation: readout uniqueness, 4 points affinely dependent (card ≤ dim+1) | 12 |
| `DualityIdem.lean` | §8 | idempotent family: one-step collapse, counterexample items | 4 |

**Verified claim**: `lake build` on this trimmed root passes with **zero sorry** across all
seven files; `#print axioms` on every theorem stays within the standard three
(`propext`, `Classical.choice`, `Quot.sound`). Full library: 61 theorem declarations
(52 items under the proposition-item accounting), build 8706–8707 jobs in-framework.

## How to reproduce

```bash
cd lean
lake build        # Lean 4 / Leanprover  v4.33.1, Mathlib v4.33.1 (pinned)
```

- Toolchain pinned: `leanprover/lean4:v4.33.1` (`lean-toolchain`), Mathlib rev pinned in `lakefile.toml`.
- This root imports only the seven pinning-line files (the full in-framework library is 42 files).
- To check axioms of any theorem, append `#print axioms <name>` and rebuild.

## replication/ (quantitative physical face, paper §9)

- `钉扎_双原子绕轴冻结能标_预注册_v0.1.md` — pre-registered criteria (C-1/C-2/C-3), locked before computation
- `钉扎_双原子绕轴冻结能标_计算_v0.1.json` — machine computation record (CODATA-2018 constants, cgs)
- `钉扎_双原子绕轴冻结能标_结果_v0.1.md` — results: HCl two-axis energy-scale separation 1451×
  (E⊥(J=1) = 30.5 K active vs E_axis(J=1) ≈ 44,000 K frozen); B⊥ conversion self-consistent to 0.05%
  against NIST CCCBDB B = 10.59342 cm⁻¹ (citation code 1979HUB/HER)

**Source-data policy**: all physical constants are either CODATA-2018 (computation) or
first-hand transcribed from NIST CCCBDB (data anchor); zero values from model memory.

## License

- Code (`lean/`): MIT
- Documents (`replication/`, README): CC-BY-4.0
