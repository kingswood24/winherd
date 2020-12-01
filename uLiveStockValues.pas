{
  19/11/09 [V4.0 R0.4] /MK Additional Feature - New LivestockValues screen created.
                                              - New screen has values for Pedigree and Commercial.
}
unit uLiveStockValues;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxMaskEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxDBEdit,
  StdCtrls, Mask, DBCtrls, cxContainer, cxEdit, cxGroupBox, dxBar,
  dxBarExtItems, ActnList, cxControls, dxStatusBar, db, dbtables;

type
  TfmLivestockValues = class(TfmBaseForm)
    cxGroupBox3: TcxGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit15: TcxDBTextEdit;
    DBEdit16: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label36: TLabel;
    Label39: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TcxDBTextEdit;
    DBEdit2: TcxDBTextEdit;
    DBEdit3: TcxDBTextEdit;
    DBEdit4: TcxDBTextEdit;
    DBEdit5: TcxDBTextEdit;
    DBEdit6: TcxDBTextEdit;
    DBEdit7: TcxDBTextEdit;
    DBEdit8: TcxDBTextEdit;
    DBEdit9: TcxDBTextEdit;
    DBEdit10: TcxDBTextEdit;
    DBEdit11: TcxDBTextEdit;
    DBEdit12: TcxDBTextEdit;
    DBEdit13: TcxDBTextEdit;
    DBEdit14: TcxDBTextEdit;
    DBEdit17: TcxDBTextEdit;
    DBEdit18: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    bSave: TdxBarLargeButton;
    cxDBComboBox1: TcxDBComboBox;
    procedure actCloseExecute(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxDBComboBox1PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    procedure SetControlFieldNames(AEnterprise : String);
  public
    { Public declarations }
  end;

var
  fmLivestockValues: TfmLivestockValues;

implementation

uses DairyData;

{$R *.DFM}

procedure TfmLivestockValues.actCloseExecute(Sender: TObject);
begin
  inherited;
     Close;
end;

procedure TfmLivestockValues.bSaveClick(Sender: TObject);
begin
  inherited;
  if ( WinData.LiveStockValues.State in dsEditModes ) then
     begin
        WinData.LiveStockValues.Post;
        MessageDlg('Please run Livestock Inventory Report to calculate Opening/Closing Values',mtInformation,[mbOK],0);
     end;

end;

procedure TfmLivestockValues.FormCreate(Sender: TObject);
begin
  inherited;
     WinData.LiveStockValues.Active := True;
end;

procedure TfmLivestockValues.FormDestroy(Sender: TObject);
begin
  inherited;
     WinData.LiveStockValues.Active := False;
end;

procedure TfmLivestockValues.FormShow(Sender: TObject);
begin
  inherited;
  if not WinData.LiveStockValues.Locate('HerdID', WinData.UserDefaultHerdID, []) then
     begin
        WinData.LiveStockValues.Append;
        WinData.LiveStockValues.FieldByName('HerdID').AsInteger := WinData.UserDefaultHerdID;
        WinData.LiveStockValues.Post;
        WinData.LiveStockValues.Edit;
     end
  else
     WinData.LiveStockValues.Edit;

  if WinData.LiveStockValues.FieldByName('EnterpriseType').AsString = '' then
     WinData.LiveStockValues.FieldByName('EnterpriseType').AsString := 'Commercial';

  SetControlFieldNames(WinData.LiveStockValues.FieldByName('EnterpriseType').AsString);
end;

procedure TfmLivestockValues.SetControlFieldNames(AEnterprise : String);
begin
     if AEnterprise = 'Pedigree' then
        begin
           DBEdit1.DataBinding.DataField := 'PedigreeCowsInMilk';
           DBEdit2.DataBinding.DataField := 'PedigreeCowsDry';
           DBEdit4.DataBinding.DataField := 'PedigreeBullBreed';
           DBEdit5.DataBinding.DataField := 'PedigreeHeifer06';
           DBEdit6.DataBinding.DataField := 'PedigreeHeifer612';
           DBEdit7.DataBinding.DataField := 'PedigreeHeifer1218';
           DBEdit8.DataBinding.DataField := 'PedigreeHeifer1824';
           DBEdit9.DataBinding.DataField := 'PedigreeHeifer24Plus';
           DBEdit10.DataBinding.DataField := 'PedigreeSteer06';
           DBEdit11.DataBinding.DataField := 'PedigreeSteer612';
           DBEdit12.DataBinding.DataField := 'PedigreeSteer1218';
           DBEdit13.DataBinding.DataField := 'PedigreeSteer1824';
           DBEdit14.DataBinding.DataField := 'PedigreeSteer24Plus';
           DBEdit3.DataBinding.DataField := 'PedigreeBullBeef06';
           DBEdit17.DataBinding.DataField := 'PedigreeBullBeef612';
           DBEdit18.DataBinding.DataField := 'PedigreeBullBeef12Plus';
           DBEdit15.DataBinding.DataField := 'PedigreeOpeningValue';
           DBEdit16.DataBinding.DataField := 'PedigreeClosingValue';
        end
     else
        begin
           DBEdit1.DataBinding.DataField := 'CowsInMilk';
           DBEdit2.DataBinding.DataField := 'CowsDry';
           DBEdit4.DataBinding.DataField := 'BullBreed';
           DBEdit5.DataBinding.DataField := 'Heifer06';
           DBEdit6.DataBinding.DataField := 'Heifer612';
           DBEdit7.DataBinding.DataField := 'Heifer1218';
           DBEdit8.DataBinding.DataField := 'Heifer1824';
           DBEdit9.DataBinding.DataField := 'Heifer24Plus';
           DBEdit10.DataBinding.DataField := 'Steer06';
           DBEdit11.DataBinding.DataField := 'Steer612';
           DBEdit12.DataBinding.DataField := 'Steer1218';
           DBEdit13.DataBinding.DataField := 'Steer1824';
           DBEdit14.DataBinding.DataField := 'Steer24Plus';
           DBEdit3.DataBinding.DataField := 'BullBeef06';
           DBEdit17.DataBinding.DataField := 'BullBeef612';
           DBEdit18.DataBinding.DataField := 'BullBeef12Plus';
           DBEdit15.DataBinding.DataField := 'OpeningValue';
           DBEdit16.DataBinding.DataField := 'ClosingValue';
        end;
end;

procedure TfmLivestockValues.cxDBComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  SetControlFieldNames(WinData.LiveStockValues.FieldByName('EnterpriseType').AsString);
end;

end.
