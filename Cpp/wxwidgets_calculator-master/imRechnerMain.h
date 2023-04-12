/***************************************************************
 * Name:      imRechnerMain.h
 * Purpose:   Defines Application Frame
 * Author:     ()
 * Created:   2021-01-28
 * Copyright:  ()
 * License:
 **************************************************************/

#ifndef IMRECHNERMAIN_H
#define IMRECHNERMAIN_H

//(*Headers(imRechnerFrame)
#include <wx/button.h>
#include <wx/frame.h>
#include <wx/menu.h>
#include <wx/panel.h>
#include <wx/sizer.h>
#include <wx/statusbr.h>
#include <wx/textctrl.h>
#include <wx/tglbtn.h>
//*)

class imRechnerFrame: public wxFrame
{
    public:

        imRechnerFrame(wxWindow* parent,wxWindowID id = -1);
        virtual ~imRechnerFrame();

    private:

        //(*Handlers(imRechnerFrame)
        void OnQuit(wxCommandEvent& event);
        void OnAbout(wxCommandEvent& event);
        void OnTextCtrl1Text(wxCommandEvent& event);
        void OnButton1Click(wxCommandEvent& event);
        void OnButton2Click(wxCommandEvent& event);
        void OnButton3Click(wxCommandEvent& event);
        void OnButton4Click(wxCommandEvent& event);
        void OnButton5Click(wxCommandEvent& event);
        void OnButton6Click(wxCommandEvent& event);
        void OnButton7Click(wxCommandEvent& event);
        void OnButton8Click(wxCommandEvent& event);
        void OnButton9Click(wxCommandEvent& event);
        void OnButton0Click(wxCommandEvent& event);
        void OnPlusClick(wxCommandEvent& event);
        void OnMinusClick(wxCommandEvent& event);
        void OnMalClick(wxCommandEvent& event);
        void OnDivClick(wxCommandEvent& event);
        void OnErgClick(wxCommandEvent& event);
        void OnDelClick(wxCommandEvent& event);
        void OnImagClick(wxCommandEvent& event);
        void OnToggleButton1Toggle(wxCommandEvent& event);
        //*)

        //(*Identifiers(imRechnerFrame)
        static const long ID_TEXTCTRL1;
        static const long ID_TOGGLEBUTTON1;
        static const long ID_BUTTON1;
        static const long ID_BUTTON2;
        static const long ID_BUTTON3;
        static const long ID_BUTTON4;
        static const long ID_BUTTON5;
        static const long ID_BUTTON6;
        static const long ID_BUTTON7;
        static const long ID_BUTTON8;
        static const long ID_BUTTON9;
        static const long ID_BUTTON10;
        static const long ID_BUTTON11;
        static const long ID_BUTTON12;
        static const long ID_BUTTON13;
        static const long ID_BUTTON14;
        static const long ID_BUTTON15;
        static const long ID_BUTTON16;
        static const long ID_BUTTON17;
        static const long ID_PANEL1;
        static const long ID_MENUITEM1;
        static const long idMenuAbout;
        static const long ID_STATUSBAR1;
        //*)

        //(*Declarations(imRechnerFrame)
        wxButton* Button0;
        wxButton* Button1;
        wxButton* Button2;
        wxButton* Button3;
        wxButton* Button4;
        wxButton* Button5;
        wxButton* Button6;
        wxButton* Button7;
        wxButton* Button8;
        wxButton* Button9;
        wxButton* Del;
        wxButton* Div;
        wxButton* Erg;
        wxButton* Imag;
        wxButton* Mal;
        wxButton* Minus;
        wxButton* Plus;
        wxPanel* Panel1;
        wxStatusBar* StatusBar1;
        wxTextCtrl* TextCtrl1;
        wxToggleButton* ToggleButton1;
        //*)

        DECLARE_EVENT_TABLE()
};

#endif // IMRECHNERMAIN_H
