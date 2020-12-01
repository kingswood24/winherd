{
   07/07/11 [V4.1 R2.2] /MK Change - Now Bringing In CSV File Automatically - No Need For CSVImport Button.

   30/10/19 [V5.9 R1.0] /MK Change - Execute - Moyvalley are sending on a file with an uppercase file extension, we should allow for this.
}

unit uRemittanceLoad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfRemittanceLoad = class(TForm)
    Label1: TLabel;
    lbFiles: TListBox;
    bOk: TButton;
    bCancel: TButton;
    OpenDialog: TOpenDialog;
    btnCSVImport: TButton;
    procedure lbFilesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbFilesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCSVImportClick(Sender: TObject);
  private
    { Private declarations }
    CSVFileName : String;
  public
    function ProcessCSVFile(AFileName : String) : String;
    function Execute(slFiles : tStrings) : String;
  end;

var
  fRemittanceLoad: TfRemittanceLoad;

implementation

uses ElectronicRemittanceConverter;

{$R *.DFM}

function  TfRemittanceLoad.Execute(slFiles : tStrings) : String;
var
   FileName : String;
begin
 LbFiles.Items.Assign(slFiles);
 LbFiles.Sorted:=True;
 LbFiles.ItemHeight:=Canvas.TextHeight('Wy')+2;
 Result:='';

 if ShowModal = mrOK then
    begin
       FileName := lbFiles.Items[lbFiles.ItemIndex];
       //   30/10/19 [V5.9 R1.0] /MK Change - Moyvalley are sending on a file with an uppercase file extension, we should allow for this.
       if ( UpperCase(ExtractFileExt(FileName)) = '.CSV' ) then
          begin
             Result:=ProcessCSVFile(FileName);
          end
       else
          Result:=lbFiles.Items[lbFiles.ItemIndex];
    end
end;

procedure TfRemittanceLoad.lbFilesDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
   s : string;
begin
 s:=tListBox(Control).Items[Index];
 s:=ExtractFileName(s);
 with Control as tListBox do
  begin
   Canvas.FillRect(Rect);
   Canvas.Textout(Rect.Left+1,Rect.Top+1,s);
  end;
end;

procedure TfRemittanceLoad.lbFilesClick(Sender: TObject);
begin
 bOk.Enabled:=LbFiles.ItemIndex<>-1;
end;

procedure TfRemittanceLoad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TfRemittanceLoad.btnCSVImportClick(Sender: TObject);
begin
   //ProcessCSVFile;
end;

function TfRemittanceLoad.ProcessCSVFile(AFileName : String) : String;
var
   ElectronicRemittanceConverter : TElectronicRemittanceConverter;
   fName : String;
begin
   if FileExists(AFileName) then
      begin
         ElectronicRemittanceConverter := TElectronicRemittanceConverter.Create;
         try
            ElectronicRemittanceConverter.CSVFileName := AFileName;
            try
               ElectronicRemittanceConverter.Convert;
               fName := 'C:\Kingswood Inward Files\KRemittance'+ FormatDateTime('ddmmyyhhnn', now) + '.rmt';
               ElectronicRemittanceConverter.SaveToFile(fName);
               // fName := ExtractFileName(fName);
               // lbFiles.Items.Insert(0,fName);
               // lbFiles.ItemIndex :=  lbFiles.Items.IndexOf(fName);
               Result := fName;
               // MessageDlg('File has been successfully converted',mtInformation,[mbOK],0);
            except
               on e : exception do
                  begin
                     ModalResult := mrCancel;
                     MessageDlg(E.Message + #13#10 + #13#10 + 'An error occurred while converting remittance file - contact Kingswood.',mtError,[mbOK],0);
                  end;
            end;
         finally
           FreeAndNil(ElectronicRemittanceConverter);
         end;
      end;
end;

end.
