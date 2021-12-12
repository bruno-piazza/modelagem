function [y_nonlin,t,x_nonlin] = nonlinear_sim(x0,u,t)

    kt = 11.3*10^-3;
    kb = kt;
    Ra = 23.9;
    b = 291.8*10^-9;
    Irr = 1.66*10^-6;
    I1 = 226.8*10^-5;
    I2 = 226.165*10^-5;
    I3 = 205.796*10^-5;
    params = [kt,kb,Ra,b,Irr,I1,I2,I3];
    
    %Integração 
    [time,x_nonlin] = ode23(@(t,x)x_dot(t,x,u,params),t,x0);
    y_nonlin = x_nonlin(:,1:6);
end