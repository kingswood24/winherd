unit FertilityAnalysisFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, RXSpin, Mask, ToolEdit;

type
  TFertilityAnalysisFilter = class(TForm)
    pExitReports: TPanel;
    ExitBtn: TBitBtn;
    HelpBtn: TBitBtn;
    ViewBtn: TBitBtn;
    PrintBtn: TBitBtn;
    pHeatServiceListing: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    FromGroupSearch: TSpeedButton;
    ToGroupSearch: TSpeedButton;
    ToGroup: TEdit;
    FromGroup: TEdit;
    SwitchLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CalvingRadio: TRadioGroup;
    BullsRadio: TRadioGroup;
    FromLact: TRxSpinEdit;
    ToLact: TRxSpinEdit;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CalvingRadioClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FertilityAnalysisFilter: TFertilityAnalysisFilter;

implementation
uses
    GenTypesConst,
    Dairydata,
    HeatAndServiceListing;
{$R *.DFM}

procedure TFertilityAnalysisFilter.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TFertilityAnalysisFilter.FormShow(Sender: TObject);
begin
     If pHeatServiceListing.Visible Then
        begin
             FertilityanalysisFilter.Caption := 'Heats And Services Listing';
             CalvingRadioClick ( Sender );
             FromDate.Text := '01/01/1998';
             ToDate.Text := FormatDateTime('dd/mm/yyyy', Date );             
        end;
end;

procedure TFertilityAnalysisFilter.CalvingRadioClick(Sender: TObject);
begin
     If CalvingRadio.ItemIndex = 0 Then
        SwitchLabel.Caption := 'Calving Date From'
     Else If CalvingRadio.ItemIndex = 1 Then
        SwitchLabel.Caption := 'Heats Date From'
     Else If CalvingRadio.ItemIndex = 2 Then
        SwitchLabel.Caption := 'Services Date From';
end;

procedure TFertilityAnalysisFilter.ViewBtnClick(Sender: TObject);
begin
  If pHeatServiceListing.Visible Then
     Begin
       HeatsAndServicesListingScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
       HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Clear;
       HeatsAndServicesListingScr.qHeatsAndServicesListing.Close;
       HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('SELECT DISTINCT D.LactNo, D.AnimalNo, D.Sex, D.Type, D1.EventDate, D1.EventDesc, D1.EventType');
       HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('FROM "Animals.DB" D, "Events.DB" D1 WHERE (D1.AnimalLactNo = D.LactNo)');
       HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('AND D.Type = "Dairy" AND D.InHerd = "True" ');
       HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('and D.LactNo BETWEEN (' + FromLact.Text + ' and ' + ToLact.Text + ')');

       If CalvingRadio.ItemIndex = 0 Then  // Routine For deciding Date Selection
          Begin
             HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('AND D1.EventType = ''''5'''' '); // Calving
             HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('and D1.EventDate BETWEEN (' + FromDate.Text + ' AND ' + ToDate.Text + ')');
          End
       Else If CalvingRadio.ItemIndex = 1 Then
          Begin
             HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('AND D1.EventType = ''''1'''' '); // Heats
             HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('and D1.EventDate BETWEEN (' + FromDate.Text + ' AND ' + ToDate.Text + ')');
          End
       Else If CalvingRadio.ItemIndex = 2 Then
          Begin
             HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('AND D1.EventType = ''''2'''' '); // Services
             HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('and D1.EventDate BETWEEN (' + FromDate.Text + ' AND ' + ToDate.Text + ')');
          End;

{
        If BullsRadio.ItemIndex = 0  Then
           HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('
        Else
            HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('

}
       HeatsAndServicesListingScr.qHeatsAndServicesListing.SQL.Add('ORDER BY D.AnimalNo Asc');
       HeatsAndServicesListingScr.qHeatsAndServicesListing.Open;

       If ( Sender as TBitBtn ).Name = 'ViewBtn' Then
          begin
               HeatsAndServicesListingScr.RptTitle.Font.Color := ClRed;
               HeatsAndServicesListingScr.Detail.Font.Color := ClNavy;
               HeatsAndServicesListingScr.Preview;
          End
       else
           begin
               HeatsAndServicesListingScr.RptTitle.Font.Color := ClBlack;
               HeatsAndServicesListingScr.Detail.Font.Color := ClBlack;
                HeatsAndServicesListingScr.Print;
           End;
     End;
end;

end.
