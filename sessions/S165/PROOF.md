# S165 — genuine homotopy-equivalence primary transfer and adjacent-class detection

Entry main d214c72c95a444c3f68722f0e75bb720078d0997, after S164 ordinary two-parent PR #197 merge and independent hosted main Lean #40934137311 / integrity #40934137409 SUCCESS.

## Lean-certified mathematical scope

- `C4.ChainHomotopyEquivalence` stores two genuine chain maps and BOTH Mathlib homotopy-inverse comparisons; strict inverses are never required.
- `C4.transferPrimary` explicitly splices a middle comparison homotopy with the original primary filler, using endpoint relabelling rather than dependent casts. `ChainHomotopyEquivalence.transportPrimary` transports a nullhomotopy through arbitrary homotopy-equivalent objects.
- `ChainHomotopyEquivalence.reflectNull` constructs an original nullhomotopy from a nullhomotopy of the transported arrow. `transport_nonnull` follows.
- `FiveStagePrimaryData` and `FiveStagePrimaryData.transport` retain all FOUR independent chain maps and construct all THREE primary nullhomotopies on FIVE arbitrary homotopy-equivalent replacement complexes. `GlobalFourfoldDefiningSystem.toPrimaryData` and `canonicalTransferredPrimaries` connect the original C4 defining system to this result.
- `globalAdjacent_nonnull` proves from the true first-regular-component equation that residue one prevents a genuine adjacent global map from being nullhomotopic. `GlobalFourfoldDefiningSystem.adjacent_nonnull` applies this independently to all four arrows. `transferred_adjacent_nonnull` proves all four transferred arrows remain non-nullhomotopic under arbitrary genuine chain homotopy equivalences.

The last argument uses an exact degree-one coefficient obstruction, not a weakening to nonzero termwise maps. The replacement objects are arbitrary; no unjustified residue-one coordinates are attached to them.

## Still OPEN

This does NOT construct transferred degree-two secondary fillers with their corrected coherence equations, a transferred tertiary boundary, or a full square-zero-chain/global fourfold obstruction under every required comparison. It does NOT equate homotopy equivalence with arbitrary quasi-isomorphism zigzags. Free-quiver cone, coherent derived two-shift, whole-real shoelace/replacement on BOTH lanes, exact metric definitions/bounds and group-algebra presentation remain OPEN. No numerical headline theorem is declared.

The real diagram and global obstruction from S164 remain intact. No OptionD source was changed.
