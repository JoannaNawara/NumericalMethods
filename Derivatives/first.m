syms x
f=@(x) 1/3*x.^2.*sin(3*x);
g=@(x)(2*x.*sin(3*x))/3 + x.^2.*cos(3*x);
x=[-2*pi:0.1:2*pi];


subplot(211)
plot(x, f(x), 'g', 'LineWidth',0.1 )
hold on
plot(x,myfirst_2order(f,x, 0.5), 'or', 'MarkerSize', 4, 'LineWidth',0.5);
plot(x, myfirst_4order(f, x, 0.5), 'r.', 'MarkerSize', 2, 'LineWidth',0.5);
plot(x, g(x));
hold off
title("Pierwsza pochodna h=0.5");
legend("funkcja", "wzor 2rz", "wzor 4rz", 'pochodna');

subplot(212)
plot(x, f(x), 'g', 'LineWidth',0.1 )
hold on
plot(x,myfirst_2order(f,x, 0.1), 'or', 'MarkerSize', 4, 'LineWidth',0.5);
plot(x, myfirst_4order(f, x, 0.1), 'r.', 'MarkerSize', 2, 'LineWidth',0.5);
plot(x, g(x));
hold off
title("Pierwsza pochodna h=0.1");
legend("funkcja", "wzor 2rz", "wzor 4rz", 'pochodna');

p_a=g(-5.5)
p_2=myfirst_2order(f,-5.5, 0.5);
p_4=myfirst_4order(f, -5.5, 0.5);

function y = myfirst_2order(f,x,h)
    y=(f(x+h)-f(x-h))/(2*h);
end

function y = myfirst_4order(f,x,h)
    y=1/(12*h)*(f(x-2*h)-8*f(x-h)+8*f(x+h)-f(x+2*h));
end