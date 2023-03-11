format rat
A = [ -1 -1 1; 1 3 3; -1 -1 5; 1 3 7]
[Q R] = qr_gs(A)

function [Q R] = qr_gs(A)
    w = length(A(:,1)); %wiersze
    k = length(A(1,:)); %kolumny
    R = zeros(k,k);
    for n=1:k
       a=A(:,n);
       for m=1:(n-1)
          R(m,n)=Q(:,m)'*a;
       end
       qn=a;
       for m=1:(n-1)
          qn=qn-R(m,n)*Q(:,m); 
       end
       for m=1:w
          R(n,n)=R(n,n)+qn(w)^2; 
       end
       R(n,n)=sqrt(R(n,n));
       Q(:,n)=1/R(n,n)*qn;
    end

end