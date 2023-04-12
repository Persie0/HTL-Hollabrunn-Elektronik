#include "vL_header.h"
void printasc(billofsale *start)    //Ausgabe aufsteigend (A-Z)
{
    check(start);   //schaut ob Liste leer ist
    if(start!=NULL) //wenn Liste nich leer ist
    {
        billofsale *p=start;    //p zeigt auf 1. Element
        //gibt alle Elemente der Liste aus
        while(p!=NULL)  //laeuft bis zum letzten Element
        {
            oElements(p);
            p=p->next;
        }
    }
    puts("\n**********\n");
}
