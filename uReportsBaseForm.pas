unit uReportsBaseForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, RXCtrls, ComCtrls, ToolWin,
  QuickRpt, QRCtrls, db, QRExport, DBTables, uHerdOwner;

type
  TReportsBaseForm = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    pHerdID: TPanel;
    Label7: TLabel;
    cbHerdIdentity: TRxDBLookupCombo;
    GroupBox1: TGroupBox;
    LFromDate: TLabel;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    LToDate: TLabel;
    rgSortBy: TRadioGroup;
    rgSortOrder: TRadioGroup;
    ProgBar: TProgressBar;
    lWaitCaption: TLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    GenQuery: TQuery;
    BaseReport: TQuickRep;
    PageHeaderBand: TQRBand;
    ReportTitle: TQRLabel;
    DateTimeLabel: TQRSysData;
    PageNumLabel: TQRSysData;
    SubDetailBand: TQRSubDetail;
    SummaryBand: TQRBand;
    CountExpression: TQRExpr;
    TotalLabel: TQRLabel;
    PageFooterBand: TQRBand;
    CompanyNameLabel: TQRLabel;
    ProgramVersionLabel: TQRLabel;
    qrlSortBy: TQRLabel;
    qrlSortOrder: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel19: TQRLabel;
    qrlHerdIdentity: TQRLabel;
    cbUseFilter: TCheckBox;
    cbDichromatic: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure cbHerdIdentityChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QRDateLabelHandler(sender: TObject; var Value: String);
    procedure FormDestroy(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure SubDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FHelpFile: string;
    FHerdID: Integer;
    FShowAllHerds: Boolean;
    procedure HerdIdentityChange; dynamic;
    procedure SetShowAllHerds(const Value: Boolean);
    procedure SetHelpFile(const Value: string);
    procedure SetHerdID(const Value: Integer);
    function GetHerdID: Integer;
    function GetHerdIdentity: string;
    function GetOwnerName: string;
    function GetSortByField: string;
    function GetSortByOrder: string;
    procedure SetShowFilter(const Value: Boolean);
    procedure SetDichromatic(const Value: Boolean);
    function GetShowDichromatic: Boolean;
    function GetShowFilter: Boolean;
  protected
    ChangeMade : Boolean;
    TempTable : TTable;
    FormShowing : Boolean;
    HerdOwnerData : THerdOwnerData;
    procedure SetupForm; virtual;
    procedure LoadScreenDefaults;virtual;
    procedure SaveScreenDefaults;virtual;
    procedure EnableViewPrintButtons(const AEnable : Boolean);
    procedure LoadReportData;virtual;
  public
    { Public declarations }
    PDAExport : Boolean;
    procedure InitProgress(const Min, Max, Step : Integer; const ProgCaption : String = '');
    procedure ResetProgress;
    procedure StepProgress(const Step : Integer = 1);
    function ExportToPDA(QR : TQuickRep) : Boolean;
    property ShowAllHerds : Boolean read FShowAllHerds write SetShowAllHerds;
    property HelpFile : string read FHelpFile write SetHelpFile;
    property HerdID : Integer read GetHerdID write SetHerdID;
    property HerdIdentity : string read GetHerdIdentity;
    property OwnerName : string read GetOwnerName;
    property SortByField : string read GetSortByField;
    property SortByOrder : string read GetSortByOrder;
    property ShowFilter : Boolean read GetShowFilter write SetShowFilter;
    property ShowDichromatic : Boolean read GetShowDichromatic write SetDichromatic;
  end;

const
   cDatabaseName = 'kingswd';
   cAscending = 0;
   cDescending = 1;

var
  ReportsBaseForm: TReportsBaseForm;

implementation

uses DairyData, GenTypesConst;

{$R *.DFM}

procedure TReportsBaseForm.FormCreate(Sender: TObject);
begin
   SetupForm;
end;

procedure TReportsBaseForm.SetupForm;
begin
   FormShowing := False;
   PDAExport := WinData.ExportToPDA;
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbView.Glyph, cBtnImgPreview);
   WinData.LoadBtnImage(WinData.Images,sbPrint.Glyph, cBtnImgPrint);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph, cBtnImgHelp);
   BaseReport.Hide;
   ProgramVersionLabel.Caption := ProgramVersionLabel.Caption + ' ' + HerdVerNo;
   FromDate.Date := IncMonth(Date, -1); // default a month back
   ToDate.Date := Date; // default to todays date
   cbHerdIdentity.KeyValue := WinData.UserDefaultHerdID;
   HelpFile := '';
   qrlHerdIdentity.Caption := '';
   qrlSortBy.Caption := '';
   qrlSortOrder.Caption := '';
   ResetProgress;
   TempTable := TTable.Create(nil);
   TempTable.DatabaseName := AliasName;
   ShowAllHerds := False;
   ShowFilter := True;
   ShowDichromatic := False;

   HerdOwnerData  := THerdOwnerData.Create(WinData.KingData, WinData.UserDefaultHerdID);

   ChangeMade := True;
end;

procedure TReportsBaseForm.sbHelpClick(Sender: TObject);
begin
   if HelpFile <> '' then
      WinData.HTMLHelp(HelpFile);
end;

procedure TReportsBaseForm.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TReportsBaseForm.SetHelpFile(const Value: string);
begin
   FHelpFile := Value;
end;

procedure TReportsBaseForm.cbHerdIdentityChange(Sender: TObject);
begin
   HerdIdentityChange;
   ChangeMade := True;
end;

procedure TReportsBaseForm.HerdIdentityChange;
begin
   if Trim(cbHerdIdentity.Value) <> '0' then
      HerdID := StrToInt(cbHerdIdentity.Value)
   else
      HerdID := 0;

end;

procedure TReportsBaseForm.SetHerdID(const Value: Integer);
begin
   FHerdID := Value;
end;

procedure TReportsBaseForm.SetShowAllHerds(const Value: Boolean);
begin
   FShowAllHerds := Value;
   if Value then
      cbHerdIdentity.DisplayEmpty := '<All Herds>'
   else
      cbHerdIdentity.DisplayEmpty := '<None>';
end;

procedure TReportsBaseForm.ResetProgress;
begin
   lWaitCaption.Visible := False;
   ProgBar.Position := 0;
   ProgBar.Visible := False;
   Update;
   Application.ProcessMessages;
end;

procedure TReportsBaseForm.InitProgress(const Min, Max, Step : Integer; const ProgCaption : String = '');
begin
   ProgBar.Min := Min;
   ProgBar.Max := Max;
   ProgBar.Step := Step;
   ProgBar.Visible := True;
   if ( ProgCaption <> '' ) then
      begin
         lWaitCaption.Caption := ProgCaption;
         lWaitCaption.Visible := True;
      end;
   Update;
   Application.ProcessMessages;
end;

procedure TReportsBaseForm.StepProgress(const Step: Integer);
begin
   ProgBar.StepBy(Step);
   Application.ProcessMessages;
end;

procedure TReportsBaseForm.QRDateLabelHandler(sender: TObject;
  var Value: String);
begin
   if (TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).DataType in ([ftDate, ftDateTime])) then
      if TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 then
         Value := '';
end;

procedure TReportsBaseForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ( Key = VK_ESCAPE ) then
      Close;
end;

function TReportsBaseForm.GetOwnerName: string;
begin
   Result := '';
   if WinData.OwnerFile.Locate('ID', HerdID, []) then
      Result := WinData.OwnerFileName.AsString;
end;

function TReportsBaseForm.GetHerdID: Integer;
begin
   Result := 0;
   if Trim(cbHerdIdentity.Value) <> '0' then
      Result := StrToInt(cbHerdIdentity.Value);
end;

function TReportsBaseForm.GetHerdIdentity: string;
begin
   Result := '';
   if WinData.OwnerFile.Locate('ID', HerdID, []) then
      Result := WinData.OwnerFileHerdIdentity.AsString;
end;

function TReportsBaseForm.GetSortByField: string;
var
   tSortByField : string;
begin
   tSortByField := rgSortBy.Items[rgSortBy.ItemIndex];
   if Pos('&', tSortByField) > 0 then
      Delete(tSortByField, Pos('&', tSortByField), 1);
   Result := tSortByField;
end;

function TReportsBaseForm.GetSortByOrder: string;
var
   tSortByOrder : string;
begin
   tSortByOrder := rgSortOrder.Items[rgSortOrder.ItemIndex];
   if Pos('&', tSortByOrder) > 0 then
      Delete(tSortByOrder, Pos('&', tSortByOrder), 1);
   Result := tSortByOrder;
end;

procedure TReportsBaseForm.FormDestroy(Sender: TObject);
begin
   if ( TempTable <> nil ) then
      begin
         if TempTable.Exists then
            begin
               TempTable.Close;
               TempTable.DeleteTable;
            end;
         FreeAndNil(TempTable);
      end;
   SaveScreenDefaults;
end;

procedure TReportsBaseForm.sbViewClick(Sender: TObject);
begin
   EnableViewPrintButtons(False);
   if not ( ShowAllHerds ) and (HerdID = 0 ) then
      begin
        { **** This will only be invoked when first call to inherited is made }
         MessageDlg('Please select a herd',mtInformation,[mbOk],0);
         EnableViewPrintButtons(True);
         sbView.Enabled := True;
         sbPrint.Enabled := True;
         cbHerdIdentity.DropDown;
         Abort;
      end;
   qrlHerdIdentity.Caption := HerdIdentity;
   qrlSortBy.Caption := SortByField;
   qrlSortOrder.Caption := SortByOrder;
end;

procedure TReportsBaseForm.SubDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   i : integer;
begin
   if cbDichromatic.Checked then
      begin
         if Assigned(SubDetailBand.Dataset) then
            if ( ( SubDetailBand.DataSet.RecNo mod 5 ) = 0 ) then
               begin
                  SubDetailBand.Color := $00FEDDCF
               end
            else
               begin
                  SubDetailBand.Color := clWhite;
               end;

         for i := 0 to SubDetailBand.ControlCount-1 do
            if ( SubDetailBand.Controls[i] is TQRCustomLabel ) then
               ( SubDetailBand.Controls[i] as TQRCustomLabel ).Color := SubDetailBand.Color;
      end;
end;

procedure TReportsBaseForm.FormShow(Sender: TObject);
begin
   sbHelp.Enabled := ( HelpFile <> '' );
   LoadScreenDefaults;
end;

procedure TReportsBaseForm.cbUseFilterClick(Sender: TObject);
begin
   if cbUseFilter.Checked then
      begin
         if not WinData.ActiveFilter then
            begin
               cbUseFilter.State := cbUnchecked;
               if FormShowing then
                  MessageDlg(cNoFilterApplied,mtInformation,[mbOk],0);
            end
         else
            begin
               ChangeMade := True;
               cbUseFilter.Font.Color := clBlue;
            end;
      end
   else
      begin
         ChangeMade := True;
         cbUseFilter.Font.Color := clBlack;
      end;
end;

procedure TReportsBaseForm.SetShowFilter(const Value: Boolean);
begin
   cbUseFilter.Visible := Value;
   cbUseFilter.Checked := Value;
end;

procedure TReportsBaseForm.SetDichromatic(const Value: Boolean);
begin
   cbDichromatic.Visible := Value;
end;

function TReportsBaseForm.GetShowDichromatic: Boolean;
begin
   Result := cbDichromatic.Visible;
end;

function TReportsBaseForm.GetShowFilter: Boolean;
begin
   Result := cbUseFilter.Visible;
end;

function TReportsBaseForm.ExportToPDA(QR: TQuickRep) : Boolean;
begin
   Result := WinData.PDALinkExport.ExportReport(QR);
end;

procedure TReportsBaseForm.LoadScreenDefaults;
begin
   //
end;

procedure TReportsBaseForm.SaveScreenDefaults;
begin
   //
end;

procedure TReportsBaseForm.EnableViewPrintButtons(const AEnable: Boolean);
begin
   sbView.Enabled := AEnable;
   sbPrint.Enabled := AEnable;
end;

procedure TReportsBaseForm.sbPrintClick(Sender: TObject);
begin
   EnableViewPrintButtons(False);
   if not ( ShowAllHerds ) and (HerdID = 0 ) then
      begin
        { **** This will only be invoked when first call to inherited is made }
         MessageDlg('Please select a herd',mtInformation,[mbOk],0);
         EnableViewPrintButtons(True);
         sbView.Enabled := True;
         sbPrint.Enabled := True;
         cbHerdIdentity.DropDown;
         Abort;
      end;
end;

procedure TReportsBaseForm.FormActivate(Sender: TObject);
begin
   FormShowing := True;
end;

procedure TReportsBaseForm.LoadReportData;
begin
   //
end;

end.
