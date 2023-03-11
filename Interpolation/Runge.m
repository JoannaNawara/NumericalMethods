%Define variables a, b, and c
a = 1;
b = -5;
c = 6;

x = [-5:0.01:5];

[x2,y2]=gen(2);
[x4,y4]=gen(4);
[x6,y6]=gen(6);
[x8,y8]=gen(8);
[x10,y10]=gen(10);

[y_n1] = interp_lagrange(x2,y2,x);
[y_n2] = interp_lagrange(x4,y4,x);
[y_n3] = interp_lagrange(x6,y6,x);
[y_n4] = interp_lagrange(x8,y8,x);
[y_n5] = interp_lagrange(x10,y10,x);

subplot(331), plot(x,(1./(1+x.^2))); title("Funkcja Rungego");
subplot(332), plot(x, y_n1, 'r', x2,y2,'or'); title("Interpolacja Lagranga n=2");
subplot(333), plot(x, y_n2, 'r', x4,y4,'or'); title("Interpolacja Lagranga n=4");
subplot(334), plot(x, y_n3, 'r', x6,y6,'or'); title("Interpolacja Lagranga n=6");
subplot(335), plot(x, y_n4, 'r', x8,y8,'or'); title("Interpolacja Lagranga n=8");
subplot(336), plot(x, y_n5, 'r', x10,y10,'or'); title("Interpolacja Lagranga n=10");

[y_n6] = interpSplajn(x2,y2,x,0,0);
[y_n7] = interpSplajn(x4,y4,x,0,0);
[igrek6s] = interpSplajn(x6,y6,x,0,0);
[y_n9] = interpSplajn(x8,y8,x,0,0);
[igrek10s] = interpSplajn(x10,y10,x,0,0);

subplot(331), plot(x,(1./(1+x.^2))); title("Funkcja Rungego");
subplot(332), plot(x, y_n6, 'r', x2,y2,'or'); title("Interpolacja splajnami n=2");
subplot(333), plot(x, y_n7, 'r', x4,y4,'or'); title("Interpolacja splajnami n=4");
subplot(334), plot(x, igrek6s, 'r', x6,y6,'or'); title("Interpolacja splajnami n=6");
subplot(335), plot(x, y_n9, 'r', x8,y8,'or'); title("Interpolacja splajnami n=8");
subplot(336), plot(x, igrek10s, 'r', x10,y10,'or'); title("Interpolacja splajnami n=10");

function [x,y] = gen(n)
    for i=1:(n+1)
       x(i)=-5+(i-1)*10/n; 
       y(i)=1/(1+x(i)^2);
    end
end

function [y_n] = interpSplajn(x,y,x0,kat1,kat2)
    [x i]=sort(x);
    y=y(i);
    
    n=length(x); %ilosc elementow
    m=n+2; % ilosc niewiadomych
    
    G=zeros(m,m);
    d=zeros(m,1);
    m1=zeros(n,4);
    m2=zeros(n,n-2);
    m3=zeros(2,4);
    m4=zeros(2,n-2);
    
    for i=1:n %pierwsza macierz
       for j=1:4
           m1(i,j)=x(i)^(j-1);
       end
        for j=1:(n-2) %druga macierz
            if x(i)-x(j+1) > 0
               m2(i,j)=(x(i)-x(j+1))^3;
            else
               m2(i,j)=0;
            end
        end
    end
    %trzecia macierz
    for j=2:4
        m3(1,j)=(j-1)*x(1)^(j-2);
    end
    for j=2:4
        m3(2,j)=(j-1)*x(n)^(j-2);
    end
    
    
    for j=1:(n-2)
        if x(1)-x(j+1) > 0
            m4(1,j)=3*(x(1)-x(j+1))^2;
        else
            m4(1,j)=0;
        end
    end
    for j=1:(n-2)
        if x(n)-x(j+1) > 0
            m4(2,j)=3*(x(n)-x(j+1))^2;
        else
            m4(2,j)=0;
        end
    end
    
    
    G = [m1 m2;m3 m4];
    d = zeros(m,1);
    d(1:n)=y;
    d(n+1)=tan(deg2rad(kat1));
    d(n+2)=tan(deg2rad(kat2));
    res=linsolve(G,d);
    
    for i=1:length(x0)
       y_n(i)=splajn(sort(x),res,x0(i)); 
    end

end
    
    
function y_n = splajn(x,res,xs)
    y_n=res(1);
    for i=2:4
        y_n=y_n+res(i)*xs^(i-1);
    end
    for i=1:(length(x)-2)
       if xs-x(i+1) > 0
          y_n=y_n+res(i+4)*(xs-x(i+1))^3; 
       end
    end
end

function [igrek] = interp_lagrange(x,y,iks)
    igrek=zeros(length(iks),1);
    suma=0;
    for i=1:length(iks)
        for k=1:length(y)
           suma=1;
           for n=1:length(x)
               if n ~= k
                    suma=suma*(iks(i)-x(n))/(x(k)-x(n));
               end
           end
           igrek(i)=igrek(i)+suma*y(k);
        end
    end
end