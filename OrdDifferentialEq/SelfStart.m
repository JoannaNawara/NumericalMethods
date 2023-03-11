%syms y(x);
%ode = diff(x,y) == y-x.^2;
%cond = y(0) == 1;
%ySol(x) = dsolve(ode, cond)

f_r=@(x) 2*x-exp(x) + x.^2 +2; 
fun=@(x,y) y-x^2;
a=0;
b=2;
h=0.1;
x0=0;
y0=1;
x=[a:h:b];
y1=rrz_euler(fun, a,b,h,x0,y0);
y2=rrz_trapez(fun, a,b,h,x0,y0);
y3=rrz_rk(fun, a,b,h,x0,y0);
index=(b-a)/h;
eu_19=y1(index);
tr_19=y2(index);
an_19=2*(1.9)-exp(1.9)+(1.9)^2+2
rk_19=y3(index);

plot(x,y3,'b', x,y2, 'y', x,y1, x, f_r(x), 'ro')
legend("Rungy-Kutty", "trapez", "Euler", "analitycznie", 'Location','northwest')

%syms y(x);
%ode = diff(x,y) == y-x^2;
%cond = y(0) == 1;
%ySol(x) = dsolve(ode, cond)

function [y] = rrz_euler(fun, a,b,h,x0,y0)
    y(1)=y0;
    x=a;
    for i=2:((b-a)/h+1)
        y(i)=y(i-1)+h*fun(x, y(i-1));
        x=x+h;
    end
end

function [tra] = rrz_trapez(fun, a,b,h,x0,y0)
    tra(1)=y0;
    x=a;
    for i=2:((b-a)/h+1)
        tra(i)=tra(i-1)+h/2*(fun(x,tra(i-1))+fun(x+h, tra(i-1)+h*fun(x,tra(i-1))));
        x=x+h;
    end
end

function [rk] = rrz_rk(fun, a,b,h,x0,y0)
    rk(1)=y0;
    x=a;
    for i=2:((b-a)/h+1)
        k1=h*fun(x,rk(i-1));
        k2=h*fun(x+1/2*h, rk(i-1)+1/2*k1);
        k3=h*fun(x+1/2*h, rk(i-1)+1/2*k2);
        k4=h*fun(x+h, rk(i-1)+k3);
        rk(i)=rk(i-1)+1/6*(k1+2*k2+2*k3+k4);
        x=x+h;
    end
end