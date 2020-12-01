unit uMovedBy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Db, RXCtrls, ComCtrls,
  ToolWin, kwDBNavigator;

type
  TfMovedBy = class(TForm)
    Panel2: TPanel;
    dsMovedBy: TDataSource;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton2: TToolButton;
    DBNavigator: TkwDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eName: TDBEdit;
    eTownland: TDBEdit;
    eCounty: TDBEdit;
    eHerdIdentity: TDBEdit;
    procedure ExitButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowTheForm ( AddingRecord : Boolean );                    // added 1/00

//var                                                                // changed 1/00
//  fMovedBy: TfMovedBy;

implementation
Uses
   DairyData;

var                                                                  // changed 1/00
  fMovedBy: TfMovedBy;

{$R *.DFM}

procedure ShowTheForm ( AddingRecord : Boolean );
begin
    try
       if ( fMovedBy = nil ) then                                    // added 1/00 to
          Application.CreateForm(TfMovedBy, fMovedBy);               //
       if AddingRecord then                                          // show blank
          WinData.tMovedTo.Append;                                   //
       fMovedBy.ShowModal;                                           // record upon
    except                                                           //
       ShowMessage('Cannot create form - close program and re-boot');// opening
    end;                                                             //
end;

procedure TfMovedBy.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

end.
