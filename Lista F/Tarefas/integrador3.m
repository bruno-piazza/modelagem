function [x,y] = integrador3(A,B,C,D,u,t,x0)
    n = size(A,2); % dimensão do vetor de estados
    N = size(t,2); % número de instantes de tempo a serem avaliados
    dt = (t(end) - t(1))/N; % passo de tempo

    x = zeros(n,N); % vetor contendo a solução
    x(:,1) = x0; % aplicação das condições iniciais
    
    % Termos na Série de Taylor até ordem m
    m = 10;

    Phi_dt = zeros(size(A)); % Matriz de Transição
    Gamma_dt = zeros(size(A)); 

    for i=1:m
        Phi_dt = Phi_dt + (A^(i-1) * dt^(i-1)) / (factorial(i-1));
        Gamma_dt = Gamma_dt + (A^(i-1) * dt^(i-1)) / (factorial(i));
    end

    Gamma_dt = dt * Gamma_dt;
    M_forc = Gamma_dt * B * u; %Matriz de Termos Forçantes

    % Solução do sistema
    for i=1:N
        x(:,i+1) = Phi_dt * x(:,i) + M_forc;
    end
    
    y = C * x + D;
end