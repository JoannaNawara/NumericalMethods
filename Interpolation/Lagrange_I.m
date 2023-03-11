x=[1 2 3];
y=[0 1 4];
iks=[1,1.5]
iksCheck=[2:0.1:4]


[igrek] = interp_lagrange(x,y,iks)
[igrekCheck] = interp_lagrange(x,y,iksCheck)

suma_igrek=sum(igrekCheck)

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