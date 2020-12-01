{
 ==============================================================================

 09/09/02 SP -

 Revision - Check MoorePark Document
            Emailed by Anne Geoghegan 19 August 2002
            Teagasc Kingswood Interface Feedback V1.1.doc.

}

unit MooreParkExport;

interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, ExtCtrls, Db, DBTables, StdCtrls,
   ComCtrls, FileCtrl, kRoutines;

   procedure CreateTempTables;

   procedure LoadAnimals;
   procedure LoadSalePurchEvents;
   procedure UpdateAnimalTable;

   procedure AddFileHeader;
   procedure AddFileAnimals;
   procedure AddFileEvents; { Writes E "StringList" to F "StringList", F is final StringList saved to file }
   procedure GetEvents; { Write events to temp Stringlist }

   procedure DelTemps;

   function SaveFile : Integer;
   function AddToBuff(Buffer, s : String; IncludeComma : Boolean) : String; { Adds Current Field to Buffer }
   function ReturnFileName : String; { Gives the FileName, with HerdIdentifier, File Date etc. }

   procedure AddTempID(EventID : Integer); { This Adds All Event ID's to StringList, for Registering }
   function MarkAsRegistered : Integer;

   procedure CreateExportFile(const HerdID : Integer);

const
   { File Header }
     sFMD = 'FMD'; {File Structure version}
     sHRD = 'HRD'; {Herd Number of Farm Owner}
     sDAT = 'DAT'; {Date and Time file was created}

   { HRD Section of file }
     sAID  = 'AID';
     sBUY  = 'BUY';
     sSEL  = 'SEL';
     sDIE  = 'DIE';
     sSIR  = 'SIR';
     sDAM  = 'DAM';
     sMMR  = 'MMR';
     sDRG  = 'ALL,DRG';
     sINT  = 'ALL,INT';
     sEABR = 'EABR';
     sECLV = 'ECLV';
     sECST = 'ECST';
     sECON = 'ECON';
     sEDNP = 'EDNP';
     sEDIE = 'EDIE';
     sEDRY = 'EDRY';
     sEIMP = 'EIMP';
     sEHTN = 'EHTN';
     sELWT = 'ELWT';
     sEMST = 'EMST';
     sEPRT = 'EPRT';
     sERBI = 'ERBI';
     sERBO = 'ERBO';
     sESEL = 'ESEL';
     sESAI = 'ESAI';
     sESFB = 'ESFB';
     sETBC = 'ETBC';
     sEWNC = 'EWNC';

     fDir = 'C:\Kingswood Herd Management\MoorePark Export';

     SQLMPNotified = 'AND (E.MPNotified = False)';
     SQLMPDelete   = 'AND (M.Notified = False)';

var
   tmpAnimals,
   tmpSaleDeath,
   tmpPurchase,
   tmpDam,
   tmpSire,
   LookupEvents,
   TmpIDs,                 { Contains all EventIDs to be registered }
   LookupMediPur : TTable; { Used for Drug Administration Event }

   HerdIdentity : Integer;


   SubQuery,
   GenQuery : TQuery;

   dsAnimals : TDataSource;
   FileName : String;

   { Booleans }
   BUY,
   SEL,
   DIE,
   DAM,
   SIR : Boolean;

   Buffer : String;

   { StringLists }
   F,
   E : TStringList;

   FileCreated : Boolean;

implementation
uses
   DairyData, GenTypesConst, uProgressIndicator;

{ TMooreParkExport }

procedure AddFileAnimals;
var
   Buffer : String;
begin
   with tmpAnimals do
      begin
         First;
         while not (eof) do
            begin
               Buffer := '';
               BUY := (FieldByName('PurchDate').AsDateTime > 0);
               SEL := ((FieldByName('SaleDate').AsDateTime > 0) AND (FieldByName('SaleDeath').AsString = 'Sold'));
               DIE := ((FieldByName('SaleDate').AsDateTime > 0) AND (FieldByName('SaleDeath').AsString = 'Died'));
               DAM := Length(FieldByName('DamNatID').AsString) > 0;
               SIR := Length(FieldByName('SireCode').AsString) > 0;

               { AID Animal }
               Buffer := AddToBuff(Buffer, sHRD, True );
               Buffer := AddToBuff(Buffer, sAID, True);
               Buffer := AddToBuff(Buffer, IntToStr(FieldByName('AnimalID').AsInteger), True);
               Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
               Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
               Buffer := AddToBuff(Buffer, FieldByName('PurchBorn').AsString, True);
               if FieldByName('PurchDate').AsDateTime > 0 then
                  Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('PurchDate').AsDateTime), True)
               else
                  Buffer := AddToBuff(Buffer, '', True);
               Buffer := AddToBuff(Buffer, FieldByName('LactStatus').AsString, True);
               Buffer := AddToBuff(Buffer, IntToStr(FieldByName('LactNo').AsInteger), True);
               Buffer := AddToBuff(Buffer, FieldByName('Sex').AsString, True);
               Buffer := AddToBuff(Buffer, FieldByName('SireCode').AsString, True);
               Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('DamNatID').AsString)), True);
               Buffer := AddToBuff(Buffer, FieldByName('BreedCode').AsString, True); //jt added this field
               Buffer := AddToBuff(Buffer, FieldByName('SecondBreed').AsString, True);
               if FieldByName('DateOfBirth').AsDateTime > 0 then
                  Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('DateOfBirth').AsDateTime), True)
               else
                  Buffer := AddToBuff(Buffer, '', True);
               if FieldByName('LtCalveDate').AsDateTime > 0 then
                  Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('LtCalveDate').AsDateTime), True)
               else
                  Buffer := AddToBuff(Buffer, '', True);
               Buffer := AddToBuff(Buffer, FieldByName('BTEPurchNum').AsString, True);
               Buffer := AddToBuff(Buffer, FieldByName('sBreeding').AsString, True);
               Buffer := AddToBuff(Buffer, FieldByName('SaleDeath').AsString, True);
               if FieldByName('SaleDate').AsDateTime > 0 then
                  Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('SaleDate').AsDateTime), True)
               else
                  Buffer := AddToBuff(Buffer, '', True);
               Buffer := AddToBuff(Buffer, FieldByName('HerdBookNo').AsString, True);
               Buffer := AddToBuff(Buffer, FieldByName('Name').AsString, True);
               Buffer := AddToBuff(Buffer, FieldByName('Tattoo').AsString, True);
               Buffer := AddToBuff(Buffer, FieldByName('GradeUpCode').AsString, True);
               Buffer := AddToBuff(Buffer, FieldByName('MilkCowNo').AsString, True);
               Buffer := AddToBuff(Buffer, FieldByName('TranspondNo').AsString, True);

               if FieldByName('DryOffDate').AsDateTime > 0 then
                  Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('DryOffDate').AsDateTime), False)
               else
                  Buffer := AddToBuff(Buffer, '', False);

               F.Append(Buffer);

               if BUY then
                  with tmpPurchase do
                     begin
                        Buffer := '';
                        Buffer := AddToBuff(Buffer, sHRD, True );
                        Buffer := AddToBuff(Buffer, sBUY, True );
                        Buffer := AddToBuff(Buffer, IntToStr(tmpAnimals.FieldByName('AnimalID').AsInteger), True);
                        Buffer := AddToBuff(Buffer, tmpAnimals.FieldByName('AnimalNo').AsString, True);
                        Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(tmpAnimals.FieldByName('NatIDNum').AsString)), True);
                        if FieldByName('EventDate').AsDateTime > 0 then
                           Buffer := AddToBuff(Buffer,  FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                        else
                           Buffer := AddToBuff(Buffer, '', True);
                        Buffer := AddToBuff(Buffer, FloatToStr(FieldByName('Price').AsFloat), True);
                        Buffer := AddToBuff(Buffer, IntToStr(FieldByName('SuppID').AsInteger), True);
                        Buffer := AddToBuff(Buffer, FieldByName('SuppName').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address1').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address2').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address3').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address4').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('SuppHerdNo').AsString, False);

                        F.Append(Buffer);
                     end;

               if SEL then
                  with tmpSaleDeath do
                     begin
                        Buffer := '';
                        Buffer := AddToBuff(Buffer, sHRD, True );
                        Buffer := AddToBuff(Buffer, sSEL, True);
                        Buffer := AddToBuff(Buffer, IntToStr(FieldByName('AnimalID').AsInteger), True);
                        Buffer := AddToBuff(Buffer, tmpAnimals.FieldByName('AnimalNo').AsString, True);
                        Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(tmpAnimals.FieldByName('NatIDNum').AsString)), True);
                        if FieldByName('EventDate').AsDateTime > 0 then
                           Buffer := AddToBuff(Buffer,  FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                        else
                           Buffer := AddToBuff(Buffer, '', True);
                        Buffer := AddToBuff(Buffer, FloatToStr(FieldByName('Price').AsFloat), True);
                        Buffer := AddToBuff(Buffer, FloatToStr(FieldByName('Weight').AsFloat), True);
                        Buffer := AddToBuff(Buffer, FieldByName('CarcaseGrd').AsString, True);
                        Buffer := AddToBuff(Buffer, IntToStr(FieldByName('CustID').AsInteger), True);
                        Buffer := AddToBuff(Buffer, FieldByName('CustName').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address1').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address2').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address3').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address4').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('CustHerdNo').AsString, False);

                        F.Append(Buffer);
                     end;

               if DIE then
                  with tmpSaleDeath do
                     begin
                        Buffer := '';
                        Buffer := AddToBuff(Buffer, sHRD, True );
                        Buffer := AddToBuff(Buffer, sDIE, True );
                        Buffer := AddToBuff(Buffer, IntToStr(tmpAnimals.FieldByName('AnimalID').AsInteger), True);
                        Buffer := AddToBuff(Buffer, tmpAnimals.FieldByName('AnimalNo').AsString, True);
                        Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(tmpAnimals.FieldByName('NatIDNum').AsString)), True);
                        if FieldByName('EventDate').AsDateTime > 0 then
                           Buffer := AddToBuff(Buffer,  FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                        else
                           Buffer := AddToBuff(Buffer, '', True);
                        Buffer := AddToBuff(Buffer, IntToStr(FieldByName('CustID').AsInteger), True);
                        Buffer := AddToBuff(Buffer, FieldByName('CustName').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address1').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address2').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address3').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('Address4').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('CustHerdNo').AsString, False);

                        F.Append(Buffer);
                     end;

                  if SIR then
                     with tmpSire do
                        begin
                           Buffer := '';
                           Buffer := AddToBuff(Buffer, sHRD, True);
                           Buffer := AddToBuff(Buffer, sSIR, True );
                           Buffer := AddToBuff(Buffer, IntToStr(FieldByName('AnimalID').AsInteger), True);
                           Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                           Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                           Buffer := AddToBuff(Buffer, IntToStr(FieldByName('SireID').AsInteger), True);
                           Buffer := AddToBuff(Buffer, FieldByName('SireAnimalNo').AsString, True);
                           Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('SireNatID').AsString)), True);
                           Buffer := AddToBuff(Buffer, FieldByName('HerdBookNo').AsString, True);
                           Buffer := AddToBuff(Buffer, FieldByName('Tattoo').AsString, True);
                           Buffer := AddToBuff(Buffer, FieldByName('Name').AsString, False);

                           F.Append(Buffer);
                        end;

                  if DAM then
                     with tmpDam do
                        begin
                           Buffer := '';
                           Buffer := AddToBuff(Buffer, sHRD, True);
                           Buffer := AddToBuff(Buffer, sDAM, True);
                           Buffer := AddToBuff(Buffer, IntToStr(tmpAnimals.FieldByName('AnimalID').AsInteger), True);
                           Buffer := AddToBuff(Buffer, tmpAnimals.FieldByName('AnimalNo').AsString, True);
                           Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(tmpAnimals.FieldByName('NatIDNum').AsString)), True);
                           Buffer := AddToBuff(Buffer, IntToStr(FieldByName('DamID').AsInteger), True);
                           Buffer := AddToBuff(Buffer, FieldByName('DamAnimalNo').AsString, True);
                           Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('DamNatID').AsString)), True);
                           Buffer := AddToBuff(Buffer, tmpDam.FieldByName('HerdBookNo').AsString, True);
                           Buffer := AddToBuff(Buffer, tmpDam.FieldByName('Tattoo').AsString, True);
                           Buffer := AddToBuff(Buffer, tmpDam.FieldByName('Name').AsString, True);
                           Buffer := AddToBuff(Buffer, tmpDam.FieldByName('GradeupCode').AsString, True);
                           Buffer := AddToBuff(Buffer, tmpDam.FieldByName('MilkCowNo').AsString, False);

                           F.Append(Buffer);
                        end;
               Next;
            end;
      end;

      uProgressIndicator.ProgressIndicator.Position := 60;
      GetEvents;
end;

procedure AddFileEvents;
var
   i : Integer;
begin
   for i := 0 to E.Count-1 do
      F.Append(E.Strings[i]);
end;

procedure AddFileHeader;
   function HerdOwnerDetails : String;
      function RemoveComma(str : String) : String;
      begin { Remove any instance of comma "," }
         Result := '';
         while Pos(',', str) > 0 do
            System.Delete(str, Pos(',', str), 1);
         Result := str;
      end;
   var
      Tempstr,
      s : String;
   begin
      with TTable.Create(nil) do
         try
            DatabaseName    := WinData.KingData.DatabaseName;
            TableName       := 'Owners.db';
            Open;

            try
               if Locate('ID', HerdIdentity, []) then
                  begin
                     // JT got rid of the repeating HerdID
                     // s := AddToBuff(s, FieldByName('HerdIdentity').AsString);
                     s := AddToBuff(s, RemoveComma(FieldByName('HerdIdentity').AsString), True);
                     s := AddToBuff(s, RemoveComma(FieldByName('Name').AsString), True);
                     s := AddToBuff(s, RemoveComma(FieldByName('Address1').AsString), True);
                     s := AddToBuff(s, RemoveComma(FieldByName('Address2').AsString), True);
                     s := AddToBuff(s, RemoveComma(FieldByName('Address3').AsString), True);
                     s := AddToBuff(s, RemoveComma(FieldByName('Address4').AsString), True);
                     s := AddToBuff(s, RemoveComma(FieldByName('Fax').AsString), True);
                     s := AddToBuff(s, RemoveComma(FieldByName('Phone').AsString), False);
                     result := Trim(s);
                  end;
            finally
               Close;
            end;
        finally
           Free;
        end;
   end;
var
   buffer : String;
begin
   // Create working stringlist.
   F := TStringList.Create;

   { FMD File Structure }
   Buffer := '';
   Buffer := AddToBuff(Buffer, sFMD, True);
   Buffer := AddToBuff(Buffer,MooreParkVerNo, True);
   F.Append(Buffer+',,,,,,');

   { HRD Herd Descripter }
   Buffer := '';
   Buffer := AddToBuff(Buffer, sHRD, True);
   Buffer := AddToBuff(Buffer, HerdOwnerDetails, False);
   F.Append(Buffer);

   { DAT Date and Time of file creation }
   Buffer := '';
   Buffer := AddToBuff(Buffer, sDAT, True);
   Buffer := AddToBuff(Buffer, FormatDateTime('dd/mm/yy',Date), True);
   Buffer := AddToBuff(Buffer, FormatDateTime('hh:mm:ss',Now()), False);
   F.Append(Buffer);

   uProgressIndicator.ProgressIndicator.Position := 45;
   AddFileAnimals;

   uProgressIndicator.ProgressIndicator.Position := 100;

   if MarkAsRegistered <> 0 then
      MessageDlg('Unable to mark events as registered, contact Kingswood',mtError,[mbOK],0)
   else
      begin
         uProgressIndicator.ProgressIndicator.Close;
         Case SaveFile of
            -1 : begin
                    MessageDlg('Unable to create Moore Park Export File.'+#13+
                               'If this problem persists, contact Kingswood',mtError,[mbOK],0);
                 end;
            0  : begin
                    MessageDlg(Format('Moore Park Export File successfully created.'+#13+
                                      'File Location: %s',[FileName]),mtInformation,[mbOK],0);
                 end;
         end;
         FileCreated := True;
      end;
end;

procedure AddTempID(EventID: Integer);
begin
   if TmpIDs.RecordCount > 0 then
      TmpIDs.Append
   else
      TmpIDs.Insert;
   TmpIDs.FieldByName('EventID').AsInteger := EventID;
   TmpIDs.Post;
end;

function AddToBuff(Buffer, s: String; IncludeComma : Boolean): String;
begin
   if IncludeComma then
      Result := Buffer+Trim(S)+','
   else
      Result := Buffer+Trim(S);
end;

procedure CreateExportFile(const HerdID : Integer);
begin
   Screen.Cursor := crHourGlass;
   try
      if not DirectoryExists(fDir) then
         CreateDir(fDir);
      HerdIdentity := HerdID;
      FileCreated := False;
      CreateTempTables;
      uProgressIndicator.ShowProgressIndicator('Creating Moorepark export file, please wait...',0,100,1);
      LoadAnimals;
      LoadSalePurchEvents;
      UpdateAnimalTable;
   finally
      DelTemps;
      Screen.Cursor := crDefault;
   end;
end;

procedure CreateTempTables;
begin
   GenQuery := TQuery.Create(nil);
   GenQuery.DatabaseName := WinData.KingData.DatabaseName;

   SubQuery := TQuery.Create(nil);
   SubQuery.DatabaseName := WinData.KingData.DatabaseName;
   SubQuery.SQL.Clear;
   SubQuery.SQL.Add('Select Max(E.EventDate) EDate, E.ID EventID, E.MPAction ');
   SubQuery.SQL.Add('FROM Events E');
   SubQuery.SQL.Add('Where E.AnimalID =:EID');
   //SubQuery.SQL.Add('And E.AnimalLactNo =:LactNo');
   SubQuery.SQL.Add('And E.EventType = '+IntToStr(CDryOffEvent)+'');
   SubQuery.SQL.Add(SQLMPNotified);
   SubQuery.SQL.Add('GROUP BY E.ID, E.MPAction ');

   with TmpIDs do
      begin
         TmpIDs := TTable.Create(nil);
         DataBaseName := WinData.KingData.DatabaseName;
         TableName    := 'TmpIDs';

         FieldDefs.Add('EventID', ftInteger, 0, False);

         CreateTable;
         Open;
      end;

   with tmpAnimals do
      begin
         tmpAnimals   := TTable.Create(nil);
         tmpAnimals.DatabaseName := WinData.KingData.DatabaseName;
         tmpAnimals.TableType    := ttParadox;
         tmpAnimals.TableName    := 'tmpAnimals';

         with tmpAnimals.FieldDefs do
            begin
               Clear;
               Add('AnimalID'   , ftInteger, 0, False);
               Add('AnimalNo'   , ftString, 10, False);
               Add('NatIDNum'   , ftString, 20, False);
               Add('PurchBorn'  , ftString,  6, False);
               Add('PurchDate'  , ftDate,    0, False);
               Add('LactStatus' , ftString,  7, False);
               Add('LactNo'     , ftInteger, 0, False);
               Add('Sex'        , ftString, 10, False);
               Add('SireID'     , ftInteger, 0, False);
               Add('SireCode'   , ftString, 10, False);
               Add('DamID'      , ftInteger, 0, False);
               Add('DamNatID'   , ftString, 20, False);
               Add('BreedCode'  , ftString, 30, False);//jt changed this from breed to breedcode
               Add('SecondBreed', ftString, 30, False);
               Add('DateOfBirth', ftDate,    0, False);
               Add('LtCalveDate', ftDate,    0, False);
               Add('BTEPurchNum', ftString, 30, False);
               Add('Breeding'   , ftBoolean, 0, False);
               Add('sBreeding'  , ftString,  1, False);
               Add('SaleDeath'  , ftString,  4, False);
               Add('SaleDate'   , ftDate,    0, False);
               Add('HerdBookNo' , ftString, 20, False);
               Add('Name'       , ftString, 40, False);
               Add('Tattoo'     , ftString, 15, False);
               Add('GradeUpCode', ftString,  5, False);
               Add('MilkCowNo'  , ftString, 15, False);
               Add('TranspondNo', ftString, 15, False);
               Add('DryOffDate', ftDate,    0, False);
            end;

         with tmpAnimals.IndexDefs do
            begin
               Clear;
               Add('', 'AnimalID', [ixUnique, ixPrimary]);
            end;
         tmpAnimals.CreateTable;
         tmpAnimals.Open;

         dsAnimals := TDataSource.Create(nil);
         dsAnimals.DataSet := tmpAnimals;
      end;

   with tmpDam do
      begin
         tmpDam := TTable.Create(nil);
         tmpDam.DatabaseName := WinData.KingData.DatabaseName;
         tmpDam.TableName    := 'tmpDam';

         with tmpDam.FieldDefs do
            begin
               Clear;
               Add('AnimalID'     , ftInteger, 0, False);
               Add('AnimalNo'     , ftString, 10, False);
               Add('NatIDNum'     , ftString, 20, False);
               Add('DamID'        , ftInteger, 0, False);
               Add('DamAnimalNo'  , ftString, 10, False);
               Add('DamNatID'     , ftString, 20, False);
               Add('HerdBookNo'   , ftString, 20, False);
               Add('Tattoo'       , ftString, 15, False);
               Add('Name'         , ftString, 40, False);
               Add('GradeupCode'  , ftString, 10, False);
               Add('MilkCowNo'    , ftString, 15, False);
            end;

         with tmpDam.IndexDefs do
            begin
               Clear;
               Add('iAID'    , 'AnimalID'        , [ixPrimary, ixUnique]);
               Add('iDamID'  , 'AnimalID;DamID'  , [ixCaseInsensitive]);
            end;

         tmpDam.IndexFieldNames := 'AnimalID;DamID';
         tmpDam.MasterFields    := 'AnimalID';
         tmpDam.MasterSource    := dsAnimals;

         tmpDam.CreateTable;
         tmpDam.Open;
      end;

   with tmpSire do
      begin
         tmpSire := TTable.Create(nil);
         tmpSire.DatabaseName := WinData.KingData.DatabaseName;
         tmpSire.TableName    := 'tmpSire';

         with tmpSire.FieldDefs do
            begin
               Clear;
               Add('AnimalID'     , ftInteger, 0, False);
               Add('AnimalNo'     , ftString, 10, False);
               Add('NatIDNum'     , ftString, 20, False);
               Add('SireID'       , ftInteger, 0, False);
               Add('SireAnimalNo' , ftString, 10, False);
               Add('SireNatID'    , ftString, 20, False);
               Add('HerdBookNo'   , ftString, 20, False);
               Add('Tattoo'       , ftString, 15, False);
               Add('Name'         , ftString, 40, False);
            end;

         with tmpSire.IndexDefs do
            begin
               Clear;
               Add('iAID'    , 'AnimalID'        , [ixPrimary, ixUnique]);
               Add('iSireID' , 'AnimalID;SireID' , [ixCaseInsensitive]);
            end;

         tmpSire.IndexFieldNames := 'AnimalID;SireID';
         tmpSire.MasterFields    := 'AnimalID';
         tmpSire.MasterSource    := dsAnimals;

         tmpSire.CreateTable;
         tmpSire.Open;
      end;

   with tmpSaleDeath do
      begin

         tmpSaleDeath := TTable.Create(nil);
         tmpSaleDeath.DatabaseName := WinData.KingData.DatabaseName;
         tmpSaleDeath.TableName    := 'tmpSaleDeath';

         with tmpSaleDeath.FieldDefs do
            begin
               Clear;
               Add('AnimalID'   , ftInteger, 0, False);
               Add('EventDate'  , ftDate,    0, False);
               Add('Price'      , ftFloat,   0, False);
               Add('Weight'     , ftFloat,   0, False);
               Add('CarcaseGrd' , ftString, 15, False);
               Add('CustID'     , ftInteger, 0, False);
               Add('CustName'   , ftString, 60, False);
               Add('Address1'   , ftString, 30, False);
               Add('Address2'   , ftString, 30, False);
               Add('Address3'   , ftString, 30, False);
               Add('Address4'   , ftString, 30, False);
               Add('CustHerdNo' , ftString, 30, False);
               Add('Sold'       , ftBoolean, 0, False);
            end;

         with tmpSaleDeath.IndexDefs do
            begin
               Clear;
               Add('iAID'  , 'AnimalID'           , [ixPrimary, ixUnique]);
            end;

         tmpSaleDeath.IndexFieldNames := 'AnimalID';
         tmpSaleDeath.MasterFields    := 'AnimalID';
         tmpSaleDeath.MasterSource    := dsAnimals;

         tmpSaleDeath.CreateTable;
         tmpSaleDeath.Open;
      end;


   with tmpPurchase do
      begin
         tmpPurchase := TTable.Create(nil);
         tmpPurchase.DatabaseName := WinData.KingData.DatabaseName;
         tmpPurchase.TableName    := 'tmpPurchase';

         with tmpPurchase.FieldDefs do
            begin
               Clear;
               Add('AnimalID'   , ftInteger, 0, False);
               Add('EventDate'  , ftDate,    0, False);
               Add('Price'      , ftFloat,   0, False);
               Add('SuppID'     , ftInteger, 0, False);
               Add('SuppName'   , ftString, 60, False);
               Add('Address1'   , ftString, 30, False);
               Add('Address2'   , ftString, 30, False);
               Add('Address3'   , ftString, 30, False);
               Add('Address4'   , ftString, 30, False);
               Add('SuppHerdNo' , ftString, 30, False);
            end;

         with tmpPurchase.IndexDefs do
            begin
               Clear;
               Add('iAID'  , 'AnimalID'           , [ixPrimary, ixUnique]);
            end;

         tmpPurchase.IndexFieldNames := 'AnimalID';
         tmpPurchase.MasterFields    := 'AnimalID';
         tmpPurchase.MasterSource    := dsAnimals;

         tmpPurchase.CreateTable;
         tmpPurchase.Open;
      end;

end;

procedure DelTemps;
begin
   with TmpIDs do
      begin
         Close;
         DeleteTable;
         Free;
      end;
   with GenQuery do
      begin
         Close;
         Free;
      end;
   with SubQuery do
      begin
         Close;
         Free;
      end;
   dsAnimals.Free;
   with tmpAnimals do
      begin
         Close;
         DeleteTable;
         Free;
      end;
   with tmpDam do
      begin
         Close;
         DeleteTable;
         Free;
      end;
   with tmpSire do
      begin
         Close;
         DeleteTable;
         Free;
      end;
   with tmpSaleDeath do
      begin
         Close;
         DeleteTable;
         Free;
      end;
   with tmpPurchase do
      begin
         Close;
         DeleteTable;
         Free;
      end;
end;

procedure GetEvents;
var
   FromDate : TDateTime;
   i,
   j : Byte;
   SupplierName,
   HerdNum,
   TempStr : String;
   PrePurchase : Boolean;
begin

   E := TStringList.Create;
   { EABR Abortion }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction ');
         Sql.Add('FROM Animals A                                           ');
         Sql.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)                ');
         Sql.Add('WHERE (A.LactNo = E.AnimalLactNo)                        ');
     //    Sql.Add('AND   (A.InHerd=True)                                    ');
         Sql.Add('AND   (A.Sex="Female")                                   ');
         Sql.Add('AND   (A.AnimalDeleted=False)                            ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+') ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CAbortionEvent)+')       ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEABR, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                           ');
         Sql.Add('FROM MPDelete M                                     ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CAbortionEvent)+')  ');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);

                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEABR, True);
                     Buffer := AddToBuff(Buffer, 'D', True  );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;
         Close;
      end;

   { Calvings New Style Calving Event }
   with GenQuery do
      for j := 0 to 1 do
         begin
            { Live Calves }
            for i := 1 to 4 do
               begin
                  Sql.Clear;
                  Sql.Add('SELECT DISTINCT D.ID ADamID, D.AnimalNo DamNo, D.NatIDNum DamIDNum, E.EventDate, E.MPAction, E.ID EventID, ');
                  Sql.Add('                S.AnimalNo SireNo, S.NatIDNum SireIDNum, S.HerdID SireHerd,                         ');
                  Sql.Add('                G.LookupCode, A.NatIDNum CalfIDNum, A.Sex CalfSex, A.Name CalfName, A.ID CalfID,    ');
                  Sql.Add('                SB.Code SireBCode, DB.Code DamBCode, CalfMortal.LookupCode MortalCode, A.BirthWeight');
                  Sql.Add('FROM Animals A                                    ');
                  Sql.Add('LEFT JOIN Calvings C ON (C.ID'+IntToStr(i)+'=A.ID)');
                  Sql.Add('LEFT JOIN Events   E ON (E.ID = C.EventID)        ');
                  Sql.Add('LEFT JOIN Animals  D ON (D.ID = E.AnimalID)       ');
                  Sql.Add('LEFT JOIN Animals  S ON (S.ID = A.SireID)         ');
                  Sql.Add('LEFT JOIN GenLook  G ON (G.ID = C.BirthType)      ');
                  Sql.Add('LEFT JOIN Breeds DB ON (D.PrimaryBreed = DB.ID)');
                  Sql.Add('LEFT JOIN Breeds SB ON (S.PrimaryBreed = SB.ID)');
                  Sql.Add('LEFT JOIN GenLook CalfMortal ON (CalfMortal.ID = C.CalfMortality'+IntToStr(i)+')');
                  if j = 0 then
                     SQL.Add('WHERE (C.CalfDead'+IntToStr(i)+'=False)        ')
                  else
                     SQL.Add('WHERE (C.CalfDead'+IntToStr(i)+'=True )        ');
       //           Sql.Add('AND   (D.InHerd=True)                             ');
                  Sql.Add('AND   (D.Sex="Female")                            ');
                  Sql.Add('AND   (D.AnimalDeleted=False)                     ');
                  Sql.Add('AND   (E.EventType = '+IntToStr(cCalvingEvent)+') ');
                  Sql.Add('AND   (D.HerdID='+IntToStr(HerdIdentity)+') ');
                  Sql.Add(SQLMPNotified);
                  Open;

                  if RecordCount > 0 then
                     begin
                        First;
                        while not eof do
                           begin
                              AddTempID(FieldByName('EventID').AsInteger);
                              Buffer := '';
                              Buffer := AddToBuff(Buffer, sECLV , True);
                              Buffer := AddToBuff(Buffer, FieldByName('DamNo').AsString, True);
                              Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('DamIDNum').AsString)), True);
                              if FieldByName('EventDate').AsDateTime > 0 then
                                 Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                              else
                                 Buffer := AddToBuff(Buffer, '', True);
                              Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                              Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);

                              if WinData.CheckEvents.Locate('AnimalID;EventType', VarArrayOf([FieldByName('ADamID').AsInteger, CPurchaseEvent]) , [] ) then
                                 PrePurchase := FieldByName('EventDate').AsDateTime < WinData.CheckEvents.FieldByName('EventDate').AsDateTime
                              else
                                 PrePurchase := False;

                              if PrePurchase then
                                 Buffer := AddToBuff(Buffer, 'Pre-Purchase', True) // Record type
                              else
                                 begin
                                    if J = 0 then
                                       Buffer := AddToBuff(Buffer, 'Live', True) // Record type
                                    else
                                       Buffer := AddToBuff(Buffer, 'Dead', True) // Record type
                                 end;

                              if IntToStr(WinData.NONEHerdID) = FieldByName('SireHerd').AsString then
                                 Buffer := AddToBuff(Buffer, FieldByName('SireNo').AsString, True)
                              else
                                 Buffer := AddToBuff(Buffer, FieldByName('SireIDNum').AsString, True);

                              Buffer := AddToBuff(Buffer, FieldByName('LookupCode').AsString, True);

                              if j = 0 then
                                 Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('CalfIDNum').AsString)), True)
                              else
                                 Buffer := AddToBuff(Buffer, '', True);
                              if (UPPERCASE(FieldByName('CalfSex').AsString) = 'FEMALE') then
                                 Buffer := AddToBuff(Buffer, 'F', True)
                              else
                                 Buffer := AddToBuff(Buffer, 'M', True);
                              if j = 0 then
                                 Buffer := AddToBuff(Buffer, FieldByName('CalfName').AsString, True)
                              else
                                 Buffer := AddToBuff(Buffer, '', True);
                              if j = 0 then
                                 Buffer := AddToBuff(Buffer, FieldByName('CalfID').AsString, True)
                              else
                                 Buffer := AddToBuff(Buffer, '', True);
                              Buffer := AddToBuff(Buffer, FieldByName('MortalCode').AsString , True);
                              Buffer := AddToBuff(Buffer, FieldByName('SireBCode').AsString, True);
                              Buffer := AddToBuff(Buffer, FieldByName('DamBCode').AsString, True);
                              Buffer := AddToBuff(Buffer, FieldByName('BirthWeight').AsString, False);

                              E.Append(Buffer);
                              Next;
                           end;
                     end;
                  Close;
               end;
         end;

   { Calvings Old Style Calving Event }
   with GenQuery do
      for i := 1 to 4 do
         begin
            Sql.Clear;
            Sql.Add('SELECT DISTINCT D.ID ADamID, D.AnimalNo DamNo, D.NatIDNum DamIDNum, E.EventDate, E.MPAction, E.ID EventID, ');
            Sql.Add('                S.ID SireID, S.AnimalNo SireNo, S.NatIDNum SireIDNum, S.HerdID SireHerd,            ');
            Sql.Add('                G.Description, A.NatIDNum CalfIDNum, A.Sex CalfSex, A.Name CalfName, A.ID CalfID,   ');
            Sql.Add('                SB.Code SireBCode, DB.Code DamBCode, CalfMortal.LookupCode MortalCode, A.BirthWeight');
            Sql.Add('FROM Animals A                                    ');
            Sql.Add('LEFT JOIN Calvings C ON (C.ID'+IntToStr(i)+'=A.ID)');
            Sql.Add('LEFT JOIN Events   E ON (E.ID = C.EventID)        ');
            Sql.Add('LEFT JOIN Animals  D ON (D.ID = E.AnimalID)       ');
            Sql.Add('LEFT JOIN Animals  S ON (S.ID = A.SireID)         ');
            Sql.Add('LEFT JOIN GenLook  G ON (G.ID = C.BirthType)      ');
            Sql.Add('LEFT JOIN Breeds DB ON  (D.PrimaryBreed = DB.ID)  ');
            Sql.Add('LEFT JOIN Breeds SB ON  (S.PrimaryBreed = SB.ID)  ');
            Sql.Add('LEFT JOIN GenLook  CalfMortal ON (CalfMortal.ID = C.CalfMortality'+IntToStr(i)+')');
            SQL.Add('WHERE (C.CalfDead'+IntToStr(i)+' IS Null)         ');
         //   Sql.Add('AND   (D.InHerd=True)                             ');
            Sql.Add('AND   (D.Sex="Female")                            ');
            Sql.Add('AND   (D.AnimalDeleted=False)                     ');
            Sql.Add('AND   (E.EventType = '+IntToStr(cCalvingEvent)+') ');
            Sql.Add('AND   (D.HerdID='+IntToStr(HerdIdentity)+') ');
            Sql.Add(SQLMPNotified);
            Open;

            if RecordCount > 0 then
               begin
                  First;
                  while not eof do
                     begin
                        AddTempID(FieldByName('EventID').AsInteger);
                        Buffer := '';
                        Buffer := AddToBuff(Buffer, sECLV , True);
                        Buffer := AddToBuff(Buffer, FieldByName('DamNo').AsString, True);
                        Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('DamIDNum').AsString)), True);
                        if FieldByName('EventDate').AsDateTime > 0 then
                           Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                        else
                           Buffer := AddToBuff(Buffer, '', True);
                        Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                        if WinData.CheckEvents.Locate('AnimalID;EventType', VarArrayOf([FieldByName('ADamID').AsInteger, CPurchaseEvent]) , [] ) then
                           PrePurchase := FieldByName('EventDate').AsDateTime < WinData.CheckEvents.FieldByName('EventDate').AsDateTime
                        else
                           PrePurchase := False;

                        // Just attempt Pre-Purchase here, can't tell if calf was dead or alive at calving time.
                        if PrePurchase then
                           Buffer := AddToBuff(Buffer, 'Pre-Purchase', True)
                        else
                           Buffer := AddToBuff(Buffer, '', True);

                        if IntToStr(WinData.NONEHerdID) = FieldByName('SireHerd').AsString then
                           Buffer := AddToBuff(Buffer, FieldByName('SireNo').AsString, True)
                        else
                           Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('SireIDNum').AsString)), True);
                        Buffer := AddToBuff(Buffer, FieldByName('Description').AsString, True);
                        Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('CalfIDNum').AsString)), True);
                        if (UPPERCASE(FieldByName('CalfSex').AsString) = 'FEMALE') then
                           Buffer := AddToBuff(Buffer, 'F', True)
                        else
                           Buffer := AddToBuff(Buffer, 'M', True);
                        Buffer := AddToBuff(Buffer, FieldByName('CalfName').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('CalfID').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('MortalCode').AsString , True);
                        Buffer := AddToBuff(Buffer, FieldByName('SireBCode').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('DamBCode').AsString, True);
                        Buffer := AddToBuff(Buffer, FieldByName('BirthWeight').AsString, False);
                        E.Append(Buffer);
                        Next;
                     end;
               end;
               Close;
         end;

   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID              ');
         Sql.Add('FROM MPDelete M                       ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CCalvingEvent)+')  ');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);

                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sECLV, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;
         Close;
      end;

   { ECST Castrate }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction ');
         Sql.Add('FROM Animals A                                           ');
         Sql.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)                ');
         Sql.Add('WHERE (A.Sex="Steer")                                    ');
//         Sql.Add('AND   (A.InHerd=True)                                    ');
         Sql.Add('AND   (A.AnimalDeleted=False)                            ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+') ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CCastrateEvent)+')       ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sECST, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                          ');
         Sql.Add('FROM MPDelete M                                    ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CCastrateEvent)+') ');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sECST, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;
         Close;
      end;

      uProgressIndicator.ProgressIndicator.Position := 60;

   { ECON Condition Score }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction, ');
         Sql.Add('                C.Score                                  ');
         Sql.Add('FROM Animals A                                           ');
         Sql.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)                ');
         Sql.Add('LEFT JOIN ConditionScore C ON (C.EventID = E.ID)         ');
         Sql.Add('WHERE (A.LactNo = E.AnimalLactNo)                        ');
//         Sql.Add('AND   (A.InHerd=True)                                    ');
         Sql.Add('AND   (A.Sex="Female")                                   '); // Check with Gerry.
         Sql.Add('AND   (A.AnimalDeleted=False)                            ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+') ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CCondScoreEvent)+')      ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sECON , True);
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('Score').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                           ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CCondScoreEvent)+') ');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sECON, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

   { EDNP Diagnose Problem }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction, ');
         Sql.Add('                G.LookupCode                         ');
         Sql.Add('FROM Animals A                                       ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)   ');
         Sql.Add('LEFT JOIN DiagnoseProblem D ON (D.EventID  = E.ID)   ');
         Sql.Add('LEFT JOIN GenLook         G ON (G.ID= D.ICode)       ');
         Sql.Add('WHERE (A.Sex="Female")                               ');
         Sql.Add('AND   (A.LactNo = E.AnimalLactNo)                    ');
//         Sql.Add('AND   (A.InHerd=True)                                ');
         Sql.Add('AND   (A.AnimalDeleted=False)                        ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+') ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CDiagProblemEvent)+')    ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEDNP, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('LookupCode').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CDiagProblemEvent)+')');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEDNP, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

      uProgressIndicator.ProgressIndicator.Position := 65;

   { EDIE Died }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction, ');
         Sql.Add('                G.LookupCode                         ');
         Sql.Add('FROM Animals A                                       ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)   ');
         Sql.Add('LEFT JOIN SalesDeaths S     ON (S.EventID = E.ID)    ');
         Sql.Add('LEFT JOIN GenLook         G ON (G.ID = S.Culled)     ');
         Sql.Add('WHERE (S.Sold="False")                               ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+') ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')      ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEDIE, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('LookupCode').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                          ');
         Sql.Add('FROM MPDelete M                                    ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CSaleDeathEvent)+')');
         Sql.Add('AND   (M.ECategory = "'+sEDIE+'")');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     { OK need to make sure its a Death sale event}
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEDIE, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;
         Close;
      end;

   { EDRY Dry Off }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, A.LactNo  ');
         Sql.Add('FROM Animals A                                          ');
//         Sql.Add('WHERE (A.InHerd=True)                                   ');
         Sql.Add('WHERE   (A.Sex="Female")                                ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     SubQuery.ParamByName('EID').AsInteger := FieldByName('ID').AsInteger;
                     //SubQuery.ParamByName('LactNo').AsInteger := FieldByName('LactNo').AsInteger;

                     //if FieldByName('ID').AsInteger = 40 then ShowDebugMessage('40');

                     SubQuery.Active := True;
                     if SubQuery.FieldByName('EventID').AsInteger > 0 then
                        begin
                           SubQuery.First;
                           AddTempID(SubQuery.FieldByName('EventID').AsInteger);
                           Buffer := '';
                           Buffer := AddToBuff(Buffer, sEDRY, True );
                           Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                           Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                           if SubQuery.FieldByName('EDate').AsDateTime > 0 then
                              Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,SubQuery.FieldByName('EDate').AsDateTime), True)
                           else
                              Buffer := AddToBuff(Buffer, '', True);
                           Buffer := AddToBuff(Buffer, SubQuery.FieldByName('MPAction').AsString, True);
                           Buffer := AddToBuff(Buffer, SubQuery.FieldByName('EventID').AsString, False);
                           E.Append(Buffer);
                        end;
                     SubQuery.Active := False;
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CDryOffEvent)+')');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEDRY, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

      uProgressIndicator.ProgressIndicator.Position := 70;

   { EIMP Embryo Transfer }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction, ET.ET1Number, G.Description, ');
         Sql.Add('                DDam.AnimalNo DAnimalNo, DDam.NatIDNum DNatIDNum, DDam.HerdBookNo DHerdBookNo,   '); { Donor Dam Details }
         Sql.Add('                Sire.AnimalNo SAnimalNo, Sire.NatIDNum SNatIDNum, Sire.HerdBookNo SHerdBookNo    '); { Bullock Details   }
         Sql.Add('From Animals A ');
         Sql.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID) ');
         Sql.Add('LEFT JOIN EmbryoTransfer ET ON (ET.EventID = E.ID) ');
         Sql.Add('LEFT JOIN Animals DDam ON (DDam.ID = ET.DonorDamID)');
         Sql.Add('LEFT JOIN Animals Sire ON (Sire.ID = ET.SireID)    ');
         Sql.Add('LEFT JOIN GenLook G    ON (G.ID = ET.EmbryoType)   ');
         Sql.Add('WHERE (A.LactNo = E.AnimalLactNo)                  ');
//         Sql.Add('AND   (A.InHerd=True)                              ');
         Sql.Add('AND   (A.Sex="Female")                             ');
         Sql.Add('AND   (A.AnimalDeleted=False)                      ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (E.EventType = '+IntToStr(CEmbryoTransEvent)+')   ');
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     TempStr := '';
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEIMP, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('ET1Number').AsString, True);

                     Buffer := AddToBuff(Buffer, FieldByName('DAnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(FieldByName('DNatIDNum').AsString), True);
                     Buffer := AddToBuff(Buffer, FieldByName('DHerdBookNo').AsString, True);

                     Buffer := AddToBuff(Buffer, FieldByName('SAnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(FieldByName('SNatIDNum').AsString), True);
                     Buffer := AddToBuff(Buffer, FieldByName('SHerdBookNo').AsString, True);
                     TempStr := Copy(FieldByName('Description').AsString, 1, 7);
                     Buffer := AddToBuff(Buffer, Trim(TempStr), False);
                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CEmbryoTransEvent)+')');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEIMP, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

   { EHTN Heat Noticed }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)      ');
         Sql.Add('WHERE (A.LactNo = E.AnimalLactNo)                       ');
//         Sql.Add('AND   (A.InHerd=True)                                   ');
         Sql.Add('AND   (A.Sex="Female")                                  ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (E.EventType = '+IntToStr(CBullingEvent)+')       ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEHTN, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CBullingEvent)+')');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEHTN, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

   { ELWT Live Weight }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction,');
         Sql.Add('                W.Weight                                ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)      ');
         Sql.Add('LEFT JOIN Weights W         ON (W.EventID  = E.ID)      ');
         Sql.Add('WHERE (A.LactNo = E.AnimalLactNo)                       ');
  //       Sql.Add('AND   (A.InHerd=True)                                   ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (E.EventType = '+IntToStr(CWeightEvent)+')        ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sELWT, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                     try
                        Buffer := AddToBuff(Buffer, FloatToStr(FieldByName('Weight').AsFloat), False);
                     except
                        Buffer := AddToBuff(Buffer, '', False);
                     end;
                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CWeightEvent)+')');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sELWT, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

   { EMST Mastitis }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)      ');
         Sql.Add('WHERE (A.LactNo = E.AnimalLactNo)                       ');
//         Sql.Add('AND   (A.InHerd=True)                                   ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (E.EventType = '+IntToStr(CMastitisEvent)+')      ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEMST, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CMastitisEvent)+')');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEMST, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

      uProgressIndicator.ProgressIndicator.Position := 75;

   { EPRT Pregnancy Test }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction, P.PregnancyStatus ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)      ');
         Sql.Add('LEFT JOIN PregnancyDiag P   ON (E.ID = P.EventID)       ');
         Sql.Add('WHERE (A.Sex="Female")                                  ');
//         Sql.Add('AND   (A.InHerd=True)                                   ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.LactNo = E.AnimalLactNo)                       ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (E.EventType = '+IntToStr(CPregDiagEvent)+')      ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEPRT, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                     if FieldByName('PregnancyStatus').AsBoolean = True then
                        Buffer := AddToBuff(Buffer, '1' , False)
                     else if FieldByName('PregnancyStatus').AsBoolean = False then
                        Buffer := AddToBuff(Buffer, '2' , False)
                     else
                        Buffer := AddToBuff(Buffer, 'In-conclusive' , False);
                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CPregDiagEvent)+')');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEPRT, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

   { ERBI Run Bull In }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction, ');
         Sql.Add('                ABull.NatIDNum BNatIDNum                ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)      ');
         Sql.Add('LEFT JOIN BullInOut B       ON (B.EventID  = E.ID)      ');
         Sql.Add('LEFT JOIN Animals ABull     ON (ABull.ID   = B.BullID)  ');
         Sql.Add('WHERE (A.Sex="Female")                                  ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.LactNo = E.AnimalLactNo)                       ');
         Sql.Add('AND   (B.BullIn = "True")                               ');
//         Sql.Add('AND   (A.InHerd=True)                                   ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (E.EventType = '+IntToStr(CStockBullIn)+')      ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sERBI, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(FieldByName('BNatIDNum').AsString), False);
                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CStockBullIn)+')     ');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sERBI, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;
         Close;
      end;

   { ERBI Run Bull Out }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction, ');
         Sql.Add('                ABull.NatIDNum BNatIDNum                ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)      ');
         Sql.Add('LEFT JOIN BullInOut B       ON (B.EventID  = E.ID)      ');
         Sql.Add('LEFT JOIN Animals ABull     ON (ABull.ID   = B.BullID)  ');
         Sql.Add('WHERE (A.Sex="Female")                                  ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.LactNo = E.AnimalLactNo)                       ');
//         Sql.Add('AND   (A.InHerd=True)                                   ');
         Sql.Add('AND   (B.BullIn = "False")                              ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (E.EventType = '+IntToStr(CStockBullOut)+')       ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sERBO, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(FieldByName('BNatIDNum').AsString), False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                        ');
         Sql.Add('FROM MPDelete M                                  ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CStockBullOut)+')');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sERBO, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;
         Close;
      end;

   { ESELL Sale }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction, ');
         Sql.Add('                G.LookupCode                         ');
         Sql.Add('FROM Animals A                                       ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)   ');
         Sql.Add('LEFT JOIN SalesDeaths S     ON (S.EventID = E.ID)    ');
         Sql.Add('LEFT JOIN GenLook         G ON (G.ID = S.Culled)     ');
         Sql.Add('WHERE (S.Sold="True")                                ');
         Sql.Add('AND (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND (A.AnimalDeleted=False)                           ');
         Sql.Add('AND (E.EventType = '+IntToStr(CSaleDeathEvent)+')     ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sESEL , True);
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('LookupCode').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CSaleDeathEvent)+')');
         Sql.Add('AND   (M.ECategory = "'+sESEL+'")');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sESEL, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

      uProgressIndicator.ProgressIndicator.Position := 80;

   { ESAI Sever AI Bull }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction,   ');
         Sql.Add('                ASire.NatIDNum SNatIDNum, ASire.HerdBookNo SHerdBookNo, ASire.AnimalNo SAnimalNo, ASire.HerdID SHerdID ');
         Sql.Add('FROM Animals A                                       ');
         Sql.Add('LEFT JOIN Events E      ON (E.AnimalID = A.ID)       ');
         Sql.Add('LEFT JOIN Services S    ON (S.EventID = E.ID)        ');
         Sql.Add('LEFT JOIN Animals ASire ON (ASire.ID = S.ServiceBull)');
         Sql.Add('WHERE (A.LactNo=E.AnimalLactNo)                      ');
//         Sql.Add('AND   (A.InHerd=True)                                ');
         Sql.Add('AND   (A.Sex="Female")                               ');
         Sql.Add('AND   (A.AnimalDeleted=False)                        ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')       ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     if FieldByName('SHerdID').AsInteger = WinData.NONEHerdID then
                        begin
                           // Off Farm Bull
                           AddTempID(FieldByName('EventID').AsInteger);
                           Buffer := '';
                           Buffer := AddToBuff(Buffer, sESAI, True);
                           Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                           Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                           if FieldByName('EventDate').AsDateTime > 0 then
                              Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                           else
                              Buffer := AddToBuff(Buffer, '', True);
                           Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                           Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);

                           if Length(FieldByName('sAnimalNo').AsString) <= 4 then
                              Buffer := AddToBuff(Buffer, FieldByName('sAnimalNo').AsString, False)
                           else
                              Buffer := AddToBuff(Buffer, FieldByName('sHerdBookNo').AsString, False);

                           E.Append(Buffer);
                        end;
                     Next;
                  end;

               First;
               while not eof do
                  begin
                     if FieldByName('SHerdID').AsInteger <> WinData.NONEHerdID then
                        begin
                           AddTempID(FieldByName('EventID').AsInteger);
                           Buffer := '';
                           Buffer := AddToBuff(Buffer, sESFB , True);
                           Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                           Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                           if FieldByName('EventDate').AsDateTime > 0 then
                              Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                           else
                              Buffer := AddToBuff(Buffer, '', True);
                           Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                           Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, True);
                           Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('SNatIDNum').AsString)), False);

                           E.Append(Buffer);
                        end;
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID, M.ECategory           ');
         Sql.Add('FROM MPDelete M                                  ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CServiceEvent)+')');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, FieldByName('ECategory').AsString, True);
                     Buffer := AddToBuff(Buffer, 'D' , True  );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);
                     E.Append(Buffer);
                     Next;
                  end;
            end;
         Close;
      end;

   { ETBC To Be Culled }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction ');
         Sql.Add('FROM Animals A                                        ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)    ');
         Sql.Add('WHERE (A.LactNo=E.AnimalLactNo)                       ');
//         Sql.Add('AND (A.InHerd=True)                                   ');
         Sql.Add('AND (A.AnimalDeleted=False)                           ');
         Sql.Add('AND (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND (E.EventType = '+IntToStr(CToBeCulledEvent)+')    ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sETBC, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                            ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CToBeCulledEvent)+') ');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sETBC, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

   { EWNC Weaning }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.ID EventID, E.EventDate, E.MPAction ');
         Sql.Add('FROM Animals A                                        ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)    ');
         Sql.Add('WHERE (A.Sex="Female")                                ');
//         Sql.Add('AND (A.InHerd=True)                                   ');
         Sql.Add('AND (A.AnimalDeleted=False)                           ');
         Sql.Add('AND (A.LactNo=E.AnimalLactNo)                         ');
         Sql.Add('AND (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND (E.EventType = '+IntToStr(CWeaningEvent)+')       ');
         Sql.Add(SQLMPNotified);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEWNC, True );
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('MPAction').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Sql.Clear;
         Sql.Add('SELECT DISTINCT M.EventID                         ');
         Sql.Add('FROM MPDelete M                                      ');
         Sql.Add('WHERE (M.EventType = '+IntToStr(CWeaningEvent)+') ');
         Sql.Add(SQLMPDelete);
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     AddTempID(FieldByName('EventID').AsInteger);
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sEWNC, True );
                     Buffer := AddToBuff(Buffer, 'D', True   );
                     Buffer := AddToBuff(Buffer, FieldByName('EventID').AsString, False);

                     E.Append(Buffer);
                     Next;
                  end;
            end;

         Close;
      end;

   FromDate := Date-90;

   { Drug Administration }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.EventDate, M.Name DrugName, ');
         Sql.Add('                H.RateApplic, H.DoseUnitUsed, MD.Name AdminName, MD2.Name VetName, MP.BatchNo ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E            ON (E.AnimalID = A.ID)    '); { Link Events.AnimalID to Animal.ID }
         Sql.Add('LEFT JOIN Health H            ON (H.EventID  = E.ID)    '); {}
         Sql.Add('LEFT JOIN Medicine M          ON (M.ID  = H.DrugUsed)   '); { Drug Name, Batch No }
         Sql.Add('LEFT JOIN SuppliersBreeders S ON (M.ID = S.ID)          '); {}
         Sql.Add('LEFT JOIN MedAdmin MD         ON (H.AdminBy  = MD.ID)   ');
         Sql.Add('LEFT JOIN MedAdmin MD2        ON (H.VetPresc = MD2.ID)  ');
         Sql.Add('LEFT JOIN MediPur  MP         ON (H.DrugPurchID = MP.ID)  ');
//         Sql.Add('WHERE (A.InHerd=True)                                   ');
         Sql.Add('WHERE   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (E.EventType = '+IntToStr(CHealthEvent)+')        ');
         Sql.Add('AND   (E.EventDate >= "'+FormatDateTime(cUSDateStyle,FromDate)+'") ');
         Open;

         LookupMediPur := TTable.Create(nil);
         LookupMediPur.DataBaseName := WinData.KingData.DataBaseName;
         LookupMediPur.TableName := WinData.MediPurch.TableName;

         LookupMediPur.Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sDRG, True );
                     Buffer := AddToBuff(Buffer, FieldByName('ID').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('DrugName').AsString, True);
                     if Trim(FieldByName('BatchNo').AsString) <> '' then
                        if LookupMediPur.Locate('BatchNo', Trim(FieldByName('BatchNo').AsString),[]) then
                           if WinData.Suppliers.Locate('ID', LookupMediPur.FieldByName('SuppID').AsInteger, []) then
                              begin
                                 SupplierName := WinData.Suppliers.FieldByName('Name').AsString;
                                 HerdNum      := WinData.Suppliers.FieldByName('Address 1').AsString;
                              end;
                     Buffer := AddToBuff(Buffer, SupplierName, True);
                     Buffer := AddToBuff(Buffer, HerdNum, True);
                     Buffer := AddToBuff(Buffer, FieldByName('RateApplic').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('DoseUnitUsed').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('AdminName').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('VetName').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('BatchNo').AsString, False);
                     E.Append(Buffer);
                     Next;
                  end;
            end;
         Close;
         LookupMediPur.Close;
         LookupMediPur.Free;
      end;

   { Internal Exam }
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, E.EventDate,             ');
         Sql.Add('                G.Description D, G2.Description D2, G3.Description D3, ');
         Sql.Add('                G4.Description D4, G5.Description D5                   ');
         Sql.Add('FROM Animals A                                                         ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)                     ');
         Sql.Add('LEFT JOIN IntExam I         ON (I.EventID = E.ID)                      ');
         Sql.Add('LEFT JOIN GenLook G         ON ((G.ID = I.Method)                      ');
         Sql.Add('                            AND (G.ListType='+IntToStr(LIntExamMet)+'))');
         Sql.Add('LEFT JOIN GenLook G2        ON ((G2.ID = I.Reason)                     ');
         Sql.Add('                            AND (G2.ListType='+IntToStr(LIntExamRea)+'))');
         Sql.Add('LEFT JOIN GenLook G3        ON ((G3.ID = I.MainResult)                 ');
         Sql.Add('                            AND (G3.ListType='+IntToStr(LIntExamRes)+'))');
         Sql.Add('LEFT JOIN GenLook G4        ON ((G4.ID = I.Result2)                    ');
         Sql.Add('                            AND (G4.ListType='+IntToStr(LIntExamRes)+'))');
         Sql.Add('LEFT JOIN GenLook G5        ON ((G5.ID = I.Result3)                    ');
         Sql.Add('                            AND (G5.ListType='+IntToStr(LIntExamRes)+'))');
         Sql.Add('WHERE (A.Sex="Female")                                ');
//         Sql.Add('AND (A.InHerd=True)                                   ');
         Sql.Add('AND (A.AnimalDeleted=False)                           ');
         Sql.Add('AND (A.LactNo=E.AnimalLactNo)                         ');
         Sql.Add('AND (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND (E.EventType = '+IntToStr(CIntExamEvent)+')       ');
         Sql.Add('AND (E.EventDate >= "'+FormatDateTime(cUSDateStyle,FromDate)+'") ');
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     Buffer := '';
                     Buffer := AddToBuff(Buffer, sINT, True );
                     Buffer := AddToBuff(Buffer, FieldByName('ID').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('AnimalNo').AsString, True);
                     Buffer := AddToBuff(Buffer, WinData.StripAllNomNumAlpha(WinData.StripSpaces(FieldByName('NatIDNum').AsString)), True);
                     if FieldByName('EventDate').AsDateTime > 0 then
                        Buffer := AddToBuff(Buffer, FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime), True)
                     else
                        Buffer := AddToBuff(Buffer, '', True);
                     Buffer := AddToBuff(Buffer, FieldByName('D').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('D2').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('D3').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('D4').AsString, True);
                     Buffer := AddToBuff(Buffer, FieldByName('D5').AsString, True);

                     E.Append(Buffer);
                     Next;
                  end;
            end;
         Close;
      end;

      uProgressIndicator.ProgressIndicator.Position := 90;
   AddFileEvents;
end;

procedure LoadAnimals;
begin
   with GenQuery do
      begin
         Sql.Clear;                               //jt changed breed to breed code
         Sql.Add('INSERT INTO tmpAnimals (AnimalID, AnimalNo, NatIDNum, LactNo, Sex, SireID, SireCode, DamID, DamNatID, ');
         Sql.Add('                        BreedCode, DateOfBirth, Breeding, HerdBookNo, Name, MilkCowNo)                ');
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, A.LactNo, A.Sex, A.SireID, ASire.AnimalNo, A.DamID, ADam.NatIDNum, ');
         Sql.Add('                B.Code, A.DateOfBirth, A.Breeding, A.HerdBookNo, A.Name, A.MilkCowNo  ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Animals ADam  ON (ADam.ID  = A.DamID )        ');
         Sql.Add('LEFT JOIN Animals ASire ON (ASire.ID = A.SireID)        ');
         Sql.Add('LEFT JOIN Breeds  B     ON (B.ID     = A.PrimaryBreed)  ');
//         Sql.Add('LEFT JOIN Events  E     ON (E.AnimalID = A.ID)          ');  //jt Adding In DryOff Date
         Sql.Add('WHERE (A.HerdID='+IntToStr(HerdIdentity)+')');
         Sql.Add('AND   (A.AnimalDeleted=FALSE)');
//         Sql.Add('AND (A.AnimalDeleted=FALSE)');
         ExecSQL;
         Close;
      end;

   with TmpAnimals do
      begin
         Filter := 'Sex = ''Female''';
         Filtered := True;
         First;
         while not eof do
            begin
               if FieldByName('Sex').AsString = 'Female' then
                  if WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',VarArrayOf([FieldByName('AnimalID').AsInteger,FieldByName('LactNo').AsInteger,CDryOffEvent]),[]) then
                     begin
                        Edit;
                        FieldByName('DryOffDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                        Post;
                     end;
               Next;
            end;
         Filter := '';
         Filtered := False;
      end;

   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('DELETE FROM TmpAnimals                                                                  ');
         Sql.Add('WHERE (AnimalID IN (SELECT DISTINCT E.AnimalID FROM Events E                            ');
         Sql.Add('                    WHERE (EventDate < "' + FormatDateTime(cUSDateStyle,Date-365) + '") ');
         Sql.Add('                    AND   (E.EventType = '+IntToStr(CSaleDeathEvent) +')))              ');
         ExecSQL;
         Close;
      end;

      uProgressIndicator.ProgressIndicator.Position := 5;

   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('INSERT INTO tmpDam (AnimalID, AnimalNo, NatIDNum, DamID, DamAnimalNo, DamNatID, HerdBookNo,              ');
         Sql.Add('                    Tattoo, Name, MilkCowNo)           ');
         Sql.Add('SELECT DISTINCT     A.ID, A.AnimalNo, A.NatIDNum, A.DamID, ADam.AnimalNo, ADam.NatIDNum, ADam.HerdBookNo,');
         Sql.Add('                    ADam.TattoNo, ADam.Name, ADam.MilkCowNo ');
         Sql.Add('FROM Animals A                                         ');
         Sql.Add('LEFT JOIN Animals ADam  ON (ADam.ID  = A.DamID )       ');
         Sql.Add('WHERE A.ID IN (SELECT DISTINCT (AnimalID)              ');
         Sql.Add('               FROM tmpAnimals                         ');
         Sql.Add('               WHERE DamID > 0)                        ');
         ExecSQL;
         Close;
      end;

      uProgressIndicator.ProgressIndicator.Position := 10;

   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('INSERT INTO tmpSire (AnimalID, AnimalNo, NatIDNum, SireID, SireAnimalNo, SireNatID, HerdBookNo,           ');
         Sql.Add('                     Tattoo, Name )                    ');
         Sql.Add('SELECT DISTINCT      A.ID, A.AnimalNo, A.NatIDNum, A.SireID, ASire.AnimalNo, ASire.NatIDNum, ASire.HerdBookNo,');
         Sql.Add('                     ASire.TattoNo, ASire.Name         ');
         Sql.Add('FROM Animals A                                         ');
         Sql.Add('LEFT JOIN Animals ASire ON (ASire.ID = A.SireID)       ');
         Sql.Add('WHERE A.ID IN (SELECT DISTINCT (AnimalID)              ');
         Sql.Add('               FROM tmpAnimals                         ');
         Sql.Add('               WHERE SireID > 0)                       ');
         ExecSQL;
         Close;
      end;
      uProgressIndicator.ProgressIndicator.Position := 15;
end;

procedure LoadSalePurchEvents;
begin
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('INSERT INTO tmpSaleDeath (AnimalID, EventDate, Price, Weight, CarcaseGrd, CustID, CustName, Address1,             ');
         Sql.Add('                          Address2, Address3, Address4, CustHerdNo, Sold )       ');
         Sql.Add('SELECT DISTINCT           E.AnimalID, E.EventDate, S.Price, S.Weight, S.Grade, S.Customer, C.Name, C."Address 1", ');
         Sql.Add('                          C."Address 2", C."Address 3", C."Address 4", C."Address 1", S.Sold ');
         Sql.Add('FROM Events E                                       ');
         Sql.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)       ');
         Sql.Add('LEFT JOIN Customers C   ON (C.ID = S.Customer)      ');
         Sql.Add('WHERE (E.EventType = '+IntToStr(CSaleDeathEvent)+') ');
         Sql.Add('AND E.AnimalID IN (SELECT DISTINCT (AnimalID)       ');
         Sql.Add('                   FROM tmpAnimals                  ');
         Sql.Add('                   WHERE AnimalID > 0)              ');
         ExecSQL;
         Close;
      end;

      uProgressIndicator.ProgressIndicator.Position := 20;
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('INSERT INTO tmpPurchase (AnimalID, EventDate, Price, SuppID, SuppName, Address1,           ');
         Sql.Add('                         Address2, Address3, Address4, SuppHerdNo )     ');
         Sql.Add('SELECT DISTINCT          E.AnimalID, E.EventDate, P.Price, P.Supplier, S.Name, S."Address 1", ');
         Sql.Add('                         S."Address 2", S."Address 3", S."Address 4", S."Address 1" ');
         Sql.Add('FROM Events E                                        ');
         Sql.Add('LEFT JOIN Purchases P         ON (P.EventID = E.ID)  ');
         Sql.Add('LEFT JOIN SuppliersBreeders S ON (S.ID = P.Supplier) ');
         Sql.Add('WHERE (E.EventType = '+IntToStr(CPurchaseEvent)+')   ');
         Sql.Add('AND E.AnimalID IN (SELECT DISTINCT (AnimalID)        ');
         Sql.Add('                   FROM tmpAnimals                   ');
         Sql.Add('                   WHERE AnimalID > 0)               ');
         ExecSQL;
         Close;
      end;
      uProgressIndicator.ProgressIndicator.Position := 25;
end;

function MarkAsRegistered : Integer;
begin
   Result := -1;
   try
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('Update Events ');
            SQL.Add('Set MPNotified = "True" ');
            SQL.Add('Where ID IN (Select Distinct EventID From TmpIDs)');
            ExecSQL;

            SQL.Clear;
            SQL.Add('Update MPDelete ');
            SQL.Add('Set Notified = "True" ');
            SQL.Add('Where EventID IN (Select Distinct EventID From TmpIDs)');
            ExecSQL;

            Result := 0;
         end;
   except
   end;
end;

function ReturnFileName: String;
var
   s : String[6];
begin
   s := FormatDateTime('ddmmyy',Date);//jt Fixed this was Result := fDir+'\MP'+WinData.HerdIdentifier+s;
   Result := fDir+'\MP'+WinData.HerdIdentifier;
   Result := Result + s + '.dat';
end;

function SaveFile: Integer;
begin
   Result := -1;
   try
      FileName := ReturnFileName;
      F.Append('EOF');
      F.SaveToFile(FileName);
      E.Free;
      F.Free;
      Result := 0;
   except
      on E : EInOutError do
         ShowMessage(E.Message);
   end;
end;

procedure UpdateAnimalTable;
begin

   LookupEvents := TTable.Create(nil);
   try
      LookupEvents.DataBaseName := WinData.KingData.DatabaseName;
      LookupEvents.TableName := WinData.Events.TableName;
      LookupEvents.Open;

      with tmpAnimals do
         begin
            First;
            while not (eof) do
               begin
                  Edit;
                  if (FieldByName('Sex').AsString = 'Female') then
                     begin
                        // Now set sex to F
                        FieldByName('Sex').AsString := 'F';
                        if (FieldByName('LactNo').AsInteger > 0) then
                           begin
                              // Set Filter
                              LookupEvents.Filter := '((AnimalID = '+IntToStr(FieldByName('AnimalID').AsInteger)+') And (AnimalLactNo = '+IntToStr(FieldByName('LactNo').AsInteger)+') And (EventType = '+IntToStr(CDryOffEvent)+'))';
                              LookupEvents.Filtered := True;
                              if LookupEvents.RecordCount > 0 then
                                 FieldByName('LactStatus').AsString := 'Dry'
                              else
                                 FieldByName('LactStatus').AsString := 'Milking';

                              // Clear Filter
                              LookupEvents.Filter   := '';
                              LookupEvents.Filtered := False;

                              LookupEvents.Filter := '((AnimalID = '+IntToStr(FieldByName('AnimalID').AsInteger)+') And (EventType = '+IntToStr(CCalvingEvent)+'))';
                              LookupEvents.Filtered := True;
                              if LookupEvents.RecordCount > 0 then
                                 begin
                                    LookupEvents.Last;
                                    FieldByName('LtCalveDate').AsDateTime := LookupEvents.FieldByName('EventDate').AsDateTime;
                                 end;

                              LookupEvents.Filter   := '';
                              LookupEvents.Filtered := False;
                           end
                     end
                  else
                     // Now set sex to M
                     FieldByName('Sex').AsString := 'M';


                  if FieldByName('Breeding').AsBoolean then
                     FieldByName('sBreeding').AsString := 'Y'
                  else
                     FieldByName('sBreeding').AsString := 'N';

                  FieldByName('PurchBorn').AsString := 'Born';
                  if tmpPurchase.Locate('AnimalID', FieldByName('AnimalID').AsInteger, []) then
                     if tmpPurchase.FieldByName('EventDate').AsDateTime > 0 then
                        begin
                           FieldByName('PurchBorn').AsString := 'Bought';
                           FieldByname('PurchDate').AsDateTime := tmpPurchase.FieldByName('EventDate').AsDateTime;
                           FieldByName('BTEPurchNum').AsString := tmpPurchase.FieldByName('Address1').AsString;
                        end;

                  if tmpSaleDeath.Locate('AnimalID', FieldByName('AnimalID').AsInteger, []) then
                     if tmpSaleDeath.FieldByName('EventDate').AsDateTime > 0 then
                        begin
                           FieldByName('SaleDate').AsDateTime := tmpSaleDeath.FieldByName('EventDate').AsDateTime;
                           if tmpSaleDeath.FieldByName('Sold').AsBoolean then
                              FieldByName('SaleDeath').AsString := 'Sold'
                           else
                              FieldByName('SaleDeath').AsString := 'Died';
                        end;

                 Post;
                 Next;
               end;
            LookupEvents.Close;
            uProgressIndicator.ProgressIndicator.Position := 40;
            AddFileHeader;
            tmpAnimals.Close;
         end;
   finally
      LookupEvents.Free;
   end;
end;

end.

