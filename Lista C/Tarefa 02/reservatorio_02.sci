function [Qe] = entrada(t)
    Qe = Qei;
endfunction

function hdot = tanque(t,h,Qe)
    hdot(1) = (Qe(t) - sqrt((rho*g)*(h(1)-h(2))/Ra))/S1;
    hdot(2) = (sqrt((rho*g)*(h(1)-h(2))/Ra) - sqrt((rho*g)*(h(2))/Rs))/S2;
endfunction






