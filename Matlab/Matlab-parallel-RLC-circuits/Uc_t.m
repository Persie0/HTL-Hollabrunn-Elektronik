%% Funktion zur Berechnung von Uc zum Zeitpunkt t
% Berechnung von Uc in einem RLC-Schwingkreis 
% mit Sinusquelle zum Zeitpunkt t
function Uc = Uc_t(A, f, ph, R, L, C, Rk, t)
% A Amplitude der Sinusquelle
% R Verlustwiderstand Kondensator + Spule
% L Induktivität der LC-Spule
% C Kapazität des LC-Kondensators
% Rk Innenwiderstand der Spannungsquelle
% t Zeitpunkt
% f Frequenz der Spannungsquelle
% ph Phasenverschiebung der Spannungsquelle
% Uc Kondensatorspannung

w=2*pi*f;
wo=1/sqrt(L*C);
Usin=A*sin(w*t+ph);
Uc=Usin*sqrt((R^2+((w*L)^2))/(((R+Rk*(1-((w^2)/(wo^2))))^2)+((w^2)*((L+C*R*Rk)^2))));
end