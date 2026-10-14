#!/usr/bin/env python3
"""S032 independent Smith-transformation lattice extraction; small finite synthetic tests."""
import itertools, json, random, hashlib, sys
from math import prod
from sympy import Matrix, eye, zeros, ZZ
from sympy.polys.matrices import DomainMatrix
from sympy.polys.matrices.normalforms import smith_normal_decomp

shape = (5,4,3)
pts = list(itertools.product(*(range(m) for m in shape)))
N = len(pts)
le = lambda x,y: all(a<=b for a,b in zip(x,y))
top = tuple(m-1 for m in shape)
bot = (0,)*len(shape)
blocks = [
    ('D',(1,1,1)), ('D',(3,0,1)),
    ('U',(3,2,1)), ('U',(4,1,1)),
    ('B',(0,1,3)), ('B',(0,2,2)),
    ('B',(1,1,2)), ('B',(2,1,1)),
]

def supports(tag,entry,x):
    if tag=='D': return le(x,entry)
    if tag=='U': return le(entry,x)
    i,a,c=entry;return a<=x[i]<=c

rand = random.Random(32032)
initial = {}
indices = {}
for x in pts:
    ids=[j for j,(tag,data) in enumerate(blocks) if supports(tag,data,x)]
    indices[x]=ids
    d=len(ids)
    Q=eye(d)
    for _ in range(2*d+2):
        if d<2:break
        i,j=rand.sample(range(d),2)
        factor=rand.choice([-2,-1,1,2])
        origin=[Q[j,c] for c in range(d)]
        for c in range(d): Q[i,c] += factor*origin[c]
    assert abs(int(Q.det())) == 1
    initial[x]=Q

maps={}
for x in pts:
    for y in pts:
        if not le(x,y):continue
        idx_x,idx_y=indices[x],indices[y]
        D=zeros(len(idx_y),len(idx_x))
        for j,bid in enumerate(idx_x):
            if bid in idx_y: D[idx_y.index(bid),j]=1
        maps[x,y]=initial[y]*D*initial[x].inv()
        assert all(z.q==1 for z in maps[x,y])

# SymPy domain library's Smith decomposition returns U*A*V=D.
def integer_smith(A):
    if not A.rows or not A.cols:
        return zeros(A.rows,A.cols),eye(A.rows),eye(A.cols),0
    d=DomainMatrix.from_Matrix(A).convert_to(ZZ)
    D,U,V=(t.to_Matrix() for t in smith_normal_decomp(d))
    assert U*A*V==D
    assert abs(U.det())==abs(V.det())==1
    rank=sum(D[i,i]!=0 for i in range(min(D.rows,D.cols)))
    return D,U,V,rank

def kernel(A):
    D,U,V,r=integer_smith(A)
    return V[:,r:]

def image_basis_with_section(A,ambient_domain_basis=None):
    D,U,V,r=integer_smith(A)
    assert all(abs(D[i,i])==1 for i in range(r)),'image not saturated'
    # H=A*V_first, with section V_first; forms a primitive basis of image.
    S=V[:,:r]
    H=A*S
    assert H==U.inv()[:, :r]*D[:r,:r]
    return H,S

def project_killing(H,I,ambient_dim):
    assert H.rows==I.rows==ambient_dim
    J=H.row_join(I)
    D,U,V,r=integer_smith(J)
    assert r==J.cols, 'H intersects I'
    assert all(abs(D[i,i])==1 for i in range(r)),'joint image not saturated'
    # J = U^-1 D V^-1; V*[I_r 0]*U is a left inverse.
    left=V*U[:r,:]
    assert left*J==eye(r)
    Q=left[:,:][:H.cols,:]
    assert Q*H==eye(H.cols) and Q*I==zeros(H.cols,I.cols)
    return Q

def complement(Inc,Ret,dim):
    assert Ret*Inc==eye(Inc.cols)
    K=kernel(Ret)
    B=Inc.row_join(K)
    assert B.shape==(dim,dim) and abs(int(B.det()))==1
    return K, B.inv()[Inc.cols:,:]

# Current dynamic quotient diagram starts from all sheared maps.
dims={x:initial[x].rows for x in pts}
active=dict(maps)
output=[]

def peel(label,support,Inc,Ret):
    global active,dims
    d=next(iter(Inc.values())).cols
    assert d>0
    comp={}
    for x in pts:
        if support(x):
            assert Ret[x]*Inc[x]==eye(d),(label,x,'not retraction')
        else:
            assert Inc[x].cols==Ret[x].rows==d
        K,Q=complement(Inc[x],Ret[x],dims[x]) if support(x) else (eye(dims[x]),eye(dims[x]))
        comp[x]=(K,Q)
    # Independently check naturality on *all* comparable maps.
    for (x,y),A in active.items():
        E=eye(d) if support(x) and support(y) else zeros(d,d)
        assert A*Inc[x]==Inc[y]*E,(label,x,y,'inclusion not natural')
        assert Ret[y]*A==E*Ret[x],(label,x,y,'retraction not natural')
    new={}
    for (x,y),A in active.items():
        Kx,_=comp[x];_,Qy=comp[y]
        new[x,y]=Qy*A*Kx
        assert all(z.q==1 for z in new[x,y])
    active=new
    dims={x:comp[x][0].cols for x in pts}
    output.append((label,d))

# Proper death peeling, same order as finite product poset.
for v in sorted((x for x in pts if x!=top),key=lambda x:(sum(x),x)):
    xs=[tuple(vj+1 if i==j else 0 for i in range(len(shape))) for j,vj in enumerate(v) if vj+1<shape[j]]
    # Rows stacking, all maps bottom->xs.
    T=Matrix.vstack(*(active[bot,z] for z in xs)) if xs else zeros(0,dims[bot])
    L=kernel(T)
    A=active[bot,v]*L
    H,S=image_basis_with_section(A)
    if H.cols==0:continue
    src=L*S
    D,U,V,r=integer_smith(H)
    assert all(abs(D[i,i])==1 for i in range(r))
    q=project_killing(H,zeros(dims[v],0),dims[v])
    Inc={x:active[bot,x]*src if le(x,v) else zeros(dims[x],r) for x in pts}
    Ret={x:q*active[x,v] if le(x,v) else zeros(r,dims[x]) for x in pts}
    peel('D'+str(v),lambda x:le(x,v),Inc,Ret)

# Band peeling: maximal death/end first, minimal birth/start next.
for i in range(len(shape)):
    for c in range(shape[i]-2,0,-1):
        for a in range(1,c+1):
            e=tuple(a if j==i else 0 for j in range(len(shape)))
            h=tuple(c if j==i else top[j] for j in range(len(shape)))
            low=tuple(a-1 if j==i else top[j] for j in range(len(shape)))
            K=kernel(active[e,top])
            H,S=image_basis_with_section(active[e,h]*K)
            r=H.cols
            if r==0:continue
            src=K*S
            I,_=image_basis_with_section(active[low,h])
            q=project_killing(H,I,dims[h])
            support=lambda x:a<=x[i]<=c
            Inc={x:active[e,x]*src if support(x) else zeros(dims[x],r) for x in pts}
            Ret={x:q*active[x,h] if support(x) else zeros(r,dims[x]) for x in pts}
            peel('B'+str((i,a,c)),support,Inc,Ret)

# Births: top-inclusion and all outside-upset images, handled in linear-extension order.
for u in sorted(pts,key=lambda x:(sum(x),x)):
    d=dims[u]
    if d==0:continue
    H=active[u,top]
    assert H.cols==d
    im_out=[]
    for x in pts:
        if not le(u,x):
            im_out.append(active[x,top])
    I_full=Matrix.hstack(*im_out)
    I,_=image_basis_with_section(I_full)
    q=project_killing(H,I,dims[top])
    Inc={x:active[u,x] if le(u,x) else zeros(dims[x],d) for x in pts}
    Ret={x:q*active[x,top] if le(u,x) else zeros(d,dims[x]) for x in pts}
    peel('U'+str(u),lambda x:le(u,x),Inc,Ret)

assert all(d==0 for d in dims.values())
assert sorted(output)==sorted([(tag+str(data),1) for tag,data in blocks])
num_zero=sum(initial[x].rows==0 for x in pts)
num_shear=sum(initial[x]!=eye(initial[x].rows) for x in pts)
result={'shape':shape, 'N':N,'blocks':blocks,'recovered':output,'comparable_pairs':len(maps),
    'zero_stalks':num_zero,'sheared_stalks':num_shear,'all_naturality_checked':True,
    'smith_transforms_checked':True,'joint_images_checked':True,'residual_zero':True,
    'python':sys.version.split()[0]}
print(json.dumps(result,sort_keys=True))
