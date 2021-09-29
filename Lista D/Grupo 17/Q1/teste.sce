// Simulação de sistema linear
// Apagando as variáveis anteriores
clear all
// Fechando as janelas de gráficos
clc
close
// Abrindo o diretório
getd(".")
// Definir parametros :
S =10; // [m ^2] Area da secao transversal do reservatorio
rho =1000; // [ kg/m ^3] massa especifica da agua
g =10; // [m/s ^2] a c e l e r a o da gravidade na superficie da Terra
R =2* 10^8; // [ Pa/( m ^3/s ) ^2] parametro que relaciona pressao e vazao
ho =2; // [m] nivel do reservatorio em regime
hi =0.1; // [m ] nivel adicional desejado
Qei =(1/2)*sqrt(rho*g/(R*ho))*hi; // [m ^3/s] vazao na entrada
// Definir o sistema linear usando o comando syslin :
A =( -1/(2*S))* sqrt ( rho *g/(R*ho )) ;
B =1/S;
C =1;
D =0;
tanque = syslin ('c',A ,B ,C ,D) ; // o parametro ’c’ indica que o sistema eh
// continuo no tempo
// Definicao da funcao que implementa a equacao nao linear
function [xdot] = naolinear2(t , x)
xdot =( - sqrt ( rho*g*( ho +x)/R )+ Qei)/S;
endfunction
// V a z o de entrada para o sistema n o linearizado
// Definir a condicao inicial :
x0 =0; // [m] desvio inicial do nivel em r e l a o ao equilibrio
// Definir o vetor de instantes de tempo :
t =0:10:40000;
// Definir o vetor de entradas :
u =( Qei)* ones ( t);
// Simulando o sistema usando o comando csim :
[y , x ]= csim (u ,t , tanque , x0 );
// Simulando o sistema n o linear usando a funcao ode
xnlinear = ode (x0 ,t (1) ,t , naolinear2);
// Plotando o resultado em verde :
plot2d (t ,y ,3)
plot2d (t , xnlinear ,5)
legend ([" Linear "," N o linear "]) ; // Define a legenda das curvas
// Colocando um titulo na figura e nomeando os eixos :
xtitle (" Resposta do tanque "," Tempo t [s]"," Variacao de nivel [m]");
// Colocando uma grade azul no grafico :
xgrid (2)
