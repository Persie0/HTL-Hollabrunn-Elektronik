#include "vL_header.h"
void del_sname(billofsale **start, billofsale **ende)   //Löschen nach Nachnamen
{
    check(*start);   //schaut ob Liste leer ist
    if(*start!=NULL)  //wenn Liste nich leer ist
    {
        char sname[25];
        puts("Welche Liste(n) mit welchem Nachnamen soll geloescht werden?\nNachname eingeben:");
        fgets(sname, 25, stdin);    //liest Namen ein der gelöscht werden soll
        billofsale *p=*start;   //p zeigt auf 1. Element
        while(p!=NULL)  //laeuft bis p auf das letzte Element zeigt
        {
            // loescht aktuelles Element, wenn eingegebener Name = Name des aktuellen Elements
            if(strcmp(sname,p->surname)==0)
            {
                delElement(p,ende,start);
            }
            p=p->next;
        }
    }
    puts("\n**********\n");
}
