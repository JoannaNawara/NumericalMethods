%format rat

f=@(x) x^3-3;
fun=@(x) exp(-x)+sin(2*x+pi/3);

%[x1, iter] = bisekcja(f,0,4,0.1);
[x1, iter]=bisekcja(fun,0,4,0.01)

function [x1, iter] = bisekcja(fun, a, b, eps)
    iter=0;
    x1=(a+b)/2;
    while abs(b-a)>eps
       iter=iter+1;
       x1=(a+b)/2;
       if (fun(a)*fun(x1) < 0)
            % root is between a and x
            b = x1;
        else
            % root is between x and b
            a = x1;
        end
    end
end