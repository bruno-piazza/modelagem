// Simulação de sistema linear
// Apagando as variáveis anteriores
clear
// Fechando as janelas de gráficos
clc
close
// Abrindo o diretório
getd(".")

// Definindo parâmetros
ei = 12.; //Tensão da bateria
C = 10^(-4); //Capacitância
R =100; // Resistância do resistor
e0 = 0.; // Tensão inicial sobre o capacitor

//Vetor de tempo
t = 0:0.005:0.1;

//Chamada do ODE
et = ode(e0,t(1),t,tensao)

scf(1)
// Plotando o resultado em azul:
plot(t,et,'b-','LineWidth',2.7)
// Usando a variável do tipo 'lista':
T=list("Resposta transitória da tensão","Tensão [V]","Tempo [s]");

//Título do gráfico e configuração da fonte:
title(T(1),'fontsize',4);

// Nomeando os eixos:
xlabel(T(3),'fontsize',3);
ylabel(T(2),'fontsize',3);

// Colocando uma grade azul no grafico:
xgrid(2) 

// Salvando a imagem:
xs2png(1,'caso1.png');
