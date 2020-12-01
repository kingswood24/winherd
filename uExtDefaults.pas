{
 ----------------------------------------------------------------------------

 SP 13/01/2003:-

 On change or selection of Year, this sets WinData.Premium Year to the value of combobox.

 SP 13/01/2003.

 ----------------------------------------------------------------------------


}
unit uExtDefaults;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Buttons, DBTables, RXCtrls,
  ComCtrls, ToolWin, kwDBNavigator, ToolEdit, CurrEdit, RxDBComb, Dialogs,
  RxLookup;

type
  TfExtDefaults = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton2: TToolButton;
    DBNavigator: TkwDBNavigator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label15: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    GroupBox4: TGroupBox;
    ToolButton4: TToolButton;
    Year: TRxDBLookupCombo;
    GroupBox7: TGroupBox;
    DBEdit8: TDBEdit;
    Label17: TLabel;
    Bevel4: TBevel;
    procedure bExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure YearCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fExtDefaults: TfExtDefaults;

implementation
uses
   DairyData, GenTypesConst;

{$R *.DFM}

procedure TfExtDefaults.bExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfExtDefaults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   WinData.PremiaDefaults.Active := False;
   Action := caFree;
end;

procedure TfExtDefaults.DBNavigatorBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
var
  i : Word;
begin
   if Button = kwnbPost then
      if MessageDlg('Save default for '+DBEdit8.Text+' ?',mtConfirmation,[mbYes, mbNo],0) = idNo then
         WinData.PremiaDefaults.Cancel
end;

procedure TfExtDefaults.FormShow(Sender: TObject);
begin
   Try
      WinData.PremiaDefaults.Open;
      WinData.PremiaDefaults.Locate('Year', WinData.GetCurrentYear, []);
      Year.KeyValue := WinData.PremiaDefaultsID.AsInteger;
   except
   //
   end;
end;

procedure TfExtDefaults.YearCloseUp(Sender: TObject);
begin
   try
      WinData.PremiumYear := WinData.PremiaDefaultsYear.Value;
   except
      WinData.PremiumYear := WinData.GetCurrentYear;
   end;
end;

procedure TfExtDefaults.FormCreate(Sender: TObject);
begin
   WinData.LoadBtnImage(sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(sbHelp.Glyph, cBtnImgHelp);
end;

end.
