{
   08/02/16 [V5.5 R2.7] /MK Change - Added a grid to the form so that user could see the data in the table easily - SP request.
                                   - Show the code for the TObservedBy GenLookupType - SP request.
                                   - Changed lColour to lCode and dbeColour to dbeCode as it was more relevant.
}

unit uGenLookSetUp;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Buttons, RXCtrls, ComCtrls,
  ToolWin, kwDBNavigator, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxCustomData;

type
  TfGenLookSetUp = class(TForm)
    Panel2: TPanel;
    lDescription: TLabel;
    dbeDescription: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    DBNavigator: TkwDBNavigator;
    lCode: TLabel;
    dbeCode: TDBEdit;
    GenLookGrid: TcxGrid;
    GenLookGridDBTableView: TcxGridDBTableView;
    GenLookGridLevel: TcxGridLevel;
    GenLookGridDBTableViewCode: TcxGridDBColumn;
    GenLookGridDBTableViewDescription: TcxGridDBColumn;
    procedure bExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure dbeCodeChange(Sender: TObject);
    procedure dbeDescriptionChange(Sender: TObject);
  private
    { private declarations }
    FModified : Boolean;
    FFormShowing : Boolean;
    procedure SetModifiedFlag;
  public
    { public declarations }
  end;

procedure ShowTheForm ( AddingRecord : Boolean );

implementation
uses
    Dialogs,
    GenTypesConst,
    DairyData;

var
  fGenLookSetUp: TfGenLookSetUp;
  AddNewRecord : Boolean;

{$R *.DFM}

procedure ShowTheForm ( AddingRecord : Boolean );
begin
   AddNewRecord := AddingRecord;
   Application.CreateForm(TfGenLookSetUp, fGenLookSetUp);
   try
      try
         fGenLookSetUp.ShowModal;
      except
         ShowMessage('Cannot create form - close program and re-boot');
      end;
   finally
      FreeAndNil(fGenLookSetUp);
   end;
end;

procedure TfGenLookSetUp.bExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfGenLookSetUp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Case GenLookUpType Of
        TNone : ;
        TApplicMethod : ;
        THealthCode   : ;
        TServiceType  : ;
        TObservedBy   : ;
        TCulledCode   : ;
        TMortality    : ;
        TFeedCategory : ;
        TIntExamRes   : ;
        TIntExamRea   : ;
        TIntExamMet   : ;
        TAnimalColour : WinData.DeFaultColour := WinData.GenLookUp.FieldByName('ID').AsInteger;
   end;

   // Clear the FILTER !!
   WinData.GenLookUp.Filter := '';
   WinData.GenLookUp.Filtered := False;
end;

procedure TfGenLookSetUp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.GenLookUp, ModalResult = mrOK, FModified );
end;

procedure TfGenLookSetUp.FormCreate(Sender: TObject);
begin
   WinData.GenLookUp.Close;
   Case GenLookUpType Of
      TNone : MessageDlg('Invalid Call - Contact Kingswood',mtInformation,[mbOK],0);
      TApplicMethod : begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LApplicMethod);
                           fGenLookSetUp.Caption := 'Add/Lookup Application Method';
                      end;
      THealthCode   : begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LHealthCode);
                           fGenLookSetUp.Caption := 'Add/Lookup Health Code';
                      end;
      TServiceType  : Begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LServiceType);
                           fGenLookSetUp.Caption := 'Add/Lookup Service Type';
                      end;
      TAnimalColour : Begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LAnimalColour);
                           fGenLookSetUp.Caption := 'Add/Lookup Animal Colour';
                      end;
      TObservedBy   : Begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LObservedBy);
                           fGenLookSetUp.Caption := 'Add/Lookup Observed By';
                      end;
      TCulledCode   : Begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LCulledCode);
                           fGenLookSetUp.Caption := 'Add/Lookup Culled Code';
                      end;
      TMortality    : begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LMortality);
                           fGenLookSetUp.Caption := 'Add/Lookup Mortality';
                      end;
      TFeedCategory : Begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LFeedCategory);
                           fGenLookSetUp.Caption := 'Add/Lookup Feed Category';
                      end;
      TIntExamRes   : begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LIntExamRes);
                           fGenLookSetUp.Caption := 'Add/Lookup Examination Result';
                      end;
      TIntExamRea   : begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LIntExamRea);
                           fGenLookSetUp.Caption := 'Add/Lookup Examination Reason';
                      end;
      TIntExamMet   : begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LIntExamMet);
                           fGenLookSetUp.Caption := 'Add/Lookup Examination Method';
                      end;
      THealthReportDesc : begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LHealthReportDesc);
                           fGenLookSetUp.Caption := 'Add/Lookup Health Report Descriptions';
                      end;
      TMedicineGroup : begin
                           WinData.GenLookUp.Filter := 'ListType = ' + IntToStr(LMedicineGroup);
                           fGenLookSetUp.Caption := 'Add/Lookup Medicine Groups';
                       end;
   end;
   // SP 04/07/00 - EndCase Genlook screens, we changed the form caption to describe the what was being added or amended.

   //   08/02/16 [V5.5 R2.7] /MK Change - Show the code for the TObservedBy GenLookupType.
   lCode.Visible := ( GenLookUpType IN ([TAnimalColour, THealthCode, TIntExamRes, TIntExamRea, TIntExamMet, TObservedBy]) );
   dbeCode.Visible := lCode.Visible;
   GenLookGridDBTableViewCode.Visible := lCode.Visible;
   if ( lCode.Visible ) then
      begin
         lCode.Top := 44;
         dbeCode.Top := 40;
         lDescription.Top := 96;
         dbeDescription.Top := 94;
         GenLookGridDBTableViewDescription.Width := 200;
      end
   else
      begin
         lDescription.Top := 74;
         dbeDescription.Top := 72;
         GenLookGridDBTableViewDescription.Width := 270;
      end;

   WinData.GenLookUp.Filtered := True;
   DbNavigator.DataSource := WinData.sGenLookUp;
   dbeDescription.DataSource := WinData.sGenLookUp;
   dbeCode.DataSource := WinData.sGenLookUp;
   GenLookGridDBTableView.DataController.DataSource := nil;
   GenLookGridDBTableView.DataController.DataSource := WinData.sGenLookUp;

   if ( GenLookUpType in [TServiceType, TAnimalColour, TApplicMethod] ) then
      begin
         GenLookGridDBTableViewCode.SortOrder := soNone;
         GenLookGridDBTableViewDescription.SortOrder := soAscending;
      end
   else
      begin
         GenLookGridDBTableViewCode.SortOrder := soAscending;
         GenLookGridDBTableViewDescription.SortOrder := soNone;
      end;

   WinData.GenLookUp.Open;
   if ( AddNewRecord ) then                                           // added 12.99 with
      WinData.GenLookUp.Append;                                   // showtheform procedure
end;

procedure TfGenLookSetUp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      Close;
end;

procedure TfGenLookSetUp.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
end;

procedure TfGenLookSetUp.FormActivate(Sender: TObject);
begin
   FModified := False;
   FFormShowing := True;
end;

procedure TfGenLookSetUp.dbeCodeChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfGenLookSetUp.dbeDescriptionChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

end.
