function [xdot] = nlinear(t,x)
    xdot = (-sqrt(rho*g*(x+ho)/R)+Qe(t))/S;
endfunction

function [Qe] = entrada(t)
    Qe = Qei;
endfunction
