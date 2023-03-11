format rat

A=[6 4 1; 1 -3 -1; 1 -1 -4];
B=[11 -3 -4]';
X0 = [2 0 -2]';
eps=[10^(-1) 10^(-2) 10^(-3) 10^(-4) 10^(-5) 10^(-6) 10^(-7) 10^(-8) 10^(-9) 10^(-10)];

il_iteracji=zeros(length(eps),1)';
wynik=zeros(length(eps),1)';
diff=zeros(length(eps),1)';

for i=1:length(eps)
    [X,iter,roznica]=it_prosta(A,B,X0,eps(i));
    il_iteracji(i)=iter;
    x(i)=X(1);
    y(i)=X(2);
    z(i)=X(3);
    diff(i)=sum(roznica);
end

subplot(311)
semilogx(eps, il_iteracji,'ob'); 
title("Zaleznosc ilosci iteracji od wartosci eps");
ylabel("ilosc iteracji");

subplot(312)
semilogx(eps, log(diff), 'ob');
title("Suma wartosci bezwzglednych roznic poszczegolnych skladowych wektora rozwiazan dla dwoch ostatnich ietracji");
ylabel("Suma roznic");

subplot(313)
semilogx(eps,x,':ob', eps,y,':or', eps, z, ':oy');
title("Wartosci wektora X");
legend("x","y","z",'Location','northwest');



function [X,iter,roznica]=it_prosta(A,B,X0,eps)
    D=zeros(length(A));
    R=zeros(length(A));
    
    for i=1:length(A)
       D(i,i)=1/A(i,i);
    end
    
    for i=1:length(A)
       for j=1:length(A)
           if i ~= j
               R(i,j)=A(i,j);
       end
    end
    
    W=-D*R;
    Z=D*B;
    
    X1=W*X0+Z;
    roznica=abs(X1-X0);
    iter=1;

    while max(roznica) > eps
        iter=iter+1;
        Xi=W*X1+Z;
        roznica=abs(Xi-X1);
        X1=Xi;
    end
    X=X1;
    end
    
end