tic
clear all
clc
close all
global code

for code = 1:6
    %% Analysis
%     code = 6;
    % 1. Transition matrix
    % 2. Transfer matrix
    % 3. Results

    %% System Data
    % System matrices
    A = readmatrix("A_l.txt");
    B = readmatrix("B_l.txt");
    C = readmatrix("C_l.txt");
    D = zeros(size(C,1),size(B,2));

    % Time vector
    %t = linspace(0,20,10000);
    step = 0.001;
    t = 0:step:2.5;

    % Initial conditions ( ex.: phi = phi_eq + delta_phi)
    delta_phi = 0;
    delta_psi = 0;
    delta_theta = 0;
    delta_phip = 0;
    delta_psip = 0;
    delta_thetap = 0;
    delta_hx = 0;
    delta_hy = 0;
    delta_hz = 0;

    % Equilibrium position
    phi_eq = 0.01*pi/6;
    psi_eq = 1*pi/6;
    theta_eq = 1*pi/6;
    phip_eq = 0;
    psip_eq = 0;
    thetap_eq = 0;
    hx_eq = 0;
    hy_eq = 0;
    hz_eq = 0;

    x_eq = [phi_eq psi_eq theta_eq phip_eq psip_eq thetap_eq hx_eq hy_eq hz_eq];
    x0_lin = [delta_phi delta_psi delta_theta delta_phip delta_psip delta_thetap delta_hx delta_hy delta_hz];
    x0_nlin = [phi_eq+delta_phi psi_eq+delta_psi theta_eq+delta_theta phip_eq+delta_phip psip_eq+delta_psip...
               thetap_eq+delta_thetap hx_eq+delta_hx hy_eq+delta_hy hz_eq+delta_hz];
    %% 1. Transition matrix
    if code == 100
        [Phi_dt,Gamma_dt,x] = transition_matrix(A,B,t,x0',u0');
        P_tex = latex(sym(round(Phi_dt,8)));
        G_tex = latex(sym(round(Gamma_dt,8)));
    end

    %% 2. Transfer matrix
    if code == 101
        n_round = 10;
        TFM = tf_matrix(A,B,C,D,n_round);
        TFM1_latex = latex(TFM(:,1));
        TFM2_latex = latex(TFM(:,2));
        TFM3_latex = latex(TFM(:,3));
    end

    %% 3. Results
    if code == 1
        mag= [0.1 0 0]; %Magnitude do sinal de entrada
        ti = [0 0 0]; %Tempo incial 
        tf = [0.5 0 0]; %Tempo final
        u = u_selector(mag,ti,tf,t);

        [y_lin,y_nlin,t] = sys_sim(A,B,C,D,x0_lin,x0_nlin,x_eq,u,t,mag,ti,tf);
    end
    close all
    if code == 2
        mag= [0 0.1 0]; %Magnitude do sinal de entrada
        ti = [0 0 0]; %Tempo incial 
        tf = [0 0.5 0]; %Tempo final
        u = u_selector(mag,ti,tf,t);

        [y_lin,y_nlin,t] = sys_sim(A,B,C,D,x0_lin,x0_nlin,x_eq,u,t,mag,ti,tf);
    end
    close all
    if code == 3
        mag= [0 0 0.1]; %Magnitude do sinal de entrada
        ti = [0 0 0]; %Tempo incial 
        tf = [0 0 0.5]; %Tempo final
        u = u_selector(mag,ti,tf,t);

        [y_lin,y_nlin,t] = sys_sim(A,B,C,D,x0_lin,x0_nlin,x_eq,u,t,mag,ti,tf);
    end
    close all
    if code == 4
        mag= [0.1 0 0]; %Magnitude do sinal de entrada
        ti = [0 0 0]; %Tempo incial 
        tf = [0 0 0]; %Tempo final
        u = u_selector(mag,ti,tf,t);

        [y_lin,y_nlin,t] = sys_sim(A,B,C,D,x0_lin,x0_nlin,x_eq,u,t,mag,ti,tf);
    end
    close all
    if code == 5
        mag= [0 0.1 0]; %Magnitude do sinal de entrada
        ti = [0 0 0]; %Tempo incial 
        tf = [0 0 0]; %Tempo final
        u = u_selector(mag,ti,tf,t);

        [y_lin,y_nlin,t] = sys_sim(A,B,C,D,x0_lin,x0_nlin,x_eq,u,t,mag,ti,tf);
    end
    close all
    if code == 6
        mag= [0 0 0.1]; %Magnitude do sinal de entrada
        ti = [0 0 0]; %Tempo incial 
        tf = [0 0 0]; %Tempo final
        u = u_selector(mag,ti,tf,t);

        [y_lin,y_nlin,t] = sys_sim(A,B,C,D,x0_lin,x0_nlin,x_eq,u,t,mag,ti,tf);
    close all
    end
end
toc
    