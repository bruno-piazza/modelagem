function [y_lin,y_nonlin,t] = sys_sim(A,B,C,D,x0lin,x0nlin,x_eq,u,t,mag,ti,tf)

    [y_lin,t,x_lin] = linear_sim(A,B,C,D,x0lin,x_eq,u,t);
    [y_nonlin,t,x_nonlin] = nonlinear_sim(x0nlin,t,mag,ti,tf);
    
    figure(1)
    plot(t,y_lin(:,1),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,1),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('\phi [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','não linear')
    %axis([min(t) max(t) min(0,min(y_lin(:,1))-0.8*abs(min(y_lin(:,1)))) 1.2*max(y_lin(:,1))])
    
    figure(2)
    plot(t,y_lin(:,2),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,2),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('\psi [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','não linear')
    
    figure(3)
    plot(t,y_lin(:,3),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,3),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('\theta [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','não linear')

    figure(4)
    plot(t,y_lin(:,4),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,4),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('d\phi [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','não linear')
    
    figure(5)
    plot(t,y_lin(:,5),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,5),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('d\psi [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','não linear')
    
    figure(6)
    plot(t,y_lin(:,6),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,6),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('d\theta [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','não linear')
end