{
   12/12/11 [V5.0 R2.8] /MK Additional Feature - New Unit To Re-Create A Delete Feed Event From An Existing Feed Regime.
}

unit uNewFeedAllocEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  cxCurrencyEdit, cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar, cxContainer,
  cxEdit, cxLabel, ExtCtrls, DB, dbTables;

type
  TAddOrEditEvent = (AddEvent, EditEvent);
  TfmNewFeedAllocEdit = class(TfmBaseForm)
    actSave: TAction;
    actCancel: TAction;
    lbSave: TdxBarLargeButton;
    lbCancel: TdxBarLargeButton;
    pFeedAllocEdit: TPanel;
    lFeedAllocDate: TcxLabel;
    lFeedGroup: TcxLabel;
    lFeedType: TcxLabel;
    lAmountPrice: TcxLabel;
    lEndAllocDate: TcxLabel;
    teFeedType: TcxTextEdit;
    dAllocDate: TcxDateEdit;
    dEndAllocDate: TcxDateEdit;
    ceAmount: TcxCurrencyEdit;
    cePrice: TcxCurrencyEdit;
    lcbFeedGroup: TcxLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure lcbFeedGroupPropertiesCloseUp(Sender: TObject);
  private
    AddOrEditEvents : TAddOrEditEvent;
    qExistingFeedRegimes : TQuery;
    dsExistingFeedRegimes : TDataSource;
    FCurrAnimalID,
    FCurrAnimalLactNo,
    FCurrFeedGroupID : Integer;
    function GetDefPrice: Double;
    procedure SetCostDay;
    procedure SaveAnimalToRegime;
    { Private declarations }
  public
     class procedure ShowTheForm( AAdding : Boolean; AAnimalID, AAnimalLactNo, AFeedGroupID : Integer );
    { Public declarations }
  end;

var
  fmNewFeedAllocEdit: TfmNewFeedAllocEdit;

implementation

uses DairyData, GenTypesConst;

{$R *.DFM}

class procedure TfmNewFeedAllocEdit.ShowTheForm( AAdding : Boolean; AAnimalID, AAnimalLactNo, AFeedGroupID : Integer );
begin
   with TfmNewFeedAllocEdit.Create(nil) do
   try
      FCurrAnimalID := AAnimalID;
      FCurrAnimalLactNo := AAnimalLactNo;
      FCurrFeedGroupID := AFeedGroupID;
      if ( AAdding ) then
         AddOrEditEvents := AddEvent
      else
         AddOrEditEvents := EditEvent;

      lFeedGroup.Visible := ( AddOrEditEvents = AddEvent );
      if ( lFeedGroup.Visible ) then
         begin
            lFeedGroup.Visible := True;
            pFeedAllocEdit.Height := 235;
            Height := 371;
         end
      else
         begin
            pFeedAllocEdit.Height := 190;
            Height := 321;
            lFeedType.Top := 66;
            teFeedType.Top := 64;
            lAmountPrice.Top := 106;
            ceAmount.Top := 106;
            cePrice.Top := 106;
            lEndAllocDate.Top := 146;
            dEndAllocDate.Top := 148;
         end;

      ShowModal;
   finally
      Free;
   end;
end;

procedure TfmNewFeedAllocEdit.FormActivate(Sender: TObject);
begin
   inherited;
   qExistingFeedRegimes := TQuery.Create(nil);
   with qExistingFeedRegimes do
      begin
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT FR.ID FeedRegimeID, G.Description GroupName, FR.FeedType, FR.AllocDate, FR.QuantDay, ');
         SQL.Add('       FR.CostDay, FT.Description FeedName');
         SQL.Add('FROM FeedRegime FR');
         SQL.Add('LEFT JOIN Grps G On (G.ID = FR.GroupID)');
         SQL.Add('LEFT JOIN FeedTypes FT On (FT.ID = FR.FeedType)');
         SQL.Add('WHERE FR.GroupID = :CurrFeedGroupID');
         Params[0].AsInteger := FCurrFeedGroupID;
         Open;
         if RecordCount > 0 then
            begin
               lcbFeedGroup.EditValue := FieldByName('FeedRegimeID').AsInteger;
               dAllocDate.Date := FieldByName('AllocDate').AsDateTime;
               dAllocDate.Enabled := False;
               teFeedType.Text := FieldByName('FeedName').AsString;
            end;
      end;

   dsExistingFeedRegimes := TDataSource.Create(nil);
   dsExistingFeedRegimes.DataSet := qExistingFeedRegimes;

   lcbFeedGroup.Properties.ListSource := dsExistingFeedRegimes;
   lcbFeedGroup.Properties.KeyFieldNames := 'FeedRegimeID';
   lcbFeedGroup.Properties.ListFieldNames := 'GroupName';

   SetCostDay;
end;

procedure TfmNewFeedAllocEdit.lcbFeedGroupPropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
   if ( lcbFeedGroup.EditValue > 0 ) then
      if ( qExistingFeedRegimes.Locate('FeedRegimeID', lcbFeedGroup.EditValue, []) ) then
         begin
            teFeedType.Text := qExistingFeedRegimes.FieldByName('FeedName').AsString;
            SetCostDay;
         end;
end;

function TfmNewFeedAllocEdit.GetDefPrice: Double;
begin
   Result := WinData.FeedTypes.Lookup('ID', qExistingFeedRegimes.FieldByName('FeedType').AsInteger, 'DefCostTon') / 1000 ;
end;

procedure TfmNewFeedAllocEdit.SetCostDay;
var
   fPrice : Double;
begin
   if (teFeedType.Text = '') then Exit;

   if ( (qExistingFeedRegimes.FieldByName('CostDay').AsFloat <= 0) or
        (qExistingFeedRegimes.FieldByName('QuantDay').AsFloat <= 0) ) then Exit;

   ceAmount.Value := qExistingFeedRegimes.FieldByName('QuantDay').AsFloat;
   fPrice := qExistingFeedRegimes.FieldByName('CostDay').AsFloat;
   cePrice.Value := fPrice;
end;

procedure TfmNewFeedAllocEdit.actSaveExecute(Sender: TObject);
begin
   inherited;
   if ( not(WinData.FeedEvents.Locate('AnimalID;FeedRegimeID',VarArrayOf([FCurrAnimalID,lcbFeedGroup.EditValue]),[])) ) then
      begin
         if ( MessageDlg('Save animal to Feed Regime selected',mtWarning,[mbYes,mbNo],0) = mrYes ) then
            begin
               SaveAnimalToRegime;
               MessageDlg('Animal successfully added to this Feed Regime',mtInformation,[mbOK],0);
               Close;
            end
         else
            Exit;
      end
   else
      begin
         MessageDlg('Animal already exists in this regime',mtError,[mbOK],0);
         Exit;
      end;
end;

procedure TfmNewFeedAllocEdit.actCancelExecute(Sender: TObject);
begin
   inherited;
   qExistingFeedRegimes.Active := False;
   qExistingFeedRegimes.Active := True;
   SetCostDay;
end;

procedure TfmNewFeedAllocEdit.SaveAnimalToRegime;
begin
   with WinData.FeedEvents do
      begin
         Append;
         FieldByName('AnimalID').AsInteger := FCurrAnimalID;
         FieldByName('FeedType').AsInteger := qExistingFeedRegimes.FieldByName('FeedType').AsInteger;
         FieldByName('AllocDate').AsDateTime := qExistingFeedRegimes.FieldByName('AllocDate').AsDateTime;
         FieldByName('QuantDay').AsFloat := ceAmount.Value;
         FieldByName('CostDay').AsFloat := cePrice.Value;
         FieldByName('Lact').AsInteger := FCurrAnimalLactNo;
         FieldByName('FeedRegimeID').AsInteger := qExistingFeedRegimes.FieldByName('FeedRegimeID').AsInteger;
         Post;
      end;
end;

procedure TfmNewFeedAllocEdit.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( qExistingFeedRegimes <> nil ) then
      qExistingFeedRegimes.Free;
end;

end.
