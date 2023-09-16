fid1=fopen('data.txt','r');
count=0;
while (feof(fid1)~=1);
    A=fscanf(fid1,'%d %d\n',2);
    m=A(1);
    n=A(2);
    B=zeros(m,n);
    if m~=0 || n~=0
        count=count+1;
        for i=1:m
            B(i,:)=fgetl(fid1);
            
        end
        %ta inja har matrix B k tolid shode engar y pattern bude
        % man mikham hameye pattern y ja bashe na k rush neveshte beshe pas
        %hameye patternaro rikhtam tu araye celuli,k code paiin in karo mikone
        %C{count}={B} <--- in kari k kardam engar cell tuye cell shode bud,
        %darvage kafi bud tu ye cell brizam 
                C{count}=B;

    end
end
%ta inja dade haro khundam faghat, az inja b bad mese raveshe game life
%miram ,yani atrafe har matrix dade ro y radif noghte ezafe mikonam

for s=1:count;
    %vaghti tu cel chizi mirizim bordari age bashe besurate sotuni mishe , yani
    %hamishe sotunesh yeke
    %alan matrix M adad hast , 42 va 46 code ascii * va .
    %M=C{s}{1}     doroste ama {1} bi dalil bud , age bala B ro dar {} nmizashtim
    %inja niazi b 
    M=C{s}
    m=size(M,1);
    n=size(M,2);
    p=ones(m,1)*46;
    q=ones(1,n+2)*46;
    %pain miaim bordar p va q ro elsagh mikonim k ye matrix ba atrafe
    % 46 beshe
    M=[p M p];
    M=[q;M;q]
    for i=2:m+1;
        for j=2:n+1;
            if M(i,j)~=42;
                %hamsaye haye khune i,j matrix M ro mirizam tu chk, pas chk
                %bordari az adade42 va 46 hast
                chk=[M(i-1,j-1) M(i-1,j) M(i-1,j+1)...
                    M(i,j-1) M(i,j+1) M(i+1,j-1) M(i+1,j) M(i+1,j+1)];
                %hala khune haye hamsaye ke * budano peida mikone ,chejuri!
                %man nemidunam chejuri az beine chandin char  find konam az tu char ha vase
                %hamin tabdil kardam bdouble bad 42 hamun char * hast va ba
                %dastur find khunehaye 42ropeida mikonam
                %address nmikham tedad bomB  ro mikham pas logical mikonam ta address khuneha beshan 0,1
                r=find(chk==42);
                y=sum(logical(r));
                                %M(i,j)=y
                %ghesmate pain darvaghe miad code ascii character adad ro
                %mirize tu deraye i,j, hala chera, chon 42 k code ascii *
                %bude pas ba dastur char mitunim rahat be * tabdilesh
                %konim, moshkel adaadaye khunehaye matrix M budan k ba char
                %un adad morede nazare mano nmidan , pas miam bcode ascii
                %adadish tabdilesh mikonam ta vaghti zadam char bere un
                %adad k man donbaleshamo bede
                                M(i,j)=y+'0'
            end
            
        end
           
    end
        M([1 m+2],:)=[]
M(:,[1 n+2])=[]
    C{s}=M
end

fclose(fid1)
%ta inja dar matrix M adad bud va jaye * 42, hala hamzaman mikham...
%b jaye 42 dar matrix M bzaram * va dar file khoroji naamayesh bedam

fid2=fopen('output.txt','w');
for j=1:count
    fprintf(fid2,'pattern#%d \n',j);
    M=C{j}
    M=char(M)
   % for i=2:m+1;
  %for i=1:m
 % Z(i,:)=char(M(i,:))
%        M(i,:)=strrep(num2str(M(i,:)),'42','*')
   
sprintf('%s\n',M)
    end
   
%end
fclose(fid2);