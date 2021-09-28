function [hdot] = tanque(t,h,Qe)
    hdot(1) = 1/S1 * (Qe(t) - sqrt(rho*g*(h(1)-h(2))/Ra));
    hdot(2) = 1/S2 * (sqrt(rho*g*(h(1)-h(2))/Ra) - sqrt(rho*g*h(2)/Rs));
endfunction

function [Qe] = entrada(t)
    Qe = Qei;
endfunction
