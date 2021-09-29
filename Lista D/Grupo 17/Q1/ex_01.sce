// Simulação de sistema linear
// Apagando as variáveis anteriores
clear
// Fechando as janelas de gráficos
clc
close
// Abrindo o diretório
getd(".")

// Definindo parâmetros
S = 10; // [m^2] Área da seção transversal do reservatório
rho = 1000; // [kg/m^3] massa específica da água
g = 10; // [m/s^2] aceleração da gravidade na superfície da Terra
R = 2*10^8; // [Pa/(m^3/s)^2] parâmetro que relaciona pressão e vazão
ho = 2; // [m] nível do reservatório em regime
hi = 0.1; // [m] nível adicional desejado
Qei = 0; // [m^3/s] vazão na entrada

// Definir o sistema linear usando o comando syslin:
A=( -1/(2*S))* sqrt ( rho *g/(R*ho ));
B=1/S;
C=1;
D=0;

tanque = syslin('c',A,B,C,D); // o parametro 'c' indica que o sistema é contínuo no tempo
 
// Definir a condição inicial:
x0=2; // [m] desvio inicial do nível em relação ao equilíbrio

// Definir o vetor de instantes de tempo:
t=0:10:40000;

// Definir o vetor de entradas:
Qeo = 0
u = 0*ones(t);

// Simulando o sistema usando o comando csim:
[y,x]=csim(u,t,tanque,x0);


// Simulacao do sistema não linear
xnlinear = ode(x0,t(1),t,list(naolinear,entrada));


scf(1)
// Plotando o resultado linear em azul:
plot(t,y,'b-','LineWidth',2.7)
//Plotano o resultado não linear em vermelho:
plot(t,xnlinear,'r-','LineWidth',2.7);
// Usando a variável do tipo 'lista':
T=list("Resposta do tanque","Variação de nível [m]","Tempo [s]","Modelo Linear","Modelo não linear");

//Título do gráfico e configuração da fonte:
title(T(1),'fontsize',4);

// Colocando uma legenda na parte inferior direito da figura (parâmetro 2):
legends([T(4),T(5)],[2,5],1,'fontsize',3.5);

// Nomeando os eixos:
xlabel(T(3),'fontsize',3);
ylabel(T(2),'fontsize',3);

// Colocando uma grade azul no grafico:
xgrid(2) 

// Salvando a imagem:
xs2png(1,'caso1.png');
