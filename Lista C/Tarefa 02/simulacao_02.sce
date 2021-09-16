clc();
clear();
close();

getd(".")

// Definir parametros:
S1=10; // [m^2] Area da secao transversal do reservatorio
S2=10; // [m^2] Area da secao transversal do reservatorio
rho=1000; // [kg/m^3] massa especifica da agua
g=10; // [m/s^2] aceleração da gravidade na superficie da Terra
Ra=2*10^8; // [Pa/(m^3/s)^2] parametro que relaciona pressao e vazao
Rs=2*10^8; // [Pa/(m^3/s)^2] parametro que relaciona pressao e vazao
ho=2; // [m] nivel do reservatorio em regime
hi=0.1; // [m] nível adicional desejado
Qei=sqrt(rho*g*(ho+hi)/Ra); // [m^3/s] vazao na entrada

// Definir a condicao inicial:
h0=[2;0]; // [m] nivel do reservatorio na condicao inicial

// Definir o vetor t de instantes de tempo:
t=0:10:40000; // vetor de tempo. Observe que t(1) eh o instante inicial

// Comando que realiza a simulacao numérica:
H=ode(h0,t(1),t,list(tanque,entrada)); // h eh o nivel do reservatorio [m]
h1 = H(1,:)
h2 = H(2,:)


scf(1)
// Plotando o resultado em verde:
plot2d(t,h1,3)

// Definindo uma variavel do tipo 'lista':
T=list("Resposta transitoria do reservatorio","Tempo t [s]","Nivel h [m]");

// Colocando um titulo na figura e nomeando os eixos:
xtitle(T(1),T(2),T(3));

// Colocando uma grade azul no grafico:
xgrid(2) 


scf(2)
// Plotando o resultado em verde:
plot2d(t,h2,3)

// Definindo uma variavel do tipo 'lista':
T=list("Resposta transitoria do reservatorio","Tempo t [s]","Nivel h [m]");

// Colocando um titulo na figura e nomeando os eixos:
xtitle(T(1),T(2),T(3));

// Colocando uma grade azul no grafico:
xgrid(2) 
