{
   04/08/17 [V5.7 R1.2] /MK Change - ImportCsvFile - Always check for double quotes as first string in line.

   18/08/17 [V5.7 R1.2] /MK Bug Fix - SanitizeNumericField - Removed break where a character was found that wasn't numeric or a dot.
                                                             Old version of VetLink would just return numbers and dots.

   21/08/17 [V5.7 R2.0] /MK Change - IsValid - The line is valid if does/doesn't contain a VPA number.
                                   - ImportCsvFile - If the line does not contain a purchase date or quantity, or expiry date or batch number then its not valid.
                                                     Removed the requirement of the VPA number for validation.

   26/09/17 [V5.7 R3.1] /MK Change - ImportCsvFile - Default Medicine Name/Description to UpperCase as medicine table now contains only UpperCase names.

   05/12/17 [V5.7 R5.9] /MK Change - ImportCsvFile - Co-Op files don't supply animal number or dose rate. If either of these fields has a value then check for double-quotes.
}

unit uVetLinkFileImport;

interface
uses
   Classes, uSPParser;

type
   TVetLinkDataLine = class;

   TValidationResult = array of string;

   TVetLinkFileImport = class(TList)
   private
      FDataLineCount: Integer;
      FInvalidDataLineCount: Integer;
      FFileName: string;
      FParser : TSPParser;
      FErrors : TStringList;
      function GetDataLine(Index: Integer): TVetLinkDataLine;
      procedure SetDataLine(Index: Integer; const Value: TVetLinkDataLine);
      procedure ImportCsvFile(AFileName: string);
      function SanitizeNumericField(const AValue : string) : string;
   public
      constructor create;
      destructor destroy;override;
      function Add(ADataLine: TVetLinkDataLine): Integer;
      procedure Clear;override;
      procedure Import(AFileName : string);
      property DataLine[Index: Integer]: TVetLinkDataLine read GetDataLine write SetDataLine; default;
      property Filename : string read FFilename write FFilename;
      property DataLineCount : Integer read FDataLineCount write FDataLineCount;
      property InvalidDataLineCount : Integer read FInvalidDataLineCount write FInvalidDataLineCount;
      property Errors : TStringList read FErrors;
   end;

   TVetLinkDataLine = class
   private
     FAnimalTags: string;
     FBatchNumber: string;
     FVPANumber: string;
     FWithdrawal: string;
     FQuantity: string;
     FDoseRate: string;
     FDrugDescription: string;
     FExpiryDate: string;
     FPurchaseDate: string;
     FVetName: string;
     FRawData: string;
   public
     constructor Create(ARawData:string);
     function ToString() : string;
     function Validate() : TValidationResult;
     function IsValid() : boolean;

     property PurchaseDate : string read FPurchaseDate write FPurchaseDate;
     property DrugDescription : string read FDrugDescription write FDrugDescription;
     property Quantity : string read FQuantity write FQuantity;
     property AnimalTags : string read FAnimalTags write FAnimalTags;
     property BatchNumber : string read FBatchNumber write FBatchNumber;
     property ExpiryDate : string read FExpiryDate write FExpiryDate;
     property DoseRate : string read FDoseRate write FDoseRate;
     property Withdrawal : string read FWithdrawal write FWithdrawal;
     property VPANumber : string read FVPANumber write FVPANumber;
     property VetName : string read FVetName write FVetName;
     property RawData : string read FRawData write FRawData;
   end;

const
   cPurchaseDate    = 2;
   cDrugDescription = 4;
   cDrugQuantity    = 5;
   cTagDescription  = 10;
   cBatchNo         = 11;
   cExpiryDate      = 12;
   cDoseRate        = 14;
   cWithdrawal      = 16;
   cVPANumber       = 17;
   cSupplierName    = 18;

   cValidFieldCount = 18;

implementation
uses
   SysUtils, kRoutines, uApplicationLog, CSVUtils;

{ VetLinkCsvLine }


constructor TVetLinkDataLine.Create(ARawData: string);
begin
   RawData := ARawData;
end;

function TVetLinkDataLine.IsValid: boolean;
var
   FormattedVPANumber : string;
begin
   Result := False;

   if ( (Trim(PurchaseDate)='') or
        (Trim(ExpiryDate)='') or
        (Trim(Quantity)='') ) then
      begin
         Exit;
      end;

   //   05/12/17 [V5.7 R5.9] /MK Change - Co-Op files with drugs are being sent to farmers now. Allow for DDMMMYYYY date format in Purchase Date.
   try
      StrToDate(PurchaseDate);
   except
      if ( AlphaStrToDate(PurchaseDate) <= 0 ) then Exit;
   end;

   //   05/12/17 [V5.7 R5.9] /MK Change - Co-Op files with drugs are being sent to farmers now. Allow for DDMMMYYYY date format in Expiry Date.
   try
      StrToDate(ExpiryDate);
   except
      if ( AlphaStrToDate(ExpiryDate) <= 0 ) then Exit;
   end;

   FormattedVPANumber := FormatVPANumber(VPANumber);

   //   21/08/17 [V5.7 R2.0] /MK Change - The line is valid if does/doesn't contain a VPA number or the start of the VPA number contains EU.
   Result := ( Length(FormattedVPANumber) >= 0 ) or ( Copy(UPPERCASE(VPANumber),0,2) = 'EU' );
end;

function TVetLinkDataLine.ToString: string;
begin
   Result := FPurchaseDate + ',' +
             FDrugDescription + ',' +
             FQuantity + ',' +
             FAnimalTags + ',' +
             FBatchNumber + ',' +
             FExpiryDate + ',' +
             FDoseRate + ',' +
             FWithdrawal + ',' +
             FVPANumber + ',' +
             FVetName;
end;

function TVetLinkDataLine.Validate: TValidationResult;
var
   formattedVPANumber : string;
   MyResult : TValidationResult;
   TestDate : TDateTime;

   procedure AddFailure(value : string);
   begin
      SetLength(MyResult,Length(MyResult)+1);
   end;

begin
   SetLength(MyResult,0);

   formattedVPANumber := '';

   if (Trim(VPANumber)='') then
      AddFailure('VPA Number is missing.')
   else
      begin
         formattedVPANumber := FormatVPANumber(VPANumber);
         if ((Trim(formattedVPANumber) = '') or (Pos(UPPERCASE(VPANumber),'EU')<= 0)) then
             AddFailure(Format('VPA Number is not in expected format - %s.', [VPANumber]));
      end;

   if (Trim(PurchaseDate)='') then
      AddFailure('Purchase Date is missing.')
   else
      try
         TestDate := StrToDate(PurchaseDate);
         if ((TestDate < EncodeDate(1980,01,01)) or (TestDate > Date)) then
           AddFailure(Format('Purchase date is present but a little suspect :) - %s.', [PurchaseDate]));
      except
         AddFailure(Format('Purchase date is not valid. - %s', [PurchaseDate]));
      end;

   if (Trim(BatchNumber)='') then
      AddFailure('Batch Number is missing.');

   if (Trim(ExpiryDate)='') then
      AddFailure('Purchase Date is missing.')
   else
      try
         TestDate := StrToDate(ExpiryDate);
      except
         AddFailure(Format('Purchase date is not valid - %s',[ExpiryDate]));
      end;

   if (Trim(Quantity)='') then
      AddFailure('Quantity is missing.')
   else
      try
         if not IsNumeric(Quantity) then
            AddFailure(Format('Quantity is not a number - %s',[Quantity]));
      except
         AddFailure(Format('Quantity is missing or invalid - %s',[Quantity]));
      end;

   Result := MyResult;
end;

{ TVetLinkFileImport }

function TVetLinkFileImport.Add(ADataLine: TVetLinkDataLine): Integer;
begin
   Result := inherited Add( TVetLinkDataLine(ADataLine) );
end;

procedure TVetLinkFileImport.Clear;
var
   i : Integer;
begin
  for i := 0 to Count-1 do
     TVetLinkDataLine(Items[i]).Free;
  Inherited Clear;
end;

constructor TVetLinkFileImport.create;
begin
   FParser := TSPParser.Create(nil);
   FParser.SepChar := ',';
end;

destructor TVetLinkFileImport.destroy;
begin
  //Clear();
  FreeAndNil(FParser);
  FreeAndNil(FErrors);
  inherited;
end;

function TVetLinkFileImport.GetDataLine(Index: Integer): TVetLinkDataLine;
begin
   Result := TVetLinkDataLine(inherited Items[Index] );
end;

procedure TVetLinkFileImport.Import(AFileName: string);
begin
   if not FileExists(AFilename) then
      raise Exception(Format('File not found - %s.',[AFileName]));

   Clear();

   FErrors := TStringList.Create;

   if ( UpperCase(ExtractFileExt(AFileName)) = '.CSV' ) then
      ImportCsvFile(AFileName);
end;

procedure TVetLinkFileImport.ImportCsvFile(AFileName : string);
var
   FileData : TStringList;
   HeaderLineOnFile : Boolean;
   FileLine : string;
   i, StartCount : Integer;
   vlDataLine : TVetLinkDataLine;
   sDay,
   sMonth,
   sYear : ShortString;
   sExpiryDate : String;
begin
   FileData := TStringList.Create;
   try
      FileData.LoadFromFile(AFileName);
      FileData.Text := FixCsv(FileData.Text);

      if (FileData.Count=0) then Exit;

      // Check to see if the file has a header line.
      HeaderLineOnFile := ( Pos('clientcode,date',LowerCase(FileData[0])) > 0 );
      if HeaderLineOnFile then
         StartCount := 1
      else
         StartCount := 0;

      DataLineCount := FileData.Count-StartCount;

      for i := StartCount to FileData.Count-1 do
         begin
            FileLine := FileData.Strings[i];

            if ( Length(FileLine) = 0 ) then Continue;

            //   04/08/17 [V5.7 R1.2] /MK Change - Always check for double quotes as first string in line.
            FParser.Parse(FileLine);

            //   05/12/17 [V5.7 R5.9] /MK Change - Co-Op files don't supply animal number or dose rate. If either of these fields has a value then check for double-quotes. 
            if ( Length(FParser.Fields[cTagDescription]) > 0 ) or ( Length(FParser.Fields[cWithdrawal]) > 0 ) then
               if ( Copy(FileLine,0,1) <> '"' ) or ( Pos('"',FileLine) = 0 ) then
                  begin
                     // we should skip any lines that don't contain the exact number of fields defined in VetLink file spec
                     Inc(FInvalidDataLineCount);
                     FErrors.Add(Format('Line skipped - Enclosure quotes are not present on each of the fields on line: %s ',[FileLine]));
                     Continue;
                  end;

            if (FParser.Count <> cValidFieldCount) then
               begin
                  // we should skip any lines that don't contain the exact number of fields defined in VetLink file spec
                  Inc(FInvalidDataLineCount);
                  FErrors.Add(Format('Line skipped - invalid field count detected: %d - %d expected - %s',[FParser.Count,cValidFieldCount,FileLine]));
                  Continue;
               end;

            try
               vlDataLine := TVetLinkDataLine.Create(FileLine);
               vlDataLine.PurchaseDate := Trim(RemoveQuotationMarks(FParser.Fields[cPurchaseDate]));

               //   26/09/17 [V5.7 R3.1] /MK Change - Default Medicine Name/Description to UpperCase as medicine table now contains only UpperCase names.
               vlDataLine.DrugDescription := RemoveQuotationMarks(UpperCase(FParser.Fields[cDrugDescription]));

               vlDataLine.Quantity := SanitizeNumericField(RemoveQuotationMarks(FParser.Fields[cDrugQuantity]));
               vlDataLine.AnimalTags := RemoveQuotationMarks(FParser.Fields[cTagDescription]);
               vlDataLine.BatchNumber := RemoveQuotationMarks(FParser.Fields[cBatchNo]);
               vlDataLine.ExpiryDate := RemoveQuotationMarks(FParser.Fields[cExpiryDate]);
               vlDataLine.DoseRate := Trim(RemoveQuotationMarks(FParser.Fields[cDoseRate]));
               vlDataLine.Withdrawal := Trim(RemoveQuotationMarks(FParser.Fields[cWithdrawal]));
               vlDataLine.VPANumber := FormatVPANumber(Trim(RemoveQuotationMarks(FParser.Fields[cVPANumber])));
               vlDataLine.VetName := RemoveQuotationMarks(FParser.Fields[cSupplierName]);

               if ( vlDataLine.IsValid ) then
                  Add(vlDataLine)
               else
                  begin
                     Inc(FInvalidDataLineCount);
                     //   21/08/17 [V5.7 R2.0] /MK Change - If the line does not contain a purchase date or quantity, or expiry date or batch number then its not valid.
                     //                                     Removed the requirement of the VPA number for validation.
                     //   23/08/17 [V5.7 R2.0] /MK Change - Batch Number is not required for the purchase.
                     FErrors.Add(Format('Line skipped - There are incomplete records required for drug purchase i.e. Purchase Date, Quantity and/or Expiry Date.',[FParser.Count,cValidFieldCount,FileLine]));
                     Continue;
                  end;

            except
               on e : Exception do
                  begin
                     Inc(FInvalidDataLineCount);
                     FErrors.Add(Format('Exception importing: %s',[FileLine]));
                     ApplicationLog.LogError(Format('Exception importing: %s - %s',[FileLine,e.Message]) );
                  end;
            end;
         end;
   finally
      FreeAndNil(FileData);
   end;
end;

function TVetLinkFileImport.SanitizeNumericField(
  const AValue: string): string;
var
   i : Integer;
begin
   Result := '';
   // For string like 2.5mls we want to only the numeric part of the string.
   for i := 1 to Length(AValue) do
      if ( AValue[i] in ['0'..'9'] ) or ( AValue[i] = '.' ) then
         Result := Result + AValue[i];
end;

procedure TVetLinkFileImport.SetDataLine(Index: Integer;
  const Value: TVetLinkDataLine);
begin
   Items[Index] := Value;
end;

end.
