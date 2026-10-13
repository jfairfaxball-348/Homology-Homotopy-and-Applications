# S028 full finite objects

Common source K2, every facet below sorted lexicographically; no additional facets. The vertex map f2 takes the first character; f0 is constant a. Source vertices are the 20 labels in the table. Target Q has all nonempty proper faces of [a,b,c,d].

| Source vertex | f2 | f0 |
| --- | --- | --- |
| a0_L | a | a |
| a1_L | a | a |
| a2_L | a | a |
| a2_R | a | a |
| b0_L | b | a |
| b0_R | b | a |
| b1_L | b | a |
| b2_L | b | a |
| b2_R | b | a |
| c0_L | c | a |
| c0_R | c | a |
| c1_L | c | a |
| c2_L | c | a |
| c2_R | c | a |
| d0_L | d | a |
| d0_R | d | a |
| d1_L | d | a |
| d1_R | d | a |
| d2_L | d | a |
| d2_R | d | a |

```text
a0_L a1_L b1_L d2_L
a0_L a1_L b1_L d2_R
a0_L a1_L c1_L d2_L
a0_L a1_L c1_L d2_R
a0_L a2_L b0_L c2_L
a0_L a2_L b0_L d1_L
a0_L a2_L c2_L d1_L
a0_L a2_R b1_L c1_L
a0_L a2_R b1_L d2_R
a0_L a2_R c1_L d2_R
a0_L b0_L b1_L c1_L
a0_L b0_L b1_L d1_L
a0_L b0_L c0_L c1_L
a0_L b0_L c0_L c2_L
a0_L b1_L d0_L d1_L
a0_L b1_L d0_L d2_L
a0_L c0_L c1_L d2_L
a0_L c0_L c2_L d2_L
a0_L c2_L d0_L d1_L
a0_L c2_L d0_L d2_L
a1_L a2_L b1_L c1_L
a1_L a2_L b1_L d2_L
a1_L a2_L c1_L d2_L
a1_L a2_R b0_R c2_R
a1_L a2_R b0_R d1_R
a1_L a2_R c2_R d1_R
a1_L b0_R b1_L c1_L
a1_L b0_R b1_L d1_R
a1_L b0_R c0_R c1_L
a1_L b0_R c0_R c2_R
a1_L b1_L d0_R d1_R
a1_L b1_L d0_R d2_R
a1_L c0_R c1_L d2_R
a1_L c0_R c2_R d2_R
a1_L c2_R d0_R d1_R
a1_L c2_R d0_R d2_R
a2_L b0_L b2_L c2_L
a2_L b0_L b2_L d2_L
a2_L b0_L d1_L d2_L
a2_L b1_L b2_L c2_L
a2_L b1_L b2_L d2_L
a2_L b1_L c1_L c2_L
a2_L c1_L c2_L d1_L
a2_L c1_L d1_L d2_L
a2_R b0_R b2_R c2_R
a2_R b0_R b2_R d2_R
a2_R b0_R d1_R d2_R
a2_R b1_L b2_R c2_R
a2_R b1_L b2_R d2_R
a2_R b1_L c1_L c2_R
a2_R c1_L c2_R d1_R
a2_R c1_L d1_R d2_R
b0_L b1_L c1_L d1_L
b0_L b2_L c2_L d2_L
b0_L c0_L c1_L d2_L
b0_L c0_L c2_L d2_L
b0_L c1_L d1_L d2_L
b0_R b1_L c1_L d1_R
b0_R b2_R c2_R d2_R
b0_R c0_R c1_L d2_R
b0_R c0_R c2_R d2_R
b0_R c1_L d1_R d2_R
b1_L b2_L c2_L d2_L
b1_L b2_R c2_R d2_R
b1_L c1_L c2_L d1_L
b1_L c1_L c2_R d1_R
b1_L c2_L d0_L d1_L
b1_L c2_L d0_L d2_L
b1_L c2_R d0_R d1_R
b1_L c2_R d0_R d2_R
```

The ordered 334-point labels, height vector, 1516 common short edges and every nonzero signed primitive entry are in common.json. Order source faces first, by size then lexicographically, then the 14 target faces. Both full N×N distance tables are given as CSV classes 0,S,M,L. Each class is respectively 0,1−1/33400,1,1+1/33400 for squared distance. Both full rational Gram tables have denominator 200×334³=7451940800; every numerator is supplied.

Each f0/f2 JSON lists ALL cylinder simplices by dimension, sparse signed relative 2-cocycle w and relative 4-cycle z4, with all omitted coefficients zero. U consists of all source-only simplices and all 14 target vertices. Quotient faces in U collapse to the basepoint. The separate checker recreates all cliques, all coboundaries, both integral pairings and both centered matrices.
