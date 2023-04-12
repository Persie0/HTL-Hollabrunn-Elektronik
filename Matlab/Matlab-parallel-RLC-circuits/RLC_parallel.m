%% Erzwungene Schwingung am LC Parallel Schwingkreis

%% Aufgabenstellung
% Es sollen die Spannungen der Quelle und des Kondensators eines LC Parallel Schwingkreises simuliert und
% visualisiert werden. Außerdem soll die Resonanzkurve von der Kondensatorspannung und der dazugehörige
% Phasenverlauf in Abhängigkeit von der Frequenz dargestellt werden.
%%

%% Formeln
%%
% *Kondensatorspannung*
%%
% 
% <<C:\Users\Persie\Documents\MATLAB\LC\formula\Uc.png>>
% 
%%
% _Es muss einfach auf Uc umgeformt werden_ 

%%
% *Phase*
%%
% 
% <<C:\Users\Persie\Documents\MATLAB\LC\formula\Phi.png>>
% 
%%
% _Es muss einfach auf phi umgeformt werden_ 

%%
% *Resonanzfrequenz*
%%
% 
% $$f_{\mathrm {r} }={\frac {1}{2\pi {\sqrt {LC}}}}$$
% 
%% 
%%
% *Güte*
%%
% 
% <<C:\Users\Persie\Documents\MATLAB\LC\formula\Guete.png>>
% 
%%
%%
% *Phasenverschiebung*
%%
% 
% <<C:\Users\Persie\Documents\MATLAB\LC\formula\phver.png>>
% 
%%

%% Bauteilwerte und Simulationsparameter

%%
% *Sinusquelle* 
Amplitude=5;          % Amplitude der Sinusschwingung
Innenwiderstand=50; % Innenwiderstand der Sinusquelle
Phase=0; % Phasenverschiebung der Sinusquelle

%%
% *Bauteile* 
Rd=5*10^-3; % Verlustwiderstand Kondensator
Rv=5*10^-3; % Verlustwiderstand Spule
Verlustwiderstand=Rv+Rd; % Widerstand Kondensator + Spule
Induktivitaet=500*10^-6;   % LC-Spule
Kapazitaet=50.66*10^-6; % LC-Kondensator

%%
% *Simulationsparameter* 
FrequenzsweepMax=10000; %Max. Frequenz des Amplituden- & Phasengang
FrequenzsweepMin=100; %Min. Frequenz des Amplituden- & Phasengang
Uct=[]; % Vektor mit Uc-Werten 
Usin=[]; % Vektor mit Usin-Werten (Sinusquelle)
%% Matlab Funktionen
%%
% *Funktion zur Berechnung von Uc zum Zeitpunkt t* 
%
% <include>Uc_t.m</include>
%
%%
% *Funktion zur Berechnung der Phase mit Frequenz f* 
%
% <include>phi_f.m</include>
%

%% Spannungen über die Zeit
% Es wird Uc in einem LC-Schwingkreis zu Zeitpunkt t berechnet.
Frequenz=970;
Abtast=(1/Frequenz)/40; % Messwerte werden alle T/40 genommen
T=(1/Frequenz)*4; % Messwerte werden von 0 bis 5*T genommen
t=0:Abtast:T; % Messzeitpunkte
w=2*pi*Frequenz;
phver=phi_f(Frequenz, Verlustwiderstand, Induktivitaet, Kapazitaet, Innenwiderstand);%Phasenverschiebung von Uc ausrechnen
dt=phver/(2*pi*Frequenz);% Phasenverschiebung in Zeit umrechnen
tphver=t+dt; % Zu jedem Messzeitpunkt Phasenverschiebung in Zeit hinzurechnen
for a=1:1:length(t)
    Uct(a)=Uc_t(Amplitude, Frequenz, Phase, Verlustwiderstand, Induktivitaet, Kapazitaet, Innenwiderstand, t(a));
    Usin(a)=Amplitude*sin(w*t(a)+Phase);
end
% Spannungsverlaufplot über der Zeit mit entsprechenden Achsenbeschriftungen
figure(1);
plot(tphver, Uct, t, Usin);
% Y-Achse max. auf höheren Wert setzen
Umax=max(Usin);
Umaxnext=round(Umax+0.5, 1);
axis([0 T -Umaxnext Umaxnext])
legend('Uc(t)','Usin(t)')
title(append('Spannungsverlauf über der Zeit bei ',int2str(Frequenz),"Hz"));
xlabel('t [s]');
ylabel('U [V]');
grid on;
%%
% Es entsteht im Schwingkreis am Kondensator eine Wechselspannung mit einer anderen Amplitude als die der Generatorspannung und mit einer bestimmten Phasendifferenz.

%% 

%% Amplitudengang über die Frequenz
% Es wird die Resonanzkurve von Uc des LC-Schwingkreises berechnet.
Ucf=[];
fvar=FrequenzsweepMin:1:FrequenzsweepMax;
Ucf2=[];
% Resonanzkurve mit niedrigem Rv
for a=1:1:length(fvar)
    %immer bei Periodendauer/4 (bei Sinus mit Phase 0 = positives Max.) Uc nehmen
    Ucf(a)=Uc_t(Amplitude, fvar(a), 0, Verlustwiderstand, Induktivitaet, Kapazitaet, Innenwiderstand, (1/fvar(a)/4));
end
% Resonanzkurve mit hohem Rv
for a=1:1:length(fvar)
    %immer bei Periodendauer/4 (bei Sinus mit Phase 0 = positives Max.) Uc nehmen
    Ucf2(a)=Uc_t(Amplitude, fvar(a), 0, Verlustwiderstand*100, Induktivitaet, Kapazitaet, Innenwiderstand, (1/fvar(a)/4));
end
% Resonanzkurvenplot mit entsprechenden Achsenbeschriftungen
figure(2);
semilogx(fvar, Ucf, fvar, Ucf2);
legend('Kleiner Rv/Große Güte','Großer Rv/Kleine Güte')
Uc0=max(Ucf);
yticks([0 Uc0/sqrt(2) Uc0])
yticklabels({'0', append('[Uc0/sqrt(2)] ',num2str(round(Uc0/sqrt(2),2))),append('[Uc0] ', num2str(round(Uc0,2)))})
axis([0 inf 0 Uc0])
title('Amplitudengang von Uc');
xlabel('f [Hz]');
ylabel('Uc [V]');
grid on;
%%
% _Die Bandbreite bei Resonanz hängt von der Schwingkreisgüte ab. Je höher die Güte Q ist, desto schmalbandiger ist der Schwingkreis. Die Güte wiederum ist im Wesentlichen vom Verlustwiderstand der Spule abhängig. Die Verluste des Kondensators sind bei niedrigen und mittleren Frequenzen meistens vernachlässigbar klein._ 
%%
% _Die ausgerechnete Resonanzfrequenz stimmt mit der des erstellten Diagramm überein:_ 

%%
% 
% $$f_{\mathrm {r} }={\frac {1}{2\pi {\sqrt {500uH*50.66uF}}}}=1000Hz$$
% 
%% 

%% Phasengang über die Frequenz
% Es wird der Phasengang von Uc des LC-Schwingkreises berechnet.
ph=[];
for a=1:1:length(fvar)
    ph(a)=phi_f(fvar(a), Verlustwiderstand, Induktivitaet, Kapazitaet, Innenwiderstand);
end
% Phasengangsplot mit entsprechenden Achsenbeschriftungen
figure(3);
semilogx(fvar, ph);
yticks([-pi/2 0 pi/2])
yticklabels({'-pi/2','0','pi/2'})
axis([0 inf -pi/2 pi/2])
title('Phasengang von Uc');
xlabel('f [Hz]');
ylabel('phi');
grid on;
%% 

