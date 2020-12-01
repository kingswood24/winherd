{
   04/08/17 [V5.7 R1.2] /MK Change - Pass ATotalFileInvalid boolean ShowSummary so informative text appears on InvalidPurchaseMemo.

   16/08/17 [V5.7 R1.2] /MK Additional Feature - New page, Treatments Imported, to show the user what treatments were saved or not saved.   
}

unit uVetLinkFileImportSummary;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, ExtCtrls, cxPC, cxControls, GenTypesConst,
  cxContainer, cxEdit, cxLabel;

type
  TfmVetLinkFileImportSummary = class(TForm)
    PageControl: TcxPageControl;
    tsPreviousPurchases: TcxTabSheet;
    tsInvalidPurchases: TcxTabSheet;
    pActions: TPanel;
    btnClose: TcxButton;
    PreviouslyPurchasedMemo: TMemo;
    InvalidPurchaseMemo: TMemo;
    tsNewPurchases: TcxTabSheet;
    NewPurchasesMemo: TMemo;
    pInvalidVetLinkFile: TPanel;
    lInvalidVetLinkFile: TcxLabel;
    VetLinkError: TImage;
    tsTreatmentsImported: TcxTabSheet;
    TreatmentsImportedMemo: TMemo;
  private
    { Private declarations }

  public
    { Public declarations }
    class procedure ShowSummary(const AInvalidPurchases, APreviousPurchases, ANewPurchases, ATreatments : TStrings;
       ATotalFileInvalid : Boolean);
  end;

var
  fmVetLinkFileImportSummary: TfmVetLinkFileImportSummary;

implementation

{$R *.DFM}

{ TfmVetLinkFileImportSummary }

class procedure TfmVetLinkFileImportSummary.ShowSummary(const AInvalidPurchases,
  APreviousPurchases, ANewPurchases, ATreatments : TStrings; ATotalFileInvalid : Boolean);
begin
   with TfmVetLinkFileImportSummary.Create(nil) do
      try
         pInvalidVetLinkFile.Visible := ATotalFileInvalid;

         if ( AInvalidPurchases <> nil ) and ( AInvalidPurchases.Count > 0 ) then
            InvalidPurchaseMemo.Lines.Add(AInvalidPurchases.Text);
         if ( APreviousPurchases <> nil ) and ( APreviousPurchases.Count > 0 ) then
            PreviouslyPurchasedMemo.Lines.Assign(APreviousPurchases);
         if ( ANewPurchases <> nil ) and ( ANewPurchases.Count > 0 ) then
            NewPurchasesMemo.Lines.Assign(ANewPurchases);
         if ( ATreatments <> nil ) and ( ATreatments.Count > 0 ) then
            TreatmentsImportedMemo.Lines.Assign(ATreatments);

         if ( InvalidPurchaseMemo.Lines.Count > 0 ) then
            PageControl.ActivePage := tsInvalidPurchases
         else if ( PreviouslyPurchasedMemo.Lines.Count > 0 ) then
            PageControl.ActivePage := tsPreviousPurchases
         else if ( NewPurchasesMemo.Lines.Count > 0 ) then
            PageControl.ActivePage := tsNewPurchases
         else if ( TreatmentsImportedMemo.Lines.Count > 0 ) then
            PageControl.ActivePage := tsTreatmentsImported;

         tsNewPurchases.TabVisible := False;
         tsPreviousPurchases.TabVisible := False;
         tsInvalidPurchases.TabVisible := ( InvalidPurchaseMemo.Lines.Count > 0 );
         tsTreatmentsImported.TabVisible := ( TreatmentsImportedMemo.Lines.Count > 0 );

         ShowModal;
      finally
         Free;
      end;
end;

end.
