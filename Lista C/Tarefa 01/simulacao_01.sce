clc
clear all
close 

// Definir parametros:
S=10; // [m^2] Area da secao transversal do reservatorio
rho=1000; // [kg/m^3] massa especifica da agua
g=10; // [m/s^2] aceleração da gravidade na superficie da Terra
R=2*10^8; // [Pa/(m^3/s)^2] parametro que relaciona pressao e vazao
ho=2; // [m] nivel do reservatorio em regime
hi=0.3; // [m] nível adicional desejado
Qei=sqrt(rho*g*(ho+hi)/R); // [m^3/s] vazao na entrada
//Qei = 0.012

// Definir a condicao inicial:
h0=2; // [m] nivel do reservatorio na condicao inicial

// Definir o vetor t de instantes de tempo:
t=0:10:40000; // vetor de tempo. Observe que t(1) eh o instante inicial

// Comando que realiza a simulacao numérica:
h=ode(h0,t(1),t,list(tanque,entrada)); // h eh o nivel do reservatorio [m]

// Plotando o resultado em verde:
plot2d(t,h,3)

// Definindo uma variavel do tipo 'lista':
T=list("Resposta transitoria do reservatorio","Tempo t [s]","Nivel h [m]");

// Colocando um titulo na figura e nomeando os eixos:
xtitle(T(1),T(2),T(3));

// Colocando uma grade azul no grafico:
xgrid(2) 
