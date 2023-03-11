syms x

fun=@(x) exp(-x)+sin(2*x+pi/3);
pochodna=@(x) 2*cos(2*x + pi/3) - exp(-x);

[x1, iter]=stycznych(fun, pochodna, 0, 4, 0.01, 4)

function [x1, iter, x_all] = stycznych(fun, pochodna, a, b, eps, x0)
    iter=1;
    x1=x0-fun(x0)/pochodna(x0);
    x_all(iter)=x1;
    while abs(fun(x1))>eps
       x1=x1-fun(x1)/pochodna(x1);
       iter=iter+1;
       x_all(iter)=x1;
    end
end