unit uElecWeigh;

{
   09/07/10 [V4.0 R4.0] /MK Additional Feature - Added check for whether Gallagher or TruTest File.
                                               - Added read file for Gallagher File.
                                               - Used New WinData.StripAllAlphaButNum to remove all
                                                 characters but numbers from Gallagher FileName.
                                               - Added CreateFileDate from Gallagher File Name.
                                               - Added Check for producer on ReadFile.

   06/10/10 [V4.0 R5.0] /MK Change - Changed Caption of sbRead and sbRecord.
                                   - Made the Read and Import of File as one.
                                   - If TruTest then program checks to see if TruTest unit software exists - if not then prompt for
                                     another location.
                                   - Changed name of sbRead to sbExport.
                                   - Removed code for sbRead as its now incorparated into sbRecord.
                                   - sbExport will export AnimalList from FormCreate.
                                   - Added "AND Inherd = True" to AnimalList SQL.
                                   - Added new images for Import and Export.

   29/10/10 [V4.0 R5.2] /MK/SP Change - Using Parser to find Animal Number and Weight.

   19/01/11 [V4.0 R7.7] /MK Change - Made Change to Export File to match that of the Test File
                                     that Deirdre O'Donovan (O'Donovan's Engineering) Sent.
                                   - Removed Create of AnimalList File on FormShow.

   24/01/11 [V4.0 R7.8] /MK Change - I accidentally added a space to the File Header which creates an extra column on the TruTest Indicator.

   26/01/11 [V4.0 R7.8] /MK Change - Changed Link2000 To Link3000 as this is TruTest's New Program.

   25/05/11 [V4.1 R1.6] /MK Additional Feature - If TruTest Then Match By NatIDNum From File Else Match By AnimalNo From File.

   26/05/11 [V4.1 R1.7] /MK Additional Feature - Fixed Access Violation When Program Was Trying To Clear StringList.

   05/08/11 [V4.1 R4.4] /MK Additional Feature - Added New TruTest EZI Weighing Import.

   11/08/11 [V4.1 R4.5] /MK Bug Fix - Check To See If TagExists If Not Read Other Field.

   05/01/12 [V5.0 R3.1] /MK Bug Fix - EZIWeigh - Copy To Create Date Not Working - Use Parse Instead.

   19/06/12 [V5.0 R7.3] /MK Additional Feature - Added New Producer And File Read Params For Digi-Star Weighing.

   15/08/12 [V5.0 R8.5] /MK Change - Removed pmProducer and all code associated with this component as there is no
                                     need for it anymore since the new uElectronicWeighingSettings was implemented.

   15/08/12 [V5.0 R8.5] /MK Change - Added changes to Digi-Star link to bring in new Header count and AnimalNo.

   16/08/12 [V5.0 R8.5] /MK Change - Look for new ElecWeigh Module if Producer or ProducerPath preference does not exist.

   05/10/12 [V5.1 R0.2] /MK Change - CreateExportFile - Change made to export animals from AFilters table.

   06/11/12 [V5.1 R0.8] /MK Bug Fix - Check if Weigh File has leading zeros.
                                      If file doesn't have leading zeros the strip TempTable leading zero's from AnimalNo field.
                            Change - Fill Animals table after Weigh File is read in so leading zero check is done.

   18/12/12 [V5.1 R3.5] /MK Change - DigiStar new export file now exports right date format - not american date format.
                            Bug Fix - If AnimalNo on file is null and no tag number then program was saving events on first null animal no found.

   19/12/12 [V5.1 R3.5] /MK Additional Feature - If DigiStar then read individual date from each line on file.

   20/02/13 [V5.1 R4.5] /MK Change - Ask user do they want to create the Export File instead of just show Export File screen.
                                   - Allow for different TruTest File types where NatID is different in each file.

   26/06/13 [V5.1 R7.5] /MK Additional Feature - CreateExportFile - If TruTest allow file name to be entered by the user.

   15/01/15 [V5.4 R0.6] /MK Change - ReadCSVFile - EziWeigh user can also enter in the tag number in the AnimalNo field
                                                   Set NatIDNum to AnimalNo field for searching - Eamon Kennedy/GL request.

   16/01/15 [V5.4 R1.5] /MK Change - Updated LocateAnimal to find animal by part of NatID.
                                   - ReadCSVFile - Changed Gallaghers params to that of new CSV file - Anne-Marie Delaney/GL request.

   03/09/15 [V5.4 R8.5] /MK Change - sbExportClick - Change to text to better explain what animals were export - GL request.
                                                     This could pontentially show users that a filter can also be exported.

   05/11/15 [V5.5 R0.2] /MK Change - Changes made in the EZIWeigh file import to allow for the new EZIWeigh file - Deidre Maher (4793).
                                   - LocateAnimal - Changes made to allow the search by the last digits of the tag number if more than one tag found with part number.

   25/11/15 [V5.5 R1.1] /MK Bug Fix - ReadCSV - TruTest3000 - If Parse field for Tag No found then set TagNo to this parse field string else,
                                                              set the TagNo to the AnimalNo on the file as no TagNo is on the file - L.Clerkin reported.

   03/12/15 [V5.5 R1.5] /MK Additional Feature - ReadCSVFile - EZIWeigh - If date not found in parser field then look for date in whole disk line - Tim Meagher (5379).

   14/12/15 [V5.5 R1.7] /MK Change - LocateAnimal - If ANatIDNum contains IE at start then remove the IE - Nicole(Richard Bourns).
                                   - ReadCSVFile - EZIWeigh - Allow for different EZIWeigh file types where NatID position is different in each file
                                                              by making sure that the header line contains EID and use its position has NatID position - Nicole(Richard Bourns).

   14/12/15 [V5.5 R1.8] /MK Bug Fix - ReadCSVFile - Use Try/Except/End here to trap error with converted string to date.
                                                  - Even if TruTestNatIDParse is greater than zero still check if AnimalNo then has a value
                                                    and if it doesn't then use the first field for the AnimalNo.

   11/04/16 [V5.5 R5.0] /MK Change - ReadCSVFile - Made changes to the EZI Weigh file as when Marie from Eamon Kennedy's was bringing in the file the weight of the animal
                                                   was not in the right location.

   14/04/16 [V5.5 R5.7] /MK Change - ReadCSVFile - TruTest3000 - Look for F11EID( as number after open bracket varies but F11EID indicates tag no field - Eddie Jordan UCD

   02/08/16 [V5.5 R7.6] /MK Additional Feature - Added another TruTest option for XR5000.

   11/08/16 [V5.5 R7.8] /MK Change - ReadCSVFile - EZIWeigh - Applied check for file header line like that of XR5000 to determine location of fields in file - Deirdre Maher.

   29/08/16 [V5.5 R9.2] /MK Change - Added the transponder number field to MyTable that stores all animals in the herd.
                                   - LocateAnimal - Check to see if the animal coming in can be located by the transponder number - Eddie Jordan Lyons Estate.

   26/09/16 [V5.5 R9.6] /MK Additional Feature - BeginImport - Filter animals that were weighed and added to the cart - Eddie (UCD Lyons).

   09/11/16 [V5.6 R3.0] /MK Additional Feature - CreateExportFile - Created a life data file for XR5000 users - Geraldine Carroll.

   18/01/17 [V5.6 R4.0] /MK Additional Feature - CreateExportFile - Added date of birth and animals last weight to life data file for XR5000 users - Geraldine Carroll.

   28/07/17 [V5.7 R1.1] /MK Change - Changes to the import of EZIWeigh and TruTest5000 params - Eddie Jordan UCD.

   01/09/17 [V5.7 R2.2] /MK Change - ReadCSVFile - If TagNo is still blank after TruTestNatIDPos is found then set the TagNo to the AnimalNo - Martin Donovan.

   07/09/17 [V5.7 R2.3] /MK Change - ReadCSVFile - New TruTest3000 file from Heinz Eggert contained a date with dashes and the year was the start.
                                                   Made function in KRoutines to process this string correctly.

   11/10/17 [V5.7 R3.8] /MK Change - CreateExportFile - Added a progress bar to let the user know whats going on.
                                                      - Changed header line depending on preference selected i.e. date of birth, last weight.
                                                      - Changed detail line depending on preference selected i.e. date of birth, last weight.

   12/10/17 [V5.7 R3.9] /MK Change - Removed var for FirstExport from TfmElectronicWeighingSettings so removed it from the call to this unit.

   21/11/17 [V5.7 R4.6] /MK Change - ReadCSVFile - TruTest5000 - Used VID field as Animal Number - Noel Keane.
                                   - If Length of AnimalNo from new VID field is blank then use TagNo value.
                                   - Created new function, BlankHeaderWeighDate, to check to see if the eWeighDate value is empty.
                                   - CreateWeighingEvent - Check to see if the eWeighDate is empty and use MyTable.FieldByName('WeighDate').AsDateTime if it is.
                                   - LocateAnimal - If no tag number but there is an animal number then use AnimalNo as tag number.

  19/12/17 [V5.7 R6.3] /MK Change - ReadCSVFile - EZI Weigh files can contain either EID or VID or both - Raymond Carter.

  20/12/17 [V5.7 R6.3] /MK Bug Fix - BeginImport - Added new form variable for FPromptForCart so prompt to add animals to cart doesn't appear
                                                   in a loop if more than one file has been read in.

  03/09/18 [V5.8 R2.6] /MK Change - BlankHeaderWeighDate - Check to see if the passed in string has one or less characters.
                                  - CreateWeighingEvent - Made change for new TruTest 3000 file where the date is preceded by "Date: ".

  27/11/18 [V5.8 R5.5] /MK Change - CreateExportFile - EZI weigh export file can only contain the animal number and transponder number - John Wynne.

  02/01/19 [V5.8 R5.8] /MK Change - LocateAnimal - When searching for Transponder number allow for leading zeros in TruTest transponder - Mary & Derek Dean/SP/GL.

  05/04/19 [V5.8 R8.4] /MK Change - ReadCSVFile - Changed POS from F11EID to EID as newer and older files both contain char "EID" - Martin Donovan.
                                  - LocateAnimal - Strip leading zeros from tag/transponder field to search for animal - Martin Donovan.

  23/10/19 [V5.9 R1.0] /MK Change - ReadCSVFile - I had to change the XR5000 import file to allow for different heads on the file - Jeanette Whitty.

  30/07/20 [V5.9 R5.2] /MK Change - ReadCSVFile - The TruTest Data Link software can save the csv file as an old Link3000 format but this date line contains the word date so trim date from this.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, RXSpin, dbTables, Db,
  Grids, DBGrids, RXDBCtrl, DBCtrls, RXLookup, RXCtrls, ComCtrls, ToolWin,
  EanDBQr, Menus, EanQr, Mask, ToolEdit, uSPParser, cxButtons,
  GenTypesConst, uHerdLookup, DairyData, uAnimalCart, KDBRoutines,
  uProgressIndicator;

type
  TEquipmentSupplier = ( esNone, esGallaghers, esTruTest, esEziWeigh, esDigiStar, esTruTest5000 );
  TfElecWeigh = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    Panel1: TPanel;
    dbgWeigh: TRxDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    eWeighDate: TEdit;
    Label2: TLabel;
    sbRecord: TRxSpeedButton;
    sbExport: TRxSpeedButton;
    Label3: TLabel;
    eName: TEdit;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    sbOptions: TRxSpeedButton;
    Parser: TSPParser;
    sdSaveExportFile: TSaveDialog;
    ToolButton5: TToolButton;
    OpenDialog: TOpenDialog;
    eFileName: TEdit;
    btnFindDirectory: TcxButton;
    procedure sbExitClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure sbRecordClick(Sender: TObject);
    procedure dbgWeighGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure FormShow(Sender: TObject);
    procedure iadcrushdiskClick(Sender: TObject);
    procedure sbExportClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFindDirectoryClick(Sender: TObject);
    procedure sbOptionsClick(Sender: TObject);
  private
    function GetEquipmentSupplier: TEquipmentSupplier;
    procedure CheckDefFile(ExportAnimalInfo : Boolean);
  private
    { Private declarations }
    MyDataSource : TDataSource;
    MyTable,
    TempTable : TTable;
    MyQuery : TQuery;
    MyFile : TextFile;
    CSVFileRes,
    CSVFileName,
    CSVFileDate,
    FileToUse : String;
    TruTestSystem : Boolean;
    ExportAnimals : TStringList;
    ImportComplete : Boolean;
    FFile : TStringList;
    FDuplicateAnimalsFound : Boolean;
    FCountry : TCountry;
    FAnimalCartArray : array of Integer;
    FFilterAnimalsAddedToCart : Boolean;
    FPromptForCart : Boolean;
    function  OpenLink: boolean;
    procedure ReadCSVFile;
    function RemoveZeros(AnimalNo: String): String;
    procedure BeginImport;
    procedure SaveData;
    procedure CreateExportFile;
    function LocateAnimal(AAnimalNo, ANatIDNum : String): Boolean;
    //   06/11/12 [V5.1 R0.8] /MK Change - New procedure to fill animals table after weigh file is read.
    //                                     Program used to fill animals on FormShow but we now need to check
    //                                     if weigh file contains leading zeros before the animal table is filled.
    procedure FillAnimalsTable;
    function BlankHeaderWeighDate : Boolean;
  public
    { Public declarations }
    property EquipmentSupplier : TEquipmentSupplier read GetEquipmentSupplier;
  end;

procedure ShowTheForm(var AFilterCartAnimals : Boolean );

var
  fElecWeigh: TfElecWeigh;

implementation
uses
   uGenLookSetUp, uListAnimals,
   uCrushDiskWeigh, Def,
   uPreferences, EventRecording,
   KRoutines, uElectronicWeighingSettings;

{$R *.DFM}

procedure ShowTheForm(var AFilterCartAnimals : Boolean);
begin
   Application.CreateForm(TfElecWeigh, fElecWeigh);
   try
      with TfElecWeigh.Create(nil) do
         try
            FFilterAnimalsAddedToCart := False;
            MyTable := TTable.Create(nil);
            MyTable.DatabaseName := WinData.KingData.DatabaseName;
            MyTable.TableType := ttParadox;
            MyTable.TableName := 'tElecWeigh';
            if MyTable.Exists then
               MyTable.DeleteTable;
            MyTable.FieldDefs.Clear;
            MyTable.FieldDefs.Add('ID',ftAutoInc,0,FALSE);
            MyTable.FieldDefs.Add('AnimalNo',ftString,10,FALSE);
            MyTable.FieldDefs.Add('NatIDNum',ftString,20,FALSE);
            MyTable.FieldDefs.Add('Weight',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('Result',ftString,25,FALSE);
            //   19/12/12 [V5.1 R3.5] /MK Additional Feature - New WeighDate field added for DigiStar file.
            MyTable.FieldDefs.Add('WeighDate',ftDate);
            MyTable.IndexDefs.Clear;
            MyTable.IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
            MyTable.IndexDefs.Add('iAnimalNo','AnimalNo',[ixCaseInsensitive]);
            MyTable.CreateTable;
            MyTable.Open;
            MyDataSource := TDataSource.Create(nil);
            MyDataSource.DataSet := MyTable;
            dbgWeigh.DataSource := MyDataSource;
            TempTable := TTable.Create(nil);
            TempTable.DatabaseName := WinData.KingData.DatabaseName;
            TempTable.TableType := ttParadox;
            TempTable.TableName := 'TempAnimalNo';
            if TempTable.Exists then
               TempTable.DeleteTable;
            TempTable.FieldDefs.Clear;
            TempTable.FieldDefs.Add('ID',ftAutoInc,0,FALSE);
            TempTable.FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
            TempTable.FieldDefs.Add('AnimalNo',ftString,10,FALSE);
            TempTable.FieldDefs.Add('NatIDNum',ftString,20,FALSE);
            TempTable.FieldDefs.Add('SearchNatID',ftString,20,FALSE);
            TempTable.FieldDefs.Add('DateOfBirth',ftDateTime,0,FALSE);
            TempTable.FieldDefs.Add('Sex',ftString,10,FALSE);
            TempTable.FieldDefs.Add('LactNo',ftInteger,0,FALSE);
            TempTable.FieldDefs.Add('HerdID',ftInteger,0,FALSE);
            TempTable.FieldDefs.Add('TransponderNo',ftString,20);
            TempTable.CreateTable;
            TempTable.Open;
            MyQuery := TQuery.Create(nil);
            MyQuery.DatabaseName := WinData.KingData.DatabaseName;
            FCountry := HerdLookup.CountryByHerdID(WinData.UserDefaultHerdID);
            SetLength(FAnimalCartArray,0);
            ShowModal;
         finally
            MyTable.Close;
            MyTable.DeleteTable;
            MyTable.Free;
            MyDataSource.Free;
            TempTable.Close;
            TempTable.DeleteTable;
            TempTable.Free;
            AFilterCartAnimals := FFilterAnimalsAddedToCart;
            Free;
         end;
   except
      ShowMessage('Cannot create form - close program and re-boot');
   end;
end;

procedure TfElecWeigh.sbExitClick(Sender: TObject);
begin
   MyTable.Close;
   MyTable.EmptyTable;
   dbgWeigh.Refresh;
   Close;
end;

procedure TfElecWeigh.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('ElecWeigh.htm');
end;

procedure TfElecWeigh.sbRecordClick(Sender: TObject);
begin
   // download data to csv
   if TruTestSystem then
      begin
         if (NOT OpenLink) then
            begin
               if MessageDlg('Link to Weighing Machine program has not been found.' +#13#10+
                             'Have you run this program before entering Kingswood Herd?',mtWarning,[mbYes,mbNo],0) = idYes then
                  BeginImport
               else
                  MessageDlg('Contact Kingswood Computing or your Weighing Machine supplier' +#13#10+
                             'for information on running the program.',mtWarning,[mbOK],0);
            end
         else
            BeginImport
      end
   else
      BeginImport;
end;

procedure TfElecWeigh.dbgWeighGetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
   if (MyTable.FieldByName('Result').AsString <> 'OK') and
       NOT (MyTable.FieldByName('Result').IsNull) then
       AFont.Color := clRed;
end;

procedure TfElecWeigh.FormShow(Sender: TObject);
begin
   eFileName.Enabled := False;
   eName.Enabled := False;
   eWeighDate.Enabled := False;
end;

function TfElecWeigh.OpenLink: boolean;
var
   TSI : TStartUpInfo;
   TPI : TProcessInformation;
begin
   RESULT := False;
   // open link2000 and wait for it to finish then pass back control to WinHerd - kr
   FillChar(TSI,SizeOf(TSI),0);
   TSI.CB      := SizeOf(TSI);
   TSI.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
   if createprocess(NIL, PChar('C:\Program Files\Tru-Test\Link3000\Link3000.exe'),
                    NIL, NIL, False, NORMAL_PRIORITY_CLASS, NIL, NIL, TSI, TPI) then
      begin
         // this is where it waits
         WaitForInputIdle(TPI.hProcess,INFINITE);
         WaitForSingleObject(TPI.hProcess,INFINITE);
         RESULT := True;
      end
   else
      exit;
end;

procedure TfElecWeigh.ReadCSVFile;
var
   FileName,
   FileDate,
   DiskLine,
   AnimalNo,
   Weight,
   TagNo,
   Year, Month, Day : String;
   i,
   StartWgt,
   TruTestNatIDPos,
   EZIWeighAnimalNoParseCount,
   EZIWeighDateParseCount,
   EZIWeighWeightParseCount,
   EZIWeighNatIDParseCount,
   TruTest5000AnimalNoPos,
   TruTest5000TagPos,
   TruTest5000WeightPos,
   TruTest5000DatePos,
   ParseSepCount,
   FieldCheckInd : Integer;
   TagExists : Boolean;
   WeighDate,
   IndividualWeighDate : TDateTime;

   function AlternateEZIWeighDateStr ( ALineStr : String ) : String;
   var
      i,
      DaySepInt,
      MonthSepInt,
      SepCharAfterDatePos : Integer;
      DayStr,
      MonthStr,
      YearStr : String;
   begin
      Result := '';
      if ( Length(ALineStr) = 0 ) then Exit;
      DaySepInt := 0;
      MonthSepInt := 0;
      DayStr := '';
      MonthStr := '';
      YearStr := '';
      for i := 0 to Length(ALineStr) do
         begin
            if ALineStr[i] = '/' then
               begin
                  if ( DaySepInt = 0 ) then
                     DaySepInt := i
                  else if ( DaySepInt > 0 ) then
                     MonthSepInt := i;
                  if ( DaySepInt > 0 ) and ( MonthSepInt > 0 ) then
                     Break;
               end;
         end;
      if ( DaySepInt = 0 ) and ( MonthSepInt = 0 ) then Exit;
      SepCharAfterDatePos := Pos(',',Copy(ALineStr,MonthSepInt+1,Length(ALineStr)-MonthSepInt));
      DayStr := Copy(ALineStr,DaySepInt-2,2);
      MonthStr := Copy(ALineStr,MonthSepInt-2,2);
      YearStr := Copy(ALineStr,MonthSepInt+1,SepCharAfterDatePos-1);
      Result := DayStr + '/' + MonthStr + '/' + YearStr;
   end;

begin
   // Gallagher Import Code
   //   16/01/15 [V5.4 R1.5] /MK Change - Changed Gallaghers params to that of new CSV file - Anne-Marie Delaney/GL request.
   try
      if ( EquipmentSupplier = esGallaghers ) then
         begin
            ImportComplete := False;

            //FileToUse := copy(eFileName.Text,2,(Length(eFileName.Text)-2));
            FileToUse := eFileName.Text;

            FileName := WinData.StripAllAlphaButNum(FileToUse);
            FileDate := Copy(FileName,0,8);
            Year := Copy(FileDate,0,4);
            Month := Copy(FileDate,5,2);
            Day := Copy(FileDate,7,2);

            MyTable.Close;
            MyTable.EmptyTable;
            MyTable.Open;

            eName.Text := 'Gallagher File';
            eWeighDate.Text := (Day + '/' + Month + '/' + Year);
            // headings

            for i := 1 to FFile.Count-1 do
               begin
                  DiskLine := FFile.Strings[i];
                  Parser.Parse(DiskLine);
                  AnimalNo := RemoveQuotationMarks(Parser.Fields[2]);
                  TagNo := AnimalNo;
                  Weight := Parser.Fields[3];

                  MyTable.Append;
                  try
                     MyTable.FieldByName('AnimalNo').AsString := AnimalNo;
                     MyTable.FieldByName('NatIDNum').AsString := TagNo;
                     MyTable.FieldByName('Weight').AsFloat := StrToFloat(Weight);
                     MyTable.Post;
                  except
                     MyTable.Cancel;
                  end;
               end;

            ImportComplete := True;
         end
      // TruTuest Import Code
      else if ( EquipmentSupplier = esTruTest ) then
         begin
            // Empty the Table
            ImportComplete := False;

            MyTable.Close;
            MyTable.EmptyTable;
            MyTable.Open;
            // get file header info
            // Resolution
            DiskLine := FFile.Strings[0];
            CSVFileRes  := Copy(DiskLine,13,(Length(Diskline)-12));
            // Name
            DiskLine := FFile.Strings[1];
            CSVFileName := Copy(DiskLine,7,(Length(Diskline)-6));
            eName.Text := CSVFileName;
            // Date
            DiskLine := FFile.Strings[2];

            //   07/09/17 [V5.7 R2.3] /MK Change - New TruTest3000 file from Heinz Eggert contained a date with dashes and the year was the start.
            //                                     Made function in KRoutines to process this string correctly.
            if ( Pos('-',DiskLine) > 0 ) then
               CSVFileDate := GetDateFromCommaSpacedString(DiskLine)
            //   30/07/20 [V5.9 R5.2] /MK Change - The TruTest Data Link software can save the csv file as an old Link3000 format but this date line contains the word date so trim date from this.
            else if ( Pos('DATE:',UpperCase(DiskLine)) > 0 ) then
               CSVFileDate := Trim(Copy(DiskLine,Pos(':',UpperCase(DiskLine))+1,Length(DiskLine)-Pos(':',UpperCase(DiskLine))))
            else
               CSVFileDate := DiskLine;
            eWeighDate.Text := CSVFileDate;

            // headings
            // loop for each record
            //while NOT EOF(MyFile) do

            // 20/02/13 [V5.1 R4.5] /MK Change - Allow for different TruTest File types where NatID is different in each file.
            // Look through header line 3 to see what parse field NatID is in.
            DiskLine := FFile.Strings[3];
            Parser.Sepchar := ',';
            Parser.Parse(DiskLine);

            //   14/04/16 [V5.5 R5.7] /MK Change - Look for F11EID( as number after open bracket varies but F11EID indicates tag no field.
            TruTestNatIDPos := 0;
            for i := 1 to Length(DiskLine) do
               begin
                 //   05/04/19 [V5.8 R8.5] /MK Change - Changed POS from F11EID to EID as newer and older files both contain char "EID" - Martin Donovan.
                 if ( Pos('EID(',UpperCase(Parser.Fields[i])) > 0 ) then
                    TruTestNatIDPos := i;
                 if TruTestNatIDPos > 0 then
                    Break;
               end;

            for i := 5 to FFile.Count-1 do
               begin
                  //ReadLn(MyFile,DiskLine);
                  DiskLine := FFile.Strings[i];
                  StartWgt := 0;
                  if (Length(Diskline) <> 0) then
                     begin
                        Parser.Parse(Diskline);
                        AnimalNo := Parser.Fields[1];
                        Weight := Parser.Fields[2];
                        // TagNo := WinData.StripAllAlphaButNum(Parser.Fields[3]);
                        //   25/11/15 [V5.5 R1.1] /MK Bug Fix - If Parse field for Tag No found then set TagNo to this parse field string else,
                        //                                      set the TagNo to the AnimalNo on the file as no TagNo is on the file - L.Clerkin reported.
                        //   01/09/17 [V5.7 R2.2] /MK Change - If TagNo is still blank after TruTestNatIDPos is found then set the TagNo to the AnimalNo - Martin Donovan. 
                        if ( TruTestNatIDPos > 0 ) then
                           TagNo := WinData.StripAllAlphaButNum(Parser.Fields[TruTestNatIDPos]);
                        if ( Length(TagNo) = 0 ) then
                           TagNo := AnimalNo;
                        //   11/08/11 [V4.1 R4.5] /MK Bug Fix - Check To See If TagExists If Not Read Other Field.
                        TagExists := TagNo <> '';
                        {
                        if not TagExists then
                           begin
                              TagNo := WinData.StripAllAlphaButNum(Parser.Fields[5]);
                              TagExists := True;
                           end;
                        }
                        MyTable.Append;
                        try
                           MyTable.FieldByName('AnimalNo').AsString := AnimalNo;
                           MyTable.FieldByName('NatIDNum').AsString := TagNo;
                           MyTable.FieldByName('Weight').AsFloat := StrToFloat(Weight);
                           MyTable.Post;
                        except
                           MyTable.Cancel;
                        end;
                     end;
               end;
         end
      //   05/08/11 [V4.1 R4.4] /MK Additional Feature - Added New TruTest EZI Weighing Import.
      //   TruTest Ezi-Weigh Code
      else if ( EquipmentSupplier = esEziWeigh ) then
         begin
            ImportComplete := False;

            MyTable.Close;
            MyTable.EmptyTable;
            MyTable.Open;

            DiskLine := FFile.Strings[1];
            //   05/01/12 [V5.0 R3.1] /MK Bug Fix - Copy To Create Date Not Working - Use Parse Instead.
            //   CSVFileDate := Copy(DiskLine,10,10);
            Parser.Parse(DiskLine);

            //   14/12/15 [V5.5 R1.8] /MK Bug Fix - Use Try/Except/End here to trap error with converted string to date.
            CSVFileDate := Parser.Fields[4];
            try
               WeighDate := 0;
               WeighDate := StrToDate(CSVFileDate);
            except
               if ( Pos('/',CSVFileDate) > 0 ) or ( Pos('-',CSVFileDate) > 0 ) then
                  begin
                     Year := Copy(CSVFileDate,1,4);
                     Month := Copy(CSVFileDate,6,2);
                     Day := Copy(CSVFileDate,9,2);
                     CSVFileDate := (Day + '/' + Month + '/' + Year);
                  end
               else
                  begin
                     //   03/12/15 [V5.5 R1.5] /MK Additional Feature - If date not found in parser field then look for date in whole disk line - Tim Meagher (5379).
                     if ( Pos('/',DiskLine) > 0 ) then
                        CSVFileDate := AlternateEZIWeighDateStr(DiskLine);
                  end;
               if ( Length(CSVFileDate) = 0 ) then
                  begin
                     MessageDlg('Unable to determine weighing date from file.'+cCRLF+
                                'Contact Kingswood.',mtError,[mbOK],0);
                     SysUtils.Abort;
                  end;
            end;
            eWeighDate.Text := CSVFileDate;

            // 14/12/15 [V5.5 R1.7] /MK Change - Allow for different EZIWeigh file types where NatID position is different in each file
            //                                   by making sure that the header line contains EID and use its position has NatID position - Nicole(Richard Bourns).
            EZIWeighAnimalNoParseCount := 0;
            EZIWeighDateParseCount := 0;
            EZIWeighWeightParseCount := 0;
            EZIWeighNatIDParseCount := 0;
            DiskLine := FFile.Strings[0];
            Parser.Parse(DiskLine);

            for i := 1 to Parser.Count do
               begin
                  Parser.Parse(DiskLine);
                  if ( UpperCase(Parser.Fields[i]) = 'DATE' ) then
                     EZIWeighDateParseCount := i
                  else if ( UpperCase(Parser.Fields[i]) = 'EID' ) then
                     EZIWeighNatIDParseCount := i
                  else if ( UpperCase(Parser.Fields[i]) = 'VID' ) then
                     EZIWeighAnimalNoParseCount := i
                  else if ( UpperCase(Parser.Fields[i]) = 'WEIGHT' ) then
                     EZIWeighWeightParseCount := i;
               end;

            //   19/12/17 [V5.7 R6.3] /MK Change - EZI Weigh files can contain either EID or VID or both - Raymond Carter.
            if ( EZIWeighDateParseCount = 0 ) or ( EZIWeighWeightParseCount = 0 ) or
               ( (EZIWeighNatIDParseCount = 0) and (EZIWeighAnimalNoParseCount = 0) ) then
               begin
                  MessageDlg('Unable to locate TruTest EZI Weight required fields.'+cCRLF+
                             'Contact Kingswood Support at +353-1-4599491',mtError,[mbOK],0);
                  Exit;
               end;

            // Read From Line 1 To File Count.
            for i := 1 to FFile.Count-1 do
               begin
                  //ReadLn(MyFile,DiskLine);
                  DiskLine := FFile.Strings[i];
                  StartWgt := 0;
                  if (Length(Diskline) <> 0) then
                     begin
                        Parser.Parse(Diskline);
                        //   14/12/15 [V5.5 R1.8] /MK Bug Fix - Even if TruTestNatIDParse is greater than zero still check if AnimalNo then has a value
                        //                                      and if it doesn't then use the first field for the AnimalNo.
                        if ( EZIWeighAnimalNoParseCount > 0 ) then
                           AnimalNo := Parser.Fields[EZIWeighAnimalNoParseCount];
                        if ( EZIWeighNatIDParseCount > 0 ) then
                           TagNo := Parser.Fields[EZIWeighNatIDParseCount];
                        Weight := Parser.Fields[EZIWeighWeightParseCount];
                        if ( Length(CSVFileDate) = 0 ) then
                           IndividualWeighDate := StrToDate(Parser.Fields[EZIWeighDateParseCount]);
                        MyTable.Append;
                        try
                           MyTable.FieldByName('AnimalNo').AsString := AnimalNo;
                           //   15/01/15 [V5.4 R0.6] /MK Change - EziWeigh user can also enter in the tag number in the AnimalNo field
                           //                                     Set NatIDNum to AnimalNo field for searching - Eamon Kennedy/GL request.
                           MyTable.FieldByName('NatIDNum').AsString := TagNo;
                           MyTable.FieldByName('Weight').AsFloat := StrToFloat(Weight);
                           MyTable.FieldByName('WeighDate').AsDateTime := IndividualWeighDate;
                           MyTable.Post;
                        except
                           MyTable.Cancel;
                        end;
                     end;
               end;
         end
      // Digi-Star Code
      else if ( EquipmentSupplier = esDigiStar ) then
         begin
            ImportComplete := False;

            MyTable.Close;
            MyTable.EmptyTable;
            MyTable.Open;

            // Read From Line 1 To File Count.
            for i := 3 to FFile.Count-1 do
               begin
                  DiskLine := FFile.Strings[i];
                  StartWgt := 0;
                  if (Length(Diskline) <> 0) then
                     begin
                        Parser.Parse(Diskline);
                        TagNo := WinData.StripAllAlphaButNum(Parser.Fields[1]);
                        AnimalNo := WinData.StripAllSpaces(Parser.Fields[2]);
                        //   11/08/11 [V4.1 R4.5] /MK Bug Fix - Check To See If TagExists If Not Read Other Field.
                        Weight := Parser.Fields[5];
                        //   19/12/12 [V5.1 R3.5] /MK Additional Feature - If DigiStar then read individual date from each line on file.
                        IndividualWeighDate := StrToDate(Trim(Copy(Parser.Fields[9],0,10)));
                        MyTable.Append;
                        try
                           MyTable.FieldByName('NatIDNum').AsString := TagNo;
                           MyTable.FieldByName('AnimalNo').AsString := AnimalNo;
                           MyTable.FieldByName('Weight').AsFloat := StrToFloat(Weight);
                           MyTable.FieldByName('WeighDate').AsDateTime := IndividualWeighDate;
                           MyTable.Post;
                        except
                           MyTable.Cancel;
                        end;
                     end;
               end;
         end
      // TruTest 5000 Series
      else if ( EquipmentSupplier = esTruTest5000 ) then
         begin
            ImportComplete := False;

            MyTable.Close;
            MyTable.EmptyTable;
            MyTable.Open;

            TruTest5000DatePos := 0;
            TruTest5000AnimalNoPos := 0;
            TruTest5000TagPos := 0;
            TruTest5000WeightPos := 0;

            FieldCheckInd := 0;
            DiskLine := FFile.Strings[FieldCheckInd];
            Parser.Parse(DiskLine);
            if ( Parser.Count < 3 ) then
               begin
                  FieldCheckInd := 4;
                  DiskLine := FFile.Strings[FieldCheckInd];
                  Parser.Parse(DiskLine);
               end;

            for i := 1 to Parser.Count do
               begin
                  Parser.Parse(DiskLine);
                  if ( UpperCase(Parser.Fields[i]) = 'DATE' ) then
                     TruTest5000DatePos := i
                  //   21/11/17 [V5.7 R4.6] /MK Change - Used VID field as Animal Number.
                  else if ( UpperCase(Parser.Fields[i]) = 'VID' ) then
                     TruTest5000AnimalNoPos := i
                  else if ( UpperCase(Parser.Fields[i]) = 'EID' ) or ( UpperCase(Parser.Fields[i]) = 'LID' ) then
                     TruTest5000TagPos := i
                  else if ( UpperCase(Parser.Fields[i]) = 'WEIGHT' ) then
                     TruTest5000WeightPos := i;
               end;

            if ( TruTest5000DatePos = 0 ) and ( TruTest5000TagPos = 0 ) and ( TruTest5000WeightPos = 0 ) then
               begin
                  MessageDlg('Unable to locate TruTest 5000 required fields.'+cCRLF+
                             'Contact Kingswood Support at +353-1-4599491',mtError,[mbOK],0);
                  Exit;
               end;

            // Read From Line 1 To File Count.
            for i := FieldCheckInd+1 to FFile.Count-1 do
               begin
                  DiskLine := FFile.Strings[i];
                  StartWgt := 0;
                  if ( Length(Diskline) <> 0 ) then
                     begin
                        Parser.Parse(Diskline);
                        //   11/08/11 [V4.1 R4.5] /MK Bug Fix - Check To See If TagExists If Not Read Other Field.
                        TagNo := WinData.StripAllAlphaButNum(Parser.Fields[TruTest5000TagPos]);
                        AnimalNo := WinData.StripAllAlphaButNum(Parser.Fields[TruTest5000AnimalNoPos]);
                        //   21/11/17 [V5.7 R4.6] /MK Change - If Length of AnimalNo from new VID field is blank then use TagNo value. 
                        if ( Length(AnimalNo) = 0 ) then
                           AnimalNo := WinData.StripAllAlphaButNum(Parser.Fields[TruTest5000TagPos]);
                        Weight := Parser.Fields[TruTest5000WeightPos];
                        //   19/12/12 [V5.1 R3.5] /MK Additional Feature - If DigiStar then read individual date from each line on file.
                        IndividualWeighDate := StrToDate(Parser.Fields[TruTest5000DatePos]);
                        MyTable.Append;
                        try
                           MyTable.FieldByName('NatIDNum').AsString := TagNo;
                           MyTable.FieldByName('AnimalNo').AsString := AnimalNo;
                           MyTable.FieldByName('Weight').AsFloat := StrToFloat(Weight);
                           MyTable.FieldByName('WeighDate').AsDateTime := IndividualWeighDate;
                           MyTable.Post;
                        except
                           MyTable.Cancel;
                        end;
                     end;
               end;
         end;
   finally
      if FFile <> nil then
         FreeAndNil(FFile);
      ImportComplete := True;
   end;
end;

function TfElecWeigh.RemoveZeros(AnimalNo: String): String;
var
   i,l : integer;
begin
   l := length(AnimalNo);
   if (l > 0) then
      begin
         for i := 1 to l do
            begin
               if (AnimalNo[1] = '0') or (AnimalNo[1] = ' ') then
                  Delete(AnimalNo,1,1)
               else
                  break;
            end;
      end;
   RESULT := AnimalNo;
end;

procedure TfElecWeigh.iadcrushdiskClick(Sender: TObject);
begin
   uCrushDiskWeigh.ShowTheForm;
   Close;
end;

procedure TfElecWeigh.BeginImport;

   procedure LoadWeighingFile;
   begin
      if ( Preferences.PreferenceExists(cGSElectronicWeighingProducerPath) ) then
         OpenDialog.InitialDir := Preferences.ValueAsString[cGSElectronicWeighingProducerPath]
      else
         OpenDialog.InitialDir := 'C:\';

      if ( OpenDialog.Execute ) then
         begin
            eFileName.Text := OpenDialog.FileName;
            FileToUse := copy(eFileName.Text,2,(Length(eFileName.Text)-2));

            if FFile = nil then
               FFile := TStringList.Create;

            FFile.LoadFromFile(eFileName.Text);
         end
      else
         begin
            MessageDlg('No weighing file has been selected for import.'+cCRLF+
                       'To import a weighing file click the Import Animal Weights button.',mtWarning,[mbOK],0);
            sbRecord.Enabled := True;
         end;
   end;

begin
   eFileName.Enabled := True;
   eName.Enabled := True;
   eWeighDate.Enabled := True;

   FileToUse := '';
   if ( TruTestSystem ) then
      begin
         if (eFileName.Text <> '') and (eFileName.Text <> 'c:\program files\tru-test\Link2000\')then
            begin
               // remove quotations
               FileToUse := copy(eFileName.Text,2,(Length(eFileName.Text)-2));
               // assign csv file
               AssignFile(MyFile,FileToUse);
               Reset(MyFile);
            end
         else
            LoadWeighingFile;
      end
   else
      LoadWeighingFile;

   // read file to table
   if ( FFile <> nil ) then
      begin
         ReadCSVFile;
         FillAnimalsTable;
         if ImportComplete then
            try
               SaveData;
               Update;
               if ( MessageDlg('Read another weighing file?',mtInformation,[mbYes,mbNo],0) = mrYes ) then
                  begin
                     MyTable.Close;
                     MyTable.EmptyTable;
                     dbgWeigh.Refresh;
                     eFileName.Text := '';
                     eWeighDate.Text := '  /  /    ';
                     eName.Text := '';
                     sbRecord.Click;
                     FPromptForCart := False;
                  end
               else
                  begin
                     sbExport.Enabled := False;
                     sbRecord.Enabled := False;
                     eFileName.Enabled := False;
                     btnFindDirectory.Enabled := False;
                  end;

               eFileName.Text := '';
               eWeighDate.Text := '  /  /    ';
               eName.Text := '';
            finally
               //   20/12/17 [V5.7 R6.3] /MK Bug Fix - Added new form variable for FPromptForCart so prompt to add animals to cart doesn't appear
               //                                      in a loop if more than one file has been read in.
               if ( FPromptForCart ) then
                  if ( Length(FAnimalCartArray) > 0 ) then
                     if ( MessageDlg('Do you want to add the animals that were weighed to the cart?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                        begin
                           AnimalCart.AddToCart(FAnimalCartArray);
                           WinData.FReportAnimalsInCart := True;
                           MessageDlg(Format('%d animal(s) have been added to Cart and are selected on Main Grid.'+cCRLF+
                                             'Exit back to the Main Grid to view these animals.',[Length(FAnimalCartArray)]),mtInformation,[mbOK],0);
                           FFilterAnimalsAddedToCart := True;
                        end;
            end;
      end;
end;

procedure TfElecWeigh.sbExportClick(Sender: TObject);
begin
   if ( sdSaveExportFile.Execute ) then
      begin
         CreateExportFile;
         ExportAnimals.SaveToFile(sdSaveExportFile.FileName);
         //   03/09/15 [V5.4 R8.5] /MK Change - Change to text to better explain what animals were export - GL request.
         //                                     This could pontentially show users that a filter can also be exported.
         MessageDlg('Weighing Scale Animal Export File Saved.'+cCRLF+
                    'File contains only animals that are on the main animal grid.',mtInformation,[mbOK],0);
      end;
end;

procedure TfElecWeigh.SaveData;

   procedure CreateWeighingEvent(AAnimalID, ALactNo, AHerdID : Integer);
   var
      WeighingEvent : TWeighingEvent;
      dWeighDate : TDateTime;
   begin
      // check if event exists
      dWeighDate := 0;
      //   21/11/17 [V5.7 R4.6] /MK Change - Check to see if the eWeighDate is empty and use MyTable.FieldByName('WeighDate').AsDateTime if it is.
      if ( BlankHeaderWeighDate ) then
         dWeighDate := MyTable.FieldByName('WeighDate').AsDateTime
      else
         try
            dWeighDate := StrToDate(eWeighDate.Text);
         except
            dWeighDate := StripDateFromString(eWeighDate.Text);
         end;
      if ( dWeighDate = 0 ) then
         begin
            MessageDlg('There has been no date found on the weighing file.',mtError,[mbOK],0);
            Exit;
         end;
      if ( not(WinData.CheckEvents.Locate('AnimalID;EventDate;EventType',
               VarArrayOf([AAnimalID,dWeighDate,cWeightEvent]),[])) ) and
         ( MyTable.FieldByName('Weight').AsFloat > 0 ) then
         try
            WeighingEvent := TWeighingEvent.Create('BRec');
            WeighingEvent.Append;
            try
               WeighingEvent.AnimalID     := AAnimalID;
               WeighingEvent.AnimalLactNo := ALactNo;
               WeighingEvent.AnimalHerdID := AHerdID;
               WeighingEvent.EventDate := dWeighDate;
               WeighingEvent.Weight       := MyTable.FieldByName('Weight').AsFloat;
               WeighingEvent.EventComment := FloatToStr(MyTable.FieldByName('Weight').AsFloat);
               WeighingEvent.EventSource  := sELECWEIGHING;
               WeighingEvent.Post;

               SetLength(FAnimalCartArray,Length(FAnimalCartArray)+1);
               FAnimalCartArray[Length(FAnimalCartArray)-1] := AAnimalID;

               MyTable.FieldByName('Result').AsString := 'Weighing Recorded';
            except
               MyTable.FieldByName('Result').AsString := 'Weighing Not Recorded';
               WeighingEvent.Cancel;
            end;
         finally
            SafeFreeAndNil(WeighingEvent);
         end
      else
         begin
            // event exists error
            MyTable.FieldByName('Result').AsString := 'Duplicate Event!';
         end;
   end;

begin
   // loop thro' table and save to database
   with MyTable do
      begin
         First;
         while (NOT EOF) do
            begin
               Edit;
               FDuplicateAnimalsFound := False;
               if ( LocateAnimal(StripAllSpaces(MyTable.FieldByName('AnimalNo').AsString),StripAllSpaces(MyTable.FieldByName('NatIDNum').AsString)) ) then
                  CreateWeighingEvent(TempTable.FieldByName('AnimalID').AsInteger,TempTable.FieldByName('LactNo').AsInteger,
                                      TempTable.FieldByName('HerdID').AsInteger)
               else
                  begin
                     if ( FDuplicateAnimalsFound ) then
                        MyTable.FieldByName('Result').AsString := 'Duplicate animals found!'
                     else
                        MyTable.FieldByName('Result').AsString := 'Animal Not Found!'
                  end;
               Post;
               Next;
            end;
      end;
   dbgWeigh.Refresh;
end;

procedure TfElecWeigh.CreateExportFile;
var
   AnimalNo,
   NatIDNum,
   TransponderNo,
   DateOfBirth,
   AnimalSex,
   AnimalBreedCode,
   TruTestFileName,
   LastWeight : String;
   bExportDateOfBirth,
   bExportLastWeight : Boolean;
begin
   ExportAnimals := TStringList.Create;

   bExportDateOfBirth := False;
   bExportLastWeight := False;
   if ( Preferences.PreferenceExists(cGSElectronicWeighingExportTruTestDateOfBirth) ) then
      bExportDateOfBirth := Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestDateOfBirth];
   if ( Preferences.PreferenceExists(cGSElectronicWeighingExportTruTestLastWeight) ) then
      bExportLastWeight := Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestLastWeight];

   //   26/06/13 [V5.1 R7.5] /MK Additional Feature - If TruTest allow file name to be entered by the user.
   //                                                 This file name will then appear on Tru Test scales.
   if ( EquipmentSupplier in [esTruTest, esEziWeigh] ) then
      begin
         TruTestFileName := InputBox('Tru Test File Name','Please enter file name','original');
         ExportAnimals.Add('FileNo: 1,,,,,');
         ExportAnimals.Add('Name: '+TruTestFileName+',,,,,');
      end
   else if ( EquipmentSupplier <> esTruTest5000 ) then
      begin
         ExportAnimals.Add('FileNo: 1,,,,,');
         ExportAnimals.Add('Name: original,,,,,');
      end
   else if ( EquipmentSupplier = esTruTest5000 ) then
      begin
         //   11/10/17 [V5.7 R3.8] /MK Change - Changed header line depending on preference selected i.e. date of birth, last weight.
         if bExportDateOfBirth and bExportLastWeight then
            ExportAnimals.Add('LID,Weight,VID,Animal notes,Sex,DOB,Breed')
         else if bExportDateOfBirth and not bExportLastWeight then
            ExportAnimals.Add('LID,VID,Animal notes,Sex,DOB,Breed')
         else if not bExportDateOfBirth and bExportLastWeight then
            ExportAnimals.Add('LID,Weight,VID,Animal notes,Sex,Breed')
         else if not bExportDateOfBirth and not bExportLastWeight then
            ExportAnimals.Add('LID,VID,Animal notes,Sex,Breed');
      end;

   if ( EquipmentSupplier <> esTruTest5000 ) then
      begin
         ExportAnimals.Add('Date:' + ' ' + DateToStr(Date) + ',,,,,' );
         //   27/11/18 [V5.8 R5.5] /MK Change - EZI weigh export file can only contain the animal number and transponder number - John Wynne. 
         if ( EquipmentSupplier = esEziWeigh ) then
            begin
               ExportAnimals.Add('F01FID(14)isID,F11EID(16)isID');
               ExportAnimals.Add('FID,EID');
            end
         else
            begin
               ExportAnimals.Add('F01FID(14)isID,C01Code1(12),F11EID(16)isID');
               ExportAnimals.Add('FID,Code1,EID');
            end;
      end;

   //   05/10/12 [V5.1 R0.2] /MK Change - Change made to export animals from AFilters table.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT A.ID, A.AnimalNo, A.NatIDNum, A.TransponderNo, A.DateOfBirth, A.Sex, A.PrimaryBreed');
         SQL.Add('FROM Animals A');
         SQL.Add('WHERE A.ID In (SELECT AF.AID FROM AFilters AF)');
         Open;
         if ( RecordCount > 0 ) then
            try
               //   11/10/17 [V5.7 R3.8] /MK Change - Added a progress bar to let the user know whats going on.
               ShowProgressIndicator('Exporting Animals',0,RecordCount,1);
               ProgressIndicator.Max := RecordCount;
               Screen.Cursor := crHourGlass;
               Application.ProcessMessages;
               Update;
               First;
               while (NOT EOF) do
                  begin
                     AnimalNo := '';
                     NatIDNum := '';
                     DateOfBirth := '';
                     AnimalSex := '';
                     AnimalBreedCode := '';
                     LastWeight := '';

                     AnimalNo := WinData.StripAllSpaces(FieldByName('AnimalNo').AsString);
                     NatIDNum := WinData.StripAllSpaces(FieldByName('NatIDNum').AsString);
                     TransponderNo := StripAllSpaces(FieldByName('TransponderNo').AsString);
                     DateOfBirth := FormatDateTime('dd.mm.yyyy',FieldByName('DateOfBirth').AsDateTime);
                     AnimalSex := UpperCase(FieldByName('Sex').AsString);
                     AnimalBreedCode := VarToStr(HerdLookup.BreedDetailsByID(FieldByName('PrimaryBreed').AsInteger,Breeds_Code));
                     if ( EquipmentSupplier = esTruTest5000 ) then
                        LastWeight := FloatToStr(GetAnimalLastWeight(FieldByName('ID').AsInteger));

                     if ( EquipmentSupplier = esTruTest5000 ) then
                        begin
                           if ( AnimalSex = 'BULL' ) or ( AnimalSex = 'STEER' ) then
                              AnimalSex := 'MALE'
                        end
                     else
                        begin
                           if ( AnimalSex = 'FEMALE' ) then
                              AnimalSex := 'F'
                           else if ( AnimalSex = 'BULL' ) then
                              AnimalSex := 'B'
                           else if ( AnimalSex = 'STEER' ) then
                              AnimalSex := 'S';
                        end;

                     //   11/10/17 [V5.7 R3.8] /MK Change - Changed detail line depending on preference selected i.e. date of birth, last weight.
                     if ( EquipmentSupplier = esTruTest5000 ) then
                        begin
                           if bExportDateOfBirth and bExportLastWeight then
                              ExportAnimals.Add(NatIDNum + ',' + LastWeight + ',' + AnimalNo + ',,' + AnimalSex + ',' + DateOfBirth + ',' + AnimalBreedCode)
                           else if bExportDateOfBirth and not bExportLastWeight then
                              ExportAnimals.Add(NatIDNum + ',' + AnimalNo + ',,' + AnimalSex + ',' + DateOfBirth + ',' + AnimalBreedCode)
                           else if not bExportDateOfBirth and bExportLastWeight then
                              ExportAnimals.Add(NatIDNum + ',' + LastWeight + ',' + AnimalNo + ',,' + AnimalSex + ',' + AnimalBreedCode)
                           else if not bExportDateOfBirth and not bExportLastWeight then
                              ExportAnimals.Add(NatIDNum + ',' + AnimalNo + ',,' + AnimalSex + ',' + AnimalBreedCode);
                        end
                     //   27/11/18 [V5.8 R5.5] /MK Change - EZI weigh export file can only contain the animal number and transponder number - John Wynne.
                     else if ( EquipmentSupplier = esEziWeigh ) then
                        begin
                           if ( IsIETag(NatIDNum) ) then
                              begin
                                if ( Length(TransponderNo) > 0 ) then
                                   NatIDNum := TransponderNo
                                else
                                   NatIDNum := StripIrishCountryPrefixFromNatID(NatIDNum);
                              end;
                           ExportAnimals.Add(AnimalNo + ',' + NatIDNum )
                        end
                     else
                        begin
                           if bExportDateOfBirth then
                              ExportAnimals.Add(AnimalNo + ',' + DateOfBirth + AnimalSex + ',' + NatIDNum )
                           else
                              ExportAnimals.Add(AnimalNo + ',' + AnimalSex + ',' + NatIDNum );
                        end;
                     ProgressIndicator.Position := ProgressIndicator.Position + 1;
                     Application.ProcessMessages;
                     Update;
                     Next;
                  end;
            finally
               ProgressIndicator.Close;
               Screen.Cursor := crDefault;
               Application.ProcessMessages;
               Update;
               Close;
            end;
      finally
         Free;
      end;
end;

function TfElecWeigh.LocateAnimal(AAnimalNo, ANatIDNum: String): Boolean;
var
   LocatedAnimalID : Integer;
   qLocateAnimal : TQuery;
begin
   Result := False;
   //   18/12/12 [V5.1 R3.5] /MK Bug Fix - If AnimalNo on file is null and no tag number
   //                                      then program was saving events on first null animal no found.
   if ( AAnimalNo = '' ) and ( ANatIDNum = '' ) then Exit;
   //   05/04/19 [V5.8 R8.5] /MK Change - Strip leading zeros from tag/transponder field to search for animal - Martin Donovan.
   ANatIDNum := StripLeadingZeros(ANatIDNum);
   //   21/11/17 [V5.7 R4.6] /MK Change - If no tag number but there is an animal number then use AnimalNo as tag number.
   if ( Length(ANatIDNum) = 0 ) and ( Length(AAnimalNo) > 0 ) then
      ANatIDNum := AAnimalNo;
   //   14/12/15 [V5.5 R1.7] /MK Change - If ANatIDNum contains IE at start then remove the IE.
   if ( Length(ANatIDNum) > 12 ) then
      if ( Copy(UpperCase(StripAllSpaces(ANatIDNum)),0,2) = 'IE' ) then
         ANatIDNum := Copy(UpperCase(StripAllSpaces(ANatIDNum)),3,Length(ANatIDNum)-2);
   //   16/01/15 [V5.4 R1.5] /MK Change - Updated LocateAnimal to find animal by part of NatID.
   Result := ( TempTable.Locate('SearchNatID',StripAllSpaces(ANatIDNum),[]) );
   if ( not(Result) ) then
      //   02/01/19 [V5.8 R5.8] /MK Change - When searching for Transponder number allow for leading zeros in TruTest transponder - Mary & Derek Dean/SP/GL.
      Result := ( TempTable.Locate('TransponderNo',StripAllSpaces(StripLeadingZeros(ANatIDNum)),[]) );
   if ( not(Result) ) then
      begin
         LocatedAnimalID := 0;
         qLocateAnimal := TQuery.Create(nil);
         with qLocateAnimal do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT SearchNatID, ID');
               SQL.Add('FROM Animals');
               SQL.Add('WHERE (SearchNatID LIKE "%'+ANatIDNum+'%")');
               SQL.Add('AND   (InHerd = True)');
               SQL.Add('AND   (AnimalDeleted = False)');
               SQL.Add('AND   (HerdID IN (SELECT DefaultHerdID FROM Defaults))');
               try
                  Open;
                  if ( FCountry = Ireland ) then
                     begin
                        // If one animal found with this part number then use this number.
                        Result := ( RecordCount > 0 );
                        if ( Result ) then
                           begin
                              if ( RecordCount = 1 ) then
                                 LocatedAnimalID := qLocateAnimal.Fields[1].AsInteger
                              else if ( RecordCount > 1 ) then
                                 begin
                                    // If more than one animal found with this part number then.
                                    First;
                                    while ( not(Eof) ) do
                                       begin
                                          // Search by the last digits of the SearchNatID for the part number entered by user.
                                          if ( Copy(qLocateAnimal.Fields[0].AsString,Length(qLocateAnimal.Fields[0].AsString)-Length(ANatIDNum)+1,Length(ANatIDNum)) = ANatIDNum ) then
                                             begin
                                                FDuplicateAnimalsFound := ( qLocateAnimal.Fields[1].AsInteger = LocatedAnimalID );
                                                if ( not(FDuplicateAnimalsFound) ) then
                                                   LocatedAnimalID := Fields[1].AsInteger;
                                             end;
                                          Next;
                                       end;
                                 end;
                           end;
                     end
                  else
                     if ( RecordCount = 1 ) then
                        LocatedAnimalID := Fields[1].AsInteger
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Free;
            end;
         if ( LocatedAnimalID > 0 ) then
            Result := ( TempTable.Locate('AnimalID',LocatedAnimalID,[]) );
      end;

   if ( not(Result) ) and ( Length(AAnimalNo) > 0 ) then
      Result := ( TempTable.Locate('AnimalNo',AAnimalNo,[]) );
end;

procedure TfElecWeigh.FormActivate(Sender: TObject);
var
   ExportAnimalInfo : Boolean;
begin
   OnActivate := nil;

   ExportAnimalInfo := False;

   sbRecord.Enabled := False;
   btnFindDirectory.Enabled := False;

   if ( not(Preferences.PreferenceExists(cGSElectronicWeighingProducer)) ) or
      ( not(Preferences.PreferenceExists(cGSElectronicWeighingProducerPath)) ) then
         //   16/08/12 [V5.0 R8.5] /MK Change - Look for new ElecWeigh Module if Producer or ProducerPath preference does not exist.
         CheckDefFile(ExportAnimalInfo);

   if ( Preferences.PreferenceExists(cGSElectronicWeighingProducer) ) then
      begin
         if ( ExportAnimalInfo ) then
            begin
               //   20/02/13 [V5.1 R4.5] /MK Change - Ask user do they want to create the Export File instead of just show Export File screen.
               if ( MessageDlg('Do you want to create an Kingswood Export File?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                 sbExport.Click;
            end;

         TruTestSystem := ( (EquipmentSupplier = esTruTest) or (EquipmentSupplier = esEziWeigh) or (EquipmentSupplier = esTruTest5000) );

         FFile := nil;

         FPromptForCart := True;;
         sbRecord.Click;
      end;
end;

procedure TfElecWeigh.btnFindDirectoryClick(Sender: TObject);
begin
   sbRecord.Click;
end;

procedure TfElecWeigh.sbOptionsClick(Sender: TObject);
var
   ExportAnimals : Boolean;
begin
   //   16/08/12 [V5.0 R8.5] /MK Change - Look for new ElecWeigh Module if Producer or ProducerPath preference does not exist.
   if ( not(Preferences.PreferenceExists(cGSElectronicWeighingProducer)) ) or
      ( not(Preferences.PreferenceExists(cGSElectronicWeighingProducerPath)) ) then
         // Check Defintion File.
         CheckDefFile(ExportAnimals)
   else
      TfmElectronicWeighingSettings.ShowSettings(ExportAnimals);

   if ( EquipmentSupplier <> esNone ) then
      sbRecord.Click;
end;

function TfElecWeigh.GetEquipmentSupplier: TEquipmentSupplier;
begin
   if ( Preferences.PreferenceExists(cGSElectronicWeighingProducer) ) then
      begin
         if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'Gallagher' ) then
            Result := esGallaghers
         else if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'TruTest' ) then
            Result := esTruTest
         else if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'TruTestEZI' ) then
            Result := esEziWeigh
         else if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'DigiStar' ) then
            Result := esDigiStar
         else if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'TruTest5000' ) then
            Result := esTruTest5000
         else
            Result := esNone;
      end
   else
      Result := esNone;
end;

procedure TfElecWeigh.CheckDefFile(ExportAnimalInfo : Boolean);
begin
   //   16/08/12 [V5.0 R8.5] /MK Change - Look for new ElecWeigh Module if Producer or ProducerPath preference does not exist.
   if ( Def.Definition.dUseElecWeigh )then
      TfmElectronicWeighingSettings.ShowSettings(ExportAnimalInfo)
   else
      MessageDlg(cMissingModulePayMsg,mtError,[mbOK],0);
end;

procedure TfElecWeigh.FillAnimalsTable;

   function WeighFileHasLeadingZeros : Boolean;
   var
     sAnimalNo : String;
   begin
      with MyTable do
         begin
            First;
            while not(Eof) do
               begin
                  sAnimalNo := FieldByName('AnimalNo').AsString;
                  if sAnimalNo <> '' then
                     begin
                        Result := ( Copy(sAnimalNo,0,1) = '0' );
                        if ( Result ) then
                           Break;
                     end;
                  Next;
               end;
         end;
   end;

var
   sNatIDNum : String;
   bWeighFileHasLeadingZeros : Boolean;
begin
   // fill table with eligible animals
   bWeighFileHasLeadingZeros := WeighFileHasLeadingZeros;

   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO '+TempTable.TableName+'');
         SQL.Add('(AnimalID, AnimalNo, NatIDNum, SearchNatID, DateOfBirth, Sex, LactNo, HerdID, TransponderNo)');
         SQL.Add('SELECT A.ID, A.AnimalNo, A.NatIDNum, A.SearchNatID, A.DateOfBirth, A.Sex, A.LactNo, A.HerdID, A.TransponderNo');
         SQL.Add('FROM Animals A');
         SQL.Add('WHERE (A.AnimalDeleted=FALSE )');
         SQL.Add('AND   (A.InHerd = True )');
         SQL.Add('AND   (A.HerdID <> '+IntToStr(WinData.NONEHerdID)+')');
         ExecSQL;
      end;

      with TempTable do
         begin
            First;
            while not EOF do
               begin
                  Edit;
                  //   06/11/12 [V5.1 R0.8] /MK Bug Fix - Check if Weigh File has leading zeros.
                  //                                      If file doesn't have leading zeros the strip TempTable leading zero's from AnimalNo field.
                  if ( not(bWeighFileHasLeadingZeros) ) then
                     TempTable.FieldByName('AnimalNo').AsString := RemoveZeros(TempTable.FieldByName('AnimalNo').AsString);
                  sNatIDNum := '';
                  sNatIDNum := TempTable.FieldByName('NatIDNum').AsString;
                  TempTable.FieldByName('NatIDNum').AsString := WinData.StripAllAlphaButNum(sNatIDNum);
                  TempTable.FieldByName('TransponderNo').AsString := StripAllSpaces(TempTable.FieldByName('TransponderNo').AsString);
                  Post;
                  Next;
              end;
         end;
end;

function TfElecWeigh.BlankHeaderWeighDate: Boolean;
var
   i : Integer;
   sDate : String;
begin
   Result := False;
   sDate := StripAllAlphaButNum(eWeighDate.Text);
   Result := ( Length(sDate) <= 1 );
end;

end.