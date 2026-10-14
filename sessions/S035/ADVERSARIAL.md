# S035 — adversarial proof and priority ledger

## Attack register and dispositions

A1. **Incorrect use of pointwise Ho nullity.** A morphism in Ho(Top^[1]) carries coherence of its commuting square. Derived mapping homotopy pullback explicitly detects this. Counterexample: theta's two vertical maps vanish separately but theta itself does not (T75). PASS internal, external referee outstanding.

A2. **Overreading LS Prop3.10/3.12.** They establish HC-vs-HI, not automatically HC-vs-IHC; S035 adds the strict derived-arrow nullity test. LS *v1* had already anticipated adapting the proof, limiting method novelty. No new source novelty claim.

A3. **Pointed/unpointed leak.** π1 and π0 of relevant mapping spaces are preserved on forgetting the basepoint because target S3 has π1=π2=0. This would be unsafe for a merely simply connected target with π2!=0.

A4. **IHC factors through point but not zero in arrow category?** The derived mapping space Map(point-arrow,B) has π0=π0(B0)=*, as B0=S3. This establishes zero of the factorization; evaluation at the two vertices alone would not.

A5. **Interleaving identities/naturality.** HC construction checks both F/G composite identities at every index. IHC contradiction uses one required identity plus restriction to the full arrow 0<1 (not two disconnected evaluations). For eps<1 use monotonicity. At eps=3/2 no lower claim.

A6. **Natural transformation homotopy model.** Homotopy pullback formula for the arrow indexing category is a standard derived mapping-space fact, not a direct product. Should receive a separate theorem-level outside referee with careful projective-cofibrant replacement. No Lean or machine certification.

A7. **Literature false novelty.** Original LS final Remark3.13 open in 2023; v1 preprint authors explicitly proposed the intermediate HC/IHC separation, so conjecture/strategy priority is theirs. 2026 Springer dg-module equality concerns different model category; 2026 relative Sullivan CDGAs likewise. Search limited, no exhaustive priority clearance.

A8. **Complexity reserve.** Expanded N×r SNF bound not binary succinct k1 nonprincipal rectangle algorithm. No claimed P/hardness reduction.

A9. **Stage-check executable.** First local harness incorrectly tested stage for F rather than G and failed; corrected source rerun PASS. This computer check covers only sampled rational time-index stages. Toda and mapping-space proof are mathematical, not certified by code.

**Gate outcome:** credible internally complete proof candidate of a source-stated open strictness comparison, first novelty gate still NOT STARTED; outside referee and bibliography mandatory before selecting a HHA manuscript flagship.
