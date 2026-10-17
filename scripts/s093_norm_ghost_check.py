#!/usr/bin/env python3
"""S093 finite modular linear-system check. No topological or originality certification."""
def rank(a,p):
    a=[row[:] for row in a]
    r=0
    for col in range(len(a[0]) if a else 0):
        piv=next((j for j in range(r,len(a)) if a[j][col]%p),None)
        if piv is None: continue
        a[r],a[piv]=a[piv],a[r]
        inv=pow(a[r][col]%p,-1,p)
        a[r]=[(x*inv)%p for x in a[r]]
        for j in range(len(a)):
            if j!=r and a[j][col]%p:
                z=a[j][col]%p
                a[j]=[(x-z*y)%p for x,y in zip(a[j],a[r])]
        r+=1
    return r

def nullhomotopic(p,q,n):
    # P_n: B in degrees 1..n, even d=N=t^(q-1), odd d=t.
    # Unknown components h_i: multiplication by a polynomial of degree <q.
    width=q*(n-1)
    a=[[0]*width for _ in range(q*n)]
    b=[0]*(q*n)
    for i in range(1,n+1):
        b[(i-1)*q+q-1]=1
        for j,d in ((i,"N" if (i+1)%2==0 else "t"),
                    (i-1,"N" if i%2==0 else "t")):
            if not (1<=j<n): continue
            for s in range(q):
                target=q-1 if d=="N" and s==0 else (s+1 if d=="t" and s<q-1 else None)
                if target is not None:
                    a[(i-1)*q+target][(j-1)*q+s]=(a[(i-1)*q+target][(j-1)*q+s]+1)%p
    return rank(a,p)==rank([row+[x] for row,x in zip(a,b)],p)

if __name__=="__main__":
    tests=((2,2),(2,4),(2,8),(3,3),(3,9),(5,5))
    for p,q in tests:
        flags=[]
        for n in range(1,7):
            actual=nullhomotopic(p,q,n)
            assert actual == (n%2==0),(p,q,n,actual)
            flags.append("n%d=%s"%(n,"NULL" if actual else "NONNULL"))
        print("p=%d q=%d %s"%(p,q," ".join(flags)))
    print("PASS: 36 finite homotopy equation systems; no CW or HHA proof.")
