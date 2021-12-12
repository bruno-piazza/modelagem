function [y_lin,t,x_lin] = linear_sim(A,B,C,D,x0,u,t)

    sys = ss(A,B,C,D);
   
    phi_eq = 0.01*pi/6;
    psi_eq = 1*pi/6;
    theta_eq = 1*pi/6;
    
    [y_lin,t,x_lin] = lsim(sys,u,t,x0);
    y_lin(1,:) = y_lin(1,:) + phi_eq;
    y_lin(2,:) = y_lin(2,:) + psi_eq;
    y_lin(3,:) = y_lin(3,:) + theta_eq;
    
%     figure(1)
%     plot(t,y_lin(:,1),'linewidth',1.5)
%     grid on
%     xlabel('Tempo [s]','fontsize',12.5)
%     ylabel('\phi [rad]','fontsize',12.5)
%     title('Comportamento do CubeSat','fontsize',12.5)
%     legend('linear')
%     
%     figure(2)
%     plot(t,y_lin(:,2),'linewidth',1.5)
%     grid on
%     xlabel('Tempo [s]','fontsize',12.5)
%     ylabel('\psi [rad]','fontsize',12.5)
%     title('Comportamento do CubeSat','fontsize',12.5)
%     legend('linear')
%     
%     figure(3)
%     plot(t,y_lin(:,3),'linewidth',1.5)
%     grid on
%     xlabel('Tempo [s]','fontsize',12.5)
%     ylabel('\theta [rad]','fontsize',12.5)
%     title('Comportamento do CubeSat','fontsize',12.5)
%     legend('linear')
% 
%     figure(4)
%     plot(t,y_lin(:,4),'linewidth',1.5)
%     grid on
%     xlabel('Tempo [s]','fontsize',12.5)
%     ylabel('d\phi [rad]','fontsize',12.5)
%     title('Comportamento do CubeSat','fontsize',12.5)
%     legend('linear')
%     
%     figure(5)
%     plot(t,y_lin(:,5),'linewidth',1.5)
%     grid on
%     xlabel('Tempo [s]','fontsize',12.5)
%     ylabel('d\psi [rad]','fontsize',12.5)
%     title('Comportamento do CubeSat','fontsize',12.5)
%     legend('linear')
%     
%     figure(6)
%     plot(t,y_lin(:,6),'linewidth',1.5)
%     grid on
%     xlabel('Tempo [s]','fontsize',12.5)
%     ylabel('d\theta [rad]','fontsize',12.5)
%     title('Comportamento do CubeSat','fontsize',12.5)
%     legend('linear')
end