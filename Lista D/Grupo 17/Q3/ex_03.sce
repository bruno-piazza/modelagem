// Simulação de sistema linear
// Apagando as variáveis anteriores
clear
// Fechando as janelas de gráficos
clc
close


// Definindo parâmetros
S1 = 10; // [m^2] Área da seção transversal do reservatório 1
S2 = 10; // [m^2] Área da seção transversal do reservatório 2
rho = 1000; // [kg/m^3] massa específica da água
g = 10; // [m/s^2] aceleração da gravidade na superfície da Terra
Ra = 2*10^8; // [Pa/(m^3/s)^2] parâmetro que relaciona pressão e vazão no res. 1
Rs = 2*10^8; // [Pa/(m^3/s)^2] parâmetro que relaciona pressão e vazão no res. 2
ho = 2; // [m] nível do reservatório em regime
hi = 0.1; // [m] nível adicional desejado
Qei = sqrt ( rho *g*(ho+hi)/Ra); // [m^3/s] vazão na entrada

// Definir o vetor de instantes de tempo:
t=0:10:40000;

// Definicao das matrizes do sistema linearizado
A= rho *g/(2* Qei )*[-1/S1/Ra ,1/S1/Ra ;1/S2/Ra ,-1/S2*(1/Ra +1/Rs)];
B =[1 /S1 ;0];
C =[1 ,0;0 ,1];
D =[0;0];

tanque = syslin('c',A,B,C,D); // o parametro 'c' indica que o sistema é contínuo no tempo
 
// Definir a condição inicial:
x01 = -2.2; // [m] desvio inicial do nível em relação ao equilíbrio no res.1
x02 = -0.1; // [m] desvio inicial do nível em relação ao equilíbrio no res.1
x0 = [x01;x02];

// V azão de equilíbrio [m^3/s]
Qeo = sqrt ( rho *g*2*(ho+hi)/(Ra+Rs))

// Definir o vetor de entradas:
u = (Qei-Qeo)*ones(t);

// Simulando o sistema usando o comando csim:
[y,x]=csim(u,t,tanque,x0);

scf(1)
// Plotando o resultado linear em azul:
plot(t,x(1,:),'b-','LineWidth',2.7)
//Plotano o resultado não linear em vermelho:
plot(t,x(2,:),'r-','LineWidth',2.7);
// Usando a variável do tipo 'lista':
T=list("Resposta do tanque","Variação de nível [m]","Tempo [s]","Reservatório 1","Reservatório 2");

//Título do gráfico e configuração da fonte:
title(T(1),'fontsize',4);

// Colocando uma legenda na parte inferior direito da figura (parâmetro 2):
legends([T(4),T(5)],[2,5],4,'fontsize',3.5);

// Nomeando os eixos:
xlabel(T(3),'fontsize',3);
ylabel(T(2),'fontsize',3);

// Colocando uma grade azul no grafico:
xgrid(2) 

// Salvando a imagem:
xs2png(1,'caso1.png');
