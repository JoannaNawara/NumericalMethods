fun=@(x,y) y-x^2;
a=0;
b=2;
h=0.1;
x0=0;
y0=1;
x=[a:h:b];

y1=rrz1_ab(fun, a,b,h,x0,y0);
y2=rrz2_ab(fun, a,b,h,x0,y0);
y3=rrz3_ab(fun, a,b,h,x0,y0);
y4=rrz4_ab(fun, a,b,h,x0,y0);
index=(b-a)/h;
ab1_19=y1(index);
ab2_19=y2(index);
ab3_19=y3(index);
ab4_19=y4(index);

function [y] = rrz1_ab(fun, a,b,h,x0,y0)
    y=rrz_rk(fun,a,a+h,h,x0,y0);
    x=a+h;
    for i=3:((b-a)/h+1)
        y(i)=y(i-1)+h/2*(-fun(x-h, y(i-2))+3*fun(x,y(i-1)));
        x=x+h;
    end
end

function [y] = rrz2_ab(fun, a,b,h,x0,y0)
    y=rrz_rk(fun,a,a+2*h,h,x0,y0);
    x=a+2*h;
    for i=4:((b-a)/h+1)
        y(i)=y(i-1)+h/12*(5*fun(x-2*h, y(i-3))-16*fun(x-h,y(i-2))+23*fun(x,y(i-1)));
        x=x+h;
    end
end

function [y] = rrz3_ab(fun, a,b,h,x0,y0)
    y=rrz_rk(fun,a,a+3*h,h,x0,y0);
    x=a+3*h;
    for i=5:((b-a)/h+1)
        y(i)=y(i-1)+h/24*(-9*fun(x-3*h, y(i-4))+37*fun(x-2*h, y(i-3))-59*fun(x-h,y(i-2))+55*fun(x,y(i-1)));
        x=x+h;
    end
end

function [y] = rrz4_ab(fun, a,b,h,x0,y0)
    y=rrz_rk(fun,a,a+4*h,h,x0,y0);
    x=a+4*h;
    for i=6:((b-a)/h+1)
        y(i)=y(i-1)+h/720*(251*fun(x-4*h, y(i-5))-1274*fun(x-3*h, y(i-4))+2616*fun(x-2*h, y(i-3))-2774*fun(x-h,y(i-2))+1901*fun(x,y(i-1)));
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