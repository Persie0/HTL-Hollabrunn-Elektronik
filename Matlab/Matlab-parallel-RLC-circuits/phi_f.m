%% Funktion zur Berechnung der Phase bei der Frequenz f
% Berechnung von Phi in einem RLC-Schwingkreis 
% mit Sinusquelle bei der Frequenz f
function phi = phi_f(f, R, L, C, Rk)
% Berechnung von Phi in einem RLC-Schwingkreis mit 
% Sinusquelle bei der Frequenz f
%
% R Verlustwiderstand Kondensator + Spule
% L Induktivität der LC-Spule
% C Kapazität des LC-Kondensators
% Rk Innenwiderstand der Spannungsquelle
% f Frequenz der Spannungsquelle

w=2*pi*f;
phi=atan( (w*Rk*(L-L*((w^2)/((1/sqrt(L*C))^2))-C*(R^2))) / ((R^2)+R*Rk+(w^2)*(L^2)) );
end