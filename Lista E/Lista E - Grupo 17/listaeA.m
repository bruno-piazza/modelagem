clear all
clc
close all
%% 
%   INTRODUÇÃO
%Parâmetros do sistema
%Declaração de variáveis
m=1;b=1;k=1;

%Definição da função de transferência
s=tf('s');
G=1/(m*s^2+b*s+k);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Simulação do sistema
%Criação do vetor de tempo
t=0:.01:9;

%Definição da entrada
u=ones(size(t));

%Definição do vetor de condições iniciais
x0=[0;0];

%Plots
figure(1)
[y,~,~]=lsim(G,u,t,x0);

figure(1)
plot(t,y,t,u)
title('Resultado da simulação (entrada em degrau) para m=1, k=1 e c=1 (\zeta=0,5)')
grid on
axis([0 max(t) 0 1.2])
ylabel('Posição [m]')
xlabel('Tempo [s]')
legend('Posição','Sinal de entrada')
%%
%   QUESTÃO 1
%Frequência natural
FrequenciaNatural=sqrt(k/m)

%Amortecimento
Zeta=b/(2*sqrt(k*m))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Matriz A
A=[0,1;-k/m,-b/m];

%Cálculo dos autovalores
[V,AutoValores] = eig(A);
AutoValores

%Cálculo das raízes do denominador
raizes=roots([m,b,k])

%Módulo das raízes
Modulo=abs(raizes)

%Real/Mod = Coef de amort
Real=abs(real(raizes));
CoefAmort=Real/Modulo

%%
%   QUESTÃO 2
figure(2)
plot(real(raizes),imag(raizes),'x')
title('Polos do sistema')
grid on
ylabel('Eixo dos Reais')
xlabel('Eixo Imaginário')
text(real(raizes(1))-0.1,-0.1+imag(raizes(1)),'-0,5 + 0,8660i');
text(real(raizes(2))-0.1,0.1+imag(raizes(2)),'-0,5 - 0,8660i');

for i=1:4
    %Definição do vetor de condições iniciais
    x0n=[0,0.5,0.75,1;0,0.5,.75,1];

    %Simulação
    %Gambiarra
    [A,B,C,D] = ssdata(G);
    Gn = ss(A,B,C,D);
    [y,tout,x]=lsim(Gn,u,t,[x0n(1,i);x0n(2,i)]);
    
    %Plots  
    figure(3)
    plot(x(:,1),y)
    title('Plano de fases para m=1, k=1 e c=1 (\zeta=0,5)')
    grid on
    ylabel('Velocidade [m/s]')
    xlabel('Posição [m]')
    legend('x_0=0 e v_0=0','x_0=0,5 e v_0=0,5','x_0=0,75 e v_0=0,75','x_0=1 e v_0=1')
    axis ([-0.4 1 0 1.6])
    hold on
    
end