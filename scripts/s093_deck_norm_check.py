#!/usr/bin/env python3
"""Finite complete bit-ring arithmetic checks for HHA S093; not topology verification."""
import hashlib
import itertools

def mul_cyclic(a,b,q):
    out=0
    for i in range(q):
        if (a>>i)&1:
            for j in range(q-i):
                if (b>>j)&1: out ^= 1 << (i+j)
    return out

def cyclic(q):
    elems=range(1<<q); t=2; N=1<<(q-1)
    # P3: bottom d2=N, top d3=t; h1,h2. Chain homotopy equations:
    # N*h1=N, t*h2+h1*N=N, h2*t=N.
    sol=0
    for h1 in elems:
        if mul_cyclic(N,h1,q)!=N: continue
        for h2 in elems:
            if (mul_cyclic(t,h2,q)^mul_cyclic(h1,N,q))!=N: continue
            if mul_cyclic(h2,t,q)!=N: continue
            sol+=1
    # P2: d2=N, h1=1 nullhomotopies. P4: N,t,N, h1=1,h2=0,h3=1.
    assert mul_cyclic(N,1,q)==N
    assert mul_cyclic(t,0,q)^mul_cyclic(N,1,q)==N
    assert mul_cyclic(N,1,q)==N
    assert sol==0
    return (q, (1<<q)**2, sol)

def mul_torus(a,b):
    out=0
    for i in range(4):
        if (a>>i)&1:
            for j in range(4):
                if ((b>>j)&1) and not ((i&j)!=0):
                    out ^= 1<<(i|j)
    return out

def torus():
    B=range(16); u=2;v=4;N=8
    # d2:B -> B^2 = (v,u), h:B^2 -> B determined by row (p,q)
    # d2*h=N id on B^2, h*d2=N id on B.
    bottom_solutions=0; total_solutions=0
    for p in B:
        for q in B:
            eq11=mul_torus(v,p)==N
            eq12=mul_torus(v,q)==0
            eq21=mul_torus(u,p)==0
            eq22=mul_torus(u,q)==N
            if not (eq11 and eq12 and eq21 and eq22):continue
            bottom_solutions+=1
            if mul_torus(p,v)^mul_torus(q,u)==N: total_solutions+=1
    kernel=[a for a in B if (mul_torus(v,a),mul_torus(u,a))==(0,0)]
    image={(mul_torus(v,a),mul_torus(u,a)) for a in B}
    assert len(kernel)==1 or len(kernel)==2 # expect dim1
    assert kernel==[0,8],kernel
    assert len(image)==8
    for a,b in itertools.product(B,repeat=2):
        assert (mul_torus(N,a),mul_torus(N,b)) in image
    assert bottom_solutions==4 and total_solutions==0
    return (256,bottom_solutions,total_solutions,len(kernel),len(image))

if __name__ == '__main__':
    lines=[f'CYCLIC q={q}: tested_pairs={pairs} homotopies={sol}' for q,pairs,sol in [cyclic(2),cyclic(4),cyclic(8)]]
    tested,bottom,total,kernel,image=torus()
    lines.append(f'TORUS C2xC2: tested_rows={tested} lower_equation_solutions={bottom} full_homotopies={total} kernel_size={kernel} image_size={image}')
    lines.append('PASS: finite algebraic equations and homology action only')
    output='\n'.join(lines)+'\n'
    print(output,end='')
    print('OUTPUT_SHA256',hashlib.sha256(output.encode()).hexdigest())
