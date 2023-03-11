A=[1 4 2 -2; 1 6 1 -1; -1 0 0 5;3 6 9 8;]
[L,U]=dekmpLU(A)
[determinant]=detLU(L,U)

function [determinant] = detLU(L,U)
    detL=1;
    detU=1;
    for i=1:4
       detL=detL*L(i,i);
       detU=detU*U(i,i);
    end
    determinant=detL*detU;
end

function [L,U] = dekmpLU(A)
    L1=diag(ones(4,1));
    L2=diag(ones(4,1));
    L3=diag(ones(4,1));
    for i=2:4
        L1(i,1)=-A(i,1)/A(1,1);
    end
    L1
    A2=L1*A;
    A2
    for i=3:4
        L2(i,2)=-A2(i,2)/A2(2,2);
    end
    L2
    A3=L2*A2;
    A3
    L3(4,3)=-A3(4,3)/A3(3,3);
    L3
    U=A3*L3;
    L=inv(L1)*inv(L2)*inv(L3);
end
