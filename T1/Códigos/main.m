clear all
clc
close all

%% Analysis
code = 3;
% 1. Transition matrix
% 2. Transfer matrix
% 3. Results

%% System Data
% System matrices
A = readmatrix("A_l.txt");
B = readmatrix("B_l.txt");
C = readmatrix("C_l.txt");
D = zeros(size(C,1),size(B,2));

% Initial conditions
x0 = [0.01*pi/6 1*pi/6 1*pi/6 0 0 0 0 0 0];
% u0 = [0 0 0];

% Time vector
t = linspace(0,20,10000);

%% 1. Transition matrix
if code == 1
    [Phi_dt,Gamma_dt,x] = transition_matrix(A,B,t,x0',u0');
    P_tex = latex(sym(round(Phi_dt,8)));
    G_tex = latex(sym(round(Gamma_dt,8)));
end

%% 2. Transfer matrix
if code == 2
    n_round = 10;
    TFM = tf_matrix(A,B,C,D,n_round);
    TFM1_latex = latex(TFM(:,1));
    TFM2_latex = latex(TFM(:,2));
    TFM3_latex = latex(TFM(:,3));
end

%% 3. Simulation
if code == 3
    x0 = [0.01*pi/6 1*pi/6 1*pi/6 0 0 0 0 0 0];
    u1 = zeros(length(t),1);
    u2 = zeros(length(t),1);
    u3 = zeros(length(t),1);
    u = [u1 u2 u3];
    [y_lin,y_nlin,t] = sys_sim(A,B,C,D,x0,u,t);
end