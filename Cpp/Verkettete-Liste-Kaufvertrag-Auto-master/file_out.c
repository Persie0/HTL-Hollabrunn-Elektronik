#include "vL_header.h"
void ofile(billofsale *start)   //Ausgeben einer Datei mit den Elementen der Liste
{
	check(start);   //schaut ob Liste leer ist
	if(start!=NULL)  //wenn Liste nich leer ist
	{
		billofsale *p=start;
		FILE *f;
		//oeffnet Datei im Schreibmodus, schaut ob sie erfolgreich geoeffnet wurde
		if ((f=fopen("billofsale.txt","w"))==NULL)
		{
			printf("Fehler beim Oeffnen der Datei");
		}
		else
		{
			while(p!=NULL)
			{
				fprintf(f,
				        "%s%s%s%s%f\n%d\n\n",
				        p->surname,p->type,p->brand,p->wheeldimension,p->consum,p->selfweight
				       );
				p=p->next;
			}
			fclose(f);
		}
	}
	puts("\n**********\n");
}
