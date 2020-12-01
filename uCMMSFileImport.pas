{
   23/03/09 [V3.9 R6.8] /SP - Ignore validation warnings during import, also allow duplicate tag numbers.

   25/01/11 [V4.0 R7.8] /MK Bug Fix - If NewAnimalID created next Animal's Sale Event was set to NewAnimalID.
                                    - If NewAnimalID then create Purchase Event.
}

unit uCMMSFileImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Db, DBTables, uSPParser;

type
  TfmCMMSFileImport = class(TForm)
    btnPurchFile: TButton;
    Label1: TLabel;
    tePurchFile: TEdit;
    btnSaleFile: TButton;
    Label2: TLabel;
    teSaleFile: TEdit;
    OpenDialog: TOpenDialog;
    pBarCurrent: TProgressBar;
    Button3: TButton;
    QueryAnimals: TQuery;
    Parser: TSPParser;
    btnImportSalePurch: TButton;
    procedure btnPurchFileClick(Sender: TObject);
    procedure btnSaleFileClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnImportSalePurchClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    CutOffDate : TDateTime;
    procedure ReadMovementFile(Salefile : Boolean);
    function CheckDate(const ADate : TDateTime) : TDateTime;
  public
    { Public declarations }
     class procedure ShowForm;
  end;

var
  fmCMMSFileImport: TfmCMMSFileImport;

const
  CMMS_SALE_NatIdFieldIndex = 4;
  CMMS_SALE_DOBFieldIndex = 6;
  CMMS_SALE_SexFieldIndex = 5;
  CMMS_SALE_SupplierFieldIndex = 7;
  CMMS_SALE_SaleDate = 2;

  CMMS_PURCHASE_NatIdFieldIndex = 3;
  CMMS_PURCHASE_DOBFieldIndex = 5;
  CMMS_PURCHASE_SexFieldIndex = 4;
  CMMS_PURCHASE_CustomerFieldIndex = 6;
  CMMS_PURCHASE_PurchaseDate = 1;

implementation
uses
   DairyData, EventRecording, uHerdLookup, GenTypesConst;

{$R *.DFM}

function TfmCMMSFileImport.CheckDate(const ADate: TDateTime): TDateTime;
var
  y,m,d : Word;

begin
   Result := 0;
   if ADate > Date then Exit; // if dateofbirth is after today the return 0
   DecodeDate(ADate, y, m, d);
   if y < 1950 then Exit;
   Result := ADate;
end;

procedure TfmCMMSFileImport.ReadMovementFile(Salefile : Boolean);
var
   TempStr : String;
   tDate : TDateTime;
   sFileType,
   sDateStyle : String;
   x : Integer;
   Customer, Supplier : Integer;
   SaleDeathEvent : TSaleDeathEvent;
   PurchaseEvent : TPurchaseEvent;
   EventDate : TDateTime;
   AnimalFound : Boolean;
   bNewAnimal : Boolean;

   NatIDIndex : Integer;
   DOBIndex : Integer;
   SexIndex : Integer;
   SupplierCustomerIndex : Integer;
   EventDateIndex : Integer;
   OthereventDateIndex: Integer;

   NewAnimal : TAnimalRecord;
   slLoadFile : TStringList;

   tNatID, FBuffer : String;

begin
  slLoadFile := TStringList.Create;
  slLoadFile.Clear;
  if Salefile then
     slLoadFile.LoadFromFile(teSaleFile.Text)
  else
     slLoadFile.LoadFromFile(tePurchFile.Text);
  pBarCurrent.Position := 0;
  pBarCurrent.Max := slLoadFile.Count;
  pBarCurrent.Step := 1;
  pBarCurrent.Visible := True;
  Update;

  QueryAnimals.Active := False;
  QueryAnimals.Active := True;

  if SaleFile then
     begin
        NatIDIndex := CMMS_SALE_NatIdFieldIndex;
        DOBIndex := CMMS_SALE_DOBFieldIndex;
        SexIndex := CMMS_SALE_SexFieldIndex;
        SupplierCustomerIndex := CMMS_SALE_SupplierFieldIndex;
        EventDateIndex := CMMS_SALE_SaleDate;
        SaleDeathEvent := TSaleDeathEvent.Create('cmmssales');
     end
  else
     begin
        NatIDIndex := CMMS_PURCHASE_NatIdFieldIndex;
        DOBIndex := CMMS_PURCHASE_DOBFieldIndex;
        SexIndex := CMMS_PURCHASE_SexFieldIndex;
        SupplierCustomerIndex := CMMS_PURCHASE_CustomerFieldIndex;
        EventDateIndex := CMMS_PURCHASE_PurchaseDate;
        OthereventDateIndex := 8;
        PurchaseEvent := TPurchaseEvent.Create('cmmspurch');
        SaleDeathEvent := TSaleDeathEvent.Create('cmmssales');
     end;

   NewAnimal := TAnimalRecord.Create;
   NewAnimal.RaiseExceptions := False;
   NewAnimal.ValidateBreed := False;
   NewAnimal.AllowDuplicateTags := True;
   NewAnimal.ValidateColour := False;
   NewAnimal.ValidateDOB := False;
   NewAnimal.ValidateIdTags := False;

  try
   for x := 0 to Pred(slLoadFile.Count) do
      begin
         bNewAnimal := False;
         Application.ProcessMessages;
         FBuffer := '';
         FBuffer := Trim(slLoadFile.Strings[x]);
         if FBuffer <> '' then
            begin
               Parser.Parse(FBuffer);
               tNatID := Trim(Parser.Fields[NatIDIndex]);
               if tNatID = '' then Continue;
             //  if tNatID = 'IE361079810022' then ShowMessage('IE361079810022');

               TempStr := Trim(Parser.Fields[EventDateIndex]);
               if (TempStr = '') or (StrToDate(TempStr) < CutOffDate) then
                  Continue;

               AnimalFound := QueryAnimals.Locate('SearchNatID', tNatID, []);
               if ( not AnimalFound ) then
                  begin
                     NewAnimal.Add;
                     try
                     NewAnimal.HerdID := WiNdata.UserDefaultHerdID;
                     NewAnimal.NatIDNum := tNatID;
                     NewAnimal.AnimalNo := '';
                     NewAnimal.LactNo := 0;
                     { DateOfBirth  }
                     tDate := 0;
                     TempStr := Trim(Parser.Fields[DOBIndex]);
                     if TempStr = '' then
                        NewAnimal.DateOfBirth := EncodeDate(1996, 01, 01)
                     else
                        begin
                           tDate := StrToDate(TempStr);
                           tDate := CheckDate(tDate);
                           NewAnimal.DateOfBirth := tDate;
                        end;
                     if Trim(Parser.Fields[SexIndex]) = 'F' then
                        NewAnimal.Sex := 'Female'
                     else
                        NewAnimal.Sex := 'Steer';

                     NewAnimal.InHerd := True;
                     NewAnimal.Breeding := False;
                     NewAnimal.AnimalDeleted := False;
                     NewAnimal.Save;
                     AnimalFound := True;
                     bNewAnimal := True;
                     except

                     end;
                  end;

               if ( AnimalFound ) and ( bNewAnimal ) then
                  begin
                     try
                        if SaleFile then
                           begin
                              //Customer := AddCustomer(  Trim(Parser.Fields[SupplierCustomerIndex]));
                              SaleDeathEvent.Append;
                              SaleDeathEvent.AnimalID := NewAnimal.ID;
                              SaleDeathEvent.AnimalHerdID := NewAnimal.HerdID;
                              SaleDeathEvent.Sold := True;
                              SaleDeathEvent.PreSale := False;
                              TempStr := Trim(Parser.Fields[EventDateIndex]);
                              if TempStr <> '' then
                                 SaleDeathEvent.EventDate := StrToDate(TempStr);
                              SaleDeathEvent.EventComment := 'Sale';
                              SaleDeathEvent.AnimalLactNo := NewAnimal.LactNo;
                              SaleDeathEvent.Post;
                              WinData.AddToEventLookupData(NewAnimal.ID, CSaleDeathEvent);
                           end
                        else
                           begin
                              PurchaseEvent.Append;
                              PurchaseEvent.AnimalID := NewAnimal.ID;
                              PurchaseEvent.AnimalHerdID := NewAnimal.HerdID;
                              TempStr := Trim(Parser.Fields[EventDateIndex]);
                              if TempStr <> '' then
                                 PurchaseEvent.EventDate := StrToDate(TempStr);
                              PurchaseEvent.EventComment := 'Purchase';
                              PurchaseEvent.AnimalLactNo := NewAnimal.LactNo;
                              PurchaseEvent.Post;
                              WinData.AddToEventLookupData(NewAnimal.ID, CPurchaseEvent);

                              if not WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([ NewAnimal.ID,CSaleDeathEvent]),[]) then
                                 begin
                                    TempStr := Trim(Parser.Fields[OthereventDateIndex]);
                                    if TempStr <> '' then
                                       begin
                                          SaleDeathEvent.Append;
                                          SaleDeathEvent.AnimalID := NewAnimal.ID;
                                          SaleDeathEvent.AnimalHerdID := NewAnimal.HerdID;
                                          SaleDeathEvent.Sold := True;
                                          SaleDeathEvent.PreSale := False;
                                          SaleDeathEvent.EventDate := StrToDate(TempStr);
                                          SaleDeathEvent.EventComment := 'Sale';
                                          SaleDeathEvent.AnimalLactNo := NewAnimal.LactNo;
                                          SaleDeathEvent.Post;
                                          WinData.AddToEventLookupData(NewAnimal.ID, CSaleDeathEvent);
                                       end;
                                 end;
                           end;
                     finally

                     end;
                  end
               else if ( AnimalFound ) and not ( bNewAnimal ) then
                  begin
                     try
                        if SaleFile then
                           begin
                              //Customer := AddCustomer(  Trim(Parser.Fields[SupplierCustomerIndex]));
                              SaleDeathEvent.Append;
                              SaleDeathEvent.AnimalID := QueryAnimals.FieldByName('ID').AsInteger;
                              SaleDeathEvent.AnimalHerdID := QueryAnimals.FieldByName('HerdID').AsInteger;
                              SaleDeathEvent.Sold := True;
                              SaleDeathEvent.PreSale := False;
                              TempStr := Trim(Parser.Fields[EventDateIndex]);
                              if TempStr <> '' then
                                 try
                                    SaleDeathEvent.EventDate := StrToDate(TempStr);
                                 except
                                    ShowMessage('Failed to create date from string '+ FBuffer);
                                 end;

                              SaleDeathEvent.EventComment := 'Sale';
                              SaleDeathEvent.AnimalLactNo := QueryAnimals.FieldByName('LactNo').AsInteger;
                              SaleDeathEvent.Post;
                              WinData.AddToEventLookupData(QueryAnimals.FieldByName('ID').AsInteger, CSaleDeathEvent);
                           end
                        else
                           begin
                              PurchaseEvent.Append;
                              PurchaseEvent.AnimalID := QueryAnimals.FieldByName('ID').AsInteger;
                              PurchaseEvent.AnimalHerdID := QueryAnimals.FieldByName('HerdID').AsInteger;
                              TempStr := Trim(Parser.Fields[EventDateIndex]);
                              if TempStr <> '' then
                                 PurchaseEvent.EventDate := StrToDate(TempStr);
                              PurchaseEvent.EventComment := 'Purchase';
                              PurchaseEvent.AnimalLactNo := QueryAnimals.FieldByName('LactNo').AsInteger;
                              PurchaseEvent.Post;
                              WinData.AddToEventLookupData(QueryAnimals.FieldByName('ID').AsInteger, CPurchaseEvent);

                              if not WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([ QueryAnimals.FieldByName('ID').AsInteger,CSaleDeathEvent]),[]) then
                                 begin
                                    TempStr := Trim(Parser.Fields[OthereventDateIndex]);
                                    if TempStr <> '' then
                                       begin
                                          SaleDeathEvent.Append;
                                          SaleDeathEvent.AnimalID := QueryAnimals.FieldByName('ID').AsInteger;
                                          SaleDeathEvent.AnimalHerdID := QueryAnimals.FieldByName('HerdID').AsInteger;
                                          SaleDeathEvent.Sold := True;
                                          SaleDeathEvent.PreSale := False;
                                          SaleDeathEvent.EventDate := StrToDate(TempStr);
                                          SaleDeathEvent.EventComment := 'Sale';
                                          SaleDeathEvent.AnimalLactNo := QueryAnimals.FieldByName('LactNo').AsInteger;
                                          SaleDeathEvent.Post;
                                          WinData.AddToEventLookupData(QueryAnimals.FieldByName('ID').AsInteger, CSaleDeathEvent);
                                       end;
                                 end;
                           end;
                     except
                        on e : exception do
                          begin
                             if Parser <> nil then
                                Showmessage(E.Message + ' ' +  Parser.Fields[0]);
                          end;
                     end;
                  end;
            end;
         pBarCurrent.StepIt;
      end;

      if SaleFile then
         messageDlg('Sales file (Movements Out) import complete',mtInformation,[mbOK],0)
      else
         messageDlg('Purchase file (Movements In) import complete',mtInformation,[mbOK],0)

   finally
      if SaleFile then
         begin
            FreeAndNil(SaleDeathEvent);
         end
       else
         begin
            FreeAndNil(SaleDeathEvent);
            FreeAndNil(PurchaseEvent);
         end;
       FreeAndNil(NewAnimal);
       QueryAnimals.Active := False;
       pBarCurrent.Visible := False;
       Update;
     end;
end;


class procedure TfmCMMSFileImport.ShowForm;
begin
   with TfmCMMSFileImport.Create(nil) do
      try
         CutOffDate := Windata.CMMSDataStartUpDate;
         if (CutOffDate > 1) then
            begin
               CutOffDate := IncMonth(CutOffDate, -12);
               ShowModal;
            end
         else if (CutOffDate = 1) then
            MessageDlg('Unable to load CMMS movements.'+#13#10+'This data has already been imported.',mtWarning,[mbOK],0)
         else
            MessageDlg('Unable to load CMMS movements.'+#13#10+'No CMMS start date has been detected.',mtWarning,[mbOK],0);
      finally
         Free;
      end;
end;

procedure TfmCMMSFileImport.btnPurchFileClick(Sender: TObject);
begin
   OpenDialog.FileName := '';
   if OpenDialog.Execute then
      begin
         tePurchFile.Text := OpenDialog.FileName;
      end;
end;

procedure TfmCMMSFileImport.btnSaleFileClick(Sender: TObject);
begin
   OpenDialog.FileName := '';
   if OpenDialog.Execute then
      begin
         teSaleFile.Text := OpenDialog.FileName;
      end;
end;

procedure TfmCMMSFileImport.FormActivate(Sender: TObject);
begin
   MessageDlg('WARNING! '+cCRLF+
              'This import of movements history, prior to the start date of'+cCRLF+
              'your electronic herd register, should only be done once.'+cCRLF+
              'It will contain incomplete records of your livestock sales '+cCRLF+
              'and purchases (eg no customer, supplier or animal breed data'+cCRLF+
              'will be included).'+cCRLF+
              'It is NOT intended to extend your electronic herd register'+cCRLF+
              'backwards in time. It''s primary purpose is to allow the '+cCRLF+
              'user to generate livestock inventory reports (such as the '+cCRLF+
              'REPS report) without having to input manually these movement'+cCRLF+
              'events. Because of the uncomplete nature of the records, '+cCRLF+
              'these reports should be treated with caution.',mtWarning,[mbOK],0);
end;

procedure TfmCMMSFileImport.btnImportSalePurchClick(Sender: TObject);
begin
   if (FileExists(tePurchFile.text)) and (not FileExists(teSaleFile.text)) then
       begin
          MessageDlg('You must select a move out file to import',mtError,[mbOK],0);
          Exit;
       end;
   ReadMovementFile(True);
   if (FileExists(tePurchFile.text)) then
      ReadMovementFile(False);
   WinData.CMMSDataStartUpDate := 1;
   Close;
end;

procedure TfmCMMSFileImport.Button3Click(Sender: TObject);
begin
   Close;
end;

end.
