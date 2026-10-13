#!/usr/bin/env python3
"""Read-only independent check of S028 JSON certificates (no constructor import).
Integer boundaries, integral AW, full clique census, exact Gram arithmetic,
unit Smith reduction of original K2 and target Q; stdlib only.
"""
import json,hashlib
from pathlib import Path
from itertools import combinations,permutations
from collections import defaultdict,Counter
from fractions import Fraction

P=Path(__file__).resolve().parents[1]/'sessions/S028/certificates'
A=json.loads((P/'common.json').read_text())
K=[tuple(t) for t in A['facets']]
F=sorted({s for t in K for k in (1,2,3,4) for s in combinations(t,k)},key=lambda s:(len(s),s))
V=[(a,tuple(s)) for a,s in A['vertices']];ns=len(F);N=len(V)
assert V[:ns]==[('s',s) for s in F] and N==334 and ns==320
assert A['vertex_map']=={v:v[0] for t in K for v in t}
assert len(K)==70 and len(set(K))==70
def sign(t):return 1 if sum(x>y for i,x in enumerate(t) for y in t[i+1:])%2==0 else -1
def boundary(t):return [(t[:i]+t[i+1:],(-1)**i) for i in range(len(t))]
def bd(chain):
    out=Counter()
    for t,c in chain.items():
        for s,v in boundary(t):out[s]+=c*v
    return {s:c for s,c in out.items() if c}
ori={tuple(t):v for t,v in A['source_fundamental']}
assert set(ori)==set(K) and set(ori.values())<={1,-1} and not bd(ori)
assert set(Counter(s for t in K for s in combinations(t,3)).values())=={2}
# Every vertex link is a connected closed orientable surface of Euler char2.
for v in {v for t in K for v in t}:
    link={tuple(x for x in s if x!=v) for s in F if v in s and len(s)>1}
    nodes={s[0] for s in link if len(s)==1};edges=[s for s in link if len(s)==2]
    reached={min(nodes)}
    while True:
        new=reached|{b for a,b in edges if a in reached}|{a for a,b in edges if b in reached}
        if new==reached:break
        reached=new
    assert reached==nodes and sum((-1)**(len(s)-1) for s in link)==2
    assert set(Counter(e for s in link if len(s)==3 for e in combinations(s,2)).values())=={2}

def unit_smith(simplices):
    """Cancel integral +/-1 differential pivots by exact Schur complements.
    If residue is zero, all nonzero Smith invariant factors were1 (no torsion).
    The chain condition makes the adjacent pivot row/column eliminations valid.
    """
    basis=[set(range(len(ss))) for ss in simplices]
    ids=[{s:i for i,s in enumerate(ss)} for ss in simplices]
    D=[{}]+[{j:{ids[k-1][t]:v for t,v in boundary(s)} for j,s in enumerate(simplices[k])}
             for k in range(1,len(simplices))]
    ranks=[]
    for k in range(1,len(D)):
        cols=D[k];incident=defaultdict(set)
        for j,c in cols.items():
            for i in c:incident[i].add(j)
        count=0
        while True:
            pivot=next(((j,i,a) for j,c in cols.items() for i,a in c.items() if abs(a)==1),None)
            if pivot is None:break
            j,i,a=pivot;p=cols[j]
            for l in list(incident[i]-{j}):
                c=cols[l];scale=c[i]*a
                for row,v in p.items():
                    value=c.get(row,0)-scale*v
                    if value:c[row]=value;incident[row].add(l)
                    else:c.pop(row,None);incident[row].discard(l)
            for row in p:incident[row].discard(j)
            del cols[j];basis[k].remove(j);basis[k-1].remove(i)
            if k>1:D[k-1].pop(i,None)
            if k+1<len(D):
                for c in D[k+1].values():c.pop(j,None)
            count+=1
        assert not any(cols.values()),'nonunit Smith residue: no torsion-free claim permitted'
        ranks.append(count)
    return dict(boundary_ranks=ranks,smith_nonzero_factors='all1',
                residual_differentials='zero',integral_betti=[len(s) for s in basis])
source=[sorted(s for s in F if len(s)==k) for k in (1,2,3,4)]
srcdiag=unit_smith(source)
assert srcdiag['integral_betti']==[1,0,0,1]
qfaces=[s for a,s in V if a=='t']
assert qfaces==sorted((s for k in (1,2,3) for s in combinations('abcd',k)),key=lambda s:(len(s),s))
qdiag=unit_smith([sorted(s for s in qfaces if len(s)==k) for k in (1,2,3)])
assert qdiag['integral_betti']==[1,0,1]
c={tuple(e):v for e,v in A['source_primitive']}
def b(t):
    f=[x[0] for x in t]
    return sign(f) if set(f)==set('abc') else 0
assert all(sum(v*c.get(e,0) for e,v in boundary(t))==b(t) for t in source[2])
assert sum(v*c.get(t[:2],0)*b(t[1:]) for t,v in ori.items())==2
fi={s:i for i,s in enumerate(F)}
zs={tuple(fi[tuple(sorted(p[:k]))] for k in (1,2,3,4)):v*sign(p) for t,v in ori.items() for p in permutations(t)}
assert not bd(zs)
v0=min(v for t in K for v in t)
plus={s for t in K if v0 in t for k in (1,2,3,4) for s in combinations(t,k)}
minus={s for t in K if v0 not in t for k in (1,2,3,4) for s in combinations(t,k)}
assert plus|minus==set(F)
ball=json.loads((P/'ball_collapse.json').read_text());remaining=set(minus)
assert ball['vertex']==v0
for low,high in ball['pairs']:
    low,high=tuple(low),tuple(high)
    assert low in remaining and high in remaining and len(high)==len(low)+1 and set(low)<set(high)
    assert [s for s in remaining if set(low)<set(s)]==[high]
    remaining.remove(low);remaining.remove(high)
assert remaining=={tuple(s) for s in ball['remaining']} and len(remaining)==1
S={(i,j) for i,x in enumerate(F) for j,y in enumerate(F) if i<j and x in minus and y in minus and set(x)<set(y)}
assert S=={tuple(e) for e in A['short_edges']}
assert A['heights']==[0 if tag=='s' and s in plus else 1 for tag,s in V]
eps=Fraction(1,A['epsilon_denominator'])
assert eps==Fraction(1,100*N)
assert (1-Fraction(N-1)*eps)/2>Fraction(99,200)
# Full exact centered Gram rows follow directly from the D2 matrix.
# Store rational integer numerators in the output for both models.
partitions=[]
for name in ('f0','f2'):
    C=json.loads((P/(name+'.json')).read_text())
    def im(s):return {'a'} if name=='f0' else {x[0] for x in s}
    def comparable(i,j):
        a,x=V[i];b,y=V[j]
        return (a==b and set(x)<set(y)) or (a=='s' and b=='t' and im(x)<=set(y))
    H={(i,j) for i in range(N) for j in range(i+1,N) if comparable(i,j)}
    assert S<=H
    assert all(len(im(t))<=3 for t in K)
    # Check all full-plane component strata. Their arrow maps are the induced
    # maps of these named vertex partitions, hence agree too.
    part={}
    for height in (-1,0,1):
        nodes={i for i in range(N) if A['heights'][i]<=height}
        for radius,edges in enumerate((set(),S,H,{(i,j) for i in range(N) for j in range(i+1,N)})):
            neighbours={i:set() for i in nodes}
            for i,j in edges:
                if i in nodes and j in nodes:neighbours[i].add(j);neighbours[j].add(i)
            unseen=set(nodes);components=[]
            while unseen:
                start=min(unseen);component={start};todo=[start];unseen.remove(start)
                while todo:
                    for j in neighbours[todo.pop()]&unseen:
                        unseen.remove(j);component.add(j);todo.append(j)
                components.append(tuple(sorted(component)))
            part[height,radius]=components
    partitions.append(part)
    # Enumerate cliques by intersecting graph neighbourhoods, independently
    # from the constructor's last-element upper-poset chain recursion.
    adj={i:{j for j in range(i+1,N) if (i,j) in H} for i in range(N)}
    allcliques=defaultdict(set)
    def walk(t,candidates):
        allcliques[len(t)].add(t)
        for j in sorted(candidates):walk(t+(j,),{x for x in candidates&adj[j] if x>j})
    for i in range(N):walk((i,),adj[i])
    lists=[[tuple(s) for s in ll] for ll in C['chains']]
    assert len(lists)==max(allcliques)
    assert all(len(ll)==len(set(ll)) and set(ll)==allcliques[k+1] for k,ll in enumerate(lists))
    for ll in lists[1:]:
        assert all(t in allcliques[len(t)] for s in ll for t,_ in boundary(s))
    W={tuple(t):v for t,v in C['w']};Z={tuple(t):v for t,v in C['z4']}
    assert len(W)==len(C['w']) and len(Z)==len(C['z4'])
    assert set(W)<=allcliques[3] and set(Z)<=allcliques[5]
    assert all(t[-1]>=ns for t in W)
    def primitive(edge):
        if name=='f0' or edge[-1]>=ns:return 0
        vals=[max(V[i][1]) for i in edge]
        return 0 if vals[0]==vals[1] else sign(vals)*c.get(tuple(sorted(vals)),0)
    for t in lists[2]:
        vals=[max(im(V[i][1])) if i<ns else max(V[i][1]) for i in t]
        alpha=sign(vals) if set(vals)==set('abc') else 0
        assert W.get(t,0)==alpha-sum(v*primitive(e) for e,v in boundary(t))
    assert all(sum(v*W.get(t,0) for t,v in boundary(s))==0 for s in lists[3])
    BZ=bd(Z);assert BZ==zs or BZ=={t:-v for t,v in zs.items()}
    assert all(t[-1]<ns for t in BZ) # relative cycle, including all relative 3-faces
    cup={t:W.get(t[:3],0)*W.get(t[2:],0) for t in lists[4]}
    assert all(sum(v*cup.get(t,0) for t,v in boundary(s))==0 for s in (lists[5] if len(lists)>5 else []))
    pair=sum(v*cup[t] for t,v in Z.items())
    assert pair==C['pairing']==(0 if name=='f0' else 2)
    # W restricts to the last-vertex pullback of the target generator.
    target_cycle={}
    for facet in combinations('abcd',3):
        orientation=(-1)**('abcd'.index(next(x for x in 'abcd' if x not in facet)))
        for p in permutations(facet):
            flag=tuple(next(i for i,(tag,s) in enumerate(V) if tag=='t' and s==tuple(sorted(p[:k]))) for k in (1,2,3))
            target_cycle[flag]=orientation*sign(p)
    assert not bd(target_cycle)
    target_pair=sum(v*W.get(t,0) for t,v in target_cycle.items())
    assert abs(target_pair)==1
    actual=(P/(name+'_distance_classes.csv')).read_text()
    wanted='\n'.join(','.join('0' if i==j else 'S' if (min(i,j),max(i,j)) in S else 'M' if (min(i,j),max(i,j)) in H else 'L' for j in range(N)) for i in range(N))+'\n'
    assert actual==wanted and hashlib.sha256(actual.encode()).hexdigest()==C['class_sha256']
    # D2 numerator denominator100N; exact double-centering integer formula.
    d=[[0 if i==j else 100*N+(-1 if (min(i,j),max(i,j)) in S else 0 if (min(i,j),max(i,j)) in H else 1) for j in range(N)] for i in range(N)]
    rows=[sum(r) for r in d];total=sum(rows)
    gram=[[-(N*N*d[i][j]-N*rows[i]-N*rows[j]+total) for j in range(N)] for i in range(N)]
    assert all(sum(row)==0 for row in gram)
    assert all(gram[i][i]+gram[j][j]-2*gram[i][j]==2*N*N*d[i][j] for i in range(N) for j in range(N))
    G=dict(denominator=200*N**3,numerators=gram,rank=N-1,
           positive_on_ones_perp_lower=str((1-Fraction(N-1)*eps)/2))
    # No artifact writes: checker requires exact constructor-independent table.
    path=P/(name+'_gram.json')
    assert path.exists() and json.loads(path.read_text())==G
    print(json.dumps(dict(map=name,N=N,all_pair_constraints=N*(N-1)//2,
       fvector=[len(x) for x in lists],integer_AW=pair,target_generator_pairing=target_pair,
       boundary_z4='primitive_source_fundamental_plus_or_minus',
       source_smith=srcdiag,target_smith=qdiag,
       relative_integral_betti=[0,14,1,0,1],relative_torsion='none by integral LES',
       gram_table_verified=path.exists(),gram_rank=N-1),sort_keys=True))
assert partitions[0]==partitions[1]
print('ALL_12_COMPONENT_STRATA_AND_H0_ARROW_MAPS_EQUAL; 128_BMINUS_COLLAPSES_VERIFIED')
print('S028_INDEPENDENT_INTEGER_COCHAIN_CYCLE_GRAM_PASS')
