{
   18/03/14 [V5.2 R9.0] /MK Additional Feature - Added the capability of downloading Dan Ryan/Cows 365 files.

   21/03/14 [V5.2 R9.0] /MK Additional Feature - Added the capability of not showing the Modal if there are no attachments (from Links menu only).

   22/12/16 [V5.6 R3.9] /MK Change - Look for Herd Number in file as ICBF changed file name format without telling us.

   04/08/17 [V5.7 R1.1] /MK Change - SetupListView changed of Name column if import type is not ICBF.

   28/09/17 [V5.7 R3.3] /MK Additional Feature - Added Mark File As Read button that will prompt the user yes/no to mark as read. If yes then
                                                 the usual process to mark a file as read is taken.

   05/10/17 [V5.7 R3.5] /MK Change - MarkAttachmentAsRead - If read file already exists with AttachmentName then add # and a number to AttachmentName.

   24/02/21 [V5.9 R8.6] /MK Change - BuildFileList - Used a MemDataSet to allows sort by the date in descending order - Mary Brady request. 
}

unit uFileAttachmentImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxEdit, cxLabel, cxControls, cxContainer, cxListBox,
  cxCheckBox, cxListView, ExtCtrls, ActnList, GenTypesConst, uHerdLookup,
  dxmdaset, cxUtils, db;

type
  TImportType = (itICBF, itMart, itFactorySales, itVetLink, itCows365);

  TfmFileAttachmentImport = class(TForm)
    cxLabel1: TcxLabel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    cbIncludeAllFiles: TcxCheckBox;
    cxListView1: TcxListView;
    Bevel1: TBevel;
    ActionList1: TActionList;
    actImport: TAction;
    btnDelete: TcxButton;
    actMarkFileAsRead: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure cbIncludeAllFilesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actImportUpdate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actMarkFileAsReadExecute(Sender: TObject);
    procedure actMarkFileAsReadUpdate(Sender: TObject);
  private
    { Private declarations }
    FImportType : TImportType;
    FFileList : TStringList;
    FHerdIdentity : string;
    FFileCount : Integer;
    procedure BuildFileList;
    procedure SetupListView;
  public
    { Public declarations }
    class function execute(AImportType : TImportType; AHerdIdentity : String;
       var AFileCount : Integer; const AShowForNoAttachments : Boolean = True) : string;
    class procedure MarkAttachmentAsRead(const AAttachmentName : string);
  end;

var
  fmFileAttachmentImport: TfmFileAttachmentImport;

const
   AttachmentDirArray : Array[1..5] of string = ('ICBF', 'Mart', 'Factory', 'VetLink', 'Cows365');
   cMsg_NoFileSelected = 'Cannot complete import no file has been selected.';

implementation
uses
   kRoutines,comctrls;
{$R *.DFM}

{ TForm1 }

class function TfmFileAttachmentImport.execute(AImportType: TImportType; AHerdIdentity : String;
   var AFileCount : Integer; const AShowForNoAttachments : Boolean = True): string;
begin
   with TfmFileAttachmentImport.Create(nil) do
      try
         Result := '';
         FFileCount := 0;
         FImportType := AImportType;
         FHerdIdentity := AHerdIdentity;
         BuildFileList;
         AFileCount := FFileCount;
         if ( (AShowForNoAttachments) and (AFileCount = 0) ) or ( AFileCount > 0 ) then
            ShowModal
         else if ( (not(AShowForNoAttachments)) and (AFileCount = 0) ) then
            Result := '';
      finally
         if ModalResult = mrOK then
            if cxListView1.Selected <> nil then
               Result := ( PString(cxListView1.Selected.Data)^ );
         Free;
      end;
end;

procedure TfmFileAttachmentImport.BuildFileList;
var
   i : Integer;
   FileName, FileType, FileDate : String;
   HerdIdentifier : string;
   D, M, Y : Word;
   DisplayItem : string;
   Directory : string;
   FileLocation : string;
   ListItem: TListItem;
   FileCreationDate,
   FileModifiedDate : TDateTime;
   MemData : TdxMemData;
   ListItems : TStringList;

   procedure AddItemToListView(const Text, DataText: string; ASubItems : TStrings);
   var
      pStr: PString;
      i : Integer;
   begin
      { Allocate memory to hold our dynamic string data }
      New(pStr);
      pStr^ := DataText;
      with cxListView1.Items.Add do begin
        Caption := Text;
        Data := pStr;
        for i := 0 to ASubItems.Count-1 do
           SubItems.Add(ASubItems[i]);
      end;
   end;

begin
   SetupListView;

   FFileList := TStringList.Create;
   FFileList.Clear;
   Directory := AttachmentDirArray[Ord(FImportType)+1];
   FileLocation := AttachmentStore(FHerdIdentity) + Directory;
   GetDirectoryFiles( FileLocation, FFileList);

   if not cbIncludeAllFiles.Checked then
      for i := 0 to FFileList.Count-1 do
         begin
            // remove any files previously read.
            if Pos('_read', FFileList.Strings[i]) > 0 then
                  FFileList.Objects[i] := Pointer(1)
            else
               FFileList.Objects[i] := Pointer(0);
         end;

   case FImportType of
      itICBF : Caption := 'No of outstanding ICBF Files to import';
      itMart : Caption := 'No of outstanding Mart Files to import';
      itFactorySales : Caption := 'No of outstanding Factory Files to import';
      itVetLink : Caption := 'No of outstanding VetLink Files to import';
      itCows365 : Caption := 'No of outstanding Cows365 Files to import';
   end;
   cxLabel1.Caption := Caption;

   MemData := TdxMemData.Create(nil);
   with MemData do
      try
         ClearMemDataFieldDefs(MemData);

         CreateMemDataFieldDef(MemData,'FileCaption',ftString,1000);
         CreateMemDataFieldDef(MemData,'FileName',ftString,1000);
         CreateMemDataFieldDef(MemData,'FileDate',ftDateTime);
         CreateMemDataFieldDef(MemData,'FileType',ftString,10);

         MemData.SortedField := 'FileDate';
         MemData.SortOptions := [soDesc];

         MemData.Open;
         MemData.First;

         if ( FImportType = itICBF ) then
            begin
               //  format the remaining icbf file names
               for i := 0 to FFileList.Count-1 do
                  begin
                     // remove any files previously read.
                     if ( not(cbIncludeAllFiles.Checked) ) then
                        begin
                           if Integer(FFileList.Objects[i]) <> 0 then
                              Continue;
                        end;

                     FileName := ExtractFileName(FFileList.Strings[i]);
                     if ( Pos(cTagPrefix_IE, FFileList.Strings[i]) > 0 ) then
                        HerdIdentifier := Copy(FileName, 3, 7)
                     else if ( Pos(cTagPrefix_372, FFileList.Strings[i]) > 0 ) then
                        HerdIdentifier := Copy(FileName, 4, 7)
                     else if ( Pos(FHerdIdentity, FFileList.Strings[i]) > 0 ) then
                        HerdIdentifier := FHerdIdentity;

                     if ( Length(HerdIdentifier) > 0 ) then
                        try
                           if Pos('_read', FileName) > 0 then
                              System.Delete(FileName, Pos('_read', FileName), 5);
                           if ( not(HerdIdentifier = FHerdIdentity) ) then
                              System.Insert(' ', HerdIdentifier, 3);
                           FileType := Copy(FileName, Length(FileName)-4 , 1);
                           if FileType = 'U' then
                              FileType := 'Update'
                           else
                              FileType := 'New';

                           FileDate := Copy(FileName, Length(FileName)-12, 8);
                           D := StrToInt(Copy(FileDate, 1, 2));
                           M := StrToInt(Copy(FileDate, 3, 2));
                           Y := StrToInt(Copy(FileDate, 5, 4));
                           FileCreationDate := EncodeDate(Y,M,D);

                           MemData.Append;
                           MemData.FieldByName('FileCaption').AsString := HerdIdentifier;
                           MemData.FieldByName('FileName').AsString := FFileList.Strings[i];
                           MemData.FieldByName('FileType').AsString := FileType;
                           MemData.FieldByName('FileDate').AsDateTime := FileCreationDate;
                           MemData.Post;
                        except
                        end;
                  end;
            end
         else
            begin
               for i := 0 to FFileList.Count-1 do
                  begin
                     // remove any files previously read.
                     if not cbIncludeAllFiles.Checked then
                        begin
                           if Integer(FFileList.Objects[i]) <> 0 then
                              Continue;
                        end;

                     FileName := ExtractFileName(FFileList.Strings[i]);

                     if ( Pos('_read', FileName) > 0 ) then
                        System.Delete(FileName, Pos('_read', FileName), 5);

                     FileModifiedDate := GetFileModifiedDate(FFileList.Strings[i]);
                     MemData.Append;
                     MemData.FieldByName('FileCaption').AsString := FileName;
                     MemData.FieldByName('FileName').AsString := FFileList.Strings[i];
                     MemData.FieldByName('FileDate').AsDateTime := FileModifiedDate;
                     MemData.Post;
                  end;
            end;

      cxListView1.Items.Clear;
      ListItems := TStringList.Create();
      try
         MemData.First;
         while ( not(MemData.Eof) ) do
            begin
               if ( FImportType = itICBF ) then
                  ListItems.Add(FormatDateTime('dd of mmm yyyy', MemData.FieldByName('FileDate').AsDateTime))
               else
                  ListItems.Add(FormatDateTime('dd/MM/yyyy', MemData.FieldByName('FileDate').AsDateTime));
               ListItems.Add(MemData.FieldByName('FileType').AsString);
               AddItemToListView(MemData.FieldByName('FileCaption').AsString,
                                 MemData.FieldByName('FileName').AsString,
                                 ListItems);
               ListItems.Clear;
               Inc(FFileCount);
               MemData.Next;
            end;
      finally
         if ( ListItems <> nil ) then
            FreeAndNil(ListItems);
      end;
   finally
      MemData.Active := False;
      FreeAndNil(MemData);
   end;

   btnDelete.Visible := ( FFileCount > 0 ) and ( not(cbIncludeAllFiles.Checked) );
end;

procedure TfmFileAttachmentImport.FormDestroy(Sender: TObject);
begin
   FreeAndNil( FFileList );
end;

procedure TfmFileAttachmentImport.SetupListView;
var
   ListColumn : TListColumn;
   i : Integer;
begin
   cxListView1.Items.Clear;
   cxListView1.Columns.Clear;
   if ( FImportType = itICBF ) then
      begin
         ListColumn := cxListView1.Columns.Add;
         ListColumn.Caption := 'Herd No./Designator';
         ListColumn.Width := 150;
         ListColumn := cxListView1.Columns.Add;
         ListColumn.Caption := 'File Date';
         ListColumn.Width := 120;
         ListColumn := cxListView1.Columns.Add;
         ListColumn.Caption := 'File Type';
         ListColumn.Width := 80;
      end
   else
      begin
         ListColumn := cxListView1.Columns.Add;
         ListColumn.Caption := 'Name';
         ListColumn.Width := 300;
         ListColumn := cxListView1.Columns.Add;
         ListColumn.Caption := 'Date modified';
         ListColumn.Width := 120;
      end;
end;

procedure TfmFileAttachmentImport.cbIncludeAllFilesClick(Sender: TObject);
begin
   BuildFileList;
end;

procedure TfmFileAttachmentImport.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrOk then
      begin
         if cxListView1.Selected = nil then
            begin
               CanClose := False;
               MessageDlg('You have not selected a file to import',mtInformation,[mbOk],0);
            end;
      end;
end;

class procedure TfmFileAttachmentImport.MarkAttachmentAsRead(const AAttachmentName: string);
var
   AttachmentName : string;
   i : Integer;
begin
   if ( FileExists(AAttachmentName) ) then
      begin
         if ( Pos('Mail Attachments', AAttachmentName) > 0 ) then
            begin
               AttachmentName := AAttachmentName;
               if ( Pos('_read', AttachmentName) = 0 ) then
                  begin
                     Insert('_read', AttachmentName, Length(AttachmentName)-3);
                     if ( not(FileExists(AttachmentName)) ) then
                        RenameFile( AAttachmentName, AttachmentName )
                     else
                        begin
                           //   05/10/17 [V5.7 R3.5] /MK Change - If read file already exists with AttachmentName then add # and a number to AttachmentName.
                           for i := 1 to 100 do
                              begin
                                 Insert('#'+IntToStr(i), AttachmentName, Length(AttachmentName)-3);
                                 if ( not(FileExists(AttachmentName)) ) then
                                    begin
                                       RenameFile( AAttachmentName, AttachmentName );
                                       Break;
                                    end;
                              end;
                        end;
                  end;
            end;
      end;
end;

procedure TfmFileAttachmentImport.actImportUpdate(Sender: TObject);
begin
   actImport.Enabled := (cxListView1.Selected <> nil);
end;

procedure TfmFileAttachmentImport.FormActivate(Sender: TObject);
begin
   if ( cxListView1.Items.Count > 0 ) then
      begin
         cxListView1.Items[0].MakeVisible(False);
         cxListView1.Items[0].Focused := True;
         cxListView1.Items[0].Selected := True;
      end;
   OnActivate := nil;
end;

procedure TfmFileAttachmentImport.actMarkFileAsReadExecute(Sender: TObject);
begin
   if ( MessageDlg('Are you sure you want to mark this file as read?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
      begin
         MarkAttachmentAsRead(PString(cxListView1.Selected.Data)^);
         BuildFileList;
      end;
end;

procedure TfmFileAttachmentImport.actMarkFileAsReadUpdate(Sender: TObject);
begin
   actMarkFileAsRead.Enabled := (cxListView1.Selected <> nil);
end;

end.
