clc
clear
close all

%% Parâmetros do sistema
% Vetor de constantes de tempo
RC = [0.01,0.1,1,10,100]

%% Funções de transferência 
% Definição das funções de tranferência para as diferentes constantes de
% tempo
for i = 1:length(RC)
    G_s(i) = tf([1],[RC(i),1])
end

%% Diagramas de Bode
for j = 1:length(RC)
    figure
    bode(G_s(j))
    grid on
end