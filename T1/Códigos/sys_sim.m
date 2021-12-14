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
    title('Rota��o pr�pria em fun��o do tempo','fontsize',12.5)
    legend({'linear','n�o linear'},'Location','southwest')
    
    figure(2)
    plot(t,y_lin(:,2),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,2),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('\psi [rad]','fontsize',12.5)
    title('Precess�o em fun��o do tempo','fontsize',12.5)
    legend({'linear','n�o linear'},'Location','northwest')
    
    figure(3)
    plot(t,y_lin(:,3),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,3),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('\theta [rad]','fontsize',12.5)
    title('Nuta��o em fun��o do tempo','fontsize',12.5)
    legend({'linear','n�o linear'},'Location','southwest')

    figure(4)
    plot(t,y_lin(:,4),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,4),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('d\phi [rad]','fontsize',12.5)
    title('Taxa de rota��o pr�pria em fun��o do tempo','fontsize',12.5)
    legend({'linear','n�o linear'},'Location','northeast')
    
    figure(5)
    plot(t,y_lin(:,5),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,5),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('d\psi [rad]','fontsize',12.5)
    title('Taxa de precess�o em fun��o do tempo','fontsize',12.5)
    legend({'linear','n�o linear'},'Location','southeast')
    
    figure(6)
    plot(t,y_lin(:,6),'linewidth',1.5)
    hold on
    plot(t,y_nonlin(:,6),'--','linewidth',1.5)
    grid on
    xlabel('Tempo [s]','fontsize',12.5)
    ylabel('d\theta [rad]','fontsize',12.5)
    title('Taxa de nuta��o em fun��o do tempo','fontsize',12.5)
    legend({'linear','n�o linear'},'Location','southwest')
end