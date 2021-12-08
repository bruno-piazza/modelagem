clear all
clc
close

A = readmatrix("A_l.txt");
B = readmatrix("B_l.txt");
C = readmatrix("C_l.txt");
D_col = size(B);
D_row = size(C);
D = zeros(D_row(1),D_col(2))

t = linspace(0,5,10000);

phi_eq = 0.1*pi/6;
psi_eq = pi/6;
theta_eq = pi/6;

x0 = [0 0 0 0 0 0 0 0 0];
u1 = zeros(length(t),1);
u2 = zeros(length(t),1);
u3 = zeros(length(t),1);

for i=1:5
    u1(i,1) = 0.5;
end
u = [u1 u2 u3];

res = ss(A,B,C,[]);

[y,t,x] = lsim(res,u,t,x0);
phi = y(:,1) + phi_eq;
psi = y(:,2) + psi_eq;
theta = y(:,3) + theta_eq;

figure(1)
hold on
plot(t,phi)
% plot(t,psi)
% plot(t,theta)

figure()
plot(t,y(:,4))

%[A,B1,C,D] = x_dot(t,x,y,u);