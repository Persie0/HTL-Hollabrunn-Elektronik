/***************************************************************
 * Name:      imRechnerMain.cpp
 * Purpose:   Code for Application Frame
 * Author:     ()
 * Created:   2021-01-28
 * Copyright:  ()
 * License:
 **************************************************************/

#include "imRechnerMain.h"
#include <wx/msgdlg.h>
#include <sstream>
#include<iostream>
#include <complex>
using namespace std;
//(*InternalHeaders(imRechnerFrame)
#include <wx/intl.h>
#include <wx/string.h>
//*)

//helper functions
enum wxbuildinfoformat
{
	short_f, long_f
};

class Complex
{

private:
	float real,imag;

public:
	Complex()
	{
		real=imag=0;
	}

	Complex(float r)
	{
		real=r;
		imag=0;
	}

	Complex(float r, float i)
	{
		real=r;
		imag=i;
	}

	Complex(Complex &obj)
	{
		real=obj.real;
		imag=obj.imag;
	}

	Complex add(Complex c)
	{
		Complex Add;
		Add.real = real + c.real;
		Add.imag = imag + c.imag;
		return Add;
	}

	Complex sub(Complex c)
	{
		Complex Sub;
		Sub.real = real - c.real;
		Sub.imag = imag - c.imag;
		return Sub;
	}

	Complex mult(Complex c)
	{
		Complex Mult;
		Mult.real = real*c.real - imag*c.imag;
		Mult.imag = real*c.imag + c.real*imag;
		return Mult;
	}

	Complex div(Complex c)
	{
		Complex Div;
		float a = c.real*c.real + c.imag * c.imag;
		Div.real = (this->real * c.real + this->real * c.imag) / a;
		Div.imag = (this->real * c.real - this->real * c.imag) / a;
		return Div;
	}

	float getReal() const
	{
		return real;
	}

	float getImag() const
	{
		return imag;
	}

	void setReal(float re)
	{
		real = re;

	}

	void setImag(float im)
	{
		imag = im;
	}

};


wxString wxbuildinfo(wxbuildinfoformat format)
{
	wxString wxbuild(wxVERSION_STRING);

	if (format == long_f )
	{
#if defined(__WXMSW__)
		wxbuild << _T("-Windows");
#elif defined(__UNIX__)
		wxbuild << _T("-Linux");
#endif

#if wxUSE_UNICODE
		wxbuild << _T("-Unicode build");
#else
		wxbuild << _T("-ANSI build");
#endif // wxUSE_UNICODE
	}

	return wxbuild;
}

//(*IdInit(imRechnerFrame)
const long imRechnerFrame::ID_TEXTCTRL1 = wxNewId();
const long imRechnerFrame::ID_TOGGLEBUTTON1 = wxNewId();
const long imRechnerFrame::ID_BUTTON1 = wxNewId();
const long imRechnerFrame::ID_BUTTON2 = wxNewId();
const long imRechnerFrame::ID_BUTTON3 = wxNewId();
const long imRechnerFrame::ID_BUTTON4 = wxNewId();
const long imRechnerFrame::ID_BUTTON5 = wxNewId();
const long imRechnerFrame::ID_BUTTON6 = wxNewId();
const long imRechnerFrame::ID_BUTTON7 = wxNewId();
const long imRechnerFrame::ID_BUTTON8 = wxNewId();
const long imRechnerFrame::ID_BUTTON9 = wxNewId();
const long imRechnerFrame::ID_BUTTON10 = wxNewId();
const long imRechnerFrame::ID_BUTTON11 = wxNewId();
const long imRechnerFrame::ID_BUTTON12 = wxNewId();
const long imRechnerFrame::ID_BUTTON13 = wxNewId();
const long imRechnerFrame::ID_BUTTON14 = wxNewId();
const long imRechnerFrame::ID_BUTTON15 = wxNewId();
const long imRechnerFrame::ID_BUTTON16 = wxNewId();
const long imRechnerFrame::ID_BUTTON17 = wxNewId();
const long imRechnerFrame::ID_PANEL1 = wxNewId();
const long imRechnerFrame::ID_MENUITEM1 = wxNewId();
const long imRechnerFrame::idMenuAbout = wxNewId();
const long imRechnerFrame::ID_STATUSBAR1 = wxNewId();
//*)

BEGIN_EVENT_TABLE(imRechnerFrame,wxFrame)
	//(*EventTable(imRechnerFrame)
	//*)
END_EVENT_TABLE()

imRechnerFrame::imRechnerFrame(wxWindow* parent,wxWindowID id)
{
	//(*Initialize(imRechnerFrame)
	wxFlexGridSizer* FlexGridSizer1;
	wxFlexGridSizer* FlexGridSizer2;
	wxGridSizer* GridSizer1;
	wxGridSizer* GridSizer2;
	wxGridSizer* GridSizer3;
	wxGridSizer* GridSizer4;
	wxMenu* Menu1;
	wxMenu* Menu2;
	wxMenuBar* MenuBar1;
	wxMenuItem* MenuItem1;
	wxMenuItem* MenuItem2;

	Create(parent, wxID_ANY, wxEmptyString, wxDefaultPosition, wxDefaultSize, wxDEFAULT_FRAME_STYLE, _T("wxID_ANY"));
	Panel1 = new wxPanel(this, ID_PANEL1, wxPoint(280,224), wxDefaultSize, wxTAB_TRAVERSAL, _T("ID_PANEL1"));
	FlexGridSizer1 = new wxFlexGridSizer(5, 1, 0, 0);
	FlexGridSizer2 = new wxFlexGridSizer(0, 2, 0, 0);
	TextCtrl1 = new wxTextCtrl(Panel1, ID_TEXTCTRL1, wxEmptyString, wxDefaultPosition, wxSize(267,32), 0, wxDefaultValidator, _T("ID_TEXTCTRL1"));
	FlexGridSizer2->Add(TextCtrl1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	ToggleButton1 = new wxToggleButton(Panel1, ID_TOGGLEBUTTON1, _("ComplexMode"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_TOGGLEBUTTON1"));
	FlexGridSizer2->Add(ToggleButton1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	FlexGridSizer1->Add(FlexGridSizer2, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	GridSizer1 = new wxGridSizer(0, 3, 0, 0);
	Button1 = new wxButton(Panel1, ID_BUTTON1, _("1"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON1"));
	GridSizer1->Add(Button1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Button2 = new wxButton(Panel1, ID_BUTTON2, _("2"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON2"));
	GridSizer1->Add(Button2, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Button3 = new wxButton(Panel1, ID_BUTTON3, _("3"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON3"));
	GridSizer1->Add(Button3, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Button4 = new wxButton(Panel1, ID_BUTTON4, _("4"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON4"));
	GridSizer1->Add(Button4, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Button5 = new wxButton(Panel1, ID_BUTTON5, _("5"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON5"));
	GridSizer1->Add(Button5, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Button6 = new wxButton(Panel1, ID_BUTTON6, _("6"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON6"));
	GridSizer1->Add(Button6, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Button7 = new wxButton(Panel1, ID_BUTTON7, _("7"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON7"));
	GridSizer1->Add(Button7, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Button8 = new wxButton(Panel1, ID_BUTTON8, _("8"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON8"));
	GridSizer1->Add(Button8, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Button9 = new wxButton(Panel1, ID_BUTTON9, _("9"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON9"));
	GridSizer1->Add(Button9, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	FlexGridSizer1->Add(GridSizer1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	GridSizer2 = new wxGridSizer(0, 1, 0, 0);
	Button0 = new wxButton(Panel1, ID_BUTTON10, _("0"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON10"));
	GridSizer2->Add(Button0, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	FlexGridSizer1->Add(GridSizer2, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	GridSizer3 = new wxGridSizer(0, 4, 0, 0);
	Plus = new wxButton(Panel1, ID_BUTTON11, _("+"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON11"));
	GridSizer3->Add(Plus, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Minus = new wxButton(Panel1, ID_BUTTON12, _("-"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON12"));
	GridSizer3->Add(Minus, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Mal = new wxButton(Panel1, ID_BUTTON13, _("*"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON13"));
	GridSizer3->Add(Mal, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Div = new wxButton(Panel1, ID_BUTTON14, _("/"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON14"));
	GridSizer3->Add(Div, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	FlexGridSizer1->Add(GridSizer3, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	GridSizer4 = new wxGridSizer(0, 3, 0, 0);
	Erg = new wxButton(Panel1, ID_BUTTON15, _("="), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON15"));
	GridSizer4->Add(Erg, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Del = new wxButton(Panel1, ID_BUTTON16, _("C"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON16"));
	GridSizer4->Add(Del, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Imag = new wxButton(Panel1, ID_BUTTON17, _("i"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON17"));
	GridSizer4->Add(Imag, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	FlexGridSizer1->Add(GridSizer4, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
	Panel1->SetSizer(FlexGridSizer1);
	FlexGridSizer1->Fit(Panel1);
	FlexGridSizer1->SetSizeHints(Panel1);
	MenuBar1 = new wxMenuBar();
	Menu1 = new wxMenu();
	MenuItem1 = new wxMenuItem(Menu1, ID_MENUITEM1, _("Quit\tAlt-F4"), _("Quit the application"), wxITEM_NORMAL);
	Menu1->Append(MenuItem1);
	MenuBar1->Append(Menu1, _("&File"));
	Menu2 = new wxMenu();
	MenuItem2 = new wxMenuItem(Menu2, idMenuAbout, _("About\tF1"), _("Show info about this application"), wxITEM_NORMAL);
	Menu2->Append(MenuItem2);
	MenuBar1->Append(Menu2, _("Help"));
	SetMenuBar(MenuBar1);
	StatusBar1 = new wxStatusBar(this, ID_STATUSBAR1, 0, _T("ID_STATUSBAR1"));
	int __wxStatusBarWidths_1[1] = { -1 };
	int __wxStatusBarStyles_1[1] = { wxSB_NORMAL };
	StatusBar1->SetFieldsCount(1,__wxStatusBarWidths_1);
	StatusBar1->SetStatusStyles(1,__wxStatusBarStyles_1);
	SetStatusBar(StatusBar1);

	Connect(ID_TEXTCTRL1,wxEVT_COMMAND_TEXT_UPDATED,(wxObjectEventFunction)&imRechnerFrame::OnTextCtrl1Text);
	Connect(ID_TOGGLEBUTTON1,wxEVT_COMMAND_TOGGLEBUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnToggleButton1Toggle);
	Connect(ID_BUTTON1,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton1Click);
	Connect(ID_BUTTON2,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton2Click);
	Connect(ID_BUTTON3,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton3Click);
	Connect(ID_BUTTON4,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton4Click);
	Connect(ID_BUTTON5,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton5Click);
	Connect(ID_BUTTON6,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton6Click);
	Connect(ID_BUTTON7,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton7Click);
	Connect(ID_BUTTON8,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton8Click);
	Connect(ID_BUTTON9,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton9Click);
	Connect(ID_BUTTON10,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnButton0Click);
	Connect(ID_BUTTON11,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnPlusClick);
	Connect(ID_BUTTON12,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnMinusClick);
	Connect(ID_BUTTON13,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnMalClick);
	Connect(ID_BUTTON14,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnDivClick);
	Connect(ID_BUTTON15,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnErgClick);
	Connect(ID_BUTTON16,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnDelClick);
	Connect(ID_BUTTON17,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&imRechnerFrame::OnImagClick);
	Connect(ID_MENUITEM1,wxEVT_COMMAND_MENU_SELECTED,(wxObjectEventFunction)&imRechnerFrame::OnQuit);
	Connect(idMenuAbout,wxEVT_COMMAND_MENU_SELECTED,(wxObjectEventFunction)&imRechnerFrame::OnAbout);
	//*)
}

imRechnerFrame::~imRechnerFrame()
{
	//(*Destroy(imRechnerFrame)
	//*)
}

void imRechnerFrame::OnQuit(wxCommandEvent& event)
{
	Close();
}

void imRechnerFrame::OnAbout(wxCommandEvent& event)
{
	wxString msg = wxbuildinfo(long_f);
	wxMessageBox(msg, _("Welcome to..."));
}




void imRechnerFrame::OnTextCtrl1Text(wxCommandEvent& event)
{
}

void imRechnerFrame::OnButton1Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("1");
}

void imRechnerFrame::OnButton2Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("2");
}

void imRechnerFrame::OnButton3Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("3");
}

void imRechnerFrame::OnButton4Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("4");
}

void imRechnerFrame::OnButton5Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("5");
}

void imRechnerFrame::OnButton6Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("6");
}

void imRechnerFrame::OnButton7Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("7");
}

void imRechnerFrame::OnButton8Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("8");
}

void imRechnerFrame::OnButton9Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("9");
}

void imRechnerFrame::OnButton0Click(wxCommandEvent& event)
{
	TextCtrl1->AppendText("0");
}

wxString q1,q2, re1, re2, im1, im2;
int vz1=1, vz2=1;
float erg;
char rz;
bool com=false, realteil=false, zahl1=true, rezeich=false;
Complex c1(0,0);
Complex c2(0,0);
Complex ergebnis;

void imRechnerFrame::OnPlusClick(wxCommandEvent& event)
{
	if(com==false)
	{
		rz='+';
		q1=TextCtrl1->GetValue();
	}
	else if(com==true && realteil==false)
	{
		if(zahl1==true)
		{
			re1=TextCtrl1->GetValue();
			c1.setReal(wxAtof(re1));
		}
		else if(zahl1==false)
		{
			re2=TextCtrl1->GetValue();
			c2.setReal(wxAtof(re1));
		}
		realteil=true;
	}
	else if(com==true && realteil==true && rezeich==false)
	{
		zahl1=false;
		realteil=false;
		rezeich=true;
		rz='+';
	}
	TextCtrl1->SetValue("");
}

void imRechnerFrame::OnMinusClick(wxCommandEvent& event)
{
	if(com==false)
	{
		rz='-';
		q1=TextCtrl1->GetValue();
	}
	else if(com==true && realteil==false)
	{
		if(zahl1==true)
		{
			re1=TextCtrl1->GetValue();
			vz1=-1;
			c1.setReal(wxAtof(re1));
		}
		else if(zahl1==false)
		{
			re2=TextCtrl1->GetValue();
			vz2=-1;
			c2.setReal(wxAtof(re1));
		}
		realteil=true;
	}
	else if(com==true && realteil==true&& rezeich==false)
	{
		zahl1=false;
		rezeich=true;
		realteil=false;
		rz='-';
	}
	TextCtrl1->SetValue("");
}

void imRechnerFrame::OnMalClick(wxCommandEvent& event)
{
	if(com==false)
	{
		q1=TextCtrl1->GetValue();
		rz='*';
	}
	else if(com==true&&rezeich==false)
	{
		zahl1=false;
		rz='*';
		rezeich=true;
		realteil=false;
	}

	TextCtrl1->SetValue("");
}

void imRechnerFrame::OnDivClick(wxCommandEvent& event)
{
	if(com==false)
	{
		q1=TextCtrl1->GetValue();
		rz='/';
	}
	else if(com==true&&rezeich==false)
	{
		zahl1=false;
		rz='/';
		rezeich=true;
		realteil=false;
	}

	TextCtrl1->SetValue("");
}


void imRechnerFrame::OnImagClick(wxCommandEvent& event)
{
	if(zahl1==true)
	{
		im1=TextCtrl1->GetValue();
		c1.setImag(vz1*wxAtof(im1));

	}
	else if(zahl1==false)
	{
		im2=TextCtrl1->GetValue();
		c2.setImag(vz1*wxAtof(im2));

	}
	TextCtrl1->AppendText("i");
}

void imRechnerFrame::OnErgClick(wxCommandEvent& event)
{
	if(com==false)
	{
		q2=TextCtrl1->GetValue();
		switch(rz)
		{
		case '+':
			erg= wxAtof(q1)+wxAtof(q2);
			break;
		case '-':
			erg= wxAtof(q1)-wxAtof(q2);
			break;
		case '*':
			erg= wxAtof(q1)*wxAtof(q2);
			break;
		case '/':
			erg= wxAtof(q1)/wxAtof(q2);
			break;
		}

		std::stringstream ss;
		ss << erg;
		TextCtrl1->SetValue(ss.str());
	}



	if(com==true)
	{
		/*TextCtrl1->SetValue("");
		TextCtrl1->AppendText(re1);
		TextCtrl1->AppendText("-");
		TextCtrl1->AppendText(re2);
		TextCtrl1->AppendText("-");
		TextCtrl1->AppendText(im1);
		TextCtrl1->AppendText("-");
		TextCtrl1->AppendText(im2);
		TextCtrl1->AppendText("-");*/


		switch(rz)
		{
		case '+':
			ergebnis= c1.add(c2);
			break;
		case '-':
			ergebnis= c1.sub(c2);
			break;
		case '*':
			ergebnis= c1.mult(c2);
			break;
		case '/':
			ergebnis= c1.div(c2);
			break;
		}
		std::stringstream s1, s2;
		s1 << ergebnis.getReal();
		s2 << ergebnis.getImag();
		TextCtrl1->SetValue("");
		TextCtrl1->AppendText(s1.str());
		TextCtrl1->AppendText("+(");
		TextCtrl1->AppendText(s2.str());
		TextCtrl1->AppendText(")i");
		q1=q2=re1=re2=im1=im2="";
		realteil=false, zahl1=true,rezeich=false,zahl1=true;
	}

}

void imRechnerFrame::OnDelClick(wxCommandEvent& event)
{
	TextCtrl1->SetValue("");
	q1=q2=re1=re2=im1=im2="";
	realteil=false, zahl1=true, rezeich=false;
}




void imRechnerFrame::OnToggleButton1Toggle(wxCommandEvent& event)
{
	com=true;
}
