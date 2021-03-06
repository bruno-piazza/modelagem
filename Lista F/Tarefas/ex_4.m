% Exercício 4

% Parâmetros
m = 100;
c = 500;
k = 1000;

% Matrizes
A = [0 1; -1000*k/m -c/m];
B = [0; 1/m];
C = [1 0; 0 1];
D = [0; 0];

% Simulação do sistema
sys = ss(A,B,C,D);

% Obtenção dos diagramas
figure(1)
tf(sys)
bode(sys)
saveas(1,"bode4.png")