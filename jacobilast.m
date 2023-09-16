A=input('please enter any matrix');
n=size(A,2);
D=zeros(n,n);
L=zeros(n,n);
U=zeros(n,n);
%aval matrix haye shekaf A ro ijad mikonim
%#split
 for i=1:n
    for j=1:n
        if i>j
            L(i,j)=A(i,j);
        else if i<j
                U(i,j)=A(i,j);
            else D(i,j)=A(i,j);
            end
        end
    end
 end
 
    b=input('enter b');
        b1=b';
    X=zeros(n,2);
%hala yek matrix X n*2 migiram k bordarhaye
%javab k har marhale ijad mishan ro dakhele 2 bordar X save konan  
    X(:,1)=input('enter x0 vector');
    H=U+L;
    HX=H*X(:,1);
    T=b1-HX;
    %baraye sorat bishtar be jaye --> X(:,1)=inv(D)*T;
%az code pain raftam
        X(:,1)=D\T;
    count=input('How many steps?');
    e=input('What is the e?');
    p=0;
    while (abs(X(:,2)-X(:,1))>e)
     p=p+1;
    HX=H*X(:,2);
    T=b1-HX;
        X(:,2)=D\T;
        X(:,1)=X(:,2);
    end
    if p<=count
        disp('its convegence')
    end