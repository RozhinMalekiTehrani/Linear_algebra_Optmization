function [d]=QRmeth(A,e)
%A=[8 2;2 5]
%e=0.01
[Q,R]=qr(A);
n=size(A,1);
B=A;
%T va C darvaghe matrix A hastan k tu har marhale ghotre A ro sefr mikonan
%ta vaghti norm azash gereftim taghrib haye meghdar vizhe ro hesab nakone
C=B;
C(1:n+1:end)=0;
A=R*Q;
T=A;
%ta inja ghotr asli C ke darvaghe A dar marhale ghabl hast ro sefr kardim, hamchenin baraye T
T(1:n+1:end)=0;
for i=1:n
while norm(C(:,i)-T(:,i))>e
    B=A;
    C=B;
C(1:n+1:end)=0;
    [Q,R]=qr(B);
    A=R*Q;
    T=A;
T(1:n+1:end)=0;
end
d=diag(A);
end
end
    