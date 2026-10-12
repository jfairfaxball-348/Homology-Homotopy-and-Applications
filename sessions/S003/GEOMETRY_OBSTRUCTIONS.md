# S003 geometry: proved dimension split lemma and two-parameter one-critical obstruction

## S003-T6 — top-degree subcomplex homology is primitive

**Statement.** For every finite CW subcomplex inclusion K subset L with dim L<=n (n>=1), the map H_n(K;Z) -> H_n(L;Z) is a split injection of finite-rank free abelian groups.

**Proof.** There are no (n+1)-cells, so H_n(K)=ker(d_n:C_n(K)->C_{n-1}(K)), H_n(L)=ker(d_n:C_n(L)->C_{n-1}(L)). The inclusion of relative cellular n-chains C_n(K) into C_n(L) is a direct-summand inclusion of free groups, coordinatewise on cells. The induced inclusion on cycles is injective. Its quotient is torsionfree: if a cycle z of L has m z in C_n(K) for m nonzero, then the class of z in the free group C_n(L)/C_n(K) is killed by m, so z itself belongs to C_n(K); its boundary vanishes already in K. Therefore the subgroup H_n(K) is saturated in the finitely generated free group H_n(L), hence is a direct summand. QED.

**Sharp consequences.** If every triple intersection in a finite nested 3-cover filtration is a **graph**, each B_t=H_1(U123,t) transition is split-injective, whether or not any U_i is a cone. Thus a nonsplit B transition forces at least one triple-intersection stage of dimension >=2. If each U1,t has dimension <=2, its H_2 transitions also must be split-injective; a nonsplit A transition requires U1 to possess cells of dimension >=3 at some stage. These restrictions are about the **geometry of the intersection spaces** and are not categorical restrictions on abstract persistence modules. They do not prove a 4D lower bound for all X in nonsplit cases.

## S003-T7 — a genuine bifiltration latching obstruction under an explicit intersection axiom

Take the four-element diamond P={(0,0),(1,0),(0,1),(1,1)}. Suppose connected finite **graph** subcomplexes T_p are nested for comparable indices, and in addition satisfy the one-critical intersection identity T_10 cap T_01=T_00 as actual subcomplexes. Let V=T_10 union T_01 subset T_11. Mayer–Vietoris for the connected subgraphs with connected intersection gives
0 -> H_1(T_00) -> H_1(T_10) direct-sum H_1(T_01) -> H_1(V) -> 0.
By T6, H_1(V) injects split into H_1(T_11). Therefore
rank B_11 >= rank B_10 + rank B_01 - rank B_00,
with B_p=H_1(T_p;Z); in fact the amalgamated homology H_1(V) is a primitive subgroup of B_11.

**Counterexample to universal one-critical graph realisation.** Set B_00=0 and B_10=B_01=B_11=Z; both outgoing maps B_10->B_11 and B_01->B_11 are identity, with zero maps out of B_00. This is a perfectly valid commuting-square diagram of split injections of free abelian groups. If it had the stated graph subcomplex realization with T_10 cap T_01=T_00, the bound would be 1>=1+1-0=2, absurd. This is a complete exact obstruction to the **restricted** geometric specification.

**Essential caution:** The ordinary bifiltration condition only says T_00 subset T_10 cap T_01. It need not impose equality. If T_10=T_01=T_11=S1 and T_00=point, the same B diagram is realizable with *extra* overlap. Therefore this is NOT a no-go theorem for arbitrary two-parameter three-covers. The condition is relevant to cellwise one-critical bifiltrations, in which each cell has a single minimal grade and intersections at incomparable grades equal their meet. Extending the obstruction beyond graph T and beyond one-critical intersections remains open in this dossier.

**No computational enumeration.** All claims above are symbolic cellular/Mayer–Vietoris arguments.
