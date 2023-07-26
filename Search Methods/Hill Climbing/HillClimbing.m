%Hill Climbing 
%===============================
%Francisco Conceição al73819
%================================

clear
close all
clc

%Inicialização dos vetores X Y Z
X = zeros(1,1);
Y = zeros(1,1);
Z = zeros(1,1);
I = zeros(1,1);

a = 9;
b = 5;

f1 = @(x,y) a .* (1- x^2) .* exp(-x.^2 - (y+1).^2);
f2 =  @(x, y) -b .* (x./5 - x.^3 - y.^5) .* exp(-x.^2 - y.^2);
f3 =  @(x, y) -1/3 .* exp(-(x + 1).^2 - y.^2);
f =  @(x,y) abs(f1(x,y) + f2(x,y) + f3(x,y));


Max = [3 3];
Min = [-3 -3];

EixoX = linspace(-3, 3, 50);
EixoY = linspace(-3, 3, 50);

[cordX, cordY] = meshgrid(EixoX, EixoY);

cordZ = f(cordX, cordY);
contourf(cordX, cordY, cordZ, 20);
colormap(cool)
hold on

x = 3 + (-3 -3)* rand();
y= 3 + (-3 -3)* rand();

p = plot(x, y, 'ro','MarkerFaceColor','r');
grid on;

for i = 1:500
    x_temp = (rand - 0.5) * 2 * 0.05 + x;
    y_temp = (rand - 0.5) * 2 * 0.05 + y;
    
    x_temp = min(x_temp, Max(1));
    y_temp = min(y_temp, Max(2));

    if(f(x_temp, y_temp) > f(x, y))
        x = x_temp;
        y = y_temp;

        plot(x, y, 'ro','MarkerFaceColor','r');
        pause(0.05);
    end
    
    X(i) = x;
    Y(i) = y;
    Z(i) = f(x, y);
    I(i) = i;
end
f = figure;

colormap(f,cool);
C = cordX .* cordY;
surf(cordX, cordY, cordZ, C);
colorbar;
hold on;
plot3(X, Y, Z, 'ro', 'MarkerFaceColor','r');
figure("Name", "AAA");
plot(I,X,I, Y, I, Z); 
legend('X','Y','Z');
hold off