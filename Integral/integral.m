f1=@(x) x^2
f2=@(x) x^2-4

y=integral_rectangle(f1, 0, 10, 0.01);
p24 = integral_rectangle(f2, 2, 4, 0.01);
t04 = integral_trapez(f2, 0, 4, 0.01);

function [y] = integral_rectangle (fun,a,b,h)
    y=0;
    for i=a:h:(b-h)
        y=y+fun(i);
    end
    y=y*h;
end

function [y] = integral_trapez (fun,a,b,h)
    y=0;
    for i=(a+h):h:(b-h)
        y=y+fun(i);
    end
    y=y*h;
    y=y+h*(fun(a)+fun(b))/2 
end
