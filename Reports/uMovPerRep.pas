unit uMovPerRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, Db, DBTables, StdCtrls, Buttons, RXLookup, Mask,
  ToolEdit, ExtCtrls, RXCtrls, ComCtrls, ToolWin, EanQr, EanDBQr, QRExport;

type
  TfMovPerRep = class(TForm)
    pMovPerRep: TPanel;
    MovementDateLabel: TLabel;
    CustomerLabel: TLabel;
    gOrder: TRadioGroup;
    MovementDate: TDateEdit;
    gSortBy: TRadioGroup;
    CustomerCombo: TRxDBLookupCombo;
    qMovPerRep: TQuery;
    MovPerRep: TQuickRep;
    Rptheader: TQRBand;
    QRShape2: TQRShape;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    RptTitle: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    DetailBand2: TQRBand;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    SummaryBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel23: TQRLabel;
    PageFooterBand2: TQRBand;
    QRLabel34: TQRLabel;
    PremVerLabel: TQRLabel;
    SortLabel: TQRLabel;
    OrderLabel: TQRLabel;
    QRLabel8: TQRLabel;
    QRMovementDateLabel: TQRLabel;
    QRMoveDateLabel: TQRLabel;
    QRDestinationLabel: TQRLabel;
    Destination: TQRDBText;
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
    bcNatIDNum: TQrDBEan;
    cbIncBarCodes: TCheckBox;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
    MyTable : TTable;
    procedure CreateMovPerTable;
    procedure LoadOtherData;

  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation

uses
    GenTypesConst,
    DairyData;

var
  fMovPerRep: TfMovPerRep;

{$R *.DFM}

procedure ShowTheForm;
begin
    try
       if ( fMovPerRep = nil ) then
          Application.CreateForm(TfMovPerRep, fMovPerRep);
       fMovPerRep.ShowModal;
    except
       ShowMessage('Cannot create form - close program and re-boot');
    end;
end;

procedure TfMovPerRep.ExitBtnClick(Sender: TObject);
begin
     Close
end;

procedure TfMovPerRep.ViewBtnClick(Sender: TObject);
begin
     If pMovPerRep.Visible Then
        Begin
             try
// First - Create Table
                MyTable := TTable.Create(nil);
                CreateMovPerTable;    //Procedure to create Movement Permit & CustName Tables
// Second - Format Report and Clear out SQL
                PremVerLabel.Caption := 'Herd Management ' + HerdVerNo;
                QRMovementDateLabel.Caption := FormatDateTime(cIrishDateStyle,(MovementDate.Date));
                qMovPerRep.SQL.Clear;
// Third - Clear down the Table using SQL (in case this procedure is modified)
                qMovPerRep.SQL.Add('DELETE FROM MovPer');
                qMovPerRep.ExecSQL;
// Fourth -  Populate Table
                qMovPerRep.SQL.Clear;
                qMovPerRep.SQL.Add('INSERT INTO MovPer (AnimalNo, SortAnimalNo, AnimalID, NatID, SortNatId, CustName)');
                qMovPerRep.SQL.Add('SELECT DISTINCT D.AnimalNo, D.SortAnimalNo, D.ID, D.NatIDNum, D.SortNatID, D3.Name');
                qMovPerRep.SQL.Add('FROM "Animals.DB" D, "Events.DB" D1, "SalesDeaths.DB" D2, "Customers.DB" D3');
                qMovPerRep.SQL.Add('WHERE (D.InHerd=TRUE) AND (not( D.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                if ( Length(HerdCombo.Value) > 0 ) then
                   qMovPerRep.SQL.ADD(' AND ( D.HerdID = "' + HerdCombo.Value + '" )');
                //Now to look at the Event Database
                qMovPerREp.SQL.Add(' AND (D1.AnimalID = D.ID) AND (D2.EventID = D1.ID) AND (D3.ID = D2.Customer)');
                qMovPerRep.SQL.Add(' AND (D1.EventDate = "' + FormatDateTime('mm/dd/yyyy',(MovementDate.Date)) + '" ) ');
                //Now to look at the SalesDeaths Database
                qMovPerRep.SQL.Add(' AND (D2.PreSale = TRUE) And (D2.Customer = "' + CustomerCombo.Value + '" )');
                // Executes SQL to populate table.
                qMovPerRep.ExecSQL;
// Fifth - Gets all other data required for each animal.
                // Gets all other data to be associated with an animal
                LoadOtherData;
// Sixth - Clear out SQL and selects all animals in the Table for sorting
                qMovPerRep.SQL.Clear;
                qMovPerRep.SQL.Add('SELECT * FROM MovPer');

                case gSortBy.ItemIndex of
                     0 : begin //Sort By National ID
                            qMovPerRep.SQL.ADD('ORDER BY SortNatID');
                            SortLabel.Caption := 'Ordered By National ID Number';
                         end;
                     1 : begin // Sort By Animal No
                            qMovPerRep.SQL.ADD('ORDER BY SortAnimalNo');
                            SortLabel.Caption := 'Ordered By Animal Number';
                         end;
                end;

                case gOrder.ItemIndex of
                     0  : begin  // Ascending
                            qMovPerRep.SQL.Add('Asc');
                            OrderLabel.Caption := 'In Ascending Order';
                          end;
                     1  : begin  // Descending
                            qMovPerRep.SQL.Add('Desc');
                            OrderLabel.Caption := 'In Descending Order';
                          end;
                end;

                qMovPerRep.Open;
// Seventh - Specify Colours and Destination of report
                If ( Sender as TRxSpeedButton ).Name = 'sbView' Then
                   begin
                        RptTitle.Font.Color := ClRed;
                        DetailBand2.Font.Color := ClNavy;
                        MovPerRep.Preview;
                   End
                else
                    begin
                         RptTitle.Font.Color := ClBlack;
                         DetailBand2.Font.Color := ClBlack;
                         Windata.CallPrintDialog(MovPerRep);
                    End;

             Finally
                    MyTable.Close;
                    MyTable.DeleteTable;
                    MyTable.Free;
             End;
        End;
end;

procedure TfMovPerRep.FormCreate(Sender: TObject);
begin
     Try
        MovPerRep.hide;
        MovementDate.Date := Date;
        // First - Create Table
        MyTable := TTable.Create(nil);
        CreateMovPerTable;       //Procedure to create Movement Permit Table
     Finally
            MyTable.Close;
            MyTable.DeleteTable;
            MyTable.Free;
     End;
end;

procedure TfMovPerRep.CreateMovPerTable;
begin
     with MyTable do
        begin
           DatabaseName := WinData.KingData.DatabaseName;
           TableName := 'MovPer';
           FieldDefs.Add('AnimalNo',ftString,20,FALSE);
           FieldDefs.Add('SortAnimalNo',ftString,20,FALSE);
           FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
           FieldDefs.Add('NatID',ftString,20,FALSE);
           FieldDefs.Add('SortNatID',ftString,20,FALSE);           
           FieldDefs.Add('CustName',ftString,30,FALSE);
           CreateTable;
           Open;
        end;
end;

procedure TfMovPerRep.LoadOtherData;
begin
// Loads up all other data required for the animals
{     with MyTable do
        begin
           First;
           while NOT ( MyTable.EOF ) do
              begin      //No Other Data to load up
                 Edit;
//                 // Get Breed
//                 if WinData.Breeds.Locate('ID',FieldByName('BreedID').AsInteger,[] ) then
//                    FieldByName('Breed').AsString := WinData.Breeds.FieldByName('Name').AsString;
//                 // Get Colour
//                 if WinData.GenLookUp.Locate('ID',FieldByName('ColourID').AsInteger,[] ) then
//                    FieldByName('Colour').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                 Post;
                 Next;    
              end;
        end;  }
end;

procedure TfMovPerRep.FormShow(Sender: TObject);
begin
     HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
end;

procedure TfMovPerRep.DetailBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     //Now to input the NatID into the BarCode
     If cbIncBarCodes.Checked = True then
        Begin
             bcNatIDNum.Width := 240;
             bcNatIDNum.BarCode := WinData.StripAllSpaces(fMovPerRep.qMovPerRep.FieldByName('NatID').AsString);
        End
     else
        bcNatIDNum.Width := 0;
end;

end.
