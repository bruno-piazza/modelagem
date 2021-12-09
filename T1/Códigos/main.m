clear all
clc
close all

A = readmatrix("A_l.txt");
B = readmatrix("B_l.txt");
C = readmatrix("C_l.txt");
D_col = size(B);
D_row = size(C);
D = zeros(D_row(1),D_col(2));

res = ss(A,B,C,[]);

t = linspace(0,50,10000);

phi_eq = 0.01*pi/6;
psi_eq = 1*pi/6;
theta_eq = 1*pi/6;




x0 = [0 0.5 0 0 0 0 0 0 0];
u1 = zeros(length(t),1);
u2 = zeros(length(t),1);
u3 = zeros(length(t),1);

% for i=1:500
%     u2(i,1) = 12;
% end

% for i=1:5
%     u2(i,1) = 5;
% end

% for i=1:5000
%     u2(i,1) = 0.001*sin(t(i));
% end

u = [u1 u2 u3];



[y,t,x] = lsim(res,u,t,x0);
phi = x(:,1) + phi_eq;
psi = x(:,2) + psi_eq;
theta = x(:,3) + theta_eq;

figure(1)
hold on
%plot(t,phi)
plot(t,psi)
%plot(t,theta)

figure()
plot(t,y(:,5))

[b,a] = ss2tf(A,B,C,D,1);
% bode(res)

%[A,B1,C,D] = x_dot(t,x,y,u);