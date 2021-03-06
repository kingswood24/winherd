{
   -----------------------------------------------------
    [daz] Note: Regarding Database Component.
                WinData already contains a database
                component. However that component
                contains the same AliasName and
                DatabaseName (with different case).
                This can cause confusion so I
                have created one on this form. Its
                not really good practice and is a
                fix for the time being.


    NB   Darren is using Customer_Id in SaleGrps.db to hold HerdID

   -----------------------------------------------------

   20/04/11 [V4.0 R9.8] /MK Bug Fix - If Vat Registered Then If Price and ColdDeadWeight Then Calculate PricePerKg
                                      On Converted Price From Vat Divided By ColdDeadWeight On The File.

   25/05/11 [V4.1 R1.6] /MK Additional Feature - Take The KillOut% From KillOutPercs Table.
                                               - Create Live Weight From KillOut% and ColdDeadWeight.

   21/06/11 [V4.1 R2.0] /MK Bug - Fix For If More Than One Kill Out Animal Type

   06/12/11 [V5.0 R2.5] /MK Bug Fix - Embedded Procedure ReNumberAnimalNo Added To PostEventData.

   12/11/12 [V5.1 R0.9] /MK Additional Feature - PostSalesDeath - Added CrushXMLExport function.
                                                                - Added new Variables for EventDate and AnimalID for CrushXMLExport.

   03/11/15 [V5.4 R9.9] /MK Bug Fix - PostEventData - Setting the IsSynchronized was coded incorrectly.

   05/05/17 [V5.6 R8.0] /MK & SP Change - Added ApplicationLog.LogExceptions in try except e.Exception sequences.
                                        - Moved RMTTable to be a private variable of the unit.
                                        - FreeAndNil RMTTable in PostEventData after PostSalesDeath
                                        - Added DBISaveChanges where possible for RMTTable i.e. SalesDeaths table, and events table.

   12/12/17 [V5.7 R6.3] /MK Bug Fix - PostSalesDeath - Transport costs of the customer were not being added to the deductions from the remittance file.
   13/12/17 [V5.7 R6.3] /MK Bug Fix - PostSalesDeath - TotalDeductions from the individual line on a CSV formatted file were being added to the TotalDeductions field
                                                       on the SalesRecord. TotalDeductions on an RMT file footer were added to the CustomerCosts field.
                                                       Change so that the TotalDeductions on the CSV file to go to the CustomerCosts field along with Transport.

   19/12/17 [V5.7 R6.3] /MK Additional Feature - PostSalesDeath - If new preference is enabled then bring in the live weight and date from last weighing - Tim Meagher.

   22/12/17 [V5.7 R6.4] /MK Change - PostSalesDeath - Only use last weight if preference is ticked and last weight is within 3 days of sale date - Matt Ward/GL request.

   23/01/18 [V5.7 R6.6] /MK Change - PostSalesDeath - Should be less or equal to today - Matt Ward.

   17/04/18 [V5.7 R8.8] /MK Change - Replaced the PostEventData function from PostFactoryDockets with new CreateSaleWithTEventClass procedure that uses TSaleDeathEvent TEvent class.
                                   - New procedure also has a progress bar to indicate the import of the records - this was required for large files.

   25/04/18 [V5.7 R9.0] /MK Bug Fix - CreateSaleWithTEventClass - sPreSale Event was not update with new sale figures after move to TEvent class.

   07/06/18 [V5.8 R0.6] /MK Change - AddAnimalToXMLFile - Add NationalID number to CrushXML file.

   27/09/18 [V5.8 R3.0] /MK Bug Fix - PostFactoryDockets - Moved CreateSaleWithTEventClass into RemittanceCount loop.
                                    - CreateSaleWithTEventClass - Need to pass in the ASectionIndex for multiple dockets on one file.

   03/10/18 [V5.8 R3.0] /MK Change - CreateSaleWithTEventClass - Moved update of presale event into a seperate sub function of CreateSaleWithTEventClass for readability.
                                                               - Seperate CrushXMLExport from TSaleDeathEvent class routine.

   17/10/18 [V5.8 R4.0] /MK Change - Changed CreateSaleWithTEventClass UpdatePreSaleEvent to UpdateSaleInfo with variable for AIsPreSale to be passed in if a presale event is found.
                            Additional Feature - CreateSaleWithTEventClass - Update an existing sale record if an existing sale (not presale) record is found.

   08/04/19 [V5.8 R8.7] /MK Bug Fix - UpdateSaleInfo - When Re-Saving the Factory File the LiveWeight was not being added from either the ColdDead and Kill Out
                                                       or from a previous weighing weight and date.

   16/08/19 [V5.9 R0.0] /MK Change - CreateSaleWithTEventClass - ExportToXML - If Crush user then sometimes a presale record will appear before the actual sale.
                                                                               Pass in the actual sale date to get the sale info rather than the presale info.

   14/10/19 [V5.9 R0.9] /MK Additional Feature - CreateSaleWithTEventClass - Remove Transponder No if Parlour and RemoveTransponderAfterSale preference.

   15/11/19 [V5.9 R1.2] /MK Bug Fix - UpdateSaleInfo - Not allowing for the scenario where the EventID does not exist in the SaleDeaths table - John Sinnott.

   01/07/20 [V5.9 R5.0] /MK Bug Fix - GetCustomerCosts - Sometimes the AvgFactoryDeductPerAnimal and TotDeductions can be the same value, if they are use it - Una Carter.

   21/08/20 [V5.9 R5.5] /MK Additional Feature - When new preference "Use purchase weight as live weight for Kill out" is ticked
                                                 - take purchase weight, if any any calculated Kill Out % based on the purchase weight as live weight.
                                                 - don't calculate kill out %, if there is no purchase weight, from Kill Out calculator.
}

unit uRemittanceRecord;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, db, dbtables, uCrush, uKillOutCalculator,
  KRoutines, EventRecording, Def, uCrushXML, uApplicationLog, BDE,
  uAnimal, uHerdLookup, uProgressIndicator, uEventDataHelper;

type
  TfRemittanceRecord = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    PnlWarnings: TPanel;
    Label2: TLabel;
    PnlRecording: TPanel;
    Memo1: TMemo;
    PnlPressOK: TPanel;
    Database1: TDatabase;
    procedure bOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    //nSupplierID,
    nCustomerID,           //KVB
    nProducerID : integer;
    Duplicate : Boolean;  //KVB
    slRemitFile : tStringList;
    NumCarcasses : Integer;  //KVB 14/08/2000
    TotDeductions : Double;  //KVB 14/08/2000
    AvgFactoryDeductPerAnimal : Double;  //KVB 14/08/2000

    // Header Variables
    fDate,             //KVB
    sDate,
    sFileType,
    sFileVersion,
    sFileCreatedBy   : string;
    nRemittanceCount : Integer;
    FKillOutCalculator : TKillOutCalculator;

    RMTTable : TTable;  //KVB  18/09/2000

    procedure BuildRemitFile(SG : tStringGrid);
    procedure CreateSaleWithTEventClass(ASalesGroupID, ASectionIndex : Integer);

    function  PostFactoryDockets : boolean;
    function  PostGrps : Integer;
    function  PostGrpLinks(nGrpId : integer;slAnimalDetails : tStringList) : boolean;
    function  PostSaleGrps(nGrpId : integer;nSectionIndex : integer) : integer;   //KVB  18/09/2000
    function  PostDeductions(nSalesGrpID : integer;slSection : tStringList) : boolean;
    function  PostEventData(nSaleGrpsID : integer;nSectionIndex : integer) : boolean;
    function  PostSalesDeath(nEventID : Integer; ASex : String; AAnimalID, ALactNo, ABreedID, nSaleGrpsID : Integer;
         nVATReg : Boolean; nVATRate : Double; sLine : string; AEventDate : TDateTime) : boolean;   //KVB  18/09/2000
    function  ContainsUnknownCarcase : boolean;
    function  ContainsDuplicateCarcase : boolean;
    function  DocketAlreadyPosted      : boolean;
  public
    function  Execute(nCustomerID, nProducerID : integer;
                      SGData : tStringGrid) : boolean;           //KVB
  end;

var
  fRemittanceRecord: TfRemittanceRecord;

implementation

{$R *.DFM}
uses
    DairyData, DaZMisc, BeefRemitLine, uRemittance, GenTypesConst;

procedure TfRemittanceRecord.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TfRemittanceRecord.BuildRemitFile(SG : TStringGrid);
var
   nLoop : integer;

begin
 slRemitFile.Clear;
 for nLoop:=0 to Sg.RowCount-1 do
  begin
   if Trim(Sg.Cells[0,nLoop])<>'' then // ignore blank spaces
    if Sg.Cells[0,nLoop]<>'***' then
     slRemitFile.AddObject(Sg.Cells[0,nLoop]+'='+Sg.Cells[1,nLoop],Sg.Objects[1,nLoop])
    else
     slRemitFile.Add(Sg.Cells[1,nLoop]); // Section start
  end;
end;

function TfRemittanceRecord.ContainsUnknownCarcase : boolean;
begin
 Result:=slRemitFile.IndexOfObject(pointer(-1))<>-1;
// Result:=SgData.Cols[0].IndexOfObject(pointer(2))<>-1;
end;

function TfRemittanceRecord.ContainsDuplicateCarcase : boolean;
var
   nLoop,
   nAnimalID : integer;
begin
 Result:=False;
 with tStringList.Create do
  try
   Sorted:=True;
   Duplicates:=DupError;

   try
    for nLoop:=0 to slRemitFile.Count-1 do
     begin
      nAnimalID:=integer(slRemitFile.Objects[nLoop]);
      if nAnimalID>0 then
       Add(inttostr(nAnimalID));
     end;
   except
    Result:=True;
   end;

  finally
   free;
  end;
end;

function  TfRemittanceRecord.DocketAlreadyPosted      : boolean;
var
   sDocketDate : string;
begin
 sDocketDate:=slRemitFile.Values['FILE DATE'];
 if sDocketDate = '' then sDocketDate := FormatDateTime('dd-mm-yyyy hh:mm:ss',now);
 if sDocketDate<>'' then
  begin
   with tquery.create(Self) do
    try
     databasename:='KWLocal';
     sql.text:='select * from SaleGrps where FileDate = :fileDate';
     params[0].asDateTime:=RemitFileDateToDateTime(sDocketDate);

     open;
     result:=not (eof and bof);
     close;
    finally
     free;
    end;
  end;
end;

//function TfRemittanceRecord.Execute(nSupplierID, nProducerID : Integer;
function TfRemittanceRecord.Execute(nCustomerID, nProducerID : Integer;
                                    SGData : tStringGrid) : boolean;        //KVB
var
   s : string;
   bWarnings : Boolean;
begin
 //self.nSupplierID:=nSupplierID;
 self.nCustomerID:=nCustomerID;     //KVB
 self.nProducerID:=nProducerID;
 slRemitFile:=tStringList.Create;
 FKillOutCalculator := TKillOutCalculator.Create;
 BuildRemitFile(SgData);
 bWarnings:=False;
 if ContainsUnknownCarcase then
  begin
   bWarnings:=True;
   s:='The factory docket contains animals not in your database. '+#$D#$A+
      'These Animals will be discarded from the docket.'+#$D#$A;
   Memo1.Lines.Add(s);
  end;

 if ContainsDuplicateCarcase then
  begin
   bWarnings:=True;
   s:='The factory docket contains duplicate animals. '+#$D#$A+
      'Only the first occurrance of each duplicate animal will be posted.'+#$D#$A;
   Memo1.Lines.Add(s);
  end;

{ if DocketAlreadyPosted then  Taken out by SP 15/07/08
  begin
   bWarnings:=True;
   Duplicate := True;  //KVB
   //s:='This factory docket already exists in your database.'+#$D#$A+
   s:='This factory docket already exists in your database.';
   // KVB decided to prevent duplicate posting of factory docket.
   //   'The old information will be removed and replaced with this information.'+#$D#$A;
   Memo1.Lines.Add(s);
  end;
}
 PnlWarnings.Visible:=bWarnings;
 PnlPressOK.Visible:=not bWarnings;

 Result:=ShowModal = mrOK;
 slRemitFile.Free;
end;

procedure TfRemittanceRecord.bOkClick(Sender: TObject);
begin
 if PnlRecording.Visible then
  begin
   Close;
   ModalResult:=mrOK;
  end
 else
  begin
   PnlWarnings.Visible:=False;
   PnlPressOk.Visible:=False;
   If ( Not Duplicate ) then    //KVB - prevents duplicate posting of Factory Docket.
    begin
     PnlRecording.Visible:=True;
     bOk.Visible:=False;

     bCancel.Visible:=False;
     PostFactoryDockets;             //KVB This is where the posting of records occurs
    End
   Else
    Begin
     Close;
     ModalResult:=mrOK;
    End;
  end;
end;

{helper function, to get the required section}
function GetSection(Index : Integer;Source, Target : TStringList) : boolean;
var
   nLoop : integer;
   nIndex  : integer;
begin
 Target.Assign(Source);
 nIndex:=0;

 // find start while removing unwanted
 while nIndex<Index do
  begin
   if Target.Count = 0 then
    break;
   if copy(Target[0],1,1) = '[' then
    inc(nIndex);
   Target.Delete(0);
  end;

 // find end
 nIndex:=-1;
 for nLoop:=1 to Target.Count-1 do
  if copy(Target[nLoop],1,1) = '[' then
   begin
    nIndex:=nLoop;
    break;
   end;

 // remove to end
 if nIndex<>-1 then
  while nIndex<Target.Count do
   Target.Delete(nIndex);
end;

function TfRemittanceRecord.PostFactoryDockets : boolean;
var
   nAnimalId       : integer;
   slAnimalDetails : tStringList;
   slHeader,
   slSection       : tstringlist;
   nLoop           : integer;
   nGrpID          : integer;
   nSaleGrpsID     : integer;
begin
   try
      slAnimalDetails := TStringList.Create();
      // firstly get a list of animals needed for posting...
      with slAnimalDetails do
         try
            slHeader:=tStringList.Create;
            slSection:=tStringList.Create;

            // Ok, heres the bit thats a pain.
            // If there are multiple remittance sections, we have to post each section
            // seperately to link the correct salegrps to the correct salesdeath.
            // Why?
            // Well otherwise there is no way to to know what salesgrp an animal
            // belongs to. It can be figured out (badly) thru' the event table, but
            // where multiple remittance sections appear, this will not be possible.

            {[1] Get a list of all animals for the grps.db and grplinks.db
                 Only one grp added, and all animals grplinked}
            for nLoop:=0 to slRemitFile.Count-1 do
               begin
                  nAnimalID:=integer(slRemitFile.Objects[nLoop]);
                  // ignore nils and -1s
                  if (nAnimalID>0) then
                     begin
                        // ignore duplicate entries
                        if ( indexofobject(pointer(nAnimalID)) = -1 ) then
                           addobject(slRemitFile[nLoop],slRemitFile.Objects[nLoop]);
                     end;
               end;

            Database1.Connected := True;
            // Start a transaction ;)
            //[2] Post the new grp and get the groupID
            nGrpID:=PostGrps;
            if ( nGrpID = -1 ) then
               raise exception.create('PostGrps() failed');
            //[3] Now using the groupID, and all animals, post the grp links
            sDate:=slRemitFile.Values['SLAUGHTER DATE']; //KVB - this date needed for GrpLinks
            if ( not(PostGrpLinks(nGrpId,slAnimalDetails)) ) then
               raise exception.create('PostGrpLinks() failed');

            {[4] Now per section we need to post the data.
                For multiple occurrances, the header information will be posted
                multiple times
            [5] Firstly build the header for possible repeated use}

            fDate:=slRemitFile.Values['FILE DATE'];      //KVB
            sFileType:=slRemitFile.Values['FILE TYPE'];
            sFileVersion:=slRemitFile.Values['FILE VERSION'];
            sFileCreatedBy:=slRemitFile.Values['CREATED BY'];
            try
               nRemittanceCount:=strtoint(slRemitFile.Values['REMITTANCE COUNT']);
            except
               nRemittanceCount := 1;
            end;

            with TQuery.Create(nil) do
               try
                  DatabaseName := 'kwLocal';
                  SQL.text:='delete from salegrps where filedate = :filedate';
                  Params[0].asDateTime:=RemitFileDateToDateTime(sDate);
                  ExecSQL;
               finally
                  Free;
               end;

            for nLoop:=1 to nRemittanceCount do
               begin
                  //[6] Post the salegrps and deductions
                  nSaleGrpsID:=PostSaleGrps(nGrpId,nLoop+1);
                  if ( nSaleGrpsID = -1 ) then
                     raise exception.create('PostSaleGrps() failed');
                  CreateSaleWithTEventClass(nSaleGrpsID,nLoop+1);
               end;

         finally
            Database1.Connected := False;
            slHeader.Free;
            slSection.Free;
            free;
         end;
   except
      PnlRecording.Caption:='An Error occurred posting the Docket Information.';
   end;
   bOk.Visible:=True;
end;

function  TFRemittanceRecord.PostGrps : Integer;
var
   sDescription : String;
   sNum : Integer;
begin
 Result:=-1;
 sDescription:=Format('Remittance: %s',
                      [slRemitFile.Values['REMITTANCE DATE']]);
 with ttable.create(self) do
  try
   databasename:='kwLocal';
   tablename:='grps.db';
   try
      open;
   except
      on e : Exception do
         ShowMessage(e.Message);
   end;
   //Need to generate a unique number for the Code  //KVB
   with tquery.create(Self) do
    begin
     databasename:='KWLocal';
     sql.text:='select max(id) from grps.db';
     open;
     sNum:=fields[0].asInteger;
     close;
     inc(sNum);
    end;
   //sNum := RecordCount;    //KVB
   insert;
   //fieldbyname('GroupType').asString:=cPurchaseGroup;
   fieldbyname('GroupType').asString:=cSalesGroup;     //KVB
   //fieldbyname('Code').asString:='';   //Can not have two Groups of the same type with the same Code
   fieldbyname('Code').asString:= 'R' + IntToStr(sNum + 1);     //KVB
   fieldbyname('Description').asString:=sDescription;
   fieldbyname('Selected').asBoolean:=False;
   fieldbyname('AdditionalData').asBoolean:=True;
   post;
   result:=fieldbyname('id').asInteger;
   close;
  finally
   free;
  end;
end;

function TFRemittanceRecord.PostGrpLinks(nGrpId : integer;slAnimalDetails : tStringList) : boolean;
var
   qryDelete : tquery;

   nLoop     : integer;
begin
 Result:=False;
 qryDelete:=tQuery.Create(self);
 qryDelete.DatabaseName:='KwLocal';
 qryDelete.Sql.text:='delete from grplinks where (animalid = :animalid) and (groupid = :groupid)';

 with tquery.create(Self) do
  try
   databasename:='KwLocal';
   sql.text:='select animalid, groupid from grplinks gl, grps g '+
             'where (gl.animalid = :animalid) '+
             'and   (gl.groupid  = g.id) '+
             'and   (g.GroupType = :groupType)';
   prepare;
   qryDelete.Prepare;
   for nLoop:=0 to slAnimalDetails.Count-1 do
    begin
     params[0].asInteger:=integer(slAnimalDetails.Objects[nLoop]);
     //params[1].asString:=cPurchaseGroup;
     params[1].asString:=cSalesGroup;   //KVB
     open;
     // Remove matching items.
     while not eof do
      begin
       qryDelete.params[0].asInteger:=fields[0].asInteger;
       qryDelete.params[1].asInteger:=fields[1].asInteger;
       qryDelete.ExecSql;
       next;
      end;
     close;
    end;
   qryDelete.UnPrepare;

   unprepare;

   sql.text:='insert into grplinks (animalid, groupid, datejoined) values (:animalid, :groupid, :datejoined)';
   prepare;
   for nLoop:=0 to slAnimalDetails.Count-1 do
    begin
     params[0].asInteger:=integer(slAnimalDetails.Objects[nLoop]);
     params[1].asInteger:=nGrpId;
     //params[2].asDateTime:=Now;
     params[2].asDateTime:=RemitFileDateToDateTime(sDate);   //KVB
     Execsql;
    end;
   unprepare;

   Result:=True;
  finally
   free;
  end;
 qryDelete.Free;
end;

function TFRemittanceRecord.PostSaleGrps(nGrpId : integer;nSectionIndex : integer) : integer;
var
   slSection : tStringList;

   // Header Variables defined globally to object

   // Section Variables
   RmNumber : Integer;
   RmDate          : tDate;
   SlaughterDate   : tDate;
   LotReference    : integer;
   CarcaseCount    : integer;
   TotalValue      : double;
   TotalDeductions : double;
   ChequeAmount    : double;
   ChequeNumber    : string;

   CrushXMLExport  : TCrushXMLExport;
begin
 Result:=-1;
 slSection:=tStringList.Create;

 // Get the section we want to work with
 GetSection(nSectionIndex,slRemitFile,slSection);

 with ttable.create(Self) do
  try
   databasename:='KWLocal';
   tablename:='salegrps.db';

   open;
   insert;

   // Header details
   fieldbyname('Group_id').asInteger:=nGrpID;
   //fieldbyname('FileDate').asDateTime:=RemitFileDateToDateTime(sDate);
   fieldbyname('FileDate').asDateTime:=RemitFileDateToDateTime(fDate);    //KVB
   fieldbyname('FileType').asString:=sFileType;
   try
    fieldbyname('FileVersion').asInteger:=strtoint(sFileVersion);
   except
    fieldbyname('FileVersion').asInteger:=1;
   end;


   //fieldbyname('FileCreatedBy').asInteger:=nSupplierID;
   fieldbyname('FileCreatedBy').asInteger:=nCustomerID;     //KVB
   fieldbyname('Customer_Id').asInteger:=nProducerID;       //KVB - Darren is storing HerdID in Customer_Id
   fieldbyname('RemittanceCount').asInteger:=nRemittanceCount;

   try
    fieldbyname('RemittanceNumber').asInteger:=strtoint(slSection.Values['REMITTANCE NUMBER']);
   except
   end;

   fieldbyname('RemittanceDate').asDateTime:=RemitFileDateToDateTime(slSection.Values['REMITTANCE DATE']);

   try
    fieldbyname('SlaughterDate').asDateTime:=RemitFileDateToDateTime(slSection.Values['SLAUGHTER DATE']);
   except
   end;

   try
    fieldbyname('LotReference').asInteger:=strtoint(slSection.Values['LOT REFERENCE']);
   except
   end;

   try
    fieldbyname('ProducerReference').asInteger:=strtoint(slSection.Values['PRODUCER REFERENCE']);
   except
   end;

   try
    fieldbyname('CarcaseCount').asInteger:=strtoint(slSection.Values['CARCASE COUNT']);
    NumCarcasses := fieldbyname('CarcaseCount').asInteger;  //KVB 14/08/2000
   except
   end;

   try
    fieldbyname('TotalValue').asFloat:=strtofloatex(slSection.Values['TOTAL VALUE']);
   except
   end;

   try
    fieldbyname('TotalDeductions').asFloat:=strtofloatex(slSection.Values['TOTAL DEDUCTIONS']);
    TotDeductions := fieldbyname('TotalDeductions').asFloat;     //KVB 14/08/2000
    if ( NumCarcasses > 0 ) then                     //KVB 14/08/200
       AvgFactoryDeductPerAnimal := Round((TotDeductions * 100 ) / NumCarcasses ) / 100    //KVB 14/08/200
    else                                             //KVB 14/08/200
       AvgFactoryDeductPerAnimal := 0;                           //KVB 14/08/200
   except
   end;

   try
    fieldbyname('PaymentAmt').asFloat:=strtofloatex(slSection.Values['CHEQUE AMOUNT']);
   except
   end;

   fieldbyname('PaymentNum').asString:=slSection.Values['CHEQUE NUMBER'];

   // post the record.

   try
   post;
   except
      on e : exception do
         begin
            showmessage(e.message);
            ApplicationLog.LogException(e);
         end;
   end;

   if Def.Definition.dUseCrush then
      begin
         with TCrushXMLExport.Create do
            try
               FSalesGroup.GroupID := FieldByName('Group_id').AsInteger;
               FSalesGroup.FileVersion := FieldByName('FileVersion').AsInteger;
               FSalesGroup.FileCreatedBy := FieldByName('FileCreatedBy').AsInteger;
               FSalesGroup.CustomerID := FieldByName('Customer_Id').AsInteger;
               FSalesGroup.RemittanceCount := FieldByName('RemittanceCount').AsInteger;
               FSalesGroup.RemittanceNumber := FieldByName('RemittanceNumber').AsInteger;
               FSalesGroup.LotReference := FieldByName('LotReference').AsInteger;
               FSalesGroup.ProducerReference := FieldByName('ProducerReference').AsInteger;
               FSalesGroup.CarcaseCount := FieldByName('CarcaseCount').AsInteger;
               FSalesGroup.FileDate := FieldByName('FileDate').AsDateTime;
               FSalesGroup.RemittanceDate := FieldByName('RemittanceDate').AsDateTime;
               FSalesGroup.SlaughterDate := FieldByName('SlaughterDate').AsDateTime;
               FSalesGroup.FileType := FieldByName('FileType').AsString;
               FSalesGroup.PaymentNum := FieldByName('PaymentNum').AsString;
               FSalesGroup.TotalValue := FieldByName('TotalValue').AsFloat;
               FSalesGroup.TotalDeductions := FieldByName('TotalDeductions').AsFloat;
               FSalesGroup.PaymentAmt := FieldByName('PaymentAmt').AsFloat;
               CreateorOpenXMLFile(etSale);
               AddLookupItemToXML;
            finally
               Free;
            end;
      end;

   // now post the deductions
   PostDeductions(fieldbyname('SaleGrps_ID').asInteger,slSection);

   // return this salegrps_id
   Result:=fieldbyname('SaleGrps_ID').asInteger;

   close;
  finally
   free;
  end;

 slSection.Free;
end;


function  TFRemittanceRecord.PostDeductions(nSalesGrpID : integer;slSection : tStringList) : boolean;
var
   nLoop : integer;
   s     : string;
begin
 Result:=False;
 with tquery.create(self) do
  try
   databasename:='KWLocal';
   sql.text:='delete from deductions where salegrps_id = :salegrps_id';
   params[0].asInteger:=nSalesGrpID;
   execsql;
  finally
   free;
  end;

 with ttable.create(self) do
  try
   databasename:='KWLocal';
   tablename:='deductions';
   open;
   nLoop:=0;
   s:=slSection.Values[format('DEDUCTION %.2d',[nLoop+1])];
   while (s<>'') do
    begin
     with TBeefRemitDeductionLine.Create do
      try
       Load(s);

       insert;
       fieldbyname('SaleGrps_ID').asInteger:=nSalesGrpID;
       fieldbyname('Description').asString:=Description;
       fieldbyname('Details').asString:=Details;
       fieldbyname('Deducted').asFloat:=Deducted;
       fieldbyname('VAT').asFloat:=VAT;
       post;
      finally
       free;
      end;

     inc(nLoop);
     s:=slSection.Values[format('DEDUCTION %.2d',[nLoop+1])];
    end;
   close;
  finally
   free;
  end;
end;

function TFRemittanceRecord.PostEventData(nSaleGrpsID : integer;nSectionIndex : integer) : boolean;
var
   slSection : tStringList;
   nLoop     : integer;
   PreSale : Boolean;  //KVB
   nVATReg  : Boolean;  //KVB  18/09/2000
   nVatRate : Double;  //KVB  18/09/2000

   nAnimalID,
   nHerdID,             //KVB
   nLactNo,
   nBreedID,
   nEventID  : integer;
   nSex  : String;
   nSaleDate : TDateTime;

   slDupIDs  : tStringList;

   procedure ReNumberAnimalNo ( AAnimalID : Integer ) ;
   var
      MaxLength : Byte;
      TempAnimalNo : string;
      AnimalRecord : TAnimalRecord;
      ReNumberFormat : String;
   begin
      AnimalRecord := TAnimalRecord.Create('');
      try
         AnimalRecord.Load(AAnimalID);

         if Length(Trim(AnimalRecord.AnimalNo)) <= 0 then
            begin
               Exit;
            end;

         ReNumberFormat := WinData.GlobalSettings.ReNumFormat;
         if RenumberFormat = '/yy' then
            begin
               if Length(Trim(AnimalRecord.AnimalNo)) <= 7 then
                  TempAnimalNo := (AnimalRecord.AnimalNo +'/' + FormatDateTime('yy', Date));
            end
         else if RenumberFormat = '(yy)' then
            begin
               if Length(Trim(AnimalRecord.AnimalNo)) <= 6 then
                  TempAnimalNo := (AnimalRecord.AnimalNo +'(' + FormatDateTime('yy', Date) + ')');
            end
         else
            begin
               MessageDlg(Format('Cannot renumber animal "%s". No renumbering format has been specified',[AnimalRecord.AnimalNo]),mtWarning,[mbOK],0);
               Exit;
            end;

         if ( TempAnimalNo <> '' ) then
            begin
               if not DuplicateAnimalNo(TempAnimalNo) then
                  begin
                     with TQuery.Create(nil) do
                        try
                           DatabaseName := AliasName;
                           SQL.Clear;
                           SQL.Add('UPDATE Animals SET AnimalNo =:AnimalNo');
                           SQL.Add('WHERE ID=:ID');
                           Params[0].AsString := TempAnimalNo;
                           Params[1].AsInteger := AAnimalID;
                           ExecSQL;

                           TempAnimalNo := SortAnimalNoString(TempAnimalNo);
                           SQL.Clear;
                           SQL.Add('UPDATE Animals SET SortAnimalNo =:SortAnimalNo');
                           SQL.Add('WHERE ID=:ID');
                           Params[0].AsString := TempAnimalNo;
                           Params[1].AsInteger := AAnimalID;
                           ExecSQL;

                        finally
                           Free;
                        end;
                  end
               else
                  MessageDlg(Format('The Animal Number "%s" cannot be renumbered.' + cCRLF +
                             'Animal No "" already exists in database.',[AnimalRecord.AnimalNo,AnimalRecord.AnimalNo]), mtWarning,[mbOK],0);
            end
         else
            MessageDlg(Format('The Animal Number "%s" cannot be changed. ' + cCRLF +
                       'The new Animal Number value exceeds maximum field length of 10 characters.',[AnimalRecord.AnimalNo]), mtWarning,[mbOK],0);
      finally
         FreeAndNil(AnimalRecord);
      end;
   end;

begin
 Result:=False;
 slSection:=tStringList.Create;
 slDupIDs:=tStringList.Create;
 slDupIDs.Sorted:=True;
 slDupIDs.Duplicates:=DupError; // raise error on duplicate ;)

 // Get the section we want to work with
 GetSection(nSectionIndex,slRemitFile,slSection);

 with ttable.create(Self) do
  try

   databasename:='KWLocal';
   tablename:='Events.db';

   open;


   for nLoop:=0 to slSection.Count-1 do
    begin
     // for this section we have a carcase line ;)
     if integer(slSection.Objects[nLoop])>0 then
      begin

       nAnimalID := integer(slSection.Objects[nLoop]);



       try
        slDupIDs.Add(inttostr(nAnimalID));
       except
        continue;
       end;

       if Global_Crush <> nil then
          begin
            if Global_Crush.InUse then
               begin
                  with tquery.create(Self) do
                   try
                      databasename:='KWLocal';
                      sql.Add('Select NatIDNum from Animals Where ID = :AID');
                      params[0].AsInteger := nAnimalID;
                      open;
                      try
                          Global_Crush.UpdateHasTag(FieldByName('NatIDNum').AsString, True);
                      finally
                         close;
                      end;
                    finally
                      Free;
                    end;
               end;
          end;
       with tquery.create(Self) do
        try
         databasename:='KWLocal';
         //KVB Need to get VATRate and VATRegistered from Ownerd.db
         //sql.text:='select LactNo, HerdID from Animals where ID = :AnimalID';   //KVB
         sql.text:='SELECT A.LactNo, A.Sex, A.PrimaryBreed, A.HerdID, O.VATRegistered, O.VATRate, A.AnimalNo';  //KVB  18/09/2000
         SQL.Add('FROM Animals A, Owners O');  //KVB  18/09/2000
         SQL.ADD('WHERE ((A.ID = :AnimalID) AND (A.HerdID = O.ID))');   //KVB  18/09/2000
         params[0].asInteger:=nAnimalID;
         open;
         nLactNo:=-1;
         nHerdID:=-1;     //KVB
         nVATReg := False;  //KVB   18/09/2000
         nVATRate := 0;  //KVB  18/09/2000
         if not eof and bof then
            Begin                                 //KVB 28/08/2000
                 nLactNo   := Fields[0].AsInteger;
                 nSex      := Fields[1].AsString;    //KVB
                 nBreedID  := Fields[2].AsInteger;    //KVB
                 nHerdID   := Fields[3].AsInteger;    //KVB
                 nVATReg   := Fields[4].AsBoolean;  //KVB  18/09/2000
                 nVATRate  := Fields[5].AsFloat;   //KVB  18/09/2000
            End;                                        //KVB 28/08/2000
         close;

         //KVB added code to locate an existing PreSales Event
         //Now to locate or insert a SalesDeathEvent
         PreSale := False;
         sql.text:='Select id from events where (AnimalId = :AnimalID) AND (EventType = ' + IntToStr(cSaleDeathEvent) + ')';  //KVB
         open;
         If fields[0].asInteger > 0 then
          Begin
           nEventID:=fields[0].asInteger;
           close;
           PreSale := True;
          End
         Else
          begin
           {sql.text:='select max(id) from events';
           open;
           nEventID:=fields[0].asInteger;
           close;
           inc(nEventID);
           }             //  <<< Complete fuckup, otherids needs to be updated.!
           nEventID := WinData.NextEventID; // This is the correct way of doing it.
          end;

        finally
         free;
        end;
       If (Not PreSale) then     //KVB
        Begin
         Insert;
         fieldbyname('ID').asInteger:=nEventID;
        end
       else
        begin
         locate('AnimalId;EventType',VarArrayOf([nAnimalId,cSaleDeathEvent]),[loCaseInsensitive]);
         //locate('id',VarArrayOf([nEventID]),[loCaseInsensitive]);
         edit;
        end;

       fieldbyname('AnimalId').asInteger:=nAnimalID;
       fieldbyname('AnimalLactNo').asInteger:=nLactNo;
       fieldbyname('EventDate').asDateTime:=RemitFileDateToDateTime(sDate);
       nSaleDate := FieldByName('EventDate').AsDateTime;
       fieldbyname('EventDesc').asString:='Sale';      //KVB
       fieldbyname('EventType').asInteger:=cSaleDeathEvent;
       fieldbyname('HerdID').asInteger:=nHerdID;      //KVB
       //All Event Types > 7 need ICBFNotified = TRUE
// *******************************************************************************************
// actually, boy blunder, sales/deaths (EventType=11) need reported to the ICBF
// but i'll leave you to sort that one out as you know best - kr 20/11/00
// *******************************************************************************************
       FieldByName('ICBFNotified').AsBoolean := True;  //KVB 14/08/2000

       try
//        post;
//        Result:=True;

        // Ok, so the event post worked,
        // now its time to create the SalesDeath Record;

        //if not PostSalesDeath(nEventID,nSaleGrpsID,slSection[nLoop]) then   //KVB
        try
        PostSalesDeath(nEventID, nSex, nAnimalID, nLactNo, nBreedID,
                       nSaleGrpsID, nVATReg, nVATRate, slSection[nLoop], nSaleDate)
        except
          on e : Exception do
             ApplicationLog.LogException(e);
        end;
                                 // update EventLookupData;

        if ( WinData.GlobalSettings.RenumAnimalNo ) then
           ReNumberAnimalNo(nAnimalID);


        post;          //KVB - need to post Event record after posting SalesDeaths record

        DBISaveChanges(Handle);
        if ( RMTTable <> nil) then
           begin
              DBISaveChanges(RMTTable.Handle);
              FreeAndNil(RMTTable);
           end;

        //KVB - need to ensure InHerd = False (not set if PreSale is updated by this process
        with ttable.create(Self) do
         try
          databasename:='KWLocal';
          tablename:='Animals.db';

          open;
          locate('ID',nAnimalID,[loCaseInsensitive]);
          If FieldByName('InHerd').AsBoolean = True then
           Begin
            edit;
            FieldByName('InHerd').asBoolean := False;
            Post;
           End;

          //   03/11/15 [V5.4 R9.9] /MK Bug Fix - Setting the IsSynchronized was coded incorrectly.
          Edit;
          FieldByName('IsSynchronized').asBoolean := False;
          Post;

          // update any existing feed events - 22/8/00
          with TQuery.Create(nil) do
             try
                DatabaseName := AliasName;
                SQL.Clear;
                SQL.Add('UPDATE FeedEvents SET EndDate = "' + FormatDateTime('mm/dd/yyyy', RemitFileDateToDateTime(sDate) - 1) + '"');
                SQL.Add('WHERE AnimalID = :ID');
                SQL.Add('AND EndDate IS NULL');
                Params[0].AsInteger := nAnimalID;
                ExecSQL;
             finally
                Free;
             end;

         finally

         end;

        Result:=True;

        try
           // TODO: Move nAnimalid into an array and create lookup info after successful import.
           WinData.AddToEventLookupData( nAnimalID, CSaleDeathEvent);
        except
          on e : Exception do
             ApplicationLog.LogException(e);
        end;

       except
          on e : Exception do
             begin
                ApplicationLog.LogException(e);
                Raise Exception.Create('PostEventData().Post failed');
                Result := False;
             end;
       end;



      end;
    end;

  finally
   free;
  end;

 slSection.Free;
 slDupIDs.Free;
end;

function TFRemittanceRecord.PostSalesDeath(nEventID : Integer; ASex : String; AAnimalID, ALactNo, ABreedID, nSaleGrpsID : Integer;
   nVATReg : Boolean; nVATRate : Double; sLine : string; AEventDate : TDateTime) : boolean;   //KVB  18/09/2000
var
   s : string;
   PriceLessVAT,
   AKillOut : Double;
   dCustTransport,
   dCustDeductions,
   dLastWeight,
   dPurchWeight : Double;
   dLastWeighDate,
   dPurchDate : TDateTime;
   Animal : TAnimal;
   PurchInfo : TPurchaseEventInfo;
begin
 Result:=False;
 delete(sLine,1,pos('=',sLine));

 RMTTable := ttable.create(self);
 with RMTTable do
  try
   databasename:='kwlocal';
   tablename:='salesdeaths.db';
   open;

   with tBeefRemitCarcaseLine.Create(BeefRemitCarcaseLineType) do
    try
     Load(sLine);
     //If (Not locate('EventID',VarArrayOf([nEventID]),[loCaseInsensitive]) )then
     If (Not locate('EventID',nEventID,[loCaseInsensitive]) )then
      begin
       insert;
       fieldbyname('EventID').asInteger:=nEventID;
      end
     else
      begin
       edit;
      end;
     fieldbyname('SaleGrps_ID').asInteger:=nSaleGrpsID;
     fieldbyname('Sold').asBoolean:=True;

     //fieldbyname('Customer').asInteger:=nProducerID;    //Darren has stored the Herd Owner as the Producer

     fieldbyname('Customer').asInteger:=nCustomerID;     //KVB

     //Need FeedEndDate to be 1 less than Sale Date - assume farmer not feeding animals on date of slaughter.  KVB
     fieldbyname('FeedEndDate').asDateTime:= RemitFileDateToDateTime(sDate) - 1;    //KVB
//     fieldbyname('KillOut').asFloat:=

     if ( Global_Crush <> nil ) and ( Global_Crush.InUse ) then
        begin
           if Global_Crush.CrushRecord.HasCard then
              begin
                 fieldByName('Weight').asFloat := Global_Crush.CrushRecord.Weight;
                 fieldByName('WeighingDate').asDateTime := Global_Crush.CrushRecord.DateOfWeighing;
              end;
        end
     //   19/12/17 [V5.7 R6.3] /MK Additional Feature - If new preference is enabled then bring in the live weight and date from last weighing.
     else if ( WinData.GlobalSettings.UseLastRecordWeightAsLiveWeightForKillOut ) then
        begin
           dLastWeighDate := 0;
           dLastWeighDate := WinData.FEventDataHelper.GetLastEventDate(AAnimalID,ALactNo,CWeightEvent);
           dLastWeight := 0;
           dLastWeight := WinData.FEventDataHelper.GetAnimalLastWeight(AAnimalID);
           if ( dLastWeighDate > 0 ) and ( dLastWeight > 0 ) then
              //   22/12/17 [V5.7 R6.4] /MK Change - Only use last weight if preference is ticked and last weight is within 3 days of sale date - Matt Ward/GL request.
              //   23/01/18 [V5.7 R6.6] /MK Change - Should be less or equal to today - Matt Ward.
              if ( dLastWeighDate <= AEventDate ) and ( Trunc(AEventDate - dLastWeighDate) <= 3 ) then
                 begin
                    FieldByName('WeighingDate').AsDateTime := dLastWeighDate;
                    FieldByName('Weight').AsFloat := dLastWeight;
                 end;
        end
     else if ( WinData.GlobalSettings.UsePurchaseWeightAsLiveWeightForKillOut ) then
        begin
           dPurchDate := 0;
           dPurchWeight := 0;
           PurchInfo := WinData.FEventDataHelper.GetPurchaseRecord(AAnimalID);
           if ( PurchInfo <> nil ) then
              try
                 if ( PurchInfo.Weight > 0 ) and ( (PurchInfo.EventDate > 0) and (PurchInfo.EventDate <= AEventDate) ) then
                    begin
                       FieldByName('WeighingDate').AsDateTime := PurchInfo.EventDate;
                       FieldByName('Weight').AsFloat := PurchInfo.Weight;
                    end;
           finally
              FreeAndNil(PurchInfo);
           end;
        end;


     //fieldbyname('CustomerCosts').asFloat:= CustomerDeds;     //KVB 14/08/2000

     //   12/12/17 [V5.7 R6.3] /MK Bug Fix - Transport costs of the customer were not being added to the deductions from the remittance file.
     //   13/12/17 [V5.7 R6.3] /MK Bug Fix - TotalDeductions from the individual line on a CSV formatted file were being added to the TotalDeductions field
     //                                      on the SalesRecord. TotalDeductions on an RMT file footer were added to the CustomerCosts field.
     //                                      Change so that the TotalDeductions on the CSV file to go to the CustomerCosts field along with Transport.
     dCustTransport := 0;
     dCustDeductions := 0;
     if ( WinData.Customers.Locate('ID',nCustomerID,[]) ) then
        begin
           dCustTransport := WinData.Customers.FieldByName('Transport').AsFloat;
           dCustDeductions := WinData.Customers.FieldByName('Deductions').AsFloat;
        end;

     // If the file type is CSV then we use the TotalDeductions value for each carcase on the file.
     if ( AvgFactoryDeductPerAnimal = 0 ) and ( TotalDeductions > 0 ) then
        FieldByName('CustomerCosts').AsFloat := TotalDeductions + dCustTransport
     // If the file type is RMT then average out the Total Deductions value at the bottom of the file per carcase.
     else if ( TotalDeductions = 0 ) and ( AvgFactoryDeductPerAnimal > 0 ) then
        FieldByName('CustomerCosts').AsFloat := AvgFactoryDeductPerAnimal + dCustTransport
     // If neither of these values exist and there is deductions value in the customer record then we use this as the deductions.
     else if ( (TotalDeductions = 0) and (AvgFactoryDeductPerAnimal = 0) ) and ( dCustDeductions > 0 ) then
        FieldByName('CustomerCosts').AsFloat := dCustDeductions + dCustTransport;

//   fieldbyname('WeightingDate).asDatetime :=
     fieldbyname('Notified').asBoolean := True;  //KVB - I do not know what this field is for, but all others are set to true.

     //KVB Need to remove VAT if Herd is VAT Registered.
     If nVATReg then      //KVB
        Begin            //KVB
           // changed for D5 - kr 2/10/00
//         PriceLessVAT := (Trunc(Round((Value*10000)/(100+nVATRate)))/100);  //KVB  18/09/2000
           PriceLessVAT := (Round((Value*10000)/(100+nVATRate)))/100;
           FieldByName('Price').AsFloat := PriceLessVAT;  //KVB  18/09/2000
        End               //KVB
     Else                 //KVB
         fieldbyname('Price').asFloat:=Value;      //KVB

     fieldbyname('Grade').asString:=Grade;
     fieldbyname('ColdDeadWt').asFloat:=CWeight;

     if (LiveWeight > 0) and ( FieldByName('Weight').asFloat <= 0 ) then
        fieldbyname('Weight').asFloat:=LiveWeight;

     //KVB 17/01/2001 Added the following to calculate KillOut%
     If ( FieldByName('Weight').AsFloat <> 0 ) then
        FieldByName('KillOut').AsFloat := ( (CWeight * 100 ) / FieldByName('Weight').AsFloat )
     Else
        begin
           //   25/05/11 [V4.1 R1.6] /MK Additional Feature - Take The KillOut% From KillOutPercs Table
           //                                               - Create Live Weight From KillOut% and ColdDeadWeight.
           //   21/06/11 [V4.1 R2.0] /MK Bug - Fix For If More Than One Kill Out Animal Type
           //FieldByName('KillOut').AsFloat := FKillOutCalculator.Calculate(ASex, ABreedID, ALactNo);
           AKillOut := FKillOutCalculator.Calculate(AAnimalID);
           FieldByName('KillOut').AsFloat := AKillOut;
           if ( FieldByName('Weight').AsFloat <= 0 ) and ( not(WinData.GlobalSettings.UsePurchaseWeightAsLiveWeightForKillOut) ) then
              if ( ( FieldByName('KillOut').AsFloat > 0 ) and ( FieldByName('ColdDeadWt').asFloat > 0 ) ) then
                 FieldByName('Weight').AsFloat := ( ( CWeight * 100 ) / AKillOut );
                 //FieldByName('Weight').AsFloat := ( ( FieldByName('ColdDeadWt').asFloat * 100 ) / FieldByName('KillOut').AsFloat );
        end;

     fieldbyname('PreSale').asBoolean:=False;

     s:=Carcase;
     //system.Delete(s,1,4);                                //KVB - needs changing
     try
      //Do not use the CarcassNum field - KVB
      //fieldbyname('CarcassNum').asInteger:=strtoint(s);   //KVB - needs changing
      fieldbyname('KillNumber').asString := s;  //KVB
     except
     end;

     fieldbyname('CarcassSex').asString:=Sex;
     fieldbyname('LeftWt').asFloat:=LWeight;
     fieldbyname('RightWt').asFloat:=RWeight;

     try
      fieldbyname('CondemnedWt').asFloat:=strtofloatex(Condemned);
     except
     end;

     if nVATReg then
       if ( ( FieldByName('Price').AsFloat > 0 ) and ( FieldByName('ColdDeadWt').asFloat > 0 ) ) then
           FieldByName('PricePerKg').asFloat := ( ( FieldByName('Price').AsFloat ) / ( FieldByName('ColdDeadWt').asFloat ) )
     else
        FieldByName('PricePerKg').asFloat := PricePer;

     try
      post;
      Result:=True;

      //   12/11/12 [V5.1 R0.9] /MK Additional Feature - Added CrushXMLExport function.
      if ( Def.Definition.dUseCrush ) then
         begin
            with TCrushXMLExport.Create do
               try
                  with FSaleAnimal do
                     begin
                        AnimalID := AAnimalID;
                        Animal := GetAnimal(AAnimalID);
                        if ( Animal <> nil ) then
                           NatIDNum := Animal.NatIdNum;
                        EventID := nEventID;
                        EventDate := AEventDate;
                        CustomerID := FieldByName('Customer').AsInteger;
                        FeedEndDate := FieldByName('FeedEndDate').AsDateTime;
                        WeighingDate := FieldByName('WeighingDate').AsDateTime;
                        AnimalWeight := FieldByName('Weight').AsFloat;
                        AnimalPrice := FieldByName('Price').AsFloat;
                        CustomerCosts := FieldByName('CustomerCosts').AsFloat;
                        KillOut := FieldByName('KillOut').AsFloat;
                        ColdDeadWt := FieldByName('ColdDeadWt').AsFloat;
                        KillNumber := FieldByName('KillNumber').AsString;
                        Grade := FieldByName('Grade').AsString;
                        PreSale := FieldByName('PreSale').AsBoolean;
                        SoldStatus := FieldByName('Sold').AsBoolean;
                        PricePerKg := FieldByName('PricePerKg').asFloat;
                        CarcassSex := FieldByName('CarcassSex').AsString;
                        LeftWt := FieldByName('LeftWt').AsFloat;
                        RightWt := FieldByName('RightWt').AsFloat;
                        SalesGroupID := FieldByName('SaleGrps_ID').AsInteger;
                     end;
                  if ( IsValidEvent(etSale) ) then
                     begin
                        CreateorOpenXMLFile(etSale);
                        AddAnimalToXMLFile(etSale);
                     end;
               finally
                  Free
               end;
         end;

     except
        on e:Exception do
           begin
              ApplicationLog.LogException(e);
              showmessage(e.message);
           end;
     end;
    finally
     free;
    end;

  finally
   //free;
  end;
end;

procedure TFRemittanceRecord.CreateSaleWithTEventClass(ASalesGroupID, ASectionIndex : Integer);
var
   AnimalData : TAnimal;
   slSection : TStringList;
   i, iAnimalID, iSalesSavedCount : Integer;
   dSaleDate,
   dLastWeighDate : TDateTime;
   dLastWeight,
   dCustTransport,
   dCustDeductions,
   dKillOutPer : Double;
   BeefRemitLine : tBeefRemitCarcaseLine;
   sLine : String;
   iExistSaleEventID,
   iPreSaleEventID : Integer;
   Animal : TAnimal;
   SaleEvent : TSaleDeathEvent;
   SaleEventInfo : TSaleEventInfo;
   CrushXMLExport : TCrushXMLExport;
   PurchInfo : TPurchaseEventInfo;
   PreSaleInfo : TPreSaleEventInfo;

   function GetCustomerCosts : Double;
   begin
      Result := 0;
      if ( WinData.Customers.Locate('ID',nCustomerID,[]) ) then
         begin
            dCustTransport := WinData.Customers.FieldByName('Transport').AsFloat;
            dCustDeductions := WinData.Customers.FieldByName('Deductions').AsFloat;
         end;
      // If the file type is CSV then we use the TotalDeductions value for each carcase on the file.
      if ( AvgFactoryDeductPerAnimal = 0 ) and ( BeefRemitLine.TotalDeductions > 0 ) then
         Result := BeefRemitLine.TotalDeductions + dCustTransport
      // If the file type is RMT then average out the Total Deductions value at the bottom of the file per carcase.
      else if ( BeefRemitLine.TotalDeductions = 0 ) and ( AvgFactoryDeductPerAnimal > 0 ) then
         Result := AvgFactoryDeductPerAnimal + dCustTransport
      // If the TotalDeductions and the AvgFactoryDeductPerAnimal value are the same value then use this value as deductions.
      else if ( (AvgFactoryDeductPerAnimal > 0 ) and (BeefRemitLine.TotalDeductions > 0) and (AvgFactoryDeductPerAnimal = BeefRemitLine.TotalDeductions) ) then
         Result := BeefRemitLine.TotalDeductions + dCustTransport
      // If neither of these values exist and there is deductions value in the customer record then we use this as the deductions.
      else if ( (BeefRemitLine.TotalDeductions = 0) and (AvgFactoryDeductPerAnimal = 0) ) and ( dCustDeductions > 0 ) then
         Result := dCustDeductions + dCustTransport;
   end;

   function GetKillOutPerc (AWeight, AColdDeadWt : Double ): Double;
   begin
      Result := 0;
      if ( AWeight > 0 ) and ( AColdDeadWt > 0 ) then
         Result := ( (AColdDeadWt * 100 ) / AWeight )
      else if ( not(WinData.GlobalSettings.UsePurchaseWeightAsLiveWeightForKillOut) ) then
         Result := FKillOutCalculator.Calculate(AnimalData.Id);
   end;

   function GetSalesPrice (APrice : Double) : Double;
   var
      dPriceLessVat : Double;
   begin
      Result := BeefRemitLine.Value;
      dPriceLessVat := 0;
      if ( HerdLookup.HerdOwnerData.VatRegistered ) then
         begin
            dPriceLessVat := (Round((Result*10000)/(100+HerdLookup.HerdOwnerData.VatRate)))/100;
            Result := dPriceLessVat;
         end;
   end;

   function GetPricePerKg (APrice, AColdDeadWt : Double) : Double;
   begin
      Result := BeefRemitLine.PricePer;
      if ( APrice > 0 ) and ( AColdDeadWt > 0 ) then
          Result :=  ( APrice / AColdDeadWt );
   end;

   //   17/10/18 [V5.8 R4.0] /MK Change - Changed UpdatePreSaleEvent to UpdateSaleInfo with variable for AIsPreSale to be passed in if a presale event is found.
   function UpdateSaleInfo ( AEventID : Integer; AIsPreSale : Boolean ) : Boolean;
   var
      qUpdatePreSale : TQuery;
      fLiveWeight,
      fKillOutPerc : Double;
      dLiveWeighDate : TDateTime;
      bSaleExists : Boolean;
   begin
      Result := False;
      fLiveWeight := 0;
      fKillOutPerc := 0;
      dLiveWeighDate := 0;

      fLiveWeight := BeefRemitLine.LiveWeight;
      if ( Global_Crush <> nil ) and ( Global_Crush.InUse ) then
         begin
            if Global_Crush.CrushRecord.HasCard then
               begin
                  fLiveWeight := Global_Crush.CrushRecord.Weight;
                  dLiveWeighDate := Global_Crush.CrushRecord.DateOfWeighing;
               end
         end
      else if ( WinData.GlobalSettings.UseLastRecordWeightAsLiveWeightForKillOut ) then
         begin
            fLiveWeight := WinData.FEventDataHelper.GetAnimalLastWeight(AnimalData.Id);
            dLiveWeighDate := WinData.FEventDataHelper.GetLastEventDate(AnimalData.Id,AnimalData.LactNo,CWeightEvent);
         end
      else if ( WinData.GlobalSettings.UsePurchaseWeightAsLiveWeightForKillOut ) then
         begin
            if ( PurchInfo <> nil ) and ( PurchInfo.Weight > 0 ) then
               begin
                  fLiveWeight := PurchInfo.Weight;
                  dLiveWeighDate := PurchInfo.EventDate;
               end;
         end
      else if ( AIsPreSale ) and ( (PreSaleInfo <> nil) and (PreSaleInfo.Weight > 0) ) then
         begin
            fLiveWeight := PreSaleInfo.Weight;
            dLiveWeighDate := PreSaleInfo.EventDate;
         end;
      if ( fLiveWeight <= 0 ) and ( not(WinData.GlobalSettings.UsePurchaseWeightAsLiveWeightForKillOut) ) then
         if ( fKillOutPerc > 0 ) and ( BeefRemitLine.CWeight > 0 ) then
            fLiveWeight := ( (BeefRemitLine.CWeight * 100 ) / fKillOutPerc );

      //   08/04/19 [V5.8 R8.7] /MK Bug Fix - When Re-Saving the Factory File the LiveWeight was not being added from either the ColdDead and Kill Out
      //                                      or from a previous weighing weight and date.
      fKillOutPerc := GetKillOutPerc(fLiveWeight,BeefRemitLine.CWeight);

      qUpdatePreSale := TQuery.Create(nil);
      with qUpdatePreSale do
         try
            DatabaseName := AliasName;
            try
               if ( AIsPreSale ) then
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE Animals');
                     SQL.Add('SET InHerd = False');
                     SQL.Add('WHERE ID = :AnimalID');
                     Params[0].AsInteger := iAnimalID;
                     ExecSQL;

                     Close;
                     SQL.Clear;
                     SQL.Add('UPDATE Events');
                     SQL.Add('SET EventDate = :SaleDate,');
                     SQL.Add('    EventDesc = "Sale"');
                     SQL.Add('WHERE ID = :EventID');
                     Params[0].AsDateTime := dSaleDate;
                     Params[1].AsInteger := AEventID;
                     ExecSQL;
                  end;

               // Check to see if the EventID exists in the sale table.
               Close;
               SQL.Clear;
               SQL.Add('SELECT *');
               SQL.Add('FROM SalesDeaths');
               SQL.Add('WHERE EventID = :ExistSale');
               Params[0].AsInteger := AEventID;
               Open;
               bSaleExists := ( RecordCount > 0 );

               Close;
               // If the EventID exists in the sale table then edit the record and add the sub detail.
               if bSaleExists then
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE SalesDeaths');
                     SQL.Add('SET PreSale = False,');
                     SQL.Add('    Sold = True,');
                     SQL.Add('    Customer = :Customer,');
                     SQL.Add('    Price = :Value,');
                     SQL.Add('    Grade = :Grade,');
                     SQL.Add('    Weight = :LiveWeight,');
                     SQL.Add('    ColdDeadWt = :ColdDeadWt,');
                     SQL.Add('    KillOut = :KillOut,');
                     SQL.Add('    CustomerCosts = :CustomerCosts,');
                     SQL.Add('    FeedEndDate = :FeedEndDate,');
                     SQL.Add('    CarcassSex = :CarassSex,');
                     SQL.Add('    KillNumber = :KillNumber,');
                     SQL.Add('    LeftWt = :LeftWt,');
                     SQL.Add('    RightWt = :RightWt,');
                     SQL.Add('    CondemnedWt = :CondemnedWt,');
                     SQL.Add('    PricePerKg = :PricePerKg,');
                     SQL.Add('    SaleGrps_Id = :SalesGroupID,');
                     SQL.Add('    WeighingDate = :WeighingDate');
                     SQL.Add('WHERE EventID = :EventID');
                     Params[0].AsInteger := nCustomerID;
                     Params[1].AsFloat := GetSalesPrice(BeefRemitLine.Value);
                     Params[2].AsString := BeefRemitLine.Grade;
                     Params[3].AsFloat := fLiveWeight;
                     Params[4].AsFloat := BeefRemitLine.CWeight;
                     Params[5].AsFloat := fKillOutPerc;
                     Params[6].AsFloat := GetCustomerCosts;
                     Params[7].AsDateTime := dSaleDate;
                     Params[8].AsString := BeefRemitLine.Sex;
                     Params[9].AsString := BeefRemitLine.Carcase;
                     Params[10].AsFloat := BeefRemitLine.LWeight;
                     Params[11].AsFloat := BeefRemitLine.RWeight;
                     Params[12].AsFloat := StrToFloatEx(BeefRemitLine.Condemned);
                     Params[13].AsFloat := GetPricePerKg(GetSalesPrice(BeefRemitLine.Value),BeefRemitLine.CWeight);
                     Params[14].AsInteger := ASalesGroupID;
                     Params[15].AsDateTime := dLiveWeighDate;
                     Params[16].AsInteger := AEventID;
                     ExecSQL;
                  end
               // If the EventID doesnt exist in the sale table then add the record and add the sub detail.
               else
                  begin
                     SQL.Clear;
                     SQL.Add('INSERT INTO SalesDeaths (EventID, PreSale, Sold, Customer, Price, Grade, Weight, ColdDeadWt,');
                     SQL.Add('                         KillOut, CustomerCosts, FeedEndDate, CarcassSex, KillNumber, LeftWt,');
                     SQL.Add('                         RightWt, CondemnedWt, PricePerKg, SaleGrps_Id, WeighingDate)');
                     SQL.Add('VALUES (:EventID, "False", "True", :Customer, :Price, :Grade, :Weight, :ColdDeadWt,');
                     SQL.Add('        :KillOut, :CustomerCosts, :FeedEndDate, :CarcassSex, :KillNumber, :LeftWt,');
                     SQL.Add('        :RightWt, :CondemnedWt, :PricePerKg, :SaleGrps_Id, :WeighingDate)');
                     Params[0].AsInteger := AEventID;
                     Params[1].AsInteger := nCustomerID;
                     Params[2].AsFloat := GetSalesPrice(BeefRemitLine.Value);
                     Params[3].AsString := BeefRemitLine.Grade;
                     Params[4].AsFloat := fLiveWeight;
                     Params[5].AsFloat := BeefRemitLine.CWeight;
                     Params[6].AsFloat := fKillOutPerc;
                     Params[7].AsFloat := GetCustomerCosts;
                     Params[8].AsDateTime := dSaleDate;
                     Params[9].AsString := BeefRemitLine.Sex;
                     Params[10].AsString := BeefRemitLine.Carcase;
                     Params[11].AsFloat := BeefRemitLine.LWeight;
                     Params[12].AsFloat := BeefRemitLine.RWeight;
                     Params[13].AsFloat := StrToFloatEx(BeefRemitLine.Condemned);
                     Params[14].AsFloat := GetPricePerKg(GetSalesPrice(BeefRemitLine.Value),BeefRemitLine.CWeight);
                     Params[15].AsInteger := ASalesGroupID;
                     Params[16].AsDateTime := dLiveWeighDate;
                     ExecSQL;
                  end;
               Inc(iSalesSavedCount);

               Result := True;
            except
               on e : Exception do
                  begin
                     ApplicationLog.LogException(e);
                     ApplicationLog.LogError('Error updating SaleEventID '+IntToStr(AEventID));
                     Result := False;
                     Dec(iSalesSavedCount);
                  end;
            end;
         finally
            Free;
         end;
   end;

begin
   iSalesSavedCount := 0;
   slSection := TStringList.Create();
   BeefRemitLine := tBeefRemitCarcaseLine.Create(BeefRemitCarcaseLineType);
   try
      dSaleDate := RemitFileDateToDateTime(sDate);
      if ( dSaleDate <= 0 ) then
         begin
            MessageDlg('Invalid Sale Date found on file.',mtError,[mbOK],0);
            PnlRecording.Caption := 'Invalid Slaughter Date found on file.';
            Exit;
         end;
      SaleEvent := TSaleDeathEvent.Create('FactorySales');
      try
         SaleEvent.Database.StartTransaction;
         try
            GetSection(ASectionIndex,slRemitFile,slSection);
            if ( slSection.Count = 0 ) then
               begin
                  MessageDlg('There are no sale records found on the file.',mtError,[mbOK],0);
                  Exit;
               end;

            ShowProgressIndicator('Processing Factory Sales Docket',0,slSection.Count,1);
            ProgressIndicator.Max := slSection.Count;
            Application.ProcessMessages;
            Update;
            for i := 0 to slSection.Count-1 do
               begin
                  if ( slSection.Objects[i] <> nil ) then
                     begin
                        iAnimalID := Integer(slSection.Objects[i]);
                        if ( iAnimalID > 0 ) then
                           begin
                              PurchInfo := WinData.FEventDataHelper.GetPurchaseRecord(iAnimalId);
                              PreSaleInfo := WinData.FEventDataHelper.GetPreSaleRecord(iAnimalId);

                              sLine := slSection[i];
                              Delete(sLine,1,Pos('=',sLine));
                              BeefRemitLine.Load(sLine);

                              dCustTransport := 0;
                              dCustDeductions := 0;

                              AnimalData := GetAnimal(iAnimalID);
                              if ( AnimalData <> nil ) then
                                 begin
                                    //   17/10/18 [V5.8 R4.0] /MK Additional Feature - Update an existing sale record if an existing sale (not presale) record is found.
                                    iExistSaleEventID := WinData.FEventDataHelper.GetAnimalLeftHerdEventID(iAnimalID);
                                    //   15/11/19 [V5.9 R1.2] /MK Bug Fix - UpdateSaleInfo - Not allowing for the scenario where the EventID does not exist in the SaleDeaths table - John Sinnott.
                                    if ( iExistSaleEventID = 0 ) then
                                       iExistSaleEventID := WinData.FEventDataHelper.GetAnimalNullLeftHerdEventID(iAnimalID);
                                    if ( iExistSaleEventID > 0 ) or ( not(AnimalData.InHerd) ) then
                                       begin
                                          UpdateSaleInfo(iExistSaleEventID,False);
                                          Continue;
                                       end;

                                    //   25/04/18 [V5.7 R9.0] /MK Bug Fix - PreSale Event was not update with new sale figures after move to TEvent class.
                                    iPreSaleEventID := PreSaleInfo.EventID;
                                    //   03/10/18 [V5.8 R3.0] /MK Change - Moved update of presale event into a seperate sub function of CreateSaleWithTEventClass for readability.
                                    if ( iPreSaleEventID > 0 ) then
                                       begin
                                          UpdateSaleInfo(iPreSaleEventID,True);
                                          Continue;
                                       end;

                                    dLastWeighDate := 0;
                                    dLastWeight := 0;

                                    SaleEvent.Append;
                                    try
                                       HerdLookup.HerdOwnerData.HerdID := AnimalData.HerdId;

                                       SaleEvent.CanCheckWeaning := False;
                                       SaleEvent.AllowCancel := False;
                                       SaleEvent.EventType := TSaleDeath;

                                       SaleEvent.AnimalID := AnimalData.Id;

                                       SaleEvent.EventDate := dSaleDate;

                                       SaleEvent.AnimalLactNo := AnimalData.LactNo;
                                       SaleEvent.AnimalHerdID := AnimalData.HerdId;
                                       SaleEvent.EventComment := 'Sale';
                                       SaleEvent.EventSource := sNEWFACTORYSALE;

                                       SaleEvent.Customer := nCustomerID;

                                       SaleEvent.SaleGrps_Id := ASalesGroupID;

                                       SaleEvent.FeedEndDate := dSaleDate;

                                       SaleEvent.Weight := BeefRemitLine.LiveWeight;
                                       if ( Global_Crush <> nil ) and ( Global_Crush.InUse ) then
                                          begin
                                             if Global_Crush.CrushRecord.HasCard then
                                                begin
                                                   SaleEvent.Weight := Global_Crush.CrushRecord.Weight;
                                                   SaleEvent.WeighingDate := Global_Crush.CrushRecord.DateOfWeighing;
                                                end
                                          end
                                       else if ( WinData.GlobalSettings.UseLastRecordWeightAsLiveWeightForKillOut ) then
                                          begin
                                             dLastWeighDate := WinData.FEventDataHelper.GetLastEventDate(AnimalData.Id,AnimalData.LactNo,CWeightEvent);
                                             dLastWeight := WinData.FEventDataHelper.GetAnimalLastWeight(AnimalData.Id);
                                             if ( dLastWeighDate > 0 ) and ( dLastWeight > 0 ) then
                                                if ( dLastWeighDate <= dSaleDate ) and ( Trunc(dSaleDate - dLastWeighDate) <= 3 ) then
                                                   begin
                                                      SaleEvent.Weight := dLastWeight;
                                                      SaleEvent.WeighingDate := dLastWeighDate;
                                                   end;
                                          end
                                       else if ( WinData.GlobalSettings.UsePurchaseWeightAsLiveWeightForKillOut ) then
                                          begin
                                             if ( PurchInfo <> nil ) and ( PurchInfo.Weight > 0 ) then
                                                begin
                                                   SaleEvent.Weight := PurchInfo.Weight;
                                                   SaleEvent.WeighingDate := PurchInfo.EventDate;
                                                end;
                                          end;

                                       SaleEvent.CustomerCosts := GetCustomerCosts;
                                       SaleEvent.Price := GetSalesPrice(BeefRemitLine.Value);

                                       SaleEvent.Grade := BeefRemitLine.Grade;
                                       SaleEvent.ColdDeadWt := BeefRemitLine.CWeight;

                                       SaleEvent.KillOut := GetKillOutPerc(SaleEvent.Weight,SaleEvent.ColdDeadWt);
                                       if ( SaleEvent.Weight <= 0 ) and ( not(WinData.GlobalSettings.UsePurchaseWeightAsLiveWeightForKillOut) ) then
                                          if ( SaleEvent.KillOut > 0 ) and ( SaleEvent.ColdDeadWt > 0 ) then
                                             SaleEvent.Weight := ( (SaleEvent.ColdDeadWt * 100 ) / SaleEvent.KillOut );

                                       SaleEvent.PreSale := False;

                                       SaleEvent.KillNumber := BeefRemitLine.Carcase;
                                       SaleEvent.CarcassSex := BeefRemitLine.Sex;
                                       SaleEvent.LeftWt := BeefRemitLine.LWeight;
                                       SaleEvent.RightWt := BeefRemitLine.RWeight;
                                       SaleEvent.CondemnedWt := StrToFloatEx(BeefRemitLine.Condemned);

                                       SaleEvent.PricePerKg := GetPricePerKg(SaleEvent.Price,SaleEvent.ColdDeadWt);

                                       SaleEvent.Sold := True;
                                       SaleEvent.Notified := False;
                                       SaleEvent.Slaughter := False;

                                       if WinData.GlobalSettings.RenumAnimalNo then
                                          begin
                                             SaleEvent.RenumberAfterPost := True;
                                             SaleEvent.RenumberFormat := WinData.GlobalSettings.ReNumFormat;
                                          end;

                                       //   14/10/19 [V5.9 R0.9] /MK Additional Feature - Remove Transponder No if Parlour and RemoveTransponderAfterSale preference.
                                       SaleEvent.RemoveTransponderNo := ( (Def.Definition.dUseParlour) and (WinData.GlobalSettings.RemoveTransponderAfterSale) );

                                       SaleEvent.Post;

                                       Inc(iSalesSavedCount);
                                    except
                                       on e : Exception do
                                          begin
                                             SaleEvent.Cancel;
                                             ApplicationLog.LogException(e);
                                             ApplicationLog.LogError('Error creating Factory Sale Event for animal '+IntToStr(iAnimalID));
                                          end;
                                    end;

                                 end;
                              if ( PurchInfo <> nil ) then
                                 FreeAndNil(PurchInfo);
                              if ( PreSaleInfo <> nil ) then
                                 FreeAndNil(PreSaleInfo);
                           end;
                     end;
                  ProgressIndicator.Position := ProgressIndicator.Position + 1;
               end;
            ProgressIndicator.Close;
            Application.ProcessMessages;
            Update;

            if ( iSalesSavedCount <= 0 ) then
               PnlRecording.Caption := 'Error - Failed to post Factory Docket Information.'
            else if ( iSalesSavedCount > 0 ) then
               PnlRecording.Caption := 'Factory Docket Information Posted Successfully.';
         except
            on e : Exception do
               begin
                  if SaleEvent.Database.InTransaction then
                     SaleEvent.Database.Rollback;
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError('An Error occurred posting the Sales Group Information for AnimalID '+IntToStr(iAnimalID));
                  PnlRecording.Caption:='An Error occurred posting the Sales Group Information.';
               end;
            on e : EOutOfMemory do
               begin
                  if SaleEvent.Database.InTransaction then
                     SaleEvent.Database.Rollback;
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError('An Out of Memory Error occurred posting the Sales Group Information for AnimalID '+IntToStr(iAnimalID));
                  PnlRecording.Caption:='An Out of Memory Error occurred posting the Sales Group Information.';
               end;
         end;
      finally
         if ( SaleEvent <> nil ) then
            begin
               if SaleEvent.Database.InTransaction then
                  SaleEvent.Database.Commit;
               FreeAndNil(SaleEvent);
            end;
      end;

      //   02/10/18 [V5.8 R3.0] /MK Change - Seperate CrushXMLExport from TSaleDeathEvent class routine.
      if ( Def.Definition.dUseCrush ) then
         begin
            CrushXMLExport := TCrushXMLExport.Create;
            try
               for i := 0 to slSection.Count-1 do
                  if ( slSection.Objects[i] <> nil ) then
                     begin
                        iAnimalID := Integer(slSection.Objects[i]);
                        if ( iAnimalID <= 0 ) then Continue;
                        //   16/08/19 [V5.9 R0.0] /MK Change - If Crush user then sometimes a presale record will appear before the actual sale.
                        //                                     Pass in the actual sale date to get the sale info rather than the presale info.
                        SaleEventInfo := WinData.FEventDataHelper.GetSaleDeathRecord(iAnimalID,dSaleDate);
                        if SaleEventInfo = nil then Continue;
                        with CrushXMLExport.FSaleAnimal do
                           begin
                              AnimalID := iAnimalID;
                              NatIDNum := SaleEventInfo.AnimalInfo.NatIdNum;
                              EventID := SaleEventInfo.EventID;
                              EventDate := SaleEventInfo.EventDate;
                              CustomerID := SaleEventInfo.CustomerID;
                              AnimalWeight := SaleEventInfo.AnimalWeight;
                              AnimalPrice := SaleEventInfo.AnimalPrice;
                              ColdDeadWt := SaleEventInfo.ColdDeadWt;
                              TBTestDate := SaleEventInfo.AnimalInfo.TBTestDate;
                              BruTestDate := SaleEventInfo.AnimalInfo.BruceTestDate;
                              PreSale := SaleEventInfo.PreSale;
                              SoldStatus := SaleEventInfo.SoldStatus;
                              CustomerCosts := SaleEventInfo.CustomerCosts;
                              KillOut := SaleEventInfo.KillOut;
                              LeftWt := SaleEventInfo.LeftWt;
                              RightWt := SaleEventInfo.RightWt;
                              PricePerKg := SaleEventInfo.PricePerKg;
                              KillNumber := SaleEventInfo.KillNumber;
                              Grade := SaleEventInfo.Grade;
                              CarcassSex := SaleEventInfo.CarcassSex;
                              SalesGroupID := SaleEventInfo.SalesGroupID;
                              FeedEndDate := SaleEventInfo.FeedEndDate;
                              WeighingDate := SaleEventInfo.WeighingDate;
                           end;
                        if ( CrushXMLExport.IsValidEvent(etSale) ) then
                           begin
                              CrushXMLExport.CreateorOpenXMLFile(etSale);
                              CrushXMLExport.AddAnimalToXMLFile(etSale);
                           end;
                      end;
            finally
               if ( CrushXMLExport <> nil ) then
                  CrushXMLExport.Free;
            end;
         end;
   finally
      if ( slSection <> nil ) then
         FreeAndNil(slSection);
      if ( BeefRemitLine <> nil ) then
         BeefRemitLine.Free;
   end;
end;

end.
