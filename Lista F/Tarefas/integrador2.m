function X = integrador2(A,t,x0)
    %% Dados de entrada
    % Matriz de estados A
    dim = length(A);
    
    %% 
    % Vetor de tempo
    ti = t(1);
    tf = t(end);
    n = length(t);
    dt = (tf-ti)/(n-1);
    
    %% Matriz de Transição
    Phi_dt = eye(dim) + A * dt + (A^2 * dt^2)/(2) + (A^3 * dt^3)/(6);
    
    %% Solução do sistema de equações
    X = zeros(dim,n);
    X(:,1) = x0;
    for i=1:n-1
        X(:,i+1) = Phi_dt * X(:,i);
    end
    
end
