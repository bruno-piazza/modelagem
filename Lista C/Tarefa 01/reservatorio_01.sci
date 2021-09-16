function [hdot] = tanque(t,h,Qe)
    hdot = (Qe(t) - sqrt((rho * g * h)/R)) * 1/S;
endfunction

function [Qe] = entrada(t)
    Qe = Qei
endfunction
