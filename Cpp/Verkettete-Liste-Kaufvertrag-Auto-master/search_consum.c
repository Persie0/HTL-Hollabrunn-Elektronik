#include "vL_header.h"
void sconsum(billofsale *start) //Suchen nach Verbrauch
{
    check(start);   //schaut ob Liste leer ist
    if(start!=NULL)  //wenn Liste nich leer ist
    {
        billofsale *p=start;
        float consume;
        puts("Welche Liste(n) mit welchem Verbrauch soll gefunden werden?\nVerbrauch eingeben:");
        scanf("%f", &consume);
        while(p!=NULL)
        {
            if(consume==p->consum)
            {
                oElements(p);
            }
            p=p->next;
        }
    }
    puts("\n**********\n");
}
