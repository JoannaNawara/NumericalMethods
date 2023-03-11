%x = [0    1.5708    3.1416    4.7124];
%y = [0     3     4     1];

x = [0    0.7854    1.5708    2.3562    3.1416    3.9270    4.7124    5.4978];
y= [4.0000    1.2929   -1.0000    1.2929    4.0000    2.7071    1.0000    2.7071];

x2=0:0.01:6.28;

[A0, A, B] = aproksymacja_trygonometryczna(x,y, 2*pi, 8)

[res] = F(A0,A,B,x2,2*pi)

plot(x2,res,'r', x,y,'ob')


function [res] = F(A0, A, B, x,T)
    w=2*pi/T;
    res=A0;
    for i=1:length(A)
       res=res+A(i)*cos(i*w*x)+B(i)*sin(i*w*x);
    end
end


function [A0, A, B] = aproksymacja_trygonometryczna(x,y, T, st);
    %w=2*pi/T;
    N=length(x);
    if mod(N,2) == 0
        m=(N-2)/2;
    else
        m=(N-1)/2;
    end
    %m=st;
    A0=sum(y)/N;
    A=zeros(m,1);
    B=zeros(m,1);
    for k=1:m
       for i=0:(N-1)
           A(k)=A(k)+y(i+1)*cos((2*pi)/N*i*k);
           B(k)=B(k)+y(i+1)*sin((2*pi)/N*i*k);
       end
    end
    A=2*A/N;
    B=2*B/N;
    
end