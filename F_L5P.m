function y=F_L5P(par,x)
    A = par(1);
    B = par(2);
    C = par(3);
    D = par(4);
    E = par(5);
    
    y = D+(A-D)./((1+(x/C).^B).^E);
end

