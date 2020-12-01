unit uPDAReportDefaults;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uPDAReportSelection, uPDAReportFrame, StdCtrls, Mask, ToolEdit, Registry,
  FileCtrl, CheckLst, ExtCtrls, RXCtrls, ComCtrls, ToolWin, Buttons, GenTypesConst;

type
  TPDAReportDefaults = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    GroupBox3: TGroupBox;
    pButtons: TPanel;
    sbHerdReports: TSpeedButton;
    sbSalesEligibility: TSpeedButton;
    sbQualityAssurance: TSpeedButton;
    sbCowRec: TSpeedButton;
    sbBreedingFert: TSpeedButton;
    sbMilkAnalysis: TSpeedButton;
    sbPedigreeReports: TSpeedButton;
    sbBeefMan: TSpeedButton;
    gbFileProperties: TGroupBox;
    lFileName: TLabel;
    eFileName: TEdit;
    lFileType: TLabel;
    cbFileType: TComboBox;
    btnUpdate: TButton;
    gbPedigree: TGroupBox;
    cbPedigreeReports: TCheckListBox;
    gbMilkAnalysis: TGroupBox;
    cbMilkAnalysis: TCheckListBox;
    gbBreedingFert: TGroupBox;
    cbBreedingFert: TCheckListBox;
    gbBeefMan: TGroupBox;
    cbBeefMan: TCheckListBox;
    gbCowRec: TGroupBox;
    cbCowRec: TCheckListBox;
    gbQualityAssurance: TGroupBox;
    cbQualityAssurance: TCheckListBox;
    gbSalesAnalysis: TGroupBox;
    cbSalesAnalysis: TCheckListBox;
    gbHerdReports: TGroupBox;
    cbHerdReports: TCheckListBox;
    sbHelp: TRxSpeedButton;
    Button1: TButton;
    Label1: TLabel;
    OutputDir: TDirectoryEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure nfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure sbHerdReportsClick(Sender: TObject);
    procedure cbHerdReportsClick(Sender: TObject);
    procedure cbHerdReportsClickCheck(Sender: TObject);
  private
    { Private declarations }
    Reg : TRegistry;
    ThisPDALinkReportInfo : TPDALinkReportInfo;
    LastCategory : Integer;
    LastIndex : Integer;
    function GetPDALinkInfo(Category : Byte; ReportIndex : Integer) : TPDALinkReportInfo;
    function SetPDALinkInfo(Category : Byte; ReportIndex : Integer;
            const APDALinkReportInfo : TPDALinkReportInfo) : Boolean;
    procedure SaveOutputDir(Dir : String);
    procedure LoadPDALinkActiveReports;
    function GetReportCheckListBox(index: Integer): TCheckListBox;
    function GetPDAReportGroupBox(index: Integer): TGroupBox;
    procedure SetupForm;
  public
    { Public declarations }
  end;

const
   iReportCategories : array[0..7] of string =
             ( 'Herd Reports', 'Sales Eligibility', 'Quality Assurance',
               'Cow Recording', 'Breeding/Fertility', 'Milk Analysis',
               'Pedigree Reports', 'Beef Management');
var
  PDAReportDefaults: TPDAReportDefaults;

implementation
uses
   DairyData;

{$R *.DFM}

procedure TPDAReportDefaults.FormCreate(Sender: TObject);
begin
   WinData.LoadBtnImage( sbExit.Glyph, cBtnImgExit);
   if not DirectoryExists ( OutputDir.InitialDir ) then
      CreateDir( OutputDir.InitialDir );
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   SetupForm;
end;

function TPDAReportDefaults.GetPDALinkInfo(Category: Byte;
  ReportIndex : Integer): TPDALinkReportInfo;
begin
   Result.FileName := '';
   Result.FileType := 0;

   if Reg.OpenKey( cPDALink + cPDALink_Categories + '\' + IntToStr(Category), TRUE) then
      try
         if not Reg.ValueExists( cPDALink_CategoryName ) then
            Reg.WriteString( cPDALink_CategoryName, iReportCategories[Category]);
      finally
         Reg.CloseKey;
      end;

   if Reg.OpenKey( cPDALink + cPDALink_Categories + '\' + IntToStr(Category) + '\' + IntToStr(ReportIndex) , TRUE) then
      try
         if not Reg.ValueExists( cPDALink_OutputFileName ) then
            Reg.WriteString( cPDALink_OutputFileName, '');

         if not Reg.ValueExists( cPDALink_OutputFileType ) then
            Reg.WriteInteger( cPDALink_OutputFileType, 0);

         if not Reg.ValueExists( cPDALink_ReportActive ) then
            Reg.WriteBool( cPDALink_ReportActive, False);

         Result.FileName := Reg.ReadString( cPDALink_OutputFileName );
         Result.FileType := Reg.ReadInteger( cPDALink_OutputFileType );
         Result.ReportActive := Reg.ReadBool( cPDALink_ReportActive );
      finally
         Reg.CloseKey;
      end;
end;

function TPDAReportDefaults.SetPDALinkInfo(Category: Byte;
  ReportIndex: Integer; const APDALinkReportInfo: TPDALinkReportInfo) : Boolean;
begin
   Result := False;
   if Reg.OpenKey( cPDALink + cPDALink_Categories + '\' + IntToStr(Category) + '\' + IntToStr(ReportIndex) , TRUE) then
      try
         Reg.WriteString(cPDALink_OutputFileName, APDALinkReportInfo.FileName);
         Reg.WriteInteger(cPDALink_OutputFileType, APDALinkReportInfo.FileType);
         Reg.WriteBool(cPDALink_ReportActive, APDALinkReportInfo.ReportActive);
         Result := True;
      finally
         Reg.CloseKey;
      end;
end;

procedure TPDAReportDefaults.btnUpdateClick(Sender: TObject);
begin
   ThisPDALinkReportInfo.FileName := Trim(eFileName.Text);
   ThisPDALinkReportInfo.FileType := cbFileType.ItemIndex;
   if SetPDALinkInfo(LastCategory,LastIndex,ThisPDALinkReportInfo) then
      MessageDlg('File export properties successful updated',mtInformation,[mbOK],0);
end;

procedure TPDAReportDefaults.SaveOutputDir(Dir: String);
begin
end;

procedure TPDAReportDefaults.nfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
   if not DirectoryExists(Name) then
      raise Exception.Create('Invalid Directory');
   WinData.PDALinkDirectory := Name;
end;

procedure TPDAReportDefaults.LoadPDALinkActiveReports;
var
   i, j : Integer;
begin
   for i := 0 to 7 do
      for j := 0 to GetReportCheckListBox(i).Items.Count-1 do
          GetReportCheckListBox(i).Checked[j] := GetPDALinkInfo(i, j).ReportActive;
end;

function TPDAReportDefaults.GetReportCheckListBox(index: Integer): TCheckListBox;
begin
   Result := nil;
   case index of
      0 : Result := cbHerdReports;
      1 : Result := cbSalesAnalysis;
      2 : Result := cbQualityAssurance;
      3 : Result := cbCowRec;
      4 : Result := cbBreedingFert;
      5 : Result := cbMilkAnalysis;
      6 : Result := cbPedigreeReports;
      7 : Result := cbBeefMan;
   end;
end;

procedure TPDAReportDefaults.sbHerdReportsClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to 7 do
     begin
         GetPDAReportGroupBox( i ).Visible := GetPDAReportGroupBox( i ).Tag = (Sender as TSpeedButton).Tag;
         if GetPDAReportGroupBox( i ).Visible then
            begin
               LastCategory := ( Sender as TSpeedButton ).Tag;
               GetReportCheckListBox( i ).ItemIndex := 0;
               LastIndex := 0;
               cbHerdReportsClick(GetReportCheckListBox( i ));
            end;
     end;
end;

function TPDAReportDefaults.GetPDAReportGroupBox(
  index: Integer): TGroupBox;
begin
   Result := nil;
   case index of
      0 : Result := gbHerdReports;
      1 : Result := gbSalesAnalysis;
      2 : Result := gbQualityAssurance;
      3 : Result := gbCowRec;
      4 : Result := gbBreedingFert;
      5 : Result := gbMilkAnalysis;
      6 : Result := gbPedigree;
      7 : Result := gbBeefMan;
   end;
end;

procedure TPDAReportDefaults.SetupForm;
begin
   OutputDir.InitialDir := WinData.PDALinkDirectory;
   LoadPDALinkActiveReports;
   cbHerdReports.ItemIndex := 0;
   sbHerdReportsClick(sbHerdReports); // default to herd reports.
   cbHerdReportsClick(cbHerdReports);
end;

procedure TPDAReportDefaults.cbHerdReportsClick(Sender: TObject);
begin
   LastIndex := ( Sender as TCheckListBox ).ItemIndex;
   ThisPDALinkReportInfo := GetPDALinkInfo( ( Sender as TCheckListBox ).Tag, LastIndex);
   gbFileProperties.Caption := ( ( Sender as TCheckListBox ).Parent as TGroupBox).Caption + ' - ' + ( Sender as TCheckListBox ).Items[( Sender as TCheckListBox ).ItemIndex]; //'Output File Parmeters - '+lCurrentReport.Caption;
   eFileName.Text := ThisPDALinkReportInfo.FileName;
   cbFileType.ItemIndex := ThisPDALinkReportInfo.FileType;
   ( Sender as TCheckListBox ).Checked[ ( Sender as TCheckListBox ).ItemIndex ] := ThisPDALinkReportInfo.ReportActive;
end;

procedure TPDAReportDefaults.cbHerdReportsClickCheck(Sender: TObject);
begin
{  ThisPDALinkReportInfo.ReportActive := ( Sender as TCheckListBox ).Checked[ ( Sender as TCheckListBox ).ItemIndex ];
   ThisPDALinkReportInfo.FileName := Trim(eFileName.Text);
   ThisPDALinkReportInfo.FileType := cbFileType.ItemIndex;
   SetPDALinkInfo(( Sender as TCheckListBox ).Tag,( Sender as TCheckListBox ).ItemIndex,ThisPDALinkReportInfo);
}
end;

end.
