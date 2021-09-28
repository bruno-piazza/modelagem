// Simulacao de sistema linear
// Eh sempre melhor apagar as variaveis anteriores
clear all
clc()
close()
getd(".")

// Definir parametros:
S=10; // [m^2] Area da secao transversal do reservatorio
rho=1000; // [kg/m^3] massa especifica da agua
g=10; // [m/s^2] aceleração da gravidade na superficie da Terra
R=2*10^8; // [Pa/(m^3/s)^2] parametro que relaciona pressao e vazao
ho=2; // [m] nivel do reservatorio em regime
hi=0.1; // [m] nivel adicional desejado
Qei=0.0; // [m^3/s] vazao na entrada

// Definir o sistema linear usando o comando syslin:
A=(-1/(2*S))*sqrt(rho*g/(R*ho));
B=1/S;
C=1;
D=0;

tanque=syslin('c',A,B,C,D); // o parametro 'c' indica que o sistema eh continuo no tempo
 
// Definir a condicao inicial:
x0=0; // [m] desvio inicial do nivel em relação ao equilibrio

// Definir o vetor de instantes de tempo:
t=0:10:3000;

// Definir o vetor de entradas:
u = (Qei-sqrt(rho*g*(ho+hi)/R))*ones(t);

// Simulando o sistema usando o comando csim:
[y,x]=csim(u,t,tanque,x0);

// Simulacao de não linear sistema linear

//xnlinear = ode(x0,t(1),t,list(entrada,nlinear))


scf(1)
// Plotando o resultado linear em verde:
plot(t,y,'g-','LineWidth',2.7)

// Colocando uma grade azul no grafico:
xgrid(2) 

//Plotano o resultado não linear em azul:
plot(t,xnlinear,'g-','LineWidth' ,2.7)

// Colocando um titulo na figura e nomeando os eixos:
xtitle("Resposta do tanque","Tempo t [s]","Variacao de nivel [m]");

