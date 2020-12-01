unit uGroupUpdate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxContainer, cxEdit, cxTextEdit, cxLabel, cxControls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Db,
  DBTables, StdCtrls, cxButtons, cxGroupBox, ActnList;

type
  TfmGroupUpdate = class(TForm)
    qPGroups: TQuery;
    dsPGroups: TDataSource;
    qPGroupsID: TIntegerField;
    qPGroupsGroupType: TStringField;
    qPGroupsCode: TStringField;
    qPGroupsDescription: TStringField;
    qPGroupsSelected: TBooleanField;
    qPGroupsAdditionalData: TBooleanField;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    btnOK: TcxButton;
    lIdentCaption: TcxLabel;
    cmbAnimals: TcxLookupComboBox;
    ActionList1: TActionList;
    actSave: TAction;
    actClose: TAction;
    cxGroupBox2: TcxGroupBox;
    cmbLookupPGroups: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    qBGroups: TQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    BooleanField1: TBooleanField;
    BooleanField2: TBooleanField;
    qFGroups: TQuery;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    BooleanField3: TBooleanField;
    BooleanField4: TBooleanField;
    qSGroups: TQuery;
    IntegerField3: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    BooleanField5: TBooleanField;
    BooleanField6: TBooleanField;
    dsBGroups: TDataSource;
    dsFGroups: TDataSource;
    dsSGroups: TDataSource;
    cmbLookupBGroups: TcxLookupComboBox;
    cmbLookupFGroups: TcxLookupComboBox;
    cmbLookupSGroups: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbAnimalsPropertiesCloseUp(Sender: TObject);
    procedure cmbAnimalsPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    PGroup, FGroup, BGroup, SGroup : Integer;
    procedure SetGroupControls;
    function SelectedAnimalID : Integer;
  public
    { Public declarations }
    class procedure ShowForm;
  end;

var
  fmGroupUpdate: TfmGroupUpdate;

implementation

uses DairyData, Groups;

{$R *.DFM}

class procedure TfmGroupUpdate.ShowForm;
begin
   with TfmGroupUpdate.Create(nil) do
      try
         qPGroups.Active := True;
         qFGroups.Active := True;
         qBGroups.Active := True;
         qSGroups.Active := True;

         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmGroupUpdate.FormCreate(Sender: TObject);
begin
   WinData.qFilterAnimals.Close;
   WinData.qFilterAnimals.Open;
   if not WinData.qFilterAnimals.Locate('ID',WinData.AnimalFileByIDID.AsInteger,[]) then
      begin
         raise Exception.Create('Cannot find animal ID');

      end
   else
      begin
         cmbAnimals.EditValue := WinData.AnimalFileByIDID.AsInteger;
         if WinData.SearchField = 'AnimalNo' then
            begin
               lIdentCaption.Caption := 'Animal No';
               cmbAnimals.Properties.ListFieldIndex := 0;
            end
         else
            begin
               lIdentCaption.Caption := 'Nat. Id. Number';
               cmbAnimals.Properties.ListFieldIndex := 1;
            end;
         SetGroupControls;
      end;
end;

procedure TfmGroupUpdate.actSaveExecute(Sender: TObject);
var
   AnimalID : Integer;
begin
   AnimalID := SelectedAnimalID;
   try
      if cmbLookupPGroups.EditValue <> null then
         begin
            if cmbLookupPGroups.EditValue > 0 then
               WinData.AddToGroup(SelectedAnimalID, cmbLookupPGroups.EditValue, True, Date, '', cmbAnimals.Text);
         end;

      if cmbLookupFGroups.EditValue <> null then
         begin
            if cmbLookupFGroups.EditValue > 0 then
               WinData.AddToGroup(SelectedAnimalID, cmbLookupFGroups.EditValue, True, Date, '', cmbAnimals.Text);
         end;

      if cmbLookupBGroups.EditValue <> null then
         begin
            if cmbLookupBGroups.EditValue > 0 then
               WinData.AddToGroup(SelectedAnimalID, cmbLookupBGroups.EditValue, True, Date, '', cmbAnimals.Text);
         end;

      if cmbLookupSGroups.EditValue <> null then
         begin
            if cmbLookupSGroups.EditValue > 0 then
               WinData.AddToGroup(SelectedAnimalID, cmbLookupSGroups.EditValue, True, Date, '', cmbAnimals.Text);
         end;
      MessageDlg('Animal groups updated successfully.',mtInformation,[mbOK],0);
   except
      MessageDlg('Error saving animal to groups.',mtError,[mbOK],0);
   end;
end;

procedure TfmGroupUpdate.actCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmGroupUpdate.FormDestroy(Sender: TObject);
begin
   qPGroups.Active := False;
   qFGroups.Active := False;
   qBGroups.Active := False;
   qSGroups.Active := False;
end;

procedure TfmGroupUpdate.SetGroupControls;
begin

   if SelectedAnimalID > 0 then
      begin
         WinData.GroupUpdate.Getgroups(SelectedAnimalID,PGroup,BGroup,FGroup,SGroup);
         if ( PGroup > 0 ) then
            cmbLookupPGroups.EditValue := PGroup;
         if ( FGroup > 0 ) then
            cmbLookupFGroups.EditValue := FGroup;
         if ( BGroup > 0 ) then
            cmbLookupBGroups.EditValue := BGroup;
         if ( SGroup > 0 ) then
            cmbLookupSGroups.EditValue := SGroup;
      end;
end;

procedure TfmGroupUpdate.cmbAnimalsPropertiesCloseUp(Sender: TObject);
begin
   SetGroupControls;
end;

procedure TfmGroupUpdate.cmbAnimalsPropertiesChange(Sender: TObject);
begin
   SetGroupControls;
end;

function TfmGroupUpdate.SelectedAnimalID: Integer;
begin
   Result := 0;
   if cmbAnimals.EditValue <> Null then
      Result := cmbAnimals.EditValue;
end;


end.
