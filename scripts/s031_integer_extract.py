"""S031: integer-only block extraction for explicitly sheared product-chain diagrams.
No field basis or canonical barcode is consulted by the extraction routine.
"""
import itertools, json, random, hashlib, sys
from sympy import Matrix, eye, zeros
from sympy.matrices.normalforms import smith_normal_form
from sympy.polys.domains import ZZ


def diag(A):
    A=Matrix(A); m,n=A.shape; U=eye(m); V=eye(n); k=0
    def row_swap(i,j):
        A.row_swap(i,j); U.row_swap(i,j)
    def col_swap(i,j):
        A.col_swap(i,j); V.col_swap(i,j)
    def row_add(i,j,c):
        for x in range(n): A[i,x]+=c*A[j,x]
        for x in range(m): U[i,x]+=c*U[j,x]
    def col_add(i,j,c):
        for x in range(m): A[x,i]+=c*A[x,j]
        for x in range(n): V[x,i]+=c*V[x,j]
    while k<min(m,n):
        cand=[(abs(A[i,j]),i,j) for i in range(k,m) for j in range(k,n) if A[i,j]]
        if not cand:break
        _,i,j=min(cand); row_swap(k,i); col_swap(k,j)
        for cycle in range(1000):
            dirty=False
            for i in range(k+1,m):
                if A[i,k]:
                    q=A[i,k]//A[k,k]; row_add(i,k,-q)
                    if A[i,k]: row_swap(k,i)
                    dirty=True; break
            if dirty:continue
            for j in range(k+1,n):
                if A[k,j]:
                    q=A[k,j]//A[k,k]; col_add(j,k,-q)
                    if A[k,j]:col_swap(k,j)
                    dirty=True;break
            if dirty:continue
            if abs(A[k,k])>1:
                outside=[(i,j) for i in range(k+1,m) for j in range(k+1,n) if A[i,j]%A[k,k]]
                if outside:
                    i,j=outside[0]; row_add(k,i,1);continue
            break
        else:raise RuntimeError('SNF loop limit')
        if A[k,k]<0: row_add(k,k,-2)
        k+=1
    assert all(A[i,j]==0 for i in range(m) for j in range(n) if i!=j)
    return A,U,V,k

def factors(A):
    D,U,V,r=diag(A)
    if any(D[i,i]!=1 for i in range(r)):raise AssertionError(('nonprimitive',tuple(D[i,i] for i in range(r))))
    return D,U,V,r

def image_section(A):
    """For a pure map A: source -> target, return image basis H and lifting s."""
    D,U,V,r=factors(A)
    return U.inv()[:,:r],V[:,:r],U[:r,:],r

def kernel_basis(A):
    D,U,V,r=factors(A)
    return V[:,r:],V.inv()[r:,:]

def matcols(cols,rows):
    return Matrix.hstack(*cols) if cols else zeros(rows,0)

def leq(x,y):return all(a<=b for a,b in zip(x,y))

def grid(lengths):return list(itertools.product(*(range(m) for m in lengths)))

def supports(lengths):
    pts=grid(lengths); out=[]; t=tuple(m-1 for m in lengths)
    for u in pts:out.append(('U',u,[x for x in pts if leq(u,x)]))
    for v in pts:
        if v!=t:out.append(('D',v,[x for x in pts if leq(x,v)]))
    for i,m in enumerate(lengths):
        for a in range(1,m-1):
            for c in range(a,m-1):out.append(('B',(i,a,c),[x for x in pts if a<=x[i]<=c]))
    return out

def example(lengths,seed):
    pts=grid(lengths); rng=random.Random(seed); typ=supports(lengths)
    chosen=[]
    # nontrivial inclusions: diagonal upsets, nonmaximal downsets, and overlapping bands
    U=[b for b in typ if b[0]=='U']; D=[b for b in typ if b[0]=='D']; B=[b for b in typ if b[0]=='B']
    chosen += [U[0],U[len(U)//2],U[-2],D[0],D[len(D)//2]]
    for i in range(len(lengths)):
        ix=[b for b in B if b[1][0]==i]
        if ix: chosen += [ix[0],ix[-1]]
        if len(ix)>=3:chosen += [ix[len(ix)//2]]
    chosen=list({(b[0],b[1]):b for b in chosen}.values()); indices={x:[j for j,b in enumerate(chosen) if x in b[2]] for x in pts}
    bases={}; inv={}
    for x in pts:
        d=len(indices[x]); T=eye(d)
        for _ in range(3*d+1):
            if d>=2:
                i,j=rng.sample(range(d),2)
                q=rng.choice([-1,1]); T.row_op(i,lambda v,c:v+q*T[j,c])
        bases[x]=T;inv[x]=T.inv()
    maps={}
    for x in pts:
        for y in pts:
            if leq(x,y):
                J=zeros(len(indices[y]),len(indices[x]));iy={v:i for i,v in enumerate(indices[y])}
                for j,v in enumerate(indices[x]):
                    if v in iy:J[iy[v],j]=1
                maps[x,y]=bases[y]*J*inv[x]
    return pts,maps,{x:len(indices[x]) for x in pts},chosen


def extract(lengths,seed):
    pts,M,dims,chosen=example(lengths,seed); initial_dims=dims.copy(); b=pts[0];t=pts[-1]; picked=[]; audit=[]
    def m(x,y):return M[x,y]
    def split(support,inc,ret,label):
        nonlocal M,dims
        support=set(support); r=inc[next(iter(support))].cols
        K={};W={}
        for x in pts:
            if x in support:
                assert ret[x]*inc[x]==eye(r),(label,'retraction',x)
                X,L=kernel_basis(ret[x]); K[x]=X;W[x]=L
                assert abs(Matrix.hstack(inc[x],X).det())==1,(label,'not unimodular',x)
            else: K[x]=eye(dims[x]);W[x]=eye(dims[x])
        for x in pts:
            for y in pts:
                if leq(x,y):
                    if x in support and y in support:assert m(x,y)*inc[x]==inc[y]
                    if x in support and y not in support:assert m(x,y)*inc[x]==zeros(dims[y],r)
                    if x not in support and y in support:assert ret[y]*m(x,y)==zeros(r,dims[x])
        N={(x,y):W[y]*mat*K[x] for (x,y),mat in M.items()}
        M=N;dims={x:K[x].cols for x in pts};picked.append((label,r))
    # death peel; source common bottom, composite kills exits
    for v in pts:
        if v==t:continue
        exits=[]
        for j,L in enumerate(lengths):
            if v[j]<L-1:
                aa=[0]*len(lengths);aa[j]=v[j]+1;exits.append(tuple(aa))
        T=Matrix.vstack(*(m(b,a) for a in exits))
        L,_=kernel_basis(T); H,S,Q,r=image_section(m(b,v)*L)
        if not r:continue
        s=L*S;sup=[x for x in pts if leq(x,v)]
        inc={x:m(b,x)*s for x in sup};ret={x:Q*m(x,v) for x in sup}
        split(sup,inc,ret,('D',v))
    # bands ordered by end descending, start ascending
    for i,L in enumerate(lengths):
        for c in range(L-2,0,-1):
            for a in range(1,c+1):
                e=tuple(a if j==i else 0 for j in range(len(lengths)))
                h=tuple(c if j==i else lengths[j]-1 for j in range(len(lengths)))
                low=tuple(a-1 if j==i else lengths[j]-1 for j in range(len(lengths)))
                K,_=kernel_basis(m(e,t));H,S,_,r=image_section(m(e,h)*K)
                if not r:continue
                I,_,_,_=image_section(m(low,h))
                J=Matrix.hstack(H,I);_,U,V,jr=factors(J)
                assert jr==H.cols+I.cols
                left=V*U[:jr,:];q=left[:r,:]
                s=K*S;sup=[x for x in pts if a<=x[i]<=c]
                inc={x:m(e,x)*s for x in sup};ret={x:q*m(x,h) for x in sup}
                split(sup,inc,ret,('B',(i,a,c)))
    # residual projective birth algorithm, no canonical barcode input
    born={}; full_basis={}; newborn={}
    for x in sorted(pts,key=lambda x:(sum(x),x)):
        old=[]
        for u in born:
            if leq(u,x):old += [m(u,x)*born[u]]
        A=matcols(old,dims[x]);D,U,V,r=factors(A)
        assert r==A.cols
        C=U.inv()[:,r:]; born[x]=C;newborn[x]=C.cols
        B=Matrix.hstack(A,C)
        assert abs(B.det())==1
        full_basis[x]=B
    # verify every residual composite on births and entire original decomposition by ranks
    for x in pts:
        for y in pts:
            if leq(x,y):
                desc=[u for u in born if leq(u,x)]
                ex=matcols([m(u,x)*born[u] for u in desc],dims[x]); ey=matcols([m(u,y)*born[u] for u in desc],dims[y]);assert m(x,y)*ex==ey
    expected={('U',k):1 for label,k,_ in chosen if label=='U'}
    actual={}
    for label,r in picked:actual[label]=actual.get(label,0)+r
    for u,dim in newborn.items():
        if dim:actual[('U',u)]=dim
    expect={(label,k):1 for label,k,_ in chosen}
    assert actual==expect,('multiplicities',expect,actual)
    assert sum(1 for x in pts for y in pts if leq(x,y))==len(M)
    return {'axes':list(lengths),'vertices':len(pts),'composites':len(M),'blocks':len(chosen),'splits':len(picked),'split_ranks':sum(r for _,r in picked),'births':sum(newborn.values()),'recovered':actual==expect}

if __name__=='__main__':
    out=[]
    for dims,seed in [((4,4),31031),((4,4,4),31032),((3,5),31033)]:
        out.append(extract(dims,seed));print(json.dumps(out[-1]),flush=True)
    print('ALL PASS')
