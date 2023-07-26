%Random Search Algorithm
%==============================
% Francisco Conceição al73819
%==============================

clear
close all
clc

%Inicialização de vetores X, Y, Z  da funçao
X = zeros(1, 1);
Y = zeros(1, 1);
Z = zeros(1, 1);
%a=3;
%b=10; 
a = 9;
b = 5;

f1 = @(x,y) a .* (1- x^2) .* exp(-x.^2 - (y+1).^2);
f2 =  @(x, y) -b .* (x./5 - x.^3 - y.^5) .* exp(-x.^2 - y.^2);
f3 =  @(x, y) -1/3 .* exp(-(x + 1).^2 - y.^2);
f =  @(x,y) abs(f1(x,y) + f2(x,y) + f3(x,y));

xyMax = [3 3];
xyMin = [-3 -3];

EixoX = linspace(-3, 3, 100);
EixoY = linspace(-3, 3, 100);
[cordX, cordY] = meshgrid(EixoX, EixoY);

cordZ = f(cordX, cordY);

contour(cordX, cordY, cordZ, 20);

hold on

x = 3 + (-3-3) * rand();
y = 3 + (-3-3) * rand();

plot(x, y, 'bo');
grid on

for i = 1:1000

    x = 3 + (-3-3) * rand();
    y = 3 + (-3-3) * rand();
    z = f(x,y);
    
    X(i) = x;
    Y(i) = y;
    Z(i) = z;
    
    plot(x, y, 'bo');
end

f = figure;

colormap(f,hot);
C = cordX .* cordY;
surf(cordX, cordY, cordZ, C);
colorbar;
hold on;
plot3(X, Y, Z, 'bo', 'MarkerFaceColor','b');
figure("Name", "AAA");
plot(Z, 'r');
hold off