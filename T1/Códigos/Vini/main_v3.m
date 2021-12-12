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
%t = linspace(0,20,10000);
t = 0:0.002:20;
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
    x0nlin = [0.01*pi/6 1*pi/6 1*pi/6 0 0 0 0 0 0];
    x0lin = [0 0 0 0 0 0 0 0 0];
    mag= [5 5 5];
    ti = [0 10 15];
    tf = [5 10 50];
    u = u_selector(mag,ti,tf,t);
    [y_lin,y_nlin,t] = sys_sim(A,B,C,D,x0lin,x0nlin,u,t);
end