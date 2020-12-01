unit uTBTestDtRep;

//This report altered on 01/12/1999 by KVB to combine Breed and Colour details where Breed
//does not exist and to print out premium status for those animals in the report.

{
   23/07/14 [V5.3 R4.0] /MK Bug Fix - Add Favourite option for report.

   03/10/17 [V5.7 R3.5] /MK Change - Don't change caption of favourites button just tick it and change the colour to blue like Apply Filter check box - SP request.

   20/03/19 [V5.8 R8.1] /MK Change - The checkbox shape is not appearing on the PDF printouts. For Grace Dobson the document didn't even print.
                                     I changed the single qrshape for the checkbox to 4 seperate lines to make up a box.
                                     The box is now appearing on the PDF.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, Db, DBTables, StdCtrls, Buttons, RXLookup, Mask,
  ToolEdit, ExtCtrls, RXCtrls, ComCtrls, ToolWin, QRExport, cxControls,
  cxContainer, cxEdit, cxCheckBox;

type
  TfTBTestDtRep = class(TForm)
    pTBTestDt: TPanel;
    SwitchLabel: TLabel;
    gOrder: TRadioGroup;
    TestDate: TDateEdit;
    gSortBy: TRadioGroup;
    qTBTestDt: TQuery;
    SalesRep1: TQuickRep;
    Rptheader: TQRBand;
    QRLabel18: TQRLabel;
    QRShape2: TQRShape;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    RptTitle: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    DetailBand2: TQRBand;
    qrApplicDate: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText10: TQRDBText;
    SummaryBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel23: TQRLabel;
    PageFooterBand2: TQRBand;
    QRLabel34: TQRLabel;
    PremVerLabel: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    SortLabel: TQRLabel;
    OrderLabel: TQRLabel;
    QRLabel8: TQRLabel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    qPremiums: TQuery;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    cbUseFilter: TCheckBox;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    qrlSaleDate: TQRLabel;
    cbFavourite: TcxCheckBox;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbFavouriteClick(Sender: TObject);
  private
    { Private declarations }
    MyTable: TTable;
    procedure CreateTBTestDtTable;
    procedure LoadOtherData;

  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation

uses
    GenTypesConst,
    DairyData,
    uHerdLookup,
    kDbRoutines;

var
  fTBTestDtRep: TfTBTestDtRep;

{$R *.DFM}

procedure ShowTheForm;
begin
    try
       if ( fTBTestDtRep = nil ) then
          Application.CreateForm(TfTBTestDtRep, fTBTestDtRep);
       fTBTestDtRep.cbUseFilter.Checked := WinData.ActiveFilter;
//       fTBTestDtRep.cbUseFilter.Checked := fTBTestDtRep.cbUseFilter.Visible;
       fTBTestDtRep.ShowModal;
    except
       ShowMessage('Cannot create form - close program and re-boot');
    end;
end;

procedure TfTBTestDtRep.ExitBtnClick(Sender: TObject);
begin
     Close
end;

procedure TfTBTestDtRep.ViewBtnClick(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;
   sbView.Enabled := False;
   sbPrint.Enabled := False;


     If pTBTestDt.Visible Then
        Begin
             try
                MyTable := TTable.Create(nil);
                CreateTBTestDtTable;       //Procedure to create TB Test Date Table
                PremVerLabel.Caption := 'Herd Management ' + HerdVerNo;
                qTBTestDt.SQL.Clear;
                qTBTestDt.SQL.Add('DELETE FROM TBTestDt');
                qTBTestDt.ExecSQL;

                qTBTestDt.sql.Clear;
                qTBTestDt.sql.Add('INSERT INTO TBTestDt (AnimalNo, SortAnimalNo, AnimalID, NatID, SortNatID, Sex, BreedID, DOB, ColourID, Name, TBTestDate, HerdIdentity)');
                qTBTestDt.sql.Add('SELECT DISTINCT AnimalNo, SortAnimalNo, ID, NatIDNum, SortNatID, Sex, PrimaryBreed, DateOfBirth, Colour, Name, TBTestDate, O.HerdIdentity');
                qTBTestDt.sql.Add('FROM Animals.db');
                qTBTestDt.SQL.Add('LEFT JOIN Owners O ON (O.ID=HerdID)');
                if cbUseFilter.Checked then
                   qTBTestDt.SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (ID=FA.AID)');
                qTBTestDt.SQL.Add('WHERE (InHerd=TRUE) AND (not( HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                qTBTestDt.SQL.Add('AND (( TBTestDate <= "' + FormatDateTime('mm/dd/yyyy', (TestDate.Date - 365)) + '" ) ');
                qTBTestDt.SQL.Add('  OR ( TBTestDate IS NULL ))');
                qTBTestDt.SQL.Add('AND AnimalDeleted=FALSE');

                if ( Length(HerdCombo.Value) > 0 ) then
                   qTBTestDt.SQL.ADD(' AND ( HerdID = "' + HerdCombo.Value + '" ) ');
                qTBTestDt.ExecSQL;

                LoadOtherData;

                qTBTestDt.sql.Clear;
                qTBTestDt.sql.Add('SELECT * FROM TBTestDt');

                case gSortBy.ItemIndex of
                     0 : begin // Sort By Animal No
                            qTBTestDt.SQL.ADD('ORDER BY SortAnimalNo');
                            SortLabel.Caption := 'Ordered By Animal Number';
                         end;
                     1 : begin //Sort By National ID
                            qTBTestDt.SQL.ADD('ORDER BY SortNatID');
                            SortLabel.Caption := 'Ordered By National ID Number';
                         end;
                     2 : begin // Sort By TB Test Date
                            qTBTestDt.SQL.ADD('ORDER BY TBTestDate');
                            SortLabel.Caption := 'Ordered By TB Test Date';
                         end;
                end;

                case gOrder.ItemIndex of
                     0  : begin  // Ascending
                            qTBTestDt.SQL.Add('Asc');
                            OrderLabel.Caption := 'In Ascending Order';
                          end;
                     1  : begin  // Descending
                            qTBTestDt.SQL.Add('Desc');
                            OrderLabel.Caption := 'In Descending Order';
                          end;
                end;
               qrlSaleDate.Caption := TestDate.Text;
                qTBTestDt.Open;
// Seventh - Specify Colours and Destination of report
                if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                   begin
                        RptTitle.Font.Color := ClRed;
                        DetailBand2.Font.Color := ClNavy;
                        SalesRep1.Preview;
                   End
                else
                    begin
                         RptTitle.Font.Color := ClBlack;
                         DetailBand2.Font.Color := ClBlack;
                         Windata.CallPrintDialog(SalesRep1);
                    end;
             Finally
                    MyTable.Close;
                    MyTable.DeleteTable;
                    MyTable.Free;
             End;
        End;
   sbView.Enabled := True;
   sbPrint.Enabled := True;
end;

procedure TfTBTestDtRep.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;

   Try
      SalesRep1.hide;
      // First - Create Table
      MyTable := TTable.Create(nil);
      CreateTBTestDtTable;       //Procedure to create TB Test Date Table

   Finally
          MyTable.Close;
          MyTable.DeleteTable;
          MyTable.Free;
   End;
end;

procedure TfTBTestDtRep.CreateTBTestDtTable;
begin
     with MyTable do
        begin
           DatabaseName := WinData.KingData.DatabaseName;
           TableName := 'TBTestDt';
           FieldDefs.Add('AnimalNo',ftString,20,FALSE);
           FieldDefs.Add('SortAnimalNo',ftString,20,FALSE);
           FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
           FieldDefs.Add('NatID',ftString,20,FALSE);
           FieldDefs.Add('SortNatID',ftString,20,FALSE);
           FieldDefs.Add('HerdID',ftInteger,0,FALSE);
           FieldDefs.Add('Sex',ftString,10,FALSE);
           FieldDefs.Add('BreedID',ftInteger,0,FALSE);
           FieldDefs.Add('Breed',ftString,6,FALSE);
           FieldDefs.Add('Colour',ftString,6,FALSE);

           FieldDefs.Add('DOB',ftDate,0,FALSE);
           FieldDefs.Add('PurchDate',ftDate,0,FALSE);
           FieldDefs.Add('PurchSource',ftString,30,FALSE);
           FieldDefs.Add('ColourID',ftInteger,0,FALSE);
           FieldDefs.Add('Name',ftString,40,FALSE);
           FieldDefs.Add('TBTestDate',ftDate,0,FALSE);
           FieldDefs.Add('HerdIdentity',ftString,20,FALSE);
           CreateTable;
           Open;
        end;
end;

procedure TfTBTestDtRep.LoadOtherData;
var
   vEventDate,vSupplierID, vSupplierName : Variant;
   EventDetailsArray :TEventDetailsArray;
begin
// Loads up all other data required for the animals
     with MyTable do
        begin
           First;
           while NOT ( MyTable.EOF ) do
              begin
                 Edit;
                 // Get Breed else get colour
                 If WinData.Breeds.Locate('ID',FieldByName('BreedID').AsInteger,[] ) then
                    FieldByName('Breed').AsString := WinData.Breeds.FieldByName('Code').AsString;
                 if WinData.GenLookUp.Locate('ID',FieldByName('ColourID').AsInteger,[] ) then
                    FieldByName('Colour').AsString := WinData.GenLookUp.FieldByName('LookupCode').AsString;

                 // Get the purchase weight.
                 EventDetailsArray := uHerdLookup.HerdLookup.GetEventDetails(FieldByName('AnimalID').AsInteger,cPurchaseEvent);
                 if Length(EventDetailsArray) > 0 then
                    begin
                       vEventDate := EventDetailsArray[0].Event[3];
                       if not VarIsNull(vEventDate) then
                          begin
                             FieldByName('PurchDate').AsDateTime := vEventDate;
                             vSupplierID := EventDetailsArray[0].SubEvent[1];
                             if not VarIsNull(vSupplierID) then
                                begin
                                   vSupplierName := Windata.Suppliers.Lookup('ID',vSupplierID,'Name');
                                   FieldByName('PurchSource').Value := vSupplierName;
                                end;
                          end;
                    end;
                 Post;
                 Next;
              end;
        end;
end;

procedure TfTBTestDtRep.FormShow(Sender: TObject);
begin
    HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
    //Now to put today's date in the TestDate field
    TestDate.Date := Date;  //Current Date

    cbFavourite.Checked := WinData.IsReportFavourite(cDiseaseTestRep);
    WinData.UpdateRecentReportUsage(cDiseaseTestRep);
end;

procedure TfTBTestDtRep.cbUseFilterClick(Sender: TObject);
begin
   if cbUseFilter.Checked then
      begin
         if not WinData.ActiveFilter then
            begin
               cbUseFilter.State := cbUnchecked;
               MessageDlg(cNoFilterApplied,mtInformation,[mbOk],0);
            end
         else
            cbUseFilter.Font.Color := clBlue;
      end
   else
      cbUseFilter.Font.Color := clBlack;
end;

procedure TfTBTestDtRep.QRDBText17Print(sender: TObject;
  var Value: String);
begin

   if ((Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsDateTime <= 0) then
      Value := '';

end;

procedure TfTBTestDtRep.QRDBText4Print(sender: TObject; var Value: String);
begin
//
end;

procedure TfTBTestDtRep.QRDBText1Print(sender: TObject; var Value: String);
begin
   if Value = cSex_Female then
      Value := 'F'
   else if Value = cSex_Bull then
      Value := 'B'
   else if Value = cSex_Steer then
      Value := 'S';
end;

procedure TfTBTestDtRep.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;
end;

procedure TfTBTestDtRep.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TfTBTestDtRep.FormDestroy(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TfTBTestDtRep.cbFavouriteClick(Sender: TObject);

   procedure AddRemoveFavourite ( AAddRemove : Boolean; AReportConst : String );
   begin
      if AAddRemove then
         begin
            WinData.SetReportAsFavourite(AReportConst,True);
            cbFavourite.Style.TextColor := clBlue;
            cbFavourite.StyleHot.TextColor := clBlue;
         end
      else
         begin
            WinData.SetReportAsFavourite(AReportConst,False);
            cbFavourite.Style.TextColor := clBlack;
            cbFavourite.StyleHot.TextColor := clBlack;
         end;
      Application.ProcessMessages;
      Update;
   end;

begin
   AddRemoveFavourite(cbFavourite.Checked,cDiseaseTestRep)
end;

end.
