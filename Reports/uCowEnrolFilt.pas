unit uCowEnrolFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, DBTables, DBCtrls, RXSpin,
  Grids, DBGrids, RXDBCtrl, RXCtrls, ToolWin;

type
  TReportType = ( MR2, CowsInMilk );
  TfCowEnrolFilt = class(TForm)
    pMR2Form: TPanel;
    Label1: TLabel;
    dsAnimals: TDataSource;
    qMr: TQuery;
    CowNumber: TDBLookupComboBox;
    Label3: TLabel;
    Bevel1: TBevel;
    AnimalsSelected: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton4: TToolButton;
    Panel1: TPanel;
    Label2: TLabel;
    NoSelected: TEdit;
    StatusBar1: TStatusBar;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AnimalsSelectedGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowForm;

implementation
uses GenTypesConst, DairyData, CowEnrolment;

{$R *.DFM}

procedure ShowForm;
begin
  with TfCowEnrolFilt.Create(nil) do
     try
        ShowModal;
     finally
        Free;
     end;
end;

procedure TfCowEnrolFilt.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TfCowEnrolFilt.ViewBtnClick(Sender: TObject);
var
   CowsForEnrol : TTable;
begin
   try
      // Create the Form
      CowEnrolmentScr := TCowEnrolmentScr.Create(nil);
      CowsForEnrol := TTable.Create(nil);
      with CowsForEnrol do
         begin
            DatabaseName := WinData.KingData.DatabaseName;
            TableName := 'CowsForEnrol.db';
            TableType := ttParadox;
            FieldDefs.Add('HerdOwner',ftString,30,False);
            FieldDefs.Add('Supplier',ftString,30,False);
            FieldDefs.Add('BTEHerd',ftString,20,False);
            FieldDefs.Add('HerdID',ftInteger,0,False);
            FieldDefs.Add('CowID',ftInteger,0,False);
            FieldDefs.Add('CowNo',ftString,15,False);
            FieldDefs.Add('CowLactNo',ftInteger,0,False);
            FieldDefs.Add('CowNatID',ftString,20,False); // sp 28/7/00
            FieldDefs.Add('CowBreed',ftString,15,False);
            FieldDefs.Add('DOB',ftDate,0,False);
            FieldDefs.Add('CowName',ftString,40,False);
            FieldDefs.Add('CowHBN',ftString,15,False);
            FieldDefs.Add('CowCalvingDate',ftString,12,False);

            FieldDefs.Add('SireID',ftInteger,0,False);
            FieldDefs.Add('Sire',ftString,15,False);
            FieldDefs.Add('SireHBN',ftString,20,False);
            FieldDefs.Add('SireName',ftString,40,False);
            FieldDefs.Add('SireBreed',ftString,15,False);

            FieldDefs.Add('DamID',ftInteger,0,False);
            FieldDefs.Add('Dam',ftString,15,False);
            FieldDefs.Add('DamHBN',ftString,20,False);
            FieldDefs.Add('DamNatID',ftString,20,False);   //joanne tighe 6/2/2003
//            FieldDefs.Add('DamNatID',ftString,15,False);   
            FieldDefs.Add('DamName',ftString,40,False);
            FieldDefs.Add('DamBreed',ftString,15,False);

            CreateTable;
            Open;
         end;

      // Shift selected animals into table
      qMr.First;
      qMr.DisableControls;
      if AnimalsSelected.SelCount > 0 then
         while NOT qMr.EOF do
            begin
               if AnimalsSelected.SelectedRows.CurrentRowSelected then
                  begin
                     CowsForEnrol.Insert;
                     CowsForEnrol.FieldByName('CowID').Value := qMr.FieldByName('ID').Value;
                     CowsForEnrol.FieldByName('CowNo').Value := qMr.FieldByName('AnimalNo').Value;
                     CowsForEnrol.FieldByName('CowName').Value := qMr.FieldByName('Name').Value;
                     CowsForEnrol.FieldByName('CowNatId').Value := qMr.FieldByName('NatIdNum').Value;
                     CowsForEnrol.FieldByName('CowLactNo').Value := qMr.FieldByName('LactNo').Value;
                     CowsForEnrol.FieldByName('CowHBN').Value := qMr.FieldByName('HerdBookNo').Value;

                     CowsForEnrol.FieldByName('DOB').Value := qMr.FieldByName('DateOfBirth').Value;
                     CowsForEnrol.FieldByName('SireID').Value := qMr.FieldByName('SireID').Value;
                     CowsForEnrol.FieldByName('DamID').Value := qMr.FieldByName('DamID').Value;
                     CowsForEnrol.FieldByName('HerdID').Value := qMr.FieldByName('HerdID').Value;
                     if WinData.Breeds.Locate('ID',qMr.FieldByName('PrimaryBreed').Value,[] ) then
                        CowsForEnrol.FieldByName('CowBreed').Value := WinData.Breeds.FieldByName('Code').Value;

                     // Get the Last Calving Date for this Animal
                     if WinData.CheckEvents.Locate('AnimalId;AnimalLactNo;EventType',VarArrayOf([qMr.FieldByName('ID').Value,qMr.FieldByName('LactNo').Value,CCalvingEvent]),[]) then
                        CowsForEnrol.FieldByName('CowCalvingDate').AsString := FormatDateTime('dd/mm/yyyy',WinData.CheckEvents.FieldByName('EventDate').AsDateTime);

                     // Get the Herd Info
                     if WinData.OwnerFile.Locate('ID',qMr.FieldByName('HerdId').Value, [] ) then
                        begin
                           CowsForEnrol.FieldByName('HerdOwner').Value := WinData.OwnerFile.FieldByName('Name').Value;
                           CowsForEnrol.FieldByName('BTEHerd').Value := WinData.OwnerFile.FieldByName('HerdIdentity').Value;
                           CowsForEnrol.FieldByName('Supplier').Value := WinData.OwnerFile.FieldByName('MilkrecordingID').Value;
                        end;
                     // Get the Dams Info
                     if WinData.LookUpDamSire.Locate('ID',qMr.FieldByName('DamId').Value, [] ) then
                        begin
                           CowsForEnrol.FieldByName('DamName').Value := WinData.LookUpDamSire.FieldByName('Name').Value;
                           CowsForEnrol.FieldByName('DamHBN').Value := WinData.LookUpDamSire.FieldByName('HerdBookNo').Value;
                           CowsForEnrol.FieldByName('DamNatID').Value := WinData.LookUpDamSire.FieldByName('NAtIdNum').Value;
                           // if the Herd ID is NONE do not output the AnimalNo
                           if WinData.NONEHerdID <> WinData.LookUpDamSire.FieldByName('HerdId').AsInteger then
                              CowsForEnrol.FieldByName('Dam').Value := WinData.LookUpDamSire.FieldByName('AnimalNo').Value;
                           if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').Value,[] ) then
                              CowsForEnrol.FieldByName('DamBreed').Value := WinData.Breeds.FieldByName('Code').Value;
                        end;
                     // Get the Sire Info
                     if WinData.LookUpDamSire.Locate('ID',qMr.FieldByName('SireId').Value, [] ) then
                        begin
                           CowsForEnrol.FieldByName('SireName').Value := WinData.LookUpDamSire.FieldByName('Name').Value;
                           CowsForEnrol.FieldByName('SireHBN').Value := WinData.LookUpDamSire.FieldByName('HerdBookNo').Value;
                           CowsForEnrol.FieldByName('Sire').Value := WinData.LookUpDamSire.FieldByName('AnimalNo').Value;
                           if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').Value,[] ) then
                              CowsForEnrol.FieldByName('SireBreed').Value := WinData.Breeds.FieldByName('Code').Value;
                        end;

                     CowsForEnrol.Post;
                  end;
               qMr.Next;
            end;

      qMr.EnableControls;
      with CowEnrolmentScr.qCowEnrolment do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM "CowsForEnrol"');
            SQL.Add('ORDER BY HerdID, CowNo ASC');
            Open;
         end;
      if ( Sender as TRxSpeedButton ).Name = 'sbView' then
         CowEnrolmentScr.Preview
      else
          Windata.CallPrintDialog(CowEnrolmentScr);
   finally
      CowsForEnrol.Close;
      CowsForEnrol.DeleteTable;
      CowsForEnrol.Free;
      CowEnrolmentScr.Free;
   end;
end;

procedure TfCowEnrolFilt.FormShow(Sender: TObject);
begin
   qMr.SQL.Clear;
   qMr.Close;
   qMr.SQL.Add('SELECT ID, AnimalNo, SortAnimalNo, LactNo, Name, NatIDNum, SortNatID, HerdBookNo,');
   qMr.SQL.Add('DateOfBirth, PrimaryBreed, SireID, DamID, HerdID');
   qMr.SQL.Add('FROM "Animals.db" WHERE Sex = "Female" AND InHerd=True AND AnimalDeleted=FALSE');
   qMr.SQL.Add('ORDER BY SortAnimalNo Asc');
   qMr.Open;
End;

procedure TfCowEnrolFilt.AnimalsSelectedGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
     NoSelected.Text := IntToStr(AnimalsSelected.SelCount);
end;

end.
