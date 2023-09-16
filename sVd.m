function [U,V]=sVd(A)
%A=[1 -1;0 1]
m=size(A,1);
n=size(A,2);
c=min(m,n);
r=rank(A);
U=zeros(m,m);
V=zeros(n,n);
if r==c
[V,E]=eig(A'*A);
d=diag(E);
%d barabare maghadir vizhe, sotunhaye matrix V ham bordarhaye vizhe nazi d
s=sqrt(d);
for j=1:m
    for i=1:n
        p=A*V(:,i);
    U(:,j)=p/s(i);
    
    end
end
end
U;
V;
end

