#include "vL_header.h"
void printdes(billofsale *ende) //Ausgabe absteigend (Z-A)
{
    check(ende);   //schaut ob Liste leer ist
    if(ende!=NULL)  //wenn Liste nich leer ist
    {
        billofsale *p=ende; //p zeigt auf das letzte Element
        //gibt alle Elemente der Liste aus
        while(p!=NULL)  //laeuft bis zum 1. Element
        {
            oElements(p);
            p=p->prev;
        }
    }
    puts("\n**********\n");
}
