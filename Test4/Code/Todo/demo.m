syms h
f = g*rho*pi*h + 4*F_tieguan + F_tietong - g*(m1 + 4*m2 + m3 + m4 + (13-h)*m5)
solve(f,h)

-(25625*pi - 2345733)/(1025000*pi + 441)