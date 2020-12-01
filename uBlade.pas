unit uBlade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, TB97Tlbr, RXCtrls, TB97, ComCtrls,
  RxDBComb, RxLookup, LMDWebBase, LMDMapi, FileCtrl,
  ActnList;

type
  TfmBlade = class(TForm)
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    sbExit: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ToolbarSep972: TToolbarSep97;
    Label1: TLabel;
    HerdCombo: TRxDBLookupCombo;
    sbCreate: TRxSpeedButton;
    sbUpdate: TRxSpeedButton;
    sbSend: TRxSpeedButton;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    GroupBox1: TGroupBox;
    cbFeedPurch: TCheckBox;
    cbSuppliers: TCheckBox;
    cbCattle: TCheckBox;
    cbSales: TCheckBox;
    cbHealth: TCheckBox;
    cbWeighings: TCheckBox;
    ToolbarSep975: TToolbarSep97;
    LMDMapiSendMail1: TLMDMapiSendMail;
    ActionList1: TActionList;
    Exit: TAction;
    Create: TAction;
    Send: TAction;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure HerdComboCloseUp(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure cbFeedPurchClick(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure CreateExecute(Sender: TObject);
    procedure SendExecute(Sender: TObject);
  private
    { Private declarations }
    Buffer : String;
    BladeRecords : TStringList;
    FarmerID : String;
    BladeQuery : TQuery;
    BladeLookupTable : TTable;
    ProgBar : TProgressBar;
    procedure GetSuppliers;
    procedure UpdateSuppliers;
    procedure GetFeedPurchases;
    procedure UpdateFeedPurchases;
    procedure GetAnimals;
    procedure UpdateAnimals;
    procedure GetCarcassData;
    procedure UpdateCarcassData;
    procedure GetTreatments;
    procedure UpdateTreatments;
    procedure GetWeighings;
    procedure UpdateWeighings;
    procedure CheckFarmID;
  public
    { Public declarations }
  end;

var
  fmBlade: TfmBlade;

const
   cFeedDataRec = 'FED';
   cSupplierDataRec = 'SUP';
   cCattleDataRec = 'CAT';
   cCarcassDataRec = 'CAR';
   cTreatmentDataRec = 'TRT';
   cWeighingDataRec = 'WGT';

implementation
uses
   DairyData, GenTypesConst, uHerdSetup;

{$R *.DFM}

procedure TfmBlade.FormCreate(Sender: TObject);
begin
   // Load Button Images
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbCreate.Glyph,cBtnImgExecute);
   WinData.LoadBtnImage(WinData.Images,sbSend.Glyph,cBtnImgMail);
   WinData.LoadBtnImage(WinData.Images,sbUpdate.Glyph,cBtnImgUpdate);

   // Set the Default Herd ID
   HerdCombo.KeyValue := WinData.UserDefaultHerdID;

   // Initialize Blade Query
   BladeQuery := TQuery.Create(nil);
   BladeQuery.DatabaseName := WinData.KingData.DatabaseName;

   // Initialize Blade Lookup Table
   BladeLookupTable := TTable.Create(nil);
   BladeLookupTable.DatabaseName := BladeQuery.DatabaseName;
   BladeLookupTable.TableName := 'BladeLookup';
   BladeLookupTable.Open;

   // Create Stringlist instance, this will store gathered records
   BladeRecords := TStringList.Create;
   BladeRecords.Clear;

   // Create instance of TProgressBar, set parent property to StatusBar1
   ProgBar := TProgressBar.Create(nil);
   ProgBar.Parent := StatusBar1;
   ProgBar.Max := 6;
   ProgBar.Step := 1;

   if not DirectoryExists(ExtractFilePath(ParamStr(0)) + 'Blade Notified') then
      CreateDir(ExtractFilePath(ParamStr(0)) + 'Blade Notified');
end;

procedure TfmBlade.FormDestroy(Sender: TObject);
begin

   // Free Blade Query
   if BladeQuery <> nil then
      BladeQuery.Free;

   // Free Blade Lookup Table Instance
   if BladeLookupTable <> nil then
      begin
         BladeLookupTable.Close;
         BladeLookupTable.Free;
      end;

   // Free Blade Records
   if BladeRecords <> nil then
      BladeRecords.Free;

   // Free Progress bar instance
   if ProgBar <> nil then
      ProgBar.Free;
end;

procedure TfmBlade.GetSuppliers;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('Select * from SuppliersBreeders Where BladeNotified = False');
         Open;
         First;
         while not eof do
            begin
               Buffer := cSupplierDataRec;
               if Length(Trim(FieldByName('BladeSupplierID').AsString)) > 0 then
                  begin
                     Buffer := Buffer + ',' + Trim(FieldByName('BladeSupplierID').AsString);
                     Buffer := Buffer + ',' + FarmerID;
                     BladeRecords.Append(Buffer);
                  end;
               Next;
            end;
      finally
         Close;
      end;
end;

procedure TfmBlade.GetFeedPurchases;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('Select * from FdStkEvents Where BladeNotified = False');
         Open;
         First;
         while not eof do
            begin
               Buffer := cFeedDataRec;
               if Length(Trim(FieldByName('BladeFeedID').AsString)) > 0 then
                  begin
                     Buffer := Buffer + ',' + Trim(FieldByName('BladeFeedID').AsString);
                     Buffer := Buffer + ',' + FarmerID;
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := Buffer + ',' + FormatDateTime(cIrishDateStyle, FieldByName('EventDate').AsDateTime)
                     else
                        Buffer := Buffer + ',';
                     BladeRecords.Append(Buffer);
                  end;
               Next;
            end;
      finally
         Close;
      end;
end;

procedure TfmBlade.GetAnimals;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('Select * from Animals Where HerdID = '+ HerdCombo.Value + ' ');
         SQL.Add('And BladeNotified = False ');
         Open;
         First;
         while not eof do
            begin
               Buffer := cCattleDataRec;
               // Farmer ID
               Buffer := Buffer + ',' + FarmerID;
               // Contract No ??
               Buffer := Buffer + ',';
               // Cattle ID ??
               Buffer := Buffer + ',';
               // Perfix ??
               Buffer := Buffer + ',' + Trim(FieldByName('').AsString);
               // Tag Number
               Buffer := Buffer + ',' + Trim(FieldByName('NatIDNum').AsString);
               // Date of Birth
               if FieldByName('DateOfBirth').AsDateTime > 0 then
                  Buffer := Buffer + ',' + FormatDateTime(cIrishDateStyle, FieldByName('DateOfBirth').AsDateTime)
               else
                  Buffer := Buffer + ',';
               // Sex
               Buffer := Buffer + ',' + Trim(FieldByName('Sex').AsString);
               // Primary Breed
               if WinData.Breeds.FindKey([FieldByName('PrimaryBreed').AsInteger]) then
                  Buffer := Buffer + ',' + Trim(FieldByName('Code').AsString)
               else
                  Buffer := Buffer + ',';
               // Current Location / Group { Can be Death, exit, pen }
               Buffer := Buffer + ',';
               // Current Weight
               Buffer := Buffer + ',';
               // Date of Current Weight
               Buffer := Buffer + ',';
//               BladeRecords.AddObject(Buffer, Pointer(FieldByName('ID').AsInteger));
               BladeRecords.Append(Buffer);
               Next;
            end;

      finally
         Close;
      end;
end;

procedure TfmBlade.GetCarcassData;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT Distinct (A.NatIDNum),  E.EventDate, S.Weight, S.Grade From Events E');
         SQL.Add('LEFT JOIN Animals A ON (A.ID=E.AnimalID)');
         SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID=E.ID)');
         SQL.Add('WHERE (E.EventType = ' + IntToStr(cSaleDeathEvent) + ')');
         SQL.Add('AND (S.Sold = True) ');
         SQL.Add('AND (E.BladeNotified = False) ');
         Open;
         First;
         while not eof do
            begin
               Buffer := cCarcassDataRec;
               // Farmer ID
               Buffer := Buffer + ',' + FarmerID;
               // Prefix ??
               Buffer := Buffer + ',';
               // Tag Number
               Buffer := Buffer + ',' + FieldByName('NatIDNum').AsString;
               // Sale Date
               if FieldByName('EventDate').AsDateTime > 0 then
                  Buffer := Buffer + ',' + FormatDateTime(cIrishDateStyle, FieldByName('EventDate').AsDateTime)
               else
                  Buffer := Buffer + ',';
               // Net Weight
               Buffer := Buffer + ',' + FloatToStr(FieldByName('Weight').AsFloat);
               // Grade
               Buffer := Buffer + ',' + Trim(FieldByName('Grade').AsString);
               BladeRecords.Append(Buffer);
               Next;
            end;
      finally
         Close;
      end;
end;

procedure TfmBlade.GetTreatments;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT Distinct (A.NatIDNum),  E.EventDate, H.BladeDiagCode, H.Temperature From Events E');
         SQL.Add('LEFT JOIN Animals A ON (A.ID=E.AnimalID)');
         SQL.Add('LEFT JOIN Health H ON (H.EventID=E.ID)');
         SQL.Add('WHERE (E.EventType = ' + IntToStr(cHealthEvent) + ')');
         SQL.Add('AND (E.BladeNotified = False) ');
         Open;
         First;
         while not eof do
            begin
               Buffer := cTreatmentDataRec;
               // Farmer ID
               Buffer := Buffer + ',' + FarmerID;
               // Prefix ??
               Buffer := Buffer + ',';
               // Tag Number
               Buffer := Buffer + ',' + FieldByName('NatIDNum').AsString;
               // Sale Date
               if FieldByName('EventDate').AsDateTime > 0 then
                  Buffer := Buffer + ',' + FormatDateTime(cIrishDateStyle, FieldByName('EventDate').AsDateTime)
               else
                  Buffer := Buffer + ',';
               if FieldByName('BladeDiagCode').AsInteger > 0 then
                  begin
                     if BladeLookupTable.Locate('ID', FieldByName('BladeDiagCode').AsInteger, []) then
                        Buffer := Buffer + ',' + Trim(BladeLookupTable.FieldByName('LookupCode').AsString)
                     else // Empty Diag Code
                        Buffer := Buffer + ',';
                  end
               else // Empty Diag Code
                  Buffer := Buffer + ',';
               // Recorded Temperature
               if FieldByName('Temperature').AsFloat > 0 then
                  Buffer := Buffer + ',' + FloatToStr(FieldByName('Temperature').AsFloat)
               else
                  Buffer := Buffer + ',';
               BladeRecords.Append(Buffer);
               Next;
            end;
      finally
         Close;
      end;
end;

procedure TfmBlade.GetWeighings;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT Distinct (A.NatIDNum), E.EventDate, W.Weight From Events E');
         SQL.Add('LEFT JOIN Animals A ON (A.ID=E.AnimalID)');
         SQL.Add('LEFT JOIN Weights W ON (W.EventID=E.ID)');
         SQL.Add('WHERE (E.EventType = ' + IntToStr(CWeightEvent) + ')');
         SQL.Add('AND (E.BladeNotified = False) ');
         Open;
         First;
         while not eof do
            begin
               Buffer := cTreatmentDataRec;
               // Farmer ID
               Buffer := Buffer + ',' + FarmerID;
               // Prefix ??
               Buffer := Buffer + ',';
               // Tag Number
               Buffer := Buffer + ',' + FieldByName('NatIDNum').AsString;
               // Weighing Date
               if FieldByName('EventDate').AsDateTime > 0 then
                  Buffer := Buffer + ',' + FormatDateTime(cIrishDateStyle, FieldByName('EventDate').AsDateTime)
               else
                  Buffer := Buffer + ',';
               // Animal Weight
               Buffer := Buffer + ',' + FloatToStr(FieldByName('Weight').AsFloat);
               BladeRecords.Append(Buffer);
               Next;
            end;
      finally
         Close;
      end;
end;

procedure TfmBlade.CheckFarmID;
begin
   if HerdCombo.KeyValue > 0 then
      begin
         FarmerID := Trim(WinData.qHerdDefaults.FieldByName('BladeFarmerID').AsString);
         if FarmerID = '' then
            if MessageDlg(Format('No Blade Farmer ID has been found for herd "%s"'+^J+
                          'Enter Blade ID now?', [HerdCombo.Text]), mtConfirmation,[mbYes,mbCancel],0) = idYes then
               begin
                  if WinData.OwnerFile.FindKey([HerdCombo.KeyValue]) then
                     begin
                        try
                           uHerdSetup.ShowTheForm(False, 'BladeFarmerID');
                        except
                           MessageDlg('An error has ocurred, reboot PC and try again',mtError,[mbOK],0);
                        end;
                     end;
               end
            else
               raise Exception.Create('Cannot proceed until all relevant information exists');
      end
   else
      raise Exception.Create('You must select a herd');
end;

procedure TfmBlade.FormActivate(Sender: TObject);
begin
   CheckFarmID;
end;

procedure TfmBlade.HerdComboCloseUp(Sender: TObject);
begin
   if HerdCombo.KeyValue > 0 then
      CheckFarmID;
end;

procedure TfmBlade.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmBlade.UpdateSuppliers;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('Update SuppliersBreeders Set BladeNotified = True');
         ExecSQL;
      except
         MessageDlg('Error updating BLADE event().supplier status',mtError,[mbOK],0);
      end;
end;

procedure TfmBlade.UpdateFeedPurchases;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('Update FdStkEvents Set BladeNotified = True');
         ExecSQL;
      except
         MessageDlg('Error updating BLADE event().feed status',mtError,[mbOK],0);
      end;
end;

procedure TfmBlade.UpdateAnimals;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('Update Animals Set BladeNotified = True Where HerdID = '+ HerdCombo.Value + ' ');
         SQL.Add('And BladeNotified = False ');
         ExecSQL;
      except
         MessageDlg('Error updating BLADE event().animal status',mtError,[mbOK],0);
      end;

end;

procedure TfmBlade.UpdateCarcassData;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('Update Events Set BladeNotified = True Where ID IN ');
         SQL.Add(' ( SELECT Distinct E.ID From Events E         ');
         SQL.Add('   LEFT JOIN Animals A ON (A.ID=E.AnimalID )  ');
         SQL.Add('   LEFT JOIN SalesDeaths S ON (S.EventID=E.ID)');
         SQL.Add('   WHERE (E.EventType = ' + IntToStr(cSaleDeathEvent) + ')');
         SQL.Add('   AND (S.Sold = True) ');
         SQL.Add('   AND (E.BladeNotified = False) ) ');
         ExecSQL;
      except
         MessageDlg('Error updating BLADE event().carcass status',mtError,[mbOK],0);
      end;
end;

procedure TfmBlade.UpdateTreatments;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('Update Events Set BladeNotified = True Where ID IN ');
         SQL.Add(' ( SELECT Distinct E.ID                   ');
         SQL.Add('   LEFT JOIN Animals A ON (A.ID=E.AnimalID)');
         SQL.Add('   LEFT JOIN Health H ON (H.EventID=E.ID)');
         SQL.Add('   WHERE (E.EventType = ' + IntToStr(cHealthEvent) + ')');
         SQL.Add('   AND (E.BladeNotified = False) ) ');
      except
         MessageDlg('Error updating BLADE event().health status',mtError,[mbOK],0);
      end;
end;

procedure TfmBlade.UpdateWeighings;
begin
   with BladeQuery do
      try
         SQL.Clear;
         SQL.Add('Update Events Set BladeNotified = True Where ID IN ');
         SQL.Add(' ( SELECT Distinct E.ID ');
         SQL.Add('   LEFT JOIN Animals A ON (A.ID=E.AnimalID)');
         SQL.Add('   LEFT JOIN Weights W ON (W.EventID=E.ID)');
         SQL.Add('   WHERE (E.EventType = ' + IntToStr(CWeightEvent) + ')');
         SQL.Add('   AND (E.BladeNotified = False) ) ');
      except
         MessageDlg('Error updating BLADE event().weighing status',mtError,[mbOK],0);
      end;
end;

procedure TfmBlade.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
   if Panel = StatusBar1.Panels[1] then
      with ProgBar do
         begin
            Top := Rect.Top+1;
            Left := Rect.Left+1;
            Width := ( Rect.Right - Rect.Left ) - 1;
            Height := ( Rect.Bottom - Rect.Top ) -1 ;
          end;
end;

procedure TfmBlade.cbFeedPurchClick(Sender: TObject);
begin
   if TCheckBox(Sender).Checked then
      ProgBar.Max := ProgBar.Max + 1
   else
      ProgBar.Max := ProgBar.Max - 1;
end;

procedure TfmBlade.ExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmBlade.CreateExecute(Sender: TObject);
begin
   if ProgBar.Position <> 0 then
      ProgBar.Position := 0;

   CheckFarmID;
   StatusBar1.Panels[0].Text := 'Creating file, please wait...';
   Application.ProcessMessages;

   if cbFeedPurch.Checked then
      begin
         GetFeedPurchases;
         UpdateFeedPurchases;
         ProgBar.StepIt;
      end;

   if cbSuppliers.Checked then
      begin
         GetSuppliers;
         UpdateSuppliers;
         ProgBar.StepIt;
      end;

   if cbCattle.Checked then
      begin
         GetAnimals;
         UpdateAnimals;
         ProgBar.StepIt;
      end;

   if cbSales.Checked then
      begin
         GetCarcassData;
         UpdateCarcassData;
         ProgBar.StepIt;
      end;

   if cbHealth.Checked then
      begin
         GetTreatments;
         UpdateTreatments;
         ProgBar.StepIt;
      end;

   if cbWeighings. Checked then
      begin
         GetWeighings;
         UpdateWeighings;
         ProgBar.StepIt;
      end;

   StatusBar1.Panels[0].Text := 'Blade Notification file successfully created';
   MessageDlg('Blade Notification file successfully created',mtInformation,[mbOK],0);
   StatusBar1.Panels[0].Text := '';

   ProgBar.Position := 0;

end;

procedure TfmBlade.SendExecute(Sender: TObject);
begin
  // Send Blade file to
end;

end.
