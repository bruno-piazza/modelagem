clear all
clc
close all

%% Analysis
code = 1;
% 1. Transition matrix

%% System Data
% System matrices
A = readmatrix("A_l.txt");
B = readmatrix("B_l.txt");
C = readmatrix("C_l.txt");
D_col = size(B);D_row = size(C);
D = zeros(D_row(1),D_col(2));

% Initial conditions
x0 = [0 0.5 0 0 0 0 0 0 0];
u0 = [0 0 0];

% Time vector
t = linspace(0,50,10000);

%% 1. Transition matrix
if code == 1
    [Phi_dt,Gamma_dt,x] = transition_matrix(A,B,t,x0',u0');
    Phi_dt = clean_matrix(Phi_dt,10);
    Gamma_dt = clean_matrix(Gamma_dt,10);
    P_tex = latex(sym(Phi_dt));
    G_tex = latex(sym(Gamma_dt));
end

