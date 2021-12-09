clc
clear
close all

ti = 0;
tf = 20;
n = 10000;
t = linspace(ti,tf,n);

phi_eq = 0.01*pi/6;
psi_eq = 1*pi/6;
theta_eq = 1*pi/6;

kt = 11.3*10^-3;
kb = kt;
Ra = 23.9;
b = 291.8*10^-9;
Irr = 1.66*10^-6;
I1 = 226.8*10^-5;
I2 = 226.165*10^-5;
I3 = 205.796*10^-5;

params = [kt,kb,Ra,b,Irr,I1,I2,I3];

x0 = [0.01*pi/6 pi/6 pi/6 0 0 0 0 0 0];

u1 = zeros(length(t),1);
u2 = zeros(length(t),1);
u3 = zeros(length(t),1);

for i=1:50
    u2(i,1) = 12;
end

% for i=1:5
%     u2(i,1) = 5;
% end

% for i=1:5000
%     u2(i,1) = 0.001*sin(t(i));
% end

u = [u1 u2 u3]';

%Integração 
[time,X] = ode23(@(t,x)x_dot(t,x,u,params),t,x0);
%%time = X.x;
phi = X(:,1);
psi = X(:,2);
theta = X(:,3);

figure
hold on
plot(time,phi)
plot(time,psi)
plot(time,theta)
legend('phi','psi','theta')
title('CASO A: Posição por Tempo')
xlabel('Tempo(s)')
ylabel('Posição(rad)')