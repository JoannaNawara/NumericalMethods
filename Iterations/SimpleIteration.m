A=[6 4 1; 1 -3 -1; 1 -1 -4];
B=[11 -3 -4]';
D=[6 0 0; 0 -3 0; 0 0 -4];
R=[0 4 1; 1 0 -1; 1 -1 0];
X0 = [2 0 -2]';

invD = [1/6 0 0; 0 -1/3 0; 0 0 -1/4];

W=-invD*R
Z=invD*B;

result=[0 0 0];
result2=[0 0 0];
r3=0;

for i=1:3
    r1=0;
    r2=0;
   for j=1:3 
        r1 = r1 + W(i,j);
        r2 = r2 + W(j,i);
        r3 = r3 + W(i,j)*W(i,j);
        
   end
   result(i)=abs(r1);
   result2(i)=abs(r2);
end

w1=max(result)
w2=max(result2)
w3=sqrt(r3)

X1=W*X0+Z;
diff=abs(X1-X0);

while diff > 0.001
    Xi=W*X1+Z;
    diff=abs(Xi-X1);
    X1=Xi;
end

X=X1


