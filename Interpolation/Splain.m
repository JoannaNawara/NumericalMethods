x=[-1 0 1 3 2 ];
y=[1 -1 -2 -1 0];

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
d(n+1)=tan(deg2rad(45));
d(n+2)=tan(deg2rad(135));

res=linsolve(G,d)
f_09=splajn(sort(x),res,-0.9);
f_09


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