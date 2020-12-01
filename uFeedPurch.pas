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

   22/03/16 [V5.5 R5.4] /SP Bug Fix - Fixed bug which caused an error while trying to update the feed type current stock value.

   26/01/17 [V5.6 R4.1] /MK Change - Added buttons for supplier and manufacturer to the toolbar for easy adding/editing of these lists.

   21/07/17 [V5.6 R9.3] /MK Bug Fix - Manufacturer setup button was spelt incorrectly.

   25/06/19 [V5.8 R9.6] /MK Change - Removed CellSelect from Grid properties to stop grid moving to the side when selecting a record on the grid.   
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
  cxDBLookupEdit, cxDBLookupComboBox, cxCalendar, cxMemo, cxDBEdit,
  GenTypesConst, Menus;

type
  TfFeedPurch = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    lPurchDate: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    dbnMediPurchase: TkwDBNavigator;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    qSupplier: TQuery;
    dsSupplier: TDataSource;
    RxSpeedButton2: TRxSpeedButton;
    ToolButton4: TToolButton;
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
    FeedTypeLookup: TcxDBLookupComboBox;
    SupplierLookup: TcxDBLookupComboBox;
    ManufacturerLookup: TcxDBLookupComboBox;
    PurchaseDateEdit: TcxDBDateEdit;
    BatchNumberEdit: TcxDBTextEdit;
    ExpiryDateEdit: TcxDBDateEdit;
    QuantityMaskEdit: TcxDBMaskEdit;
    UnitCostMaskEdit: TcxDBMaskEdit;
    OtherCostsMaskEdit: TcxDBMaskEdit;
    TotalFeedPriceMaskEdit: TcxDBMaskEdit;
    PurchaseCommentMemo: TcxDBMemo;
    OptionsMenu: TPopupMenu;
    AddSupplier1: TMenuItem;
    RecordCountLabel: TLabel;
    rxSuppliers: TRxSpeedButton;
    rxManufactuers: TRxSpeedButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    procedure bExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbHelpClick(Sender: TObject);
    procedure dbnMediPurchaseClick(Sender: TObject; Button: TKNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbFeedPurchaseReportClick(Sender: TObject);
    procedure btnFeedTypesClick(Sender: TObject);
    procedure cxgFeedPurchGridEnter(Sender: TObject);
    procedure cxDBMemo1PropertiesChange(Sender: TObject);
    procedure SupplierLookupPropertiesChange(Sender: TObject);
    procedure ManufacturerLookupDblClick(Sender: TObject);
    procedure PurchaseDateEditPropertiesChange(Sender: TObject);
    procedure ExpiryDateEditPropertiesChange(Sender: TObject);
    procedure BatchNumberEditPropertiesChange(Sender: TObject);
    procedure OtherCostsMaskEditExit(Sender: TObject);
    procedure OtherCostsMaskEditPropertiesChange(Sender: TObject);
    procedure UnitCostMaskEditPropertiesChange(Sender: TObject);
    procedure UnitCostMaskEditExit(Sender: TObject);
    procedure QuantityMaskEditPropertiesChange(Sender: TObject);
    procedure QuantityMaskEditExit(Sender: TObject);
    procedure dbnMediPurchaseBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure PurchaseDateEditEnter(Sender: TObject);
    procedure AddSupplier1Click(Sender: TObject);
    procedure SupplierLookupMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rxSuppliersClick(Sender: TObject);
    procedure rxManufactuersClick(Sender: TObject);

  private
    { private declarations }
    FFormShowing : Boolean;
    FModified : Boolean;
    FRecordEdited : Boolean;
    procedure SetModifiedFlag;
    procedure CalcCostAndQtyUsed;
    procedure SuppliersDropDownList;
    procedure CallWinMessage(var Message: TMessage); message WM_CXDATE_ONENTER_MESSAGE;
    procedure AddSupplier;
    procedure OptionsPopup(AValue : Integer);
    procedure SetFormCaptions;
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
    Def,
    KRoutines,
    HealthFilterU;

{$R *.DFM}

procedure TfFeedPurch.CalcCostAndQtyUsed;
begin
   if WinData.FdStkEvents.State in dsEditModes then // SP
      TotalFeedPriceMaskEdit.DataBinding.Field.AsFloat :=

      ((QuantityMaskEdit.DataBinding.Field.AsFloat*UnitCostMaskEdit.DataBinding.Field.AsFloat)+OtherCostsMaskEdit.DataBinding.Field.AsFloat);
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

procedure TfFeedPurch.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('feedpurch.htm');
end;

procedure TfFeedPurch.SuppliersDropDownList;
begin
end;

procedure TfFeedPurch.dbnMediPurchaseClick(Sender: TObject; Button: TKNavigateBtn);
begin
   // save quantity to feed table
   if ( Button = kwnbPost ) then
      begin
         SetFormCaptions();

         // 22/03/2016 SP - Bug fix.
         // The code below to append a feed purchase record
         // was triggered in DairyData FdStkEvents after post event
         // which caused the above code (to update the feed stock amount) to
         // break as the locate above was trying to locate on the appended
         // record and not the just saved!
         // Append into another purcase record
         if ( not(FRecordEdited) ) then
            begin
               try
                  WinData.FdStkEvents.Append;
               except
                  WinData.FdStkEvents.Cancel;
               end;
               FeedTypeLookup.SetFocus;
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

procedure TfFeedPurch.FormCreate(Sender: TObject);
begin
   FModified := False;
   FFormShowing := False;

   FeedTypeLookup.DataBinding.DataSource := WinData.dsFdStkEvents;
   SupplierLookup.DataBinding.DataSource := WinData.dsFdStkEvents;
   ManufacturerLookup.DataBinding.DataSource := WinData.dsFdStkEvents;
   PurchaseDateEdit.DataBinding.DataSource := WinData.dsFdStkEvents;
   BatchNumberEdit.DataBinding.DataSource := WinData.dsFdStkEvents;
   ExpiryDateEdit.DataBinding.DataSource := WinData.dsFdStkEvents;
   QuantityMaskEdit.DataBinding.DataSource := WinData.dsFdStkEvents;
   UnitCostMaskEdit.DataBinding.DataSource := WinData.dsFdStkEvents;
   OtherCostsMaskEdit.DataBinding.DataSource := WinData.dsFdStkEvents;
   TotalFeedPriceMaskEdit.DataBinding.DataSource := WinData.dsFdStkEvents;
   PurchaseCommentMemo.DataBinding.DataSource := WinData.dsFdStkEvents;
   cxgFeedPurchGridDBTableView.DataController.DataSource := WinData.dsFdStkEvents;

   SetFormCaptions();
end;

procedure TfFeedPurch.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
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
  if ( not(VarIsNull(FeedTypeLookup.EditValue)) ) then
     uFeedTypes.ShowTheForm(FeedTypeLookup.EditValue, False)
  else
     uFeedTypes.ShowTheForm(0,True);
  WinData.FeedTypes.Close;
  WinData.FeedTypes.Open;
end;

procedure TfFeedPurch.cxgFeedPurchGridEnter(Sender: TObject);
begin
   // If Table in insert state and user clicks into grid then cancel out of Insert state so database
   // moves into Browse state.
   if WinData.FdStkEvents.State = dsInsert then
      WinData.FdStkEvents.Cancel;
end;

procedure TfFeedPurch.cxDBMemo1PropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfFeedPurch.SupplierLookupPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfFeedPurch.ManufacturerLookupDblClick(Sender: TObject);
begin
   if VarIsNull(ManufacturerLookup.EditValue) then
      uManufacturers.ShowTheForm(TRUE); // blank record on open
end;

procedure TfFeedPurch.PurchaseDateEditPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfFeedPurch.ExpiryDateEditPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfFeedPurch.BatchNumberEditPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfFeedPurch.OtherCostsMaskEditExit(Sender: TObject);
begin
 CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.OtherCostsMaskEditPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.UnitCostMaskEditPropertiesChange(Sender: TObject);
begin
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.UnitCostMaskEditExit(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.QuantityMaskEditPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.QuantityMaskEditExit(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCostAndQtyUsed;
end;

procedure TfFeedPurch.dbnMediPurchaseBeforeAction(Sender: TObject; Button: TKNavigateBtn);
begin
   FRecordEdited := WinData.FdStkEvents.State = dsEdit;
end;

procedure TfFeedPurch.CallWinMessage(var Message: TMessage);
begin
   if (Message.Msg = WM_CXDATE_ONENTER_MESSAGE) then
      begin
         TcxDBDateEdit(Message.WParam).SelStart := 0;
         TcxDBDateEdit(Message.WParam).SelLength := 2;
      end;
end;

procedure TfFeedPurch.PurchaseDateEditEnter(Sender: TObject);
begin
   PostMessage(Handle, WM_CXDATE_ONENTER_MESSAGE, Integer(Sender), 0);
end;

procedure TfFeedPurch.AddSupplier1Click(Sender: TObject);
begin
   AddSupplier();
end;

procedure TfFeedPurch.AddSupplier;
var
   ID : Integer;
begin
   uSuppliers.ShowTheForm(TRUE, ID);
   qSupplier.Close;
   qSupplier.Open;
   if (WinData.FdStkEvents.State in dsEditModes) then
      WinData.FdStkEventsSupplier.AsInteger := Id;
end;

procedure TfFeedPurch.SupplierLookupMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (Button = mbRight) and (WinData.FdStkEvents.State in dsEditModes) then
      OptionsPopup(1);
end;

procedure TfFeedPurch.OptionsPopup(AValue: Integer);
var
   pt : tPoint;
   i : Integer;
begin
   GetCursorPos(pt);
   for i := 0 to  OptionsMenu.Items.Count-1 do
      OptionsMenu.Items[i].Visible := OptionsMenu.Items[i].Tag = AValue;
   OptionsMenu.Popup(pt.x,pt.y);
end;

procedure TfFeedPurch.SetFormCaptions;
begin
   RecordCountLabel.Caption := Format('%d Records', [WinData.FdStkEvents.RecordCount]);
end;

procedure TfFeedPurch.rxSuppliersClick(Sender: TObject);
var
   ID : Integer;
begin
   uSuppliers.ShowTheForm(TRUE, ID);
   dsSupplier.DataSet.Close;
   dsSupplier.DataSet.Open;
end;

procedure TfFeedPurch.rxManufactuersClick(Sender: TObject);
begin
   uManufacturers.ShowTheForm(TRUE);
   WinData.Manufacturers.Close;
   WinData.Manufacturers.Open;
end;

end.
