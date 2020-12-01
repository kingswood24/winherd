{
   09/11/15 [V5.5 R0.5] /MK Additional Feature - Added InUse dbCheckbox for the new InUse field.
}

unit uBuyers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  RXCtrls, ComCtrls, ToolWin, kwDBNavigator, db, dbtables, cxControls,
  cxContainer, cxEdit, cxCheckBox, cxDBEdit, uCrushXML, Def;

type
  TfBuyers = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EditName: TDBEdit;
    EditAddress: TDBEdit;
    EditAddress2: TDBEdit;
    EditAddress3: TDBEdit;
    EditAddress4: TDBEdit;
    EditAddress5: TDBEdit;
    EditPhone: TDBEdit;
    EditFax: TDBEdit;
    EditEmail: TDBEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton1: TToolButton;
    DBNavigator: TkwDBNavigator;
    Label4: TLabel;
    eSearch: TEdit;
    dbcbDefault: TcxDBCheckBox;
    dbcbInUse: TcxDBCheckBox;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbHelpClick(Sender: TObject);
    procedure eSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eSearchKeyPress(Sender: TObject; var Key: Char);
    procedure DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
  private
    { Private declarations }
    ID : Integer;
    PreviousIndexName : String;
  public
    { Public declarations }
  end;

procedure ShowTheForm ( AddingRecord : Boolean; var BuyerID : Integer);

implementation
uses DairyData, GenTypesConst;

var
  fBuyers: TfBuyers;

{$R *.DFM}

procedure ShowTheForm ( AddingRecord : Boolean; var BuyerID : Integer );
begin
   Application.CreateForm(TfBuyers, fBuyers);
    try
       if AddingRecord then
          WinData.Buyers.Append;
       fBuyers.ShowModal;
    finally
       BuyerID := fBuyers.ID;
       FreeAndNil(fBuyers);
    end;
end;

procedure TfBuyers.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfBuyers.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if WinData.Buyers.Active then
       begin
          ID := WinData.Buyers.FieldByName('ID').AsInteger;
          WinData.Buyers.Cancel;
       end;
end;

procedure TfBuyers.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('buyers');
end;

procedure TfBuyers.eSearchChange(Sender: TObject);
begin
   if eSearch.Text = '' then
      WinData.Buyers.First;
end;

procedure TfBuyers.FormShow(Sender: TObject);
begin
   eSearch.Text := '';
   PreviousIndexName := WinData.Buyers.IndexName;
   WinData.Buyers.Close;
   WinData.Buyers.IndexName := 'iName';
   WinData.Buyers.Open;
end;

procedure TfBuyers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   WinData.Buyers.Close;
   WinData.Buyers.IndexName := PreviousIndexName;
   WinData.Buyers.Open;
end;

procedure TfBuyers.eSearchKeyPress(Sender: TObject; var Key: Char);
begin
   if ( key  in iCharSearchSet ) then
      begin
         WinData.Buyers.Locate('Name', Trim( eSearch.Text +  key ) , [loCaseInsensitive, loPartialKey]);
      end;
end;

procedure TfBuyers.DBNavigatorClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if ( Button = kwnbPost ) then
      begin
         if Def.Definition.dUseCrush then
            begin
               with TCrushXMLExport.Create do
                  try
                     FBuyer.Name := WinData.BuyersName.AsString;
                     FBuyer.Address1 := WinData.BuyersAddress1.AsString;
                     FBuyer.Address2 := WinData.BuyersAddress2.AsString;
                     FBuyer.Address3 := WinData.BuyersAddress3.AsString;
                     FBuyer.Address4 := WinData.BuyersAddress4.AsString;
                     FBuyer.Address5 := WinData.BuyersAddress5.AsString;
                     FBuyer.Phone := WinData.BuyersPhone.AsString;
                     FBuyer.Fax := WinData.BuyersFax.AsString;
                     FBuyer.Email := WinData.BuyersEmail.AsString;
                     FBuyer.Commission := WinData.BuyersCommission.AsFloat;
                     FBuyer.DefaultBuyer := WinData.BuyersDefaultBuyer.AsBoolean;
                     CreateorOpenXMLFile(etPurchase);
                     AddLookupItemToXML;
                  finally
                     Free;
                  end;
            end;
      end;
end;

end.
