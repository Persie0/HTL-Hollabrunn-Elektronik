#include "vL_header.h"
void ifile(billofsale **start, billofsale **ende)   //Einlesen von Elementen aus einer Datei
{
	FILE *f;
	if ((f=fopen("billofsale.txt","r"))==NULL)  //oeffnet Datei im Lesemodus
	{
		printf("Fehler beim Oeffnen der Datei");
	}
	else
	{
		billofsale *temp;
		int i=1;
		while(!feof(f)) //laeuft solange das das Ende des Files noch nicht erreícht ist
		{
			//liest, je nachdem was i ist (1-6) Nachname, Typ,etc. aus dem geöffneteten File ein
			switch(i)
			{
			case 1:
				temp=(billofsale*)malloc(sizeof(billofsale));   //temporaeres Element
				if(temp==NULL)  //schaut ob Speicher zugeordnet wurde
				{
					puts("Speicher nicht zugeordnet");
					return;
				}
				fgets(temp->surname, 25, f);
				break;
			case 2:
				fgets(temp->type, 25, f);
				break;
			case 3:
				fgets(temp->brand, 25, f);
				break;
			case 4:
				fgets(temp->wheeldimension, 25, f);
				break;
			case 5:
				fscanf(f,"%f",&temp->consum);
				break;
			case 6:
				fscanf(f,"%d",&temp->selfweight);
				break;
			case 7:
				getc(f);    //liest '\n' nach dem Eigengewicht ein
				getc(f);    //liest '\n' (leere Zeile) zwischen den einzelnen Elementen ein
				i=0;        //setzt i wieder auf 0, da wieder ein neues Element eingelesen wird
				addElement(ende,start,temp);    //Element wird zur Liste hinzugefügt
				break;
			}
			i++;
		}
		fclose(f);
	}
	puts("\n**********\n");
}
