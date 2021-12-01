clear all
clc
close all
%% 
%   INTRODU��O
%Par�metros do sistema
%Declara��o de vari�veis
m=1;b=1;k=1;

%Defini��o da fun��o de transfer�ncia
s=tf('s');
G=1/(m*s^2+b*s+k);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Simula��o do sistema
%Cria��o do vetor de tempo
t=0:.01:9;

%Defini��o da entrada
u=ones(size(t));

%Defini��o do vetor de condi��es iniciais
x0=[0;0];

%Plots
figure(1)
[y,~,~]=lsim(G,u,t,x0);

figure(1)
plot(t,y,t,u)
title('Resultado da simula��o (entrada em degrau) para m=1, k=1 e c=1 (\zeta=0,5)')
grid on
axis([0 max(t) 0 1.2])
ylabel('Posi��o [m]')
xlabel('Tempo [s]')
legend('Posi��o','Sinal de entrada')
%%
%   QUEST�O 1
%Frequ�ncia natural
FrequenciaNatural=sqrt(k/m)

%Amortecimento
Zeta=b/(2*sqrt(k*m))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Matriz A
A=[0,1;-k/m,-b/m];

%C�lculo dos autovalores
[V,AutoValores] = eig(A);
AutoValores

%C�lculo das ra�zes do denominador
raizes=roots([m,b,k])

%M�dulo das ra�zes
Modulo=abs(raizes)

%Real/Mod = Coef de amort
Real=abs(real(raizes));
CoefAmort=Real/Modulo

%%
%   QUEST�O 2
figure(2)
plot(real(raizes),imag(raizes),'x')
title('Polos do sistema')
grid on
ylabel('Eixo dos Reais')
xlabel('Eixo Imagin�rio')
text(real(raizes(1))-0.1,-0.1+imag(raizes(1)),'-0,5 + 0,8660i');
text(real(raizes(2))-0.1,0.1+imag(raizes(2)),'-0,5 - 0,8660i');

for i=1:4
    %Defini��o do vetor de condi��es iniciais
    x0n=[0,0.5,0.75,1;0,0.5,.75,1];

    %Simula��o
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
    xlabel('Posi��o [m]')
    legend('x_0=0 e v_0=0','x_0=0,5 e v_0=0,5','x_0=0,75 e v_0=0,75','x_0=1 e v_0=1')
    axis ([-0.4 1 0 1.6])
    hold on
    
end