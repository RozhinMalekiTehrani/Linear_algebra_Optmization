function [X,flag]=gsiter(A,b,X0,e,N)
flag=false;
     n=size(A,2);
       D=zeros(n,n);
        L=zeros(n,n);
         U=zeros(n,n);
            for i=1:n;
               for j=1:n;
        if i>j
            L(i,j)=A(i,j);
        else if i<j
                U(i,j)=A(i,j);
            else
                D(i,j)=A(i,j);
            end
        end
    end
            end
       X0=X0'
      X=inv(D+L)*(b'-U*X0)
       s=0
       D1=inv(D)
       b1=b'
        while abs(X-X0)>e
       X=D1*(b1-(L*X+U*X0))
        X0=X;
          s=s+1
       end
             if s<=N
                 flag=true
             end
             
end


%mesal zir az jabre khati
%[M,N]=gsiter([5 5 1;1 5 1;1 1 5],[7 7 7],[0 0 0],0.01,3)