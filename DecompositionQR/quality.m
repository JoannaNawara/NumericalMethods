nx=[15,30,75,150,300,750];
ny=[10,30,50,100,200,500];
rng(42)
for i=1:length(nx)
    A = randi([-500, 500], nx(i), ny(i));
    tic; [Q,R] = qr_gs(A);time_qr_gs(i) = toc;
    err_qr_gs(i) = sum(sum(Q*R-A));
    
    tic; [Q1,R1] = qr_ht(A);time_qr_ht(i) = toc;
    err_qr_ht(i) = sum(sum(Q1*R1-A));
    
    tic; [Q2,R2] = qr(A);time_qr(i) = toc;
    err_qr(i) = sum(sum(Q2*R2-A));
end

pom=[0 150 300 450 600 750];
subplot(321), plot(pom, time_qr, 'o'); ylabel('czas [s]'); xlabel('rozmiar macierzy'); 
title('Czas realizacji dekompozycji qr()');
xticks(pom); xticklabels({'15x10','30x30','75x50','150x100','300x200','750x500'}); xtickangle(45);

subplot(323), plot(pom, time_qr_gs, 'or'); ylabel('czas [s]'); xlabel('rozmiar macierzy'); 
title('Czas realizacji dekompozycji qr\_qs()');
xticks(pom); xticklabels({'15x10','30x30','75x50','150x100','300x200','750x500'}); xtickangle(45);

subplot(325), plot(pom, time_qr_ht, 'og'); ylabel('czas [s]'); xlabel('rozmiar macierzy'); 
title('Czas realizacji dekompozycji qr\_ht()');
xticks(pom); xticklabels({'15x10','30x30','75x50','150x100','300x200','750x500'}); xtickangle(45);

subplot(322), plot(pom, err_qr, 'o'); ylabel('suma roznic |QR-A|'); xlabel('rozmiar macierzy'); 
title('Błąd dekompozycji QR qr()');
xticks(pom); xticklabels({'15x10','30x30','75x50','150x100','300x200','750x500'}); xtickangle(45);

subplot(324), plot(pom, err_qr_gs, 'or'); ylabel('suma roznic |QR-A|'); xlabel('rozmiar macierzy'); 
title('Błąd dekompozycji QR qr\_gs()');
xticks(pom); xticklabels({'15x10','30x30','75x50','150x100','300x200','750x500'}); xtickangle(45);

subplot(326), plot(pom, err_qr_ht, 'og'); ylabel('suma roznic |QR-A|'); xlabel('rozmiar macierzy'); 
title('Błąd dekompozycji QR qr\_ht()');
xticks(pom); xticklabels({'15x10','30x30','75x50','150x100','300x200','750x500'}); xtickangle(45);

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

function [Q R] = qr_ht(A)
    m = length(A(:,1)); %wiersze
    n = length(A(1,:)); %kolumny
    Q=zeros(m,m);
    I=eye(m);
    H=zeros(m,m);
    Q=I;
    R=A;
    
    for i=1:n
        a = zeros(m,1);
        e=zeros(m,1);
        a(i:m,1)=R(i:m,i);
        norma=norm(a);
        for j=1:m
           if i==j
               e(j)=1;
           end
        end
        v1=a+sign(A(i,i))*norma*e;
        
        H=I-2*v1*v1'/(v1'*v1);
        R=H*R;
        Q=Q*H;
    end
end
