function [xdot] = naolinear(t,x,Qe)
    if x<0 then
        xdot=0
    else
        xdot = (-(rho*g*(x)/R)^(1/2)+entrada(t))/S;
    end
endfunction

function [u]=entrada(t)
    u=Qei
endfunction

