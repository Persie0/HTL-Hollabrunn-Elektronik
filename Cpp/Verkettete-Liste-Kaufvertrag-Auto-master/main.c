#include "vL_header.h"

int main()
{
    //setzt Start- und Endpointer auf NULL
	billofsale *start = NULL;
	billofsale *ende = NULL;
	int choice;
	//läuft solange nicht 0 eingegeben wird
	do
	{
	    //gibt menue und menuepunkte aus
		puts("Menue: \n\t1. Einfuegen & nach Nachnamen sortieren");
		puts("\t2. Ausgabe aufsteigen");
		puts("\t3. Ausgabe absteigend");
		puts("\t4. Datei einlesen");
		puts("\t5. Datei ausgeben");
		puts("\t6. Typsuche");
		puts("\t7. Verbrauchsuche");
		puts("\t8. Nachnamen loeschen");
		puts("\t9. Reifendimensionen loeschen");
		puts("\t0. Exit");
		scanf("%d", &choice);   //liest die Auswahl ein
		getchar();  //für Enter nach Eingabe der Auswahl vom Benutzer
		//schaut was eingegeben wurde und macht dies
		switch(choice)
		{
		case 1:
			addbyusername(&start, &ende);
			break;
		case 2:
			printasc(start);
			break;
		case 3:
			printdes(ende);
			break;
		case 4:
			ifile(&start, &ende);
			break;
		case 5:
			ofile(start);
			break;
		case 6:
			stype(start);
			break;
		case 7:
			sconsum(start);
			break;
		case 8:
			del_sname(&start, &ende);
			break;
		case 9:
			del_wdem(&start, &ende);
			break;
		case 0:
			puts("Programm beendet");
			break;
		default:
			puts("falsche eingabe");
		}
	}
	while(choice!=0);
	return 0;
}
