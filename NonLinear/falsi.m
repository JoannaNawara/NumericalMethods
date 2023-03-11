f=@(x) x^3-3;
fun=@(x) exp(-x)+sin(2*x+pi/3);

%[x1, iter] = bisekcja(f,0,4,0.1);
[x1, iter]=regula_falsi(fun,0,4,0.01)


function [x1, iter] = regula_falsi(fun, a, b, eps)
    iter=0;
    x1=a-fun(a)*(b-a)/(fun(b)-fun(a));
    while abs(fun(x1))>eps
        x1=a-fun(a)*(b-a)/(fun(b)-fun(a));
        if (fun(a)*fun(x1) < 0)
            % root is between a and x
            b = x1;
        else
            % root is between x and b
            a = x1;
        end
        iter=iter+1;
    end
end