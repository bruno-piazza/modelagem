function dy = derivada(t,x,u)
    phi = x(1);
    psi = x(2);
    theta = x(3);
    phip = x(4);
    psip = x(5);
    thetap = x(6);
    hx = x(7);
    hy = x(8);
    hz = x(9);

    a = zeros(6,6);
    g = zeros(6,1);

    a(1,:) = [0,0,0,1,0,0];
    g(1) = 


end
