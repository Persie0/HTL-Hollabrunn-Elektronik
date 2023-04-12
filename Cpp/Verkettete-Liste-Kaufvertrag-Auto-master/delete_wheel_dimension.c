#include "vL_header.h"
void del_wdem(billofsale **start, billofsale **ende)    //Löschen nach Reifendimension
{
    check(*start);   //schaut ob Liste leer ist
    if(*start!=NULL)  //wenn Liste nich leer ist
    {
        char wdem[25];
        puts("Welche Liste(n) mit welchen Reifendimensionen soll geloescht werden?\nReifendimensionen:");
        fgets(wdem, 25, stdin);     //liest Reifendimensionen ein die gelöscht werden sollen
        billofsale *p=*start;   //p zeigt auf 1. Element
        while(p!=NULL)      //laeuft bis p auf das letzte Element zeigt
        {
            // loescht aktuelles Element, wenn eingegebene Reifendimensionen = Reifendimensionen des aktuellen Elements
            if(strcmp(wdem,p->wheeldimension)==0)
            {
                delElement(p,ende,start);
            }
            p=p->next;
        }
    }
    puts("\n**********\n");
}
