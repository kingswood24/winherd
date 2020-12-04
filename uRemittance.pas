{
   25/05/11 [V4.1 R1.6] /MK Additional Feature - Add KillOutPerc's Button To ToolBar.
                                               - New Procedure ShowToolBarOptions Used On FormCreate And miMatchtoCrushFile.Click.

   06/07/11 [V4.1 R2.2] /MK Additional Feature - Added Slaney To Email List.

   07/07/11 [V4.1 R2.2] /MK Change - Now Bringing In CSV File Automatically - No Need For CSVImport Button.

   18/03/14 [V5.2 R9.0] /MK Additional Feature - Disable sbRecord and sbReview if Mail Attachment import.

   24/11/14 [V5.3 R9.0] /MK Additional Feature - Changed AIBP drop-down caption to ABP - GL Request.
                                                 Change of email address for ABP - GL Request.

   06/02/15 [V5.4 R2.6] /MK Change - Timer1Timer - Changed simple text to show user what possible reasons are why that tag number can't be found.

   21/05/15 [V5.4 R7.0] /MK Additional Feature - Added Ashbourne to pmRemitMarts list - email address from emails in Anne Ryan's Gmail inbox.

   11/04/18 [V5.7 R8.8] /MK Bug Fix - ExecuteFile - Moved ClearStringGrid & BuildGridFromFile from here to a new FileTimer.OnTimer event as the canvas
                                                    of the grid had not been intitalized in time for the full width of the grid to show the content of the file - DOM.

   28/08/18 [V5.8 R2.5] /MK Bug Fix - SendEmail - Body of the email should contain the Mailbox username if Default Mail Client is Gmail.

   17/10/18 [V5.8 R4.0] /MK Change - Changed Crush Data button to Re-Save file as Crush Data has not been used since we made new Crush changes for ABP i.e uCrushBarcode.
                                   - Removed property and subsequent procedures/functions for MatchAnimalsToCrushFile.
                                   - ToolBarButtonClick - Set the Save button as not enabled after reading in the file.
                            Additional Feature - New form private variable, FReImportFile, that is defaulted off and is only set to true if importing a file again
                                                 where that file has animals that have been sold.
                                               - BuildGridFromFile/StringGrid1DblClick - Pass in form variable, FReImportFile, to CarcaseExists to allow the file to be read in again.
                                               - Allow the file to be read in again and update SalesDeaths record fields.

   11/08/20 [V5.9 R5.3] /MK Bug Fix - When checking for the .csv in the file name allow for the uppercase version of .csv also - Denis O'Brien / CJ Meats.

   04/12/20 [V5.9 R7.8] /MK Change - Added Jennings to the list of factories that a file can be requested from.   
}

unit uRemittance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, ExtCtrls, Menus, RXCtrls, ToolWin, Db, DBTables,
  RxLookup, StdCtrls, LMDWebBase, LMDMapi, uCrush, uCrushHelper, uUpdateTables,
  BeefRemitLine, uMailBoxHelper;

type
  TfRemittance = class(TForm)
    popupOptions: TPopupMenu;
    FromDiskette1: TMenuItem;
    FromEmail1: TMenuItem;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    StatusBar1: TStatusBar;
    OpenDialog1: TOpenDialog;
    qryCarcase: TQuery;
    Timer1: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbRecord: TRxSpeedButton;
    sbOptions: TRxSpeedButton;
    sbExecRecord: TRxSpeedButton;
    ToolButton10: TToolButton;
    sbReview: TRxSpeedButton;
    ToolButton8: TToolButton;
    sbEMail: TRxSpeedButton;
    pHerdId: TPanel;
    Label1: TLabel;
    cbDefaultHerd: TRxDBLookupCombo;
    MyQuery: TQuery;
    ToolButton9: TToolButton;
    ToolButton4: TToolButton;
    MAPIMail: TLMDMapiSendMail;
    sbReImportFile: TRxSpeedButton;
    pmRemitMarts: TPopupMenu;
    DawnMeats1: TMenuItem;
    AIBP1: TMenuItem;
    Keepak1: TMenuItem;
    LiffeyMeats1: TMenuItem;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Ballon1: TMenuItem;
    Dunbia1: TMenuItem;
    ToolButton7: TToolButton;
    sbKillOutPercs: TRxSpeedButton;
    ToolButton6: TToolButton;
    SlaneyMeats1: TMenuItem;
    pmiAshbourne: TMenuItem;
    FileTimer: TTimer;
    pmiMartinJennings: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FromEmail1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);

    Procedure ToolBarButtonClick(Sender : tObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbReviewClick(Sender: TObject);
    procedure cbDefaultHerdChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbReImportFileClick(Sender: TObject);
    procedure DawnMeats1Click(Sender: TObject);
    procedure AIBP1Click(Sender: TObject);
    procedure LiffeyMeats1Click(Sender: TObject);
    procedure Keepak1Click(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure Ballon1Click(Sender: TObject);
    procedure Dunbia1Click(Sender: TObject);
    procedure sbKillOutPercsClick(Sender: TObject);
    procedure SlaneyMeats1Click(Sender: TObject);
    procedure pmiAshbourneClick(Sender: TObject);
    procedure FileTimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pmiMartinJenningsClick(Sender: TObject);
  private
    procedure ShowToolBarOptions;
  private
    sFileName : String;

    //sSupplierName,
    sCustomerName,       //KVB
    sProducerName : string;

    //nSupplierID,
    nCustomerID,     //KVB
    nProducerID   : integer;

    FFileName : string;

    FReImportFile : Boolean;

    function  ContainsUnknownCarcase : boolean;
    function  AddStringGridLine(sCol1,sCol2 : string) : integer;
    procedure RemoveStringGridLine(nRow : Integer);
    procedure ClearStringGrid;
    procedure BuildGridFromFile(FileName : String);
    procedure BuildGridFromDatabase(nSalegrpsID : integer);
    procedure SendEmail(AMartName : String);
  public
    procedure Execute;overload;
    procedure ExecuteFile(AFileName : string);overload;
  end;

var
  fRemittance: TfRemittance;
  BeefRemitCarcaseLineType : TBeefRemitCarcaseLineType;

implementation

{$R *.DFM}
uses
    BeefRemit, uRemittanceLoad, uRemittanceHeader,
    uRemittanceAnimal, uRemittanceRecord, uRemittanceReview,
    DairyData, DaZMisc, GenTypesConst, ShellAPI, uHerdSetUp,
    KRoutines, uRemittanceMarts,uFileAttachmentImport,
    uSalesKillOutPercs, ElectronicRemittanceConverter;

{-----------------------------------------------------
  [daz] General Form Code
 -----------------------------------------------------}

const
     btnExit     = 0;
     btnReadFile = 1;
     btnOptions  = 2;
     btnRecord   = 3;


     nDefIdentiferWidth = 20;



procedure TfRemittance.Execute;
begin
   ShowModal;
end;

procedure TfRemittance.FormShow(Sender: TObject);
begin
   // remap string grid height to font properties
    // remap string grid height to font properties
    StringGrid1.DefaultRowHeight:=StringGrid1.Canvas.TextHeight('Zy')+3;
    pHerdId.Visible := False;
    pHerdId.Visible := True;
    cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);

    {
    pHerdId.Visible := False;   sbEMail.Visible := False;
    ToolButton4.Visible := False;
    ToolButton6.Visible := False;
    if WinData.OwnerFile.Locate('ID', WindAta.UserDefaultHerdID, []) then
       if WinData.OwnerFile.FieldByName('Country').AsInteger = 1 then
          begin
             sbEMail.Visible := True;
             pHerdId.Visible := True;
             cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);
             ToolButton4.Visible := True;
             ToolButton6.Visible := True;
          end;
    StringGrid1.DefaultRowHeight:=StringGrid1.Canvas.TextHeight('Zy')+3;
    }
end;

procedure TfRemittance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

Procedure TfRemittance.ToolBarButtonClick(Sender : tObject);
var
   pt : tPoint;
begin
 case tComponent(Sender).tag of
  btnExit    : Close;
  btnReadFile: begin
                case FromDiskette1.Checked of
                 False : with tBeefRemitFiles.Create do
                            try
                               FileLocation:='C:\Kingswood Inward Files'; //Changed Default Directory  KVB
                               if ( not(GetFiles) ) then
                                  Application.MessageBox('No Remittance Files were available in the "C:\Kingswood Inward Files" directory.',
                                                         'No Remittance files found.',MB_ICONERROR+MB_OK)
                               else
                                  begin
                                     with tfRemittanceLoad.Create(Self) do
                                        sFileName := Execute(Files);

                                     if ( sFileName <> '' ) then
                                        begin
                                           ClearStringGrid;
                                           BuildGridFromFile(sFileName)
                                        end;
                                  end;
                            finally
                               Free;
                            end;
                 True  : begin
                          if OpenDialog1.Execute then
                           begin
                            sFileName:=OpenDialog1.FileName;
                            if sFileName<>'' then
                             begin
                              ClearStringGrid;
                              BuildGridFromFile(sFileName);
                             end;
                           end;
                         end;
                end;
                sbExecRecord.Enabled:=StringGrid1.RowCount>1;
               end;
  btnOptions : begin
                with Sender as tRxSpeedButton do
                 begin
                  pt.x:=0;
                  pt.y:=Height;
                  pt:=ClientToScreen(pt);
                 end;
                popupOptions.Popup(pt.x,pt.y);
               end;
  btnRecord  : begin
                  if tfRemittanceHeader.Create(Self).Execute(sCustomerName,sProducerName, nCustomerID, nProducerID) then    //KVB
                     if tfRemittanceRecord.Create(Self).Execute(nCustomerID, nProducerID, StringGrid1) then
                        begin
                           TfmFileAttachmentImport.MarkAttachmentAsRead(FFileName);
                           StringGrid1.Font.Color := clRed;
                           //   17/10/18 [V5.8 R4.0] /MK Change - Set the Save button as not enabled after reading in the file.
                           sbExecRecord.Enabled := False;
                        end;
               end;
 end;
end;

procedure TfRemittance.FromEmail1Click(Sender: TObject);
begin
 tMenuItem(Sender).Checked:=True;
end;

procedure TfRemittance.RemoveStringGridLine(nRow : Integer);
var
   nLoop : integer;
begin
 for nLoop:=nRow+1 to StringGrid1.RowCount-1 do
  begin
   StringGrid1.Cells[0,nLoop-1]:=StringGrid1.Cells[0,nLoop];
   StringGrid1.Cells[1,nLoop-1]:=StringGrid1.Cells[1,nLoop];
   StringGrid1.Objects[0,nLoop-1]:=StringGrid1.Objects[0,nLoop];
   StringGrid1.Objects[1,nLoop-1]:=StringGrid1.Objects[1,nLoop];
  end;
 StringGrid1.RowCount:=StringGrid1.RowCount-1;
end;

function TfRemittance.AddStringGridLine(sCol1,sCol2 : string) : integer;
var
   nThisRow : integer;

function MaxInt(n1,n2 : integer) : integer;
asm
 push ebx
 mov eax,n1;
 mov ebx,n2;
 cmp eax,ebx
 jg @end
 mov eax,ebx
@end:
 pop ebx
end;

begin
 with StringGrid1 do
  begin
   nThisRow:=RowCount-1;
   Cells[0,nThisRow]:=sCol1;
   Cells[1,nThisRow]:=sCol2;

   ColWidths[0]:=MaxInt(Canvas.TextWidth(Cells[0,nThisRow])+20,ColWidths[0]);
   ColWidths[1]:=MaxInt(Canvas.TextWidth(Cells[1,nThisRow])+20,ColWidths[1]);

   Result:=nThisRow;
   RowCount:=RowCount+1;
  end;
end;

procedure TfRemittance.ClearStringGrid;
var
   nLoop : integer;
begin
 for nLoop:=0 to StringGrid1.RowCount-1 do
  StringGrid1.Rows[nLoop].Clear;
 StringGrid1.RowCount:=0;
 StatusBar1.SimpleText:='';
 Timer1.Enabled:=False;
 sbExecRecord.Enabled:=False;
end;

function  TfRemittance.ContainsUnknownCarcase : boolean;
begin
 Result:=StringGrid1.Cols[0].IndexOfObject(pointer(2))<>-1;
end;

{-----------------------------------------------------
  [daz] Interface to Text File
 -----------------------------------------------------}


procedure TfRemittance.BuildGridFromFile(FileName : String);
var
   sl : tStringList;

   nLoop,nLoop2 : integer;
   nThisRow     : integer;

   sFileVersion : string;
   sRaisedError : string;
   sName,sValue : string;

   sCountry : string;

   BRF          : tBeefRemitFile;

   NewNatIdStr  : string;

   AnimalID     : integer;

   BeefRemitSectParser : TBeefRemitSectionParser;
begin
 //sSupplierName:='';
 sCustomerName:='';       //KVB
 sProducerName:='';

 sl:=nil;
 StringGrid1.RowCount:=1;
 StringGrid1.Cells[0,0]:='';

 try
  BRF:=tBeefRemitFile.Create;
  with BRF do
   try
    if not Load(FileName) then
     begin
      sRaisedError:=format('Unable to load remittance file: %s',[FileName]);
      raise exception.create('');
     end;

    try
     sl:=tStringList.Create;
    except
     sRaisedError:='Memory Allocation Error';
     raise exception.create('');
    end;

    if not GetSectionNames(sl) then
     begin
      sRaisedError:='Invalid Sales Format';
      raise exception.create('');
     end;

    try
     BeefRemitSectParser := TBeefRemitSectionParser.Create;
     with BeefRemitSectParser do
      try
       LoadSection(sl[0]);
       Assign(BRF.SectionContents,nDefIdentiferWidth);
       if not IdentifierByName('FILE VERSION',sFileVersion) then
        begin
         sRaisedError:='Invalid Sales Format';
         raise exception.create('');
        end;

       try
        // exception raised on either sFileVersion not being a valid integer,
        // or FileVersion <> 1.
        if strtoint(sFileVersion) <> 1 then
         raise exception.create('');
       except
        sRaisedError:='Invalid Sales Format File Version';
        raise exception.create('');
       end;

       //IdentifierByName('CREATED BY',sSupplierName);
       //sSupplierName:=Trim(sSupplierName);
       IdentifierByName('CREATED BY',sCustomerName);     //KVB
       sCustomerName:=Trim(sCustomerName);

       IdentifierByName('COUNTRY',sCountry);     //KVB
       sCountry := Trim(sCountry);

       if sCountry = 'GB' then
          BeefRemitCarcaseLineType := clGB
       else
          BeefRemitCarcaseLineType := clIrl;

       for nLoop:=0 to sl.count-1 do
        begin
         // this is a waste to (re)process section 1,
         // but this makes implementation easier ;)
         LoadSection(sl[nLoop]);
         Assign(BRF.SectionContents,nDefIdentiferWidth);

         AddStringGridLine('***',sl[nLoop]);
         AddStringGridLine('','');

         for nLoop2:=0 to SectionContents.Count-1 do
          begin
           if not IdentifierByPos(nLoop2,sName,sValue) then
            continue
           else
            with StringGrid1 do
             begin

              if sProducerName='' then
               begin
                  IdentifierByName('PRODUCER NAME',sProducerName);
                  sProducerName:=Trim(sProducerName);
               end;

              nThisRow:=AddStringGridLine(sName,sValue);
              Objects[0,nThisRow] := nil; // = 0 or False

              if copy(sName,1,7) = 'CARCASE' then    //Lines with "CARCASS COUNT" and "CARCASS TOTALS" producing an error message when running through Delphi - KVB
                 begin
                    delete(sName,1,7);
                    sName:=trim(sName);
                    try
                     strtoint(sName);
                     Objects[0,nThisRow]:=pointer(1); // = 1 or True

                     // Ok so we have the carcase here, so lets examine the
                     // carcase number to see if it is one of ours
                     // WinData.CheckNatID( NatIDStr : String; var NewId : String; FromReport : Boolean ) : Boolean;
                     if GetWordCount(sValue)>0 then
                      begin
                       with tBeefRemitCarcaseLine.Create(BeefRemitCarcaseLineType) do
                        begin
                           Load(sValue);
                           NewNatIdStr:=National;
                           free;
                        end;

                       //   17/10/18 [V5.8 R4.0] /MK Additional Feature - Pass in form variable, FReImportFile, to CarcaseExists to allow the file to be read in again.
                       AnimalID:=CarcaseExists(NewNatIdStr,FReImportFile);
                       Objects[1,nThisRow]:=pointer(AnimalID);
                       if ( AnimalID = -1 ) then
                          Objects[0,nThisRow]:=pointer(2);
                      end;

                    except

                    end;
                 end;
              end;
          end;
         with StringGrid1 do
          begin
           RowCount:=RowCount+1;
           Cells[0,RowCount-1]:='';
           Cells[1,RowCount-1]:='';
          end;
        end;
      finally
       FreeAndNil(BeefRemitSectParser);
      end;
    except
     raise exception.create('')
    end;

   finally
    if assigned(sl) then
     sl.free;
    free;
   end;
 except
  on e:exception do
   Application.MessageBox(pchar(sRaisedError),
                          'Error Loading Sales File',
                          MB_ICONERROR + MB_OK);
 end;

 Timer1.Enabled:=ContainsUnknownCarcase;
end;

{-----------------------------------------------------
  [daz] Interface to Database Remittance Details
 -----------------------------------------------------}

procedure TfRemittance.StringGrid1DrawCell(Sender: TObject; Col,
  Row: Integer; Rect: TRect; State: TGridDrawState);
var
   n,
   aCol,
   aRow : integer;

begin
 n:=integer(tStringGrid(Sender).Objects[0,Row]);
 aCol:=Col;
 aRow:=Row;
 with Sender as tStringGrid do
  begin
   case n of
    0 : if gdSelected in State then
         begin
          canvas.Brush.color:=clBtnHighlight;
          canvas.Font.Color:=clBtnText;
         end;
    1 : ;
    2 : if not (gdSelected in State) then
         begin
          canvas.Brush.color:=clWindow;
          canvas.Font.Color:=clRed;
         end;
    end;
   canvas.fillrect(rect);
   canvas.textout(rect.left+1,rect.top+1,Cells[aCol,aRow]);
  end;
end;

procedure TfRemittance.Timer1Timer(Sender: TObject);
var
   s : string;
begin
   with StatusBar1 do
      if ( SimpleText <> '' )then
         SimpleText := ''
      else
         //   06/02/15 [V5.4 R2.6] /MK Change - Changed simple text to show user what possible reasons are why that tag number can't be found.
         SimpleText:= 'Remittance Docket contains National Animal ID Numbers that '+
                      'cannot be found in your database i.e. animals may not have been '+
                      'purchased or is has already been sold or has been moved temporarily.';
end;

procedure TfRemittance.StringGrid1DblClick(Sender: TObject);
// These consts are the reply values from RemitanceAnimal Properties dialog
const
     RMProp_Cancel = 0;
     RMProp_OK     = 1;
     RMProp_Delete = 2;
     RMProp_Change = 3;

var
   nRow  : integer;
   sLine : string;

   AnimalID    : integer;
   NewNatIDStr : string;

   nResult : integer;
begin
 with Sender as tStringGrid do
  begin
   nRow:=Selection.Top;
   if objects[0,nRow] <> nil then
    begin
     sLine:=Cells[1,nRow];
     nResult:=tfAnimalRemittanceProp.Create(Self).Execute(sLine,objects[0,nRow]<>pointer(1));
     case nResult of
      RMProp_Cancel : ;// No Changes;
      RMProp_OK     : begin
                       // Change line
                       StringGrid1.Cells[1,nRow] := sLine;
                       // Now have to re-code the object[0/1,nRow] values ;(
                       Objects[0,nRow]:=pointer(1); // = 1 or True

                       with tBeefRemitCarcaseLine.Create(BeefRemitCarcaseLineType) do
                        begin
                         Load(sLine);
                         NewNatIdStr:=National;
                         free;
                        end;

                        //   17/10/18 [V5.8 R4.0] /MK Additional Feature - Pass in form variable, FReImportFile, to CarcaseExists to allow the file to be read in again.
                        AnimalID:=CarcaseExists(NewNatIdStr,FReImportFile);
                        Objects[1,nRow]:=pointer(AnimalID);
                        if AnimalID = -1 then
                         Objects[0,nRow]:=pointer(2);

                      end;
      RMProp_Delete : begin
                       RemoveStringGridLine(nRow); // delete complete line
                      end;
     end;

     StatusBar1.SimpleText:='';
     Timer1.Enabled:=ContainsUnknownCarcase;
    end
   else
    beep;
  end;
end;

procedure TfRemittance.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
   key:=#0;
   StringGrid1DblClick(StringGrid1);
  end
end;

procedure TfRemittance.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_DELETE then
  begin
   with StringGrid1 do
    if objects[0,Selection.Top] <> nil then
     if  Application.MessageBox(pchar('Removing this item from the Remittance Docket will '+
                                      'result in an incorrect total and/or incorrect deductions.'+#10#13#10#13+
                                      'Are you sure ?'),
                                      'Delete Carcase from Sales Docket',
                                MB_ICONWARNING + MB_YESNO) = idYES then
      begin
       RemoveStringGridLine(Selection.Top); // delete complete line
       StatusBar1.SimpleText:='';
       Timer1.Enabled:=ContainsUnknownCarcase;
      end;
  end;

end;

procedure TfRemittance.sbReviewClick(Sender: TObject);
var
   nSaleGrpsID : integer;
begin
 nSaleGrpsID:=TfRemittanceReview.Create(Self).Execute;
 if nSaleGrpsID<>-1 then
  begin
   BuildGridFromDatabase(nSaleGrpsID);
  end;
end;

procedure TfRemittance.BuildGridFromDatabase(nSalegrpsID : integer);
var
   SaleGrpDate : TDateTime;
   s           : string;
   qry         : tquery;
begin
 ClearStringGrid;
 qry:=tquery.create(self);
 with qry do
  try
   databasename:='kingswd';
   sql.text:='select * from salegrps where SaleGrps_ID = :SaleGrps_ID';
   params[0].asInteger:=nSaleGrpsID;
   open;
   if eof and bof then
    exit;
   SaleGrpDate:=fieldbyname('FileDate').asDateTime;
   sql.text:='select * from salegrps where FileDate = :FileDate order by SaleGrps_ID';
   params[0].asDatetime:=SaleGrpDate;
   open;

   AddStringGridLine('***','[FILE START]');
   AddStringGridLine('FILE DATE',fieldbyname('FileDate').asString);
   AddStringGridLine('FILE TYPE',fieldbyname('FileType').asString);
   AddStringGridLine('FILE VERSION',fieldbyname('FileVersion').asString);

   with tQuery.Create(Self) do
    try
     databasename:='kingswd';
     //sql.text:='select * from SuppliersBreeders where id = :id';
     sql.text:='select * from Customers where id = :id';      //KVB
     params[0].asInteger:=qry.fieldbyname('FileCreatedBy').asInteger;
     open;
     if not (eof and bof) then
      s:=fieldbyname('Name').asString
     else
      s:='';
    finally
     free;
    end;

   AddStringGridLine('CREATED BY',s);
   AddStringGridLine('REMITTANCE COUNT',fieldbyname('RemittanceCount').asString);
   AddStringGridLine('','');

   while not eof do
    begin
     AddStringGridLine('***','[REMITTANCE START]');
     AddStringGridLine('REMITTANCE NUMBER',FieldByName('RemittanceNumber').asString);
     AddStringGridLine('REMITTANCE DATE',FieldByName('RemittanceDate').asString);
     AddStringGridLine('SLAUGHTER DATE',FieldByName('SlaughterDate').asString);
     AddStringGridLine('LOT REFERENCE',FieldByName('LotReference').asString);
     AddStringGridLine('PRODUCER REFERENCE',FieldByName('ProducerReference').asString);

     with tQuery.Create(Self) do
      try
       databasename:='kingswd';
       //sql.text:='select * from SysUsers where id = :id';
       sql.text:='select * from Owners where id = :id';       //KVB
       params[0].asInteger:=qry.fieldbyname('Customer_Id').asInteger;    //KVB Darren is Customer_ID as HerdID
       open;
       if not (eof and bof) then
        s:=fieldbyname('Name').asString
       else
        s:='';
      finally
       free;
      end;
     AddStringGridLine('PRODUCER NAME',s);


     AddStringGridLine('CARCASE COUNT',FieldByName('CarcaseCount').asString);
     AddStringGridLine('','');

     with tquery.create(self) do
      try
       databasename:='kingswd';
       sql.text:='select * from grps g '+
                 'left outer join grplinks gl on (gl.groupid = g.id) '+
                 'left outer join animals a on (gl.animalid = a.id) '+
                 'left outer join events e on (e.animalid = gl.animalid) '+
                 'left outer join salesdeaths sd on (e.id = sd.eventid) '+
                 'where g.id = :id and e.eventtype = :eventtype and salegrps_id is not null';
       params[0].asInteger:=qry.fieldbyname('group_id').asInteger;
       params[1].asInteger:=cSaleDeathEvent;
       open;
       //AddStringGridLine('','Ear Tag Number     Carc No.  Sex  Grad    Left Wt.    Right Wt.   Condemned    Cold Wt.    Price /Kg           Value');
       AddStringGridLine('','Ear Tag Number     Carc No.  Sex  Grad    Left Wt.    Right Wt.   Condemned    Cold Wt.    Price /Kg      Value');     //KVB
       while not eof do
        begin

         AddStringGridLine('CARCASE',PadRight(FieldByName('NatIDNum').asString,#32,17)+'  '+
                                     //PadLeft(FieldByName('CarcassNum').asString,#32,8)+'  '+       //KVB - needs changing
                                     PadRight(FieldByName('KillNumber').asString,#32,8)+'  '+      //KVB
                                     PadRight(FieldByName('CarcassSex').asString,#32,3)+'  '+
                                     PadRight(FieldByName('Grade').asString,#32,4)+'  '+
                                     PadLeft(FieldByName('LeftWt').asString,#32,10)+'   '+
                                     PadLeft(FieldByName('RightWt').asString,#32,10)+'  '+
                                     PadLeft(FieldByName('CondemnedWt').asString,#32,10)+'   '+
                                     PadLeft(FieldByName('ColdDeadWt').asString,#32,9)+'   '+
                                     PadLeft(FieldByName('PricePerKg').asString,#32,10)+''+     //KVB
                                     PadLeft(FieldByName('Price').asString,#32,11));

         next;
        end;
       close;

      finally
       free;
      end;

      AddStringGridLine('','');
      AddStringGridLine('TOTAL VALUE',fieldbyname('TotalValue').asString);
      AddStringGridLine('TOTAL DEDUCTIONS',fieldbyname('TotalDeductions').asString);
      AddStringGridLine('CHEQUE AMOUNT',fieldbyname('PaymentAmt').asString);
      AddStringGridLine('CHEQUE NUMBER',fieldbyname('PaymentNum').asString);
      AddStringGridLine('','');


      with tquery.create(Self) do
       try
        databasename:='kingswd';
        sql.text:='select * from deductions where salegrps_id = :salegrps_id order by deduction_id';
        params[0].asInteger:=nSaleGrpsID;
        open;

        AddStringGridLine('','Description            Details                    Deducted        VAT');
        while not eof do
         begin
          AddStringGridLine('DEDUCTIONS',padright(fieldbyname('Description').asString,#32,20)+'   '+
                                         padright(fieldbyname('Details').asString,#32,24)+'   '+
                                         padleft(fieldbyname('Deducted').asString,#32,8)+'   '+
                                         padleft(fieldbyname('VAT').asString,#32,8));

          next;
         end;

        close;
       finally
        free;
       end;


     next;
    end;

   close;
  finally
   free;
  end;
end;


procedure TfRemittance.cbDefaultHerdChange(Sender: TObject);
begin
   if cbDefaultHerd.Value = '' then Exit;
      begin
         if WinData.UserDefaultHerdID <> StrToInt(cbDefaultHerd.Value) then
            begin
               WinData.UserDefaultHerdID := StrToInt(cbDefaultHerd.Value);
               WinData.UserDefaultHerdID;  // Set the UserHerdType
            end;
      end;
end;

procedure TfRemittance.FormCreate(Sender: TObject);
begin
   CreateDir('C:\Kingswood Inward Files');
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph, cBtnImgHelp);
   cbDefaultHerd.LookupSource := WinData.dsHerdDefaults;
   if not uUpdateTables.CreateCrushTables then
      raise Exception.Create('Unable to create temp tables, contact Kingswood');
   ShowToolBarOptions;
   FReImportFile := False;
   sbReImportFile.Enabled := False;
end;

procedure TfRemittance.sbReImportFileClick(Sender: TObject);
begin
   try
      FReImportFile := True;
      if ( UpperCase(ExtractFileExt(FFileName)) = '.CSV' ) then
         begin
            ClearStringGrid;
            BuildGridFromFile(fRemittanceLoad.ProcessCSVFile(FFileName));
         end
      else
         begin
            ClearStringGrid;
            BuildGridFromFile(FFileName);
         end;
      if tfRemittanceHeader.Create(Self).Execute(sCustomerName,sProducerName, nCustomerID, nProducerID) then
         if tfRemittanceRecord.Create(Self).Execute(nCustomerID, nProducerID, StringGrid1) then
            begin
              TfmFileAttachmentImport.MarkAttachmentAsRead(FFileName);
              StringGrid1.Font.Color := clRed;
            end;
   finally
      FReImportFile := False;
      sbReImportFile.Enabled := False;
   end;
end;

procedure TfRemittance.SendEmail(AMartName: String);
const
    LineBreak = #13#10;
    DoubleLineBreak = LineBreak + LineBreak;
var
   HerdIdentity,
   EmailName,
   EmailAddress,
   PostalAddress,
   HerdIdentifier : String;
   iAddress : packed array [1..4] of string;
   i : Integer;
   SlaughterPlant : string;

   ToAddress, CCAddress, MessageSubject, MessageBody : string;

begin
   ToAddress := '';
   CCAddress := '';
   MessageSubject := '';
   MessageBody := '';

   If (( cbDefaultHerd.Value = IntToStr(WinData.NONEHerdID) ) OR ( cbDefaultHerd.Value = '0' )) then
      begin
         MessageDlg('Please select a Herd', mtInformation, [mbOK], 0 );
         Exit;
      end;

   try
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('SELECT O.Name, O.HerdIdentity, O.HerdIdentifier, O.Address1, O.Address2, O.Address3, O.Address4, O."E-Mail" FROM Owners O ');
      MyQuery.SQL.Add('Where (ID = ' + cbDefaultHerd.Value + ')' );
      MyQuery.Open;
      MyQuery.First;
      HerdIdentifier := (MyQuery.FieldByName('HerdIdentifier').AsString);
      HerdIdentity := (MyQuery.FieldByName('HerdIdentity').AsString);
      EmailName := (MyQuery.FieldByName('Name').AsString);

      //   28/08/18 [V5.8 R2.5] /MK Bug Fix - Body of the email should contain the Mailbox username if Default Mail Client is Gmail.
      if ( WinData.DefaultEmailClient = cEmailClient_GMail ) then
         EmailAddress := WinData.MailboxConfigAccountName
      else
         EmailAddress := (MyQuery.FieldByName('E-Mail').AsString);

      iAddress[1] := (Trim(MyQuery.FieldByName('Address1').AsString));
      iAddress[2] := (Trim(MyQuery.FieldByName('Address2').AsString));
      iAddress[3] := (Trim(MyQuery.FieldByName('Address3').AsString));
      iAddress[4] := (Trim(MyQuery.FieldByName('Address4').AsString));

      while Pos(',', iAddress[1]) > 0 do
         Delete( iAddress[1], Pos(',', iAddress[1]), 1);
      while Pos(',', iAddress[2]) > 0 do
         Delete( iAddress[2], Pos(',', iAddress[2]), 1);
      while Pos(',', iAddress[3]) > 0 do
         Delete( iAddress[3], Pos(',', iAddress[3]), 1);
      while Pos(',', iAddress[4]) > 0 do
         Delete( iAddress[4], Pos(',', iAddress[4]), 1);

   finally
      //
   end;

   if iAddress[4] <> '' then
      PostalAddress := iAddress[1] + ', ' + iAddress[2]  + ', ' + iAddress[3]  + ', ' + iAddress[4] + DoubleLineBreak
   else if iAddress[3] <> '' then
      PostalAddress := iAddress[1] + ', ' + iAddress[2]  + ', ' + iAddress[3] + DoubleLineBreak
   else if iAddress[2] <> '' then
      PostalAddress := iAddress[1] + ', ' + iAddress[2] + DoubleLineBreak
   else if iAddress[1] <> '' then
      PostalAddress := iAddress[1] + DoubleLineBreak
   else
      begin
         MessageDlg('No postal address has been found.'+cCRLF+cCRLF+
                    'Please save the postal address in Herd Setup before continuing',mtWarning,[mbOK],0);
         uHerdSetUp.ShowTheForm( False );
         Exit;
      end;

   SlaughterPlant := TfmRemittanceMarts.SelectMart(AMartName);

   if Trim(SlaughterPlant) = '' then
      begin
         MessageDlg('Cannot proceed with registration until slaughter plant name is entered.',mtInformation,[mbOK],0);
         Exit;
      end;

   if AMartName = iRemittanceMarts[2] then
      begin
         ToAddress := 'beeflairage@dawnmeats.com';
      end
   else if AMartName = iRemittanceMarts[1] then
      begin
         //   24/11/14 [V5.3 R9.0] /MK Additional Feature - Change of email address for ABP.
         ToAddress := 'paul.matthews@abpireland.com';
      end
   else if AMartName = iRemittanceMarts[3] then
      begin
         ToAddress := 'liffeypayments@liffeymeats.ie';
      end
   else if AMartName = iRemittanceMarts[0] then
      begin
         ToAddress := 'nigel.elliott@kepak.com';
      end
   else if AMartName = iRemittanceMarts[4] then
      begin
         ToAddress := 'rdraffin@dunbia.com';
      end
   else if AMartName = iRemittanceMarts[5] then
      begin
         ToAddress := 'ballonmeats@iol.ie';
      end
   else if AMartName = iRemittanceMarts[6] then
      begin
         ToAddress := 'eamon@slaney.com';
      end
   else if AMartName = iRemittanceMarts[7] then
      begin
         //   21/05/15 [V5.4 R7.0] /MK Additional Feature - Added Ashbourne to pmRemitMarts list - email address from emails in Anne Ryan's Gmail inbox.
         ToAddress := 'reception@ashmeats.ie';
      end
   else if AMartName = iRemittanceMarts[8] then
      begin
         ToAddress := 'livestock@jenningsmeat.com';
      end
   else
      begin
         MessageDlg('Failed to send email. An unknown email address has been specified.',mtError,[mbOk],0);
         SysUtils.Abort;
      end;

   CCAddress := KingswoodEmailAddress;
   MessageSubject := 'Send Sales Details';
   MessageBody := 'Name: ' + EmailName + LineBreak + LineBreak +
                  'Herd Number (BTE): ' + HerdIdentity + DoubleLineBreak +
                  'Address: ' + PostalAddress + 
                  'E-Mail Address: ' + EmailAddress + DoubleLineBreak +
                  'Slaughter Plant: ' + SlaughterPlant;
   WinData.SendSimpleEmail(ToAddress, CCAddress, MessageSubject, MessageBody);

end;

procedure TfRemittance.DawnMeats1Click(Sender: TObject);
begin
   SendEmail(iRemittanceMarts[DawnMeats1.Tag]);
end;

procedure TfRemittance.AIBP1Click(Sender: TObject);
begin
   SendEmail(iRemittanceMarts[AIBP1.Tag]);
end;

procedure TfRemittance.LiffeyMeats1Click(Sender: TObject);
begin
   SendEmail(iRemittanceMarts[LiffeyMeats1.Tag]);
end;

procedure TfRemittance.Keepak1Click(Sender: TObject);
begin
   SendEmail(iRemittanceMarts[Keepak1.Tag]);
end;

procedure TfRemittance.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('factorysales.htm');
end;

procedure TfRemittance.Ballon1Click(Sender: TObject);
begin
   SendEmail(iRemittanceMarts[Ballon1.Tag]);
end;

procedure TfRemittance.Dunbia1Click(Sender: TObject);
begin
   SendEmail(iRemittanceMarts[Dunbia1.Tag]);
end;

procedure TfRemittance.ExecuteFile(AFileName: string);
begin
   if ( FileExists(AFileName) ) then
      begin
         FFileName := AFileName;
         ShowModal;
      end
   else
      MessageDlg(Format(cMsg_FileNotFound,[AFileName]),mtError,[mbOK],0);
end;

procedure TfRemittance.sbKillOutPercsClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfmSalesKillOutPercs,fmSalesKillOutPercs);
      fmSalesKillOutPercs.ShowModal;
   finally
   end;
end;

procedure TfRemittance.ShowToolBarOptions;
begin
   //   18/03/14 [V5.2 R9.0] /MK Additional Feature - Disable sbRecord and sbReview if Mail Attachment import.
   sbRecord.Enabled := ( not(WinData.GlobalSettings.DownloadMailAttachments) );
   sbReview.Enabled := sbRecord.Enabled;
end;

procedure TfRemittance.SlaneyMeats1Click(Sender: TObject);
begin
   SendEmail(iRemittanceMarts[SlaneyMeats1.Tag]);
end;

procedure TfRemittance.pmiAshbourneClick(Sender: TObject);
begin
   SendEmail(iRemittanceMarts[pmiAshbourne.Tag]);
end;

procedure TfRemittance.FileTimerTimer(Sender: TObject);
begin
   FileTimer.Enabled := False;
   if ( Length(FFileName) = 0 ) then Exit;
   try
      if ( UpperCase(ExtractFileExt(FFileName)) = '.CSV' ) then
         begin
            ClearStringGrid;
            BuildGridFromFile(fRemittanceLoad.ProcessCSVFile(FFileName));
         end
      else
         begin
            ClearStringGrid;
            BuildGridFromFile(FFileName);
         end;
   finally
      sbExecRecord.Enabled := ( not(ContainsUnknownCarcase) );
      sbReImportFile.Enabled := ( not(sbExecRecord.Enabled) ) and ( BeefRemitCarcaseLineType = clIrl );
   end;
end;

procedure TfRemittance.FormActivate(Sender: TObject);
begin
   FileTimer.Enabled := True;
end;

procedure TfRemittance.pmiMartinJenningsClick(Sender: TObject);
begin
   SendEmail(iRemittanceMarts[pmiMartinJennings.Tag]);
end;

end.
