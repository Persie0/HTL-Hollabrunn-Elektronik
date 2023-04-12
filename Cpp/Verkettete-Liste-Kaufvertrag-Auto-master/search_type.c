#include "vL_header.h"
void stype(billofsale *start)   //Suchen nach Typ
{
	check(start);   //schaut ob Liste leer ist
	if(start!=NULL)  //wenn Liste nich leer ist
	{
		billofsale *p=start;
		char typ[25];
		puts("Welche Liste(n) von welchem Typ soll gefunden werden?\nTyp eingeben:");
		fgets(typ, 25, stdin);
		while(p!=NULL)
		{
			if(strcmp(typ,p->type)==0)
			{
				oElements(p);
			}
			p=p->next;
		}
	}
	puts("\n**********\n");
}
