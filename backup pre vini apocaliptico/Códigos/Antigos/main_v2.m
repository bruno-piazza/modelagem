clear all
clc
close

A = readmatrix("A_3.txt");
B = readmatrix("B_3.txt");
C = readmatrix("C_3.txt");

t = linspace(0,50,10000);

phi_eq = 0.01*pi/6;
psi_eq = 1*pi/6;
theta_eq = 1*pi/6;



x0 = [0 0 0 0 0 0];
u1 = zeros(length(t),1);
u2 = zeros(length(t),1);
u3 = zeros(length(t),1);

% for i=1:5
%     u2(i,1) = 0.05;
% end
u = [u1 u2 u3];

res = ss(A,B,C,[]);

[y,t,x] = lsim(res,u,t,x0);
phi = x(:,1) + phi_eq;
psi = x(:,2) + psi_eq;
theta = x(:,3) + theta_eq;

figure(1)
hold on
plot(t,phi)
plot(t,psi)
plot(t,theta)

figure()
plot(t,y(:,5))

%[A,B1,C,D] = x_dot(t,x,y,u);