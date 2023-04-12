# uPF1-Ventile

Simulation von Wasserbehälter mit LEDs und SWitches des MDDS mit Cortex M3

Es ist ein mit Unterprogrammen strukturiertes Programm für den „Microprofessor“ μPF1 zu
schreiben, welches die 2 Zulaufventile eines Behälters (Grob- u. Feinventil) simuliert. Spricht der
untere Schwimmer an, so ist das Grobventil zeitverzugslos zu schliessen. Spricht der obere
Schwimmer an, so ist das Feinventil nach einer unter der RAM-Adresse 1900H in 1/10 sec
gespeicherten Verzögerung zu schliessen. Es soll ein Endlosprogramm sein.
Zusätzliches:
Wenn der Hauptschalter aus ist, sollen die Ventile auch zu sein.
Wenn z.B. in Adresse1900H, 0AH steht, soll die Verzögerung 1s lang sein.
