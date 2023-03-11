a=[1 4 2 -2; 1 6 1 -1; -1 0 0 5; 3 6 9 8;]
rng(42);
B=randi([-3,3],6,6)

for s=1:3
   for i=(s+1):4
      for j=(s+1):4
         a(i,j)=a(i,j)-a(i,s)/a(s,s)*a(s,j)
      end
   end
end

detA=a(1,1)*a(2,2)*a(3,3)*a(4,4)

for s=1:6
   for i=(s+1):6
      for j=(s+1):6
         B(i,j)=B(i,j)-B(i,s)/B(s,s)*B(s,j)
      end
   end
end

detA=a(1,1)*a(2,2)*a(3,3)*a(4,4)
detB=B(1,1)*B(2,2)*B(3,3)*B(4,4)*B(5,5)*B(6,6)


