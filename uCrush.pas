unit uCrush;

interface

uses
   Windows, Classes, SysUtils, db, dbtables, Dialogs, uCrushDataLoad, uCrushHelper,
   KRoutines, uCrushAnimalReview;

type
   TCrushRecord = record
     AnimalNum : String[10];
     AnimalTag : String[20];
     Weight : Double;
     DateOfWeighing : TDateTime;
     HasCard : Boolean;
   end;

   TCrush = class
   private
      FCrushFileType : TCrushFileType;
      FInvokeReview: Boolean;
      FIdTag : String;
      FCrushRecord : TCrushRecord;
      FDefaultComment : String;
      FTempQuery : TQuery;
    FInUse: Boolean;
      procedure SetCrushFileType(const Value: TCrushFileType);
      procedure CrushDiskTransAfterScroll(Sender : TDataset);
      procedure SetDefaultComment(const Value: String);
      function GetNextCrushDiskID: Integer;
      procedure SetNextCrushDiskID(const Value: Integer);
    function GetInUse: Boolean;
    procedure SetInuse(const Value: Boolean);
   protected
      function IsAlreadyMatched(AIdTag : String) : Boolean;
      function FindMatch(AIdTag : String) : Boolean;
      procedure ShowReview;
   public
      CrushDisk : TTable;
      CrushDiskTrans : TTable;
      constructor Create;
      destructor Destroy;override;
      function UpdateHasTag(AIdTag : String; const NotifyUser : Boolean = False) : Boolean;
      procedure ShowCrushDataLoad;
      property CrushFileType : TCrushFileType read FCrushFileType write SetCrushFileType;
      property InvokeReview : Boolean read FInvokeReview write FInvokeReview;
      property CrushRecord : TCrushRecord read FCrushRecord;
      property NextCrushDiskID : Integer read GetNextCrushDiskID write SetNextCrushDiskID;
      property DefaultComment : string read FDefaultComment write SetDefaultComment;
      property InUse : Boolean read GetInUse write SetInuse;
   end;

var
   Global_Crush : TCrush;

implementation
uses
   uUpdateTables, GenTypesConst;

{ TCrush }

constructor TCrush.Create;
begin
   if not uUpdateTables.CreateCrushTables then
      raise Exception.Create('Unable to create tables, contact Kingswood');

   CrushDisk := TTable.Create(nil);
   CrushDisk.DatabaseName := 'kingswd';
   CrushDisk.TableName := 'CrushDisk';
   CrushDisk.Open;

   CrushDiskTrans := TTable.Create(nil);
   CrushDiskTrans.DatabaseName := 'kingswd';
   CrushDiskTrans.TableName := 'CrushDiskTrans';
   CrushDiskTrans.Open;

   //FInUse := ( CrushDiskTrans.RecordCount > 0 );
   GetRegValue(Reg_DefaultPath + Reg_BeefGrpSalesIdent, Reg_UseCrushFileIdent, FInUse);

   CrushDiskTrans.AfterScroll := CrushDiskTransAfterScroll;

   FTempQuery := TQuery.Create(nil);
   FTempQuery.DatabaseName := 'kingswd';

   FillChar(FCrushRecord, SizeOf(TCrushRecord), #0);

   FInvokeReview := True;
end;

destructor TCrush.Destroy;
begin
  CrushDisk.Close;
  FreeAndNil(CrushDisk);

  CrushDiskTrans.Close;
  FreeAndNil(CrushDiskTrans);

  FreeAndNil(FTempQuery);

  inherited;
end;

function TCrush.FindMatch(AIdTag: String): Boolean;
begin
   Result := CrushDiskTrans.Locate('AnimalTag;CrushDataType', VarArrayOf([AIdTag,Ord(FCrushFileType)]), []);
end;

function TCrush.IsAlreadyMatched(AIdTag: String): Boolean;
begin
   Result := CrushDiskTrans.Locate('AnimalTag;CrushDataType;HasCard', VarArrayOf([AIdTag,Ord(FCrushFileType),True]), []);
end;

procedure TCrush.SetCrushFileType(const Value: TCrushFileType);
begin
   FCrushFileType := Value;
   if CrushDiskTrans <> nil then
      begin
         CrushDiskTrans.Filter   := 'CrushDataType ='+ IntToStr( Ord(Value) );
         CrushDiskTrans.Filtered := True;
         if Value = cftPurchase then
            FDefaultComment := 'Purchase'
         else
            FDefaultComment := 'Sale';
      end;
end;

procedure TCrush.ShowCrushDataLoad;
begin
   TfmCrushDataLoad.ShowTheForm(FCrushFileType);
   // Reload Crush Data;
   CrushDisk.Refresh;
   CrushDiskTrans.Refresh;

   FInUse := ( CrushDiskTrans.RecordCount > 0 );
end;

function TCrush.UpdateHasTag(AIdTag: String;
   const NotifyUser : Boolean = False) : Boolean;
begin
   Result := False;
   FIdTag := AIdTag;
   AIdTag := StripAllNomNumAlpha( AIdTag );

   if not IsAlreadyMatched( AIdTag ) then
      begin
         if FindMatch(AIdTag) then
            begin
               CrushDiskTrans.Edit;
               CrushDiskTrans.FieldByName('HasCard').AsBoolean := True;
               CrushDiskTrans.Post;

               CrushDiskTransAfterScroll(CrushDiskTrans);

               Result := True;

               if FInvokeReview then
                  ShowReview;
            end
         else if NotifyUser then
            begin
               Sysutils.Beep;
               MessageDlg(Format('Cannot locate animal tag "%s" in crush file', [FIdTag]),mtWarning,[mbOK],0);
            end;
      end
   else
      raise Exception.Create('This animal was already matched');

end;

procedure TCrush.ShowReview;
begin
   TfmCrushAnimalReview.ShowAnimalReview( FIdTag, CrushDiskTrans.FieldByName('AnimalNum').AsString,
   CrushDiskTrans.FieldByName('AnimalWgt').AsFloat, CrushDiskTrans.FieldByName('WeighingDate').AsDateTime );
end;


procedure TCrush.CrushDiskTransAfterScroll(Sender: TDataset);
begin
   if not Sender.ControlsDisabled then
      begin
         FCrushRecord.AnimalNum := Sender.FieldbyName('AnimalNum').AsString;
         FCrushRecord.AnimalTag := Sender.FieldbyName('AnimalTag').AsString;
         FCrushRecord.Weight    := Sender.FieldbyName('AnimalWgt').AsFloat;
         FCrushRecord.DateOfWeighing := Sender.FieldbyName('WeighingDate').AsDateTime;
         FCrushRecord.HasCard   := Sender.FieldbyName('HasCard').AsBoolean;
      end;
end;

procedure TCrush.SetDefaultComment(const Value: String);
begin
   FDefaultComment := Value;
end;

function TCrush.GetNextCrushDiskID: Integer;
begin
   with FTempQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT CrushDiskId From OtherIDs');
         Open;
         try
            First;
            Result := FieldByName('CrushDiskId').AsInteger + 1;
         finally
            Close;
         end;
      end;
end;

procedure TCrush.SetNextCrushDiskID(const Value: Integer);
begin
   with FTempQuery do
      begin
         SQL.Clear;
         SQL.Add('UPDATE OtherIDs Set CrushDiskId = ' +IntToStr(Value));
         ExecSQL;
      end;
end;

procedure TCrush.SetInuse(const Value: Boolean);
begin
   SetRegValue(Reg_DefaultPath + Reg_BeefGrpSalesIdent, Reg_UseCrushFileIdent, Value);
end;

function TCrush.GetInUse: Boolean;
begin
   GetRegValue(Reg_DefaultPath + Reg_BeefGrpSalesIdent, Reg_UseCrushFileIdent, Result);
end;

end.
