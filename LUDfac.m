function [L,U]=LUDfac(A)
%aval check mikonim aya in matrix A 3ghotri hast ya na!
a=diag(A,0);
b=diag(A,1);
c=diag(A,-1);
n=size(A,1);
p=[];
q=[];
U=zeros(n);
L=eye(n);
u=ones(n,1);
l=ones(n,1);
%kafie yeki az ghotrhaye be joz k=-1,0,1 nasefr bashe,pas tajzie LU ba in
%tarif monaseb A nist
for i=2:n-1
    p=diag(A,i);
    if p~=0
disp('doesn''t have the property of 3 diagonals')
        return
    end
         for j=-2:-1:-n+1
        q=diag(A,j);
        if q~=0
          disp('doesn''t have the property of 3 diagonals')
            return
        end
         end
            u(1)=a(1);
            for i=2:n
                l(i)=c(i-1)/ u(i-1);
           u(i)=a(i)-l(i)*b(i-1);
            end
            %CHON AVAL l ro ones(n,1) gereftam deraye avalesh bi estefade bud pas akhar sar chon gharare jaye ghotre -1 beshine dimension bayad monaseb bashe, pas akhar kar deraye avalo azash hazf kardam 
           l(1)=[];
              u;
            %tebghe ghabl k jaygozini dar ghotr k>0 ya k<0 ro bedast avordim, inja
            %ham ba un formul kar mikonim
              L(2:n+1:n^2-n)=l
              U(n+1:n+1:n^2)=b
              U(1:n+1:end)=u
             
            L
            U
            
end
end

%mesal jabre khati: %A=[2 1 0 0;3 1 -1 0;0 2 1 1;0 0 4 2]