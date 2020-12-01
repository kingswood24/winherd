{
   08/07/11 [V4.1 R2.3] /MK Change - FeedType.KeyValue Not Null Then Show FeedTypes On Selected FeedID On btnFeedType Click.
                                   - Removed First,Next,Previous,Last From Toolbar As New Grid Allows Better Control.
                                   - Added btnFeedTypes To ToolBar. 

   12/03/13 [V5.1 R1.8] /MK Bug Fix - On Show Append new record in WinData.FdStkEvents table.

   05/03/14 [V5.2 R8.8] /MK Bug Fix - Removed all blade references and components with SP.
                            Additional Feature - Added Expiry Date as requested by Breda Forrest.

   26/11/14 [V5.4 R0.1] /MK Change - Changed old RX FeedType component to new CX component to allow drop-down-list to be sizeable - TOK/GL Request.
                                     With this new component user cannot click the add button within the drop-down-list for Feed Type
                                     but instead click the Feed Types button at the top of the Feed Purchase screen.

   16/03/16 [V5.5 R5.4] /MK Change - Fixed up tabbing on this screen. Remove tabbing into grid as it was causing the database
                                     to switch to edit mode from insert mode.
									 
   22/03/2016 [V5.5 R5.4] /SP Bug Fix - Fixed bug which caused an error while trying to update the feed type current stock value.
}

unit uFeedPurch;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, ToolEdit, RXDBCtrl, Mask, ExtCtrls,
  RXLookup, Buttons, RXCtrls, ComCtrls, ToolWin, DBTables, kwDBNavigator,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Dialogs, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfFeedPurch = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    lPurchDate: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Quantity: TDBEdit;
    CostUnit: TDBEdit;
    PurchDate: TDBDateEdit;
    FeedTypeOld: TRxDBLookupCombo;
    SupplierID: TRxDBLookupCombo;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    dbnMediPurchase: TkwDBNavigator;
    Label6: TLabel;
    Manufacturer: TRxDBLookupCombo;
    Label7: TLabel;
    OtherCosts: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbeBatch: TDBEdit;
    TotalCosts: TDBEdit;
    qSupplier: TQuery;
    dsSupplier: TDataSource;
    RxSpeedButton2: TRxSpeedButton;
    ToolButton4: TToolButton;
    DBMemo1: TDBMemo;
    Label10: TLabel;
    sbFeedPurchaseReport: TRxSpeedButton;
    ToolButton5: TToolButton;
    cxgFeedPurchGridDBTableView: TcxGridDBTableView;
    cxgFeedPurchGridLevel: TcxGridLevel;
    cxgFeedPurchGrid: TcxGrid;
    cxgFeedPurchGridDBTableViewFeedType: TcxGridDBColumn;
    cxgFeedPurchGridDBTableViewEventDate: TcxGridDBColumn;
    ToolButton6: TToolButton;
    btnFeedTypes: TRxSpeedButton;
    lExpiryDate: TLabel;
    dbExpiryDate: TDBDateEdit;
    FeedType: TcxDBLookupComboBox;
    procedure FeedTypeOldExit(Sender: TObject);
    procedure FeedTypeOldCloseUp(Sender: TObject);
    procedure bExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SupplierIDCloseUp(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure ManufacturerCloseUp(Sender: TObject);
    procedure dbnMediPurchaseClick(Sender: TObject; Button: TKNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure CostUnitExit(Sender: TObject);
    procedure CostUnitChange(Sender: TObject);
    procedure OtherCostsChange(Sender: TObject);
    procedure OtherCostsExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SupplierIDChange(Sender: TObject);
    procedure ManufacturerChange(Sender: TObject);
    procedure dbeBatchChange(Sender: TObject);
    procedure BladeIDChange(Sender: TObject);
    procedure PurchDateChange(Sender: TObject);
    procedure TotalCostsChange(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbFeedPurchaseReportClick(Sender: TObject);
    procedure btnFeedTypesClick(Sender: TObject);
    procedure cxgFeedPurchGridEnter(Sender: TObject);

  private
    { private declarations }
    FFormShowing : Boolean;
    FModified : Boolean;
    procedure SetModifiedFlag;
    procedure CalcCostAndQtyUsed;
    procedure SuppliersDropDownList;
  public
    { public declarations }
  end;

var
  fFeedPurch: TfFeedPurch;

implementation
uses
    uSuppliers,
    uFeedTypes,
    uManufacturers,
    DairyData,
    Def, KRoutines, HealthFilterU;

{$R *.DFM}

procedure TfFeedPurch.CalcCostAndQtyUsed;
begin
   if WinData.FdStkEvents.State in dsEditModes then // SP
      TotalCosts.Field.AsFloat := ((Quantity.Field.AsFloat*CostUnit.Field.AsFloat)+OtherCosts.Field.AsFloat);
end;

procedure TfFeedPurch.FeedTypeOldExit(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.FeedTypeOldCloseUp(Sender: TObject);
begin
   //If FeedType.Value = '0' Then
   if ( not(VarIsNull(FeedType.EditValue)) ) then   
      uFeedTypes.ShowTheForm(0,TRUE);  // blank record on open
end;

procedure TfFeedPurch.bExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfFeedPurch.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.MediPurch, ModalResult = mrOK, FModified );
end;

procedure TfFeedPurch.SupplierIDCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   if SupplierID.Value = '0' then
      begin
         uSuppliers.ShowTheForm(TRUE, ID);
         SupplierID.KeyValue := ID;
      end;
   qSupplier.Close;
   qSupplier.open;
end;

procedure TfFeedPurch.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('feedpurch.htm');
end;

procedure TfFeedPurch.SuppliersDropDownList;
begin
end;

procedure TfFeedPurch.ManufacturerCloseUp(Sender: TObject);
begin
   if Manufacturer.Value = '0' then
      uManufacturers.ShowTheForm(TRUE); // blank record on open
end;

procedure TfFeedPurch.dbnMediPurchaseClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   // save quantity to feed table
   if (Button = kwnbPost) then
      begin
         if WinData.FeedTypes.Locate('ID',WinData.FdStkEvents.FieldByName('FeedType').AsInteger,[]) then
            with WinData.FeedTypes do
               begin
                  Edit;
                  try
                     FieldByName('Stock').AsFloat := (FieldByName('Stock').AsFloat + Quantity.Field.AsFloat);
                     Post;
                  except
                     Cancel;
                  end;
               end;

         // 22/03/2016 SP - Bug fix.
         // The code below to append a feed purchase record
         // was triggered in DairyData FdStkEvents after post event
         // which caused the above code (to update the feed stock amount) to
         // break as the locate above was trying to locate on the appended
         // record and not the just saved!
         // Append into another purcase record
         try
            WinData.FdStkEvents.Append;
         except
            WinData.FdStkEvents.Cancel;
         end;
      end;
end;

procedure TfFeedPurch.FormShow(Sender: TObject);
begin
   qSupplier.Close;
   qSupplier.open;

   // On Show Append new record in database.
   try
      WinData.FdStkEvents.Append;
   except
      WinData.FdStkEvents.Cancel;
   end;
end;

procedure TfFeedPurch.RxSpeedButton2Click(Sender: TObject);
begin
   if Definition.dUseKingsAccs then
      WinData.CallProg.Accounts(' P ' + RegistrySerialNum, WinData.UserDefaultHerdID)
   else
      WinData.CallProg.Accounts(' P ', WinData.UserDefaultHerdID);
end;

procedure TfFeedPurch.CostUnitExit(Sender: TObject);
begin
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.CostUnitChange(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.OtherCostsChange(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.OtherCostsExit(Sender: TObject);
begin
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.FormCreate(Sender: TObject);
begin
   FModified := False;
   FFormShowing := False;
end;

procedure TfFeedPurch.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
end;

procedure TfFeedPurch.SupplierIDChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfFeedPurch.ManufacturerChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfFeedPurch.dbeBatchChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfFeedPurch.BladeIDChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfFeedPurch.PurchDateChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfFeedPurch.TotalCostsChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfFeedPurch.DBMemo1Change(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfFeedPurch.FormActivate(Sender: TObject);
begin
   FFormShowing := True;
end;

procedure TfFeedPurch.sbFeedPurchaseReportClick(Sender: TObject);
begin
   try
      try
         THeatlthFilter.ShowTheForm(rtMediFeedPurch,ptFeed,False);
      except
         ShowMessage('Cannot show this Form - close program and re-boot');
      end;
   finally
      //HeatlthFilter.Free;
   end;
end;

procedure TfFeedPurch.btnFeedTypesClick(Sender: TObject);
begin
  //if not VarIsNull(FeedType.KeyValue) then
  if ( not(VarIsNull(FeedType.EditValue)) ) then  
     //uFeedTypes.ShowTheForm(FeedType.KeyValue, False)
     uFeedTypes.ShowTheForm(FeedType.EditValue, False)
  else
     uFeedTypes.ShowTheForm(0,True)
end;

procedure TfFeedPurch.cxgFeedPurchGridEnter(Sender: TObject);
begin
   // If Table in insert state and user clicks into grid then cancel out of Insert state so database
   // moves into Browse state.
   if WinData.FdStkEvents.State = dsInsert then
      WinData.FdStkEvents.Cancel;
end;

end.
