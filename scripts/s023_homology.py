#!/usr/bin/env python3
"""Optional complete high flag clique GF2 audit: Python3+networkx3.6.1."""
from collections import Counter
import networkx as nx
import s023_recolored_null as r
def rank(xs):
    piv={}
    for z in xs:
        while z:
            k=z.bit_length()-1
            if k in piv:z^=piv[k]
            else:piv[k]=z;break
    return len(piv)
def check(f):
    edges,_,_=r.classes(f)
    G=nx.Graph();G.add_nodes_from(range(len(r.nodes)));G.add_edges_from(edges)
    C=tuple(sorted((tuple(cl) for cl in nx.enumerate_all_cliques(G)),key=lambda x:(len(x),x)))
    n=Counter(len(z)-1 for z in C);top=max(n);rr={}
    for k in range(1,top+1):
        lo=[z for z in C if len(z)==k];hi=[z for z in C if len(z)==k+1]
        ids={z:i for i,z in enumerate(lo)}
        rr[k]=rank([sum(1<<ids[z[:j]+z[j+1:]] for j in range(k+1)) for z in hi])
    b=[n[k]-rr.get(k,0)-rr.get(k+1,0) for k in range(top+1)]
    assert b==[1,0,1]+[0]*(top-2)
    return [n[k] for k in range(top+1)],[rr[k] for k in range(1,top+1)],b
if __name__=='__main__':
    assert check(r.f0)==([182,1572,4434,5418,2916,540],[181,1391,3042,2376,540],[1,0,1,0,0,0])
    assert check(r.f1)==([182,1524,3936,4032,1440],[181,1343,2592,1440],[1,0,1,0,0])
    print('S023 GF2 flag homology exact counts PASS (not an integral cup certificate)')
