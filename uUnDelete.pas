unit uUnDelete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, DBCGrids, RXLookup,
  ToolEdit, RXDBCtrl, Db, DBTables, RXCtrls, ToolWin;

type
  TfUnDelete = class(TForm)
    pMain: TPanel;
    dsDamSire: TDataSource;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    RxSpeedButton1: TRxSpeedButton;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    dbeNatId: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    eRemark: TEdit;
    DBEdit3: TDBEdit;
    lSex: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
  private
    { Private declarations }
    SuccessUndelete : Boolean;
  public
    { Public declarations }
  end;

function ShowUnDelete(AnimalID : Variant ) : Boolean;

implementation
uses
    GenTypesConst,
    DairyData,
    uRemarks;

{$R *.DFM}

function ShowUnDelete(AnimalID : Variant ) : Boolean;
begin
     with TfUnDelete.Create(nil) do
        try
           SuccessUnDelete := FALSE;
           // Mark sure to clear the Remarks
           fRemarks.RemarksAdded := FALSE;
           // find the Animal in the LookUpDamSire Table
           if WinData.LookUpDamSire.Locate('ID',AnimalID,[] ) then
              ShowModal
           else
              ShowMessage('Cannot find the Animal');
        finally
           Result := SuccessUnDelete;
           Free;
           Abort; // This aborts the current OnValidate event for both the AnimalNo and NationalIDNum fields in DairyData!
        end;
end;

procedure TfUnDelete.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfUnDelete.bSaveClick(Sender: TObject);
var
   MyQuery : TQuery;
   TestRemark : String;
   CancelledChanges : Boolean;
   UpdateOk      : Integer;
begin
    // Save the info to the relevant place
    TestRemark := WinData.StripSpaces(eRemark.Text);
    if Length(TestRemark) = 0 then
       MessageDLG('Cannot UnDelete without a Remark',mtWarning,[mbOK],0)
    else
       with WinData do
          try
             MyQuery := TQuery.Create(nil);
             MyQuery.DatabaseName := KingData.DatabaseName;
             MyQuery.SQL.Add ( 'UPDATE Animals SET AnimalDeleted=FALSE');
             MyQuery.SQL.Add ( 'WHERE ID=' + LookUpDamSire.FieldByName('ID').AsString);
             MyQuery.ExecSQL;
             UpdateOk := MyQuery.RowsAffected;

             if UpdateOK = 1 then
                begin
                  tRemarks.Open;
                  tSysUser.Open;
                  // Add a Record
                  tRemarks.Append;
                  tRemarks.FieldByName('AID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                  tRemarks.FieldByName('DateChanged').AsDateTime := Date();
                  tRemarks.FieldByName('TimeChanged').AsDateTime := Time();
                  tRemarks.FieldByName('ItemChanged').AsInteger  := uReMarks.cUnDeleteRemark;
                  tRemarks.FieldByName('OldItem').AsString       := 'Animal UnDeleted';
                  tRemarks.FieldByName('Remark').AsString        := eRemark.Text;
                  // Get the Current User Name
                  try
                    if tSysUser.Locate('ID',DefaultSysUser,[] ) then
                       tRemarks.FieldByName('ChangedBy').AsString := tSysUser.FieldByName('Name').AsString
                    else
                       raise EInvalidOp.CreateFmt('SetUp a Default User Name - Changes NOT saved',[0]);
                    CancelledChanges := FALSE;
                  except
                    tRemarks.Cancel;
                    CancelledChanges := TRUE;
                  end;
                  // Only try and save changes if the default is set.
                  if NOT CancelledChanges then
                     begin
                        tRemarks.Post;
                        WinData.Kingdata.ApplyUpdates([tRemarks]);
                        // find the Animal and Set focus to it
                        AnimalFileById.CancelUpdates;
                        AnimalFileById.Close;
                        AnimalFileById.Open;

                        if NOT AnimalFileById.Locate('ID',LookUpDamSire.FieldByName('Id').AsInteger,[]) then
                           begin
                              ShowMessage('Animal ' + LookUpDamSire.FieldByName('AnimalNo').AsString + ' has been undeleted but must be in a different Herd');
                              AnimalFileByID.Append;
                           end;
                        // Set result to TRUE the Animal has been undeleted.
                        SuccessUndelete := TRUE;
                        Close;   // Close the Form
                     end
                  else
                     begin  // Revert the Animal with a Query
                       MyQuery.SQL.Clear;
                       MyQuery.SQL.Add ( 'UPDATE Animals SET AnimalDeleted=TRUE');
                       MyQuery.SQL.Add ( 'WHERE ID=' + LookUpDamSire.FieldByName('ID').AsString);
                       MyQuery.ExecSQL;
                     end;
                end
             else
                ShowMessage('Could not UnDelete this Animal');
          finally
             MyQuery.Free;
             tSysUser.Close;
             tRemarks.Close;
          end;
end;

end.
