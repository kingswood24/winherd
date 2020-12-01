unit uBeefSalesCatalogue;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseFormAnimalCatalogue, Db, dxmdaset, ActnList, dxBar, dxBarExtItems,
  StdCtrls, cxButtons, cxTextEdit, cxLabel, cxMaskEdit, cxDropDownEdit,
  cxContainer, cxEdit, cxGroupBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxStatusBar, cxCheckBox, cxStyles, ExtCtrls,
  DairyData;

type
  TfmBeefSalesCatalogue = class(TfmBaseFormAnimalCatalogue)
    dxBarLargeButton1: TdxBarLargeButton;
    pFavourite: TPanel;
    cbFavourite: TcxCheckBox;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    procedure actViewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBeefSalesCatalogue: TfmBeefSalesCatalogue;

implementation
uses
   AncestryTree, uHerdLookup, GenTypesConst;

{$R *.DFM}

procedure TfmBeefSalesCatalogue.actViewExecute(Sender: TObject);
var
  iSelectedAnimals : PIntegerArray;
begin
  iSelectedAnimals := SelectedAnimals;

  if Length(iSelectedAnimals) = 0 then
     begin
        MessageDlg('No animals have been selected for catalogue preview.',mtInformation,[mbOK],0);
        Exit;
     end;

   if ( fAncestryTree <> nil ) then
      begin
         HerdLookup.CreatePedigreeTable(iSelectedAnimals);
         try
            fAncestryTree.AncestryTreeType := atSalesCatalogue;
            fAncestryTree.OpenAncestryData;
            fAncestryTree.qrPedDetails.preview;
         finally
            HerdLookup.FlushPedigreeTable;
            fAncestryTree.CloseAncestryData;
         end;
      end
   else
      MessageDlg('Internal program error, contact Kingswood',mtError,[mbOK],0);
end;

procedure TfmBeefSalesCatalogue.FormCreate(Sender: TObject);
begin
  inherited;
  GridStyleContentEvenOdd := True;
  FSexFilterOptions := [sfBull,sfFemale];
  LoadAnimals;
  fAncestryTree := TfAncestryTree.Create(nil);
end;

procedure TfmBeefSalesCatalogue.FormDestroy(Sender: TObject);
begin
  inherited;
  if ( fAncestryTree <> nil ) then
     FreeAndNil(fAncestryTree);
end;

procedure TfmBeefSalesCatalogue.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cSalesCatRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cSalesCatRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfmBeefSalesCatalogue.FormShow(Sender: TObject);
begin
   inherited;
   cbFavourite.Checked := WinData.IsReportFavourite(cSalesCatRep);
   WinData.UpdateRecentReportUsage(cSalesCatRep);
end;

end.
