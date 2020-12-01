unit uBeefHerdStats;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, ActnList, dxBar, dxBarExtItems, cxControls, dxStatusBar,
  StdCtrls, cxButtons, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit,
  cxCalendar, cxContainer, cxEdit, cxGroupBox, uSQLFilters, db, dbTables,
  cxProgressBar;

type
  TBeefHerdStatsRecord = record
    DaysOnFarm : Integer;
    AnimalsOnFarm : Integer;
    AvgDaysOnFarm : Double;
  end;

  TfmBeefHerdStats = class(TfmBaseForm)
    cxGroupBox1: TcxGroupBox;
    deFromDate: TcxDateEdit;
    deToDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxLabel3: TcxLabel;
    cmboSex: TcxComboBox;
    gbResults: TcxGroupBox;
    cxLabel4: TcxLabel;
    teTotalAnimalDays: TcxTextEdit;
    cxLabel5: TcxLabel;
    teTotalAnimals: TcxTextEdit;
    cxLabel6: TcxLabel;
    teAvgDays: TcxTextEdit;
    ProgressBar: TcxProgressBar;
    procedure cxButton1Click(Sender: TObject);
    procedure deFromDatePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    SQLFilter : TSQLFilter;
  public
    { Public declarations }
  end;

var
  fmBeefHerdStats: TfmBeefHerdStats;

implementation
uses
    DairyData, GenTypesConst, KDBRoutines;
{$R *.DFM}

procedure TfmBeefHerdStats.cxButton1Click(Sender: TObject);
var
   DateOfBirth, PurchDate, SalesDate : TDateTime;
   BeefHerdStatsRecord : TBeefHerdStatsRecord;
   n : Integer;
   a : double;
begin
  inherited;
  gbResults.Visible := False;
  FillChar( BeefHerdStatsRecord, SizeOf(TBeefHerdStatsRecord), 0);
  SQLFilter := TSQLFilter.Create;
  Screen.Cursor := crHourGlass;
  try
     SQLFilter.HerdID := WinData.UserDefaultHerdID;
     SQLFilter.GetAnimalsOnHerd('',deFromDate.Date, deToDate.Date) ;

     with TQuery.Create(nil) do
        try
           DatabaseName := AliasName;

           SQL.Add('Select * From '+SQLFilter.TableName );
           Open;

           First;
           ProgressBar.Position := 0;
           ProgressBar.Properties.Max := RecordCount;

           while not eof do
              begin

                 PurchDate := GetFirstEventDate(FieldByName('AnimalID').AsInteger, CPurchaseEvent);
                 SalesDate := GetFirstEventDate(FieldByName('AnimalID').AsInteger, CSaleDeathEvent);
                 DateOfBirth := FieldByName('BirthDate').AsDateTime;

                 Inc( BeefHerdStatsRecord.AnimalsOnFarm );
                 // calculate the remaining values
                 if ((PurchDate > 0) and (SalesDate = 0)) then
                    n := Trunc(Date - PurchDate)
                 else if ((PurchDate > 0) and (SalesDate > 0)) then
                    n := Trunc(SalesDate - PurchDate)
                 else if ((DateOfBirth > 0) and (SalesDate > 0)) then
                    n := Trunc(SalesDate - DateOfBirth)
                 else if (DateOfBirth > 0) then
                    n := Trunc(Date - DateOfBirth);
                 Inc( BeefHerdStatsRecord.DaysOnFarm, n );
                 ProgressBar.Position := ProgressBar.Position+1;
                 Next;
              end;

             BeefHerdStatsRecord.AvgDaysOnFarm := Trunc(BeefHerdStatsRecord.DaysOnFarm / BeefHerdStatsRecord.AnimalsOnFarm);
        finally
           Free;
        end;

        teTotalAnimalDays.Text := IntToStr(BeefHerdStatsRecord.DaysOnFarm);
        teTotalAnimals.Text := IntToStr(BeefHerdStatsRecord.AnimalsOnFarm);
        teAvgDays.Text := FloatToStrF(BeefHerdStatsRecord.AvgDaysOnFarm, ffFixed, 8, 2);
        gbResults.Visible := True;

  finally
     FreeAndNil(SQLFilter);
     Screen.Cursor := crDefault;
  end;

end;

procedure TfmBeefHerdStats.deFromDatePropertiesChange(Sender: TObject);
begin
  inherited;
  gbResults.Visible := False;
end;

end.
