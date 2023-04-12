#ifndef VL_HEADER_H_INCLUDED
#define VL_HEADER_H_INCLUDED
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct billofsale   //Struktur Kaufvertrag
{
    // Variablen sind Felder des Kaufvertrages
	char surname[25], type[25], brand[25], wheeldimension[25];
	float consum;
	unsigned int selfweight;
	struct billofsale *next;
	struct billofsale *prev;
} billofsale;

//Prototypen
void addbyusername(billofsale **start, billofsale **ende);
void printasc(billofsale *start);
void printdes(billofsale *ende);
void del_sname(billofsale **start, billofsale **ende);
void del_wdem(billofsale **start, billofsale **ende);
void sconsum(billofsale *start);
void check(billofsale *tp);
void stype(billofsale *start);
void ofile(billofsale *start);
void ifile(billofsale **start, billofsale **ende);
void oElements(billofsale *p);
void delElement(billofsale *p, billofsale **ende, billofsale **start);
void addElement(billofsale **ende, billofsale **start, billofsale *temp);
#endif // VL_HEADER_H_INCLUDED
