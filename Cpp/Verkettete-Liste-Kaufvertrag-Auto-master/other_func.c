#include "vL_header.h"
void check(billofsale *tp)  //schaut ob Liste leer ist
{
	if(tp==NULL)
	{
		puts("Liste ist leer");
	}
}

void oElements(billofsale *p)   //gibt das Element, auf das der übergebene Pointer zeigt, am Bildschirm aus
{
	printf(
	    "\nNachname: %sTyp: %sMarke: %sReifendimensionen: %sVerbrauch: %f\nEigengewicht: %d\n\n",
	    p->surname,p->type,p->brand,p->wheeldimension,p->consum,p->selfweight
	);
}

void delElement(billofsale *p, billofsale **ende, billofsale **start)       //Löscht das Element, auf das der übergebene Pointer zeigt
{
	if((p==*start)&&(p->next==NULL))
	{
		free(p);
		(*start)=NULL;
		(*ende)=NULL;
	}
	else if((p==*start)&&(p->next!=NULL))
	{
		(*start)=p->next;
		free(p);
		p=*start;
	}
	else if((p!=*start)&&(p->next==NULL))
	{
		(*ende)=p->prev;
		p->prev->next=NULL;
		free(p);
	}
	else
	{
		p->prev->next=p->next;
		free(p);
	}
}

void addElement(billofsale **ende, billofsale **start, billofsale *temp)    //Fügt das übergebene Element der Liste hinzu
{
    billofsale *p;
	temp->prev=NULL;
	temp->next=NULL;
	if(*start==NULL)
	{
		*start=temp;
		*ende=temp;
	}
	else
	{
		p=*start;
		while((strcmp(temp->surname, p->surname) > 0) && (p->next!=NULL))   //erkenn nicht ob stoppt wegen cmp oder pnext=0
		{
			p->next->prev=p;
			p=p->next;
		}
		if((p==*start) && (strcmp(temp->surname, p->surname) <= 0))
		{
			(*start)=temp;
			temp->next=p;
			p->prev=temp;
		}
		else if(p->next==NULL)
		{
			if (strcmp(temp->surname, p->surname) > 0)
			{
				(*ende)=temp;
				p->next=temp;
				temp->prev=p;
			}
			else
			{
				temp->next=p;
				temp->prev=p->prev;
				p->prev->next=temp;
				p->prev=temp;
			}
		}
		else
		{
			temp->next=p;
			temp->prev=p->prev;
			p->prev->next=temp;
			p->prev=temp;
		}
	}
}
