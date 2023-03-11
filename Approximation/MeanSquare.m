x = [-2,-1,0,1,2];
y = [4,1,0,1,4];
st=2;

x2 = [-3 ,  -2,    -1,     0 ,    1,     2,     3];
y2 = [-13.5092,   15.0143,   15.6399,   11.9732,    2.1204,    7.1199,   22.1617];
st2 = 3;

[m] = aproks(x,y,st);
[m3] = aproks(x2,y2,st2);

m
m3

function [m] = aproks(x,y,st)
    G=zeros(length(x), st+1);
    for i=1:length(x)
        G(i,1)=1;
        for j=2:(st+1)
           G(i,j)=x(i)^(j-1); 
        end
    end
    m=linsolve(G,y');
end
