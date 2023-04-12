/***************************************************************
 * Name:      imRechnerApp.cpp
 * Purpose:   Code for Application Class
 * Author:     ()
 * Created:   2021-01-28
 * Copyright:  ()
 * License:
 **************************************************************/

#include "imRechnerApp.h"

//(*AppHeaders
#include "imRechnerMain.h"
#include <wx/image.h>
//*)

IMPLEMENT_APP(imRechnerApp);

bool imRechnerApp::OnInit()
{
    //(*AppInitialize
    bool wxsOK = true;
    wxInitAllImageHandlers();
    if ( wxsOK )
    {
    	imRechnerFrame* Frame = new imRechnerFrame(0);
    	Frame->Show();
    	SetTopWindow(Frame);
    }
    //*)
    return wxsOK;

}
