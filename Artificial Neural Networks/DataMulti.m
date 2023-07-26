A

%Conjunto de dados
%Total de 120 Amostras, K40 amostras para cada class
K=40;

%Importa dados
%X_A - Classe A; X_B - Classe B; X_C - Classe C;
%X_Teste - Dados para teste da RN
Data_multi

%Visualização das classes
A = X_A';
B = X_B';
C = X_C';

plot(A(1, :), A(2,:),'bs');
grid on
hold on
plot(B(1,:), B(2,:), 'r+');
plot(C(1,:), C(2,:), 'ko')


%Topologia da rede 3x5x3
%Com adição de um neuronio de bias na camada escondida
%Inicialização dos pesos no intervalo [-1 1]
%W1: 4X3
W1 = 2*rand(4, 3) - 1;
%W2: 5(=4+bias)x3
W2 = 2*rand(3, 5) - 1;

%juntar a matriz teste a cada classe
display(W1);
display(W2);

%Com uma entrada de bias na camada entrada
%Bias =+1
bias_A=ones(K,1);
%Adiciona o vector de bias ao conjunto A
X_A =[X_A, bias_A];
%Conjunto de saída da classe A
T_A = ones(K,3) .* [1 0 0];

bias_B = ones(K,1);
%Adiciona o vector de bias ao conjunto B
X_B=[X_B, bias_B];
%Conjunto de saída da classe B
T_B = ones(K,3).*[0 1 0];

%Adiciona o vector de bias ao conjunto C
bias_C = ones(K,1);
X_C = [X_C, bias_C];
%Conjunto de saída da classe C
T_C=ones(K,3).*[0 0 1];

%Concatenação dos três vetores da entrada
X = [ X_A;
      X_B;
      X_C];
%Concatenação dos trÊs vetores de saída
T=[ T_A;
    T_B;
    T_C];
%--------------------------------------
N = 3*K;     % Número de total de amostras
n_epochs = 30000; %Número de Epocas
SSE = zeros(1,n_epochs); %Inicialização da soma do erro quadrático
alpha = 0.9; 

%Ciclo de treino da RN
for epoch = 1:n_epochs
    sum_sq_error = 0;
    for k=1:N
        x = X(k,:)';
        t = T(k,:)';
        %Soma da camada de entrada
        g1 = W1*x;
        %Saída da camada de entrada
        y1 = sig(g1);
        %---------------------------
       %Com bias na camada escondida
       y1_b = [y1
               1];

       %Soma da camada de saída
       g2 = W2*y1_b;
       %Saída da camada de saída
       y2 = sig(g2);
       %Erro da camada de saída
       e = t-y2;
       %Delta da camada de saída 
       delta2 = y2 .* (1-y2) .*e;

       %Atualização do SSE
       sum_sq_error = sum_sq_error + sum(e.^2);

       %Erro da camada escondida
       e1 = W2' * delta2;
       %Tirando o bias
       e1_b = e1(1:4);
       %Atualização dos pesos
       dW2 = alpha*delta2*y1_b';
       W2 = W2 +dW2;

       %Com bias
       delta1 = y1.*(1-y1).*e1_b;

       dW1 = alpha*delta1*x';
       W1  = W1 + dW1;
    end
    SSE(epoch) = (sum_sq_error)/N;
    %fprintf(1,'E=%d/t SSE =%3.6f\n', epoch, SSE(epoch));
end


N = 10;

yplot=zeros(N,3);

%Acrescentar Bios à matriz XTeste
XTeste_Bios = ones(N,1);
X_teste = [X_teste, XTeste_Bios];

for k = 1:N
   
   x_teste = X_teste(k,:)';
   g1=W1*x_teste;
   %Sigmoide
   y1 = sig(g1);
   %y1 adicionada com entrada de bias
   y1_b = [y1
           1];
   %Soma e saída
   g2 = W2*y1_b;
   y2= sig(g2);
   %Para o grafico
   y_plot(k,:) = y2;

end
%Limite para a classificação
limite = 0.9;
y_bin = y_plot>limite;

for k = 1:N
    display(y_bin(k, :));A
    display(X_teste(k,1));
    display(X_teste(k,2));
    if y_bin(k, :) == [1 0 0]
        plot(X_teste(k,1), X_teste(k,2), 'bd', 'MarkerFaceColor','b');
    elseif y_bin(k, :) == [0 1 0]
        plot(X_teste(k,1), X_teste(k,2), 'rd', 'MarkerFaceColor','r');
    elseif y_bin(k, :) == [0 0 1]
        plot(X_teste(k,1), X_teste(k,2), 'kd', 'MarkerFaceColor','k');
    else
        plot(X_teste(k,1), X_teste(k,2), 'md', 'MarkerFaceColor','m');
    end
end
hold off;

figure
It=1:1:n_epochs;
plot(It,SSE,'r-', 'LineWidth',2)
xlabel('Época')
ylabel('SSE')
title('Função de ativação: Sigmode')