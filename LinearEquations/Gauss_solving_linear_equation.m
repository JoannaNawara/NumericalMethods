A=[-1 2 1; 1 -3 -2; 3 -1 -1];
B=[-1 -1 4]';
Au=[A B];

rng(42);
G=randi([-30,30],6,6);
d=randi([-78,78],6,1);
Gu=[G d];

Gu

for s=1:2
   for i=(s+1):3
      for j=(s+1):4
         Au(i,j)=Au(i,j)-Au(i,s)/Au(s,s)*Au(s,j);
      end
   end
end

Au

sumX=[0 0 0];
x=[0 0 0];
n=3;

for i=3:-1:1
    suma=0;
    for j=i+1:n
        suma=suma+Au(i,j)*sumX(j);
    end
    sumX(i)=(Au(i,n+1)-suma)/Au(i,i);
end

Y=sumX'


%-----------------------------------------

for s=1:5
   for i=(s+1):6
      for j=(s+1):7
         Gu(i,j)=Gu(i,j)-Gu(i,s)/Gu(s,s)*Gu(s,j);
      end
   end
end

summ=[0 0 0];
y=[0 0 0];
n=6;

for i=6:-1:1
    suma=0;
    for j=i+1:n
        suma=suma+Gu(i,j)*summ(j);
    end
    summ(i)=(Gu(i,n+1)-suma)/Gu(i,i);
end

m=summ'