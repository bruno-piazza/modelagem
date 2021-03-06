function [y_lin,y_nonlin,t] = sys_sim(A,B,C,D,x0lin,x0nlin,x_eq,u,t,mag,ti,tf)
    global code
    
    [y_lin,t,x_lin] = linear_sim(A,B,C,D,x0lin,x_eq,u,t);
    [y_nonlin,t,x_nonlin] = nonlinear_sim(x0nlin,t,mag,ti,tf);
    
    numm=string(code)
    figure(1)
    plot(t,y_lin(:,1),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,1),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('\phi [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','n?o linear')
    %axis([min(t) max(t) min(0,min(y_lin(:,1))-0.8*abs(min(y_lin(:,1)))) 1.2*max(y_lin(:,1))])
    saveas(1,numm+'_phi','png')
    
    figure(2)
    plot(t,y_lin(:,2),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,2),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('\psi [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','n?o linear')
    saveas(2,string(code)+'_psi','png')
    
    figure(3)
    plot(t,y_lin(:,3),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,3),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('\theta [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','n?o linear')
    saveas(3,string(code)+'_theta','png')

    figure(4)
    plot(t,y_lin(:,4),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,4),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('d\phi [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','n?o linear')
    saveas(4,string(code)+'_dphi','png')
    
    figure(5)
    plot(t,y_lin(:,5),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,5),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('d\psi [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','n?o linear')
    saveas(5,string(code)+'_dpsi','png')
    
    figure(6)
    plot(t,y_lin(:,6),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,6),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('d\theta [rad]','fontsize',12.5)
    title('Comportamento do CubeSat','fontsize',12.5)
    legend('linear','n?o linear')
    saveas(6,string(code)+'_dtheta','png')
end