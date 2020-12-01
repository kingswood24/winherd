unit uClearDiseaseTestDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, db, dbTables, GenTypesConst;

type
  TfmClearDiseaseTestDate = class(TForm)
    cmboDiseaseType: TcxComboBox;
    lDiseaseType: TcxLabel;
    btnClearDiseaseDate: TcxButton;
    btnClose: TcxButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnClearDiseaseDateClick(Sender: TObject);
  private
    { Private declarations }
    FTestDatesCleared : Boolean;
  public
    { Public declarations }
    class function DiseaseTestDatesCleared : Boolean;
  end;

var
  fmClearDiseaseTestDate: TfmClearDiseaseTestDate;

implementation

{$R *.DFM}

class function TfmClearDiseaseTestDate.DiseaseTestDatesCleared: Boolean;
begin
   Result := False;
   with TfmClearDiseaseTestDate.Create(nil) do
      try
         ShowModal;
         Result := FTestDatesCleared;
      finally
         Free;
      end;
end;

procedure TfmClearDiseaseTestDate.btnClearDiseaseDateClick(Sender: TObject);
begin
   FTestDatesCleared := ( MessageDlg(Format('Are you sure you want to clear all animals %s test dates?',[cmboDiseaseType.Text]),
                                     mtConfirmation,[mbYes,mbNo],0) = mrYes );
   if ( not(FTestDatesCleared) ) then Exit;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Animals');
         case cmboDiseaseType.ItemIndex of
            0 : SQL.Add('SET TBTestDate = NULL');
            1 : SQL.Add('SET Brucellosis = NULL');
            2 : SQL.Add('SET BVDDate = NULL');
         end;
         try
            ExecSQL;
            FTestDatesCleared := True;
         except
            on e : Exception do
               FTestDatesCleared := False;
         end;
      finally
         Free;
         PostMessage(Self.Handle, WM_CLOSE,0,0);
      end;
end;

procedure TfmClearDiseaseTestDate.btnCloseClick(Sender: TObject);
begin
   Close;
end;

end.
