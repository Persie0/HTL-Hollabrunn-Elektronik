#include "vL_header.h"
void addbyusername(billofsale **start, billofsale **ende)   //nach Nachname sortiert einfügen
{
    billofsale *temp;
    temp=(billofsale*)malloc(sizeof(billofsale));   //Element das zur Liste hinzugefuegt wird
    if(temp==NULL)  //schaut ob Speicher zugeordnet wurde
    {
        puts("Speicher nicht zugeordnet");
    }
    else
    {
        //Liest Daten für das Element ein
        puts("Infos eingeben \nNachname:");
        fgets(temp->surname, 25, stdin);
        puts("Typ");
        fgets(temp->type, 25, stdin);
        puts("Marke");
        fgets(temp->brand, 25, stdin);
        puts("Reifendimensionen");
        fgets(temp->wheeldimension, 25, stdin);
        puts("Verbrauch (reele Zahl, in Liter");
        scanf("%f", &temp->consum);
        getchar();
        puts("Eigengewicht");
        scanf("%d",&temp->selfweight);
        getchar();
        addElement(ende,start,temp);
    }
    puts("\n**********\n");
}
