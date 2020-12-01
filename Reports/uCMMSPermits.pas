{
   30/06/11 [V4.1 R2.1] /MK Additional Feature - Default Search to NatIDNum As Its The First Field.

   14/11/11 [V5.0 R2.1] /MK Bug Fix - BuyerCloseup - Changed Message To That Of lBuyerDestination Label.

   14/12/11 [V5.0 R2.9] /MK Change - If Remaining Is Less Or Equal To 1 Show Message.   
}
unit uCMMSPermits;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RxLookup, StdCtrls, ExtCtrls, RXCtrls, ComCtrls, ToolWin,
  Grids, DBGrids, RXDBCtrl, DBGridEh, Menus, RXSpin, Mask, ToolEdit, GenTypesConst;

type
  TfmCMMSPermits = class(TForm)
    AnimalGrid: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton6: TToolButton;
    sbView: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel2: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    GetAnimals: TQuery;
    dsGetAnimals: TDataSource;
    Panel1: TPanel;
    Timer: TTimer;
    CMMSAnimals: TTable;
    CMMSAnimalsID: TAutoIncField;
    CMMSAnimalsNatIdNum: TStringField;
    CMMSAnimalsAnimalNo: TStringField;
    CMMSAnimalsSex: TStringField;
    CMMSAnimalsDateOfBirth: TDateField;
    CMMSAnimalsSortNatID: TStringField;
    CMMSAnimalsSortAnimalNo: TStringField;
    CMMSAnimalsSelected: TBooleanField;
    GenQuery: TQuery;
    StatusBar1: TStatusBar;
    sbPrint: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    ToolButton1: TToolButton;
    PopupMenu1: TPopupMenu;
    SelectAll1: TMenuItem;
    DeselectAll1: TMenuItem;
    rgFormType: TRadioGroup;
    dsMoveTo: TDataSource;
    sbOptions: TRxSpeedButton;
    ToolButton3: TToolButton;
    PopupMenu2: TPopupMenu;
    Select1: TMenuItem;
    Deselect1: TMenuItem;
    pNBAS31G: TPanel;
    lPrintCopies: TLabel;
    PrintCopies: TRxSpinEdit;
    pNBAS31AB: TPanel;
    lBuyerDestination: TLabel;
    Buyer: TRxDBLookupCombo;
    Label1: TLabel;
    deMovementDate: TDateEdit;
    Label2: TLabel;
    BuyerDestDetails: TRxDBLookupCombo;
    N1: TMenuItem;
    VenNoAllocationUpdate1: TMenuItem;
    pGridInfo: TPanel;
    Label3: TLabel;
    procedure sbExitClick(Sender: TObject);
    procedure HerdComboCloseUp(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CreateTempTables;
    procedure AnimalGridDblClick(Sender: TObject);
    procedure AnimalGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure sbViewClick(Sender: TObject);
    procedure CMMSAnimalsAfterPost(DataSet: TDataSet);
    procedure SelectAll1Click(Sender: TObject);
    procedure DeselectAll1Click(Sender: TObject);
    procedure SelectFormType(Sender: TObject);
    procedure BuyerCloseUp(Sender: TObject);
    procedure Select1Click(Sender: TObject);
    procedure Deselect1Click(Sender: TObject);
    procedure VenNoAllocationUpdate1Click(Sender: TObject);
    procedure BuyerDestDetailsCloseUp(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure AnimalGridTitleClick(Column: TColumnEh);
  private
    { Private declarations }
    FHerdID : Integer;
    Viewing : Boolean;
    FGrpID : Integer;
    Function  CountOfSelected :Integer;
    procedure LoadAnimals;
    procedure SelectAll(ASelect : Boolean);
    procedure UpdateStatusBar;
    procedure GetBuyer;
    procedure PreviewAForm;
    procedure PreviewBForm;
    procedure PreviewGForm;
    procedure UpdateCMMSTable(const Value : Boolean);
    procedure UpdateVenNo;
    procedure CheckHerdIsDealer;
  public
    { Public declarations }

  end;

  Procedure ShowForm(AHerdID : Integer; AGrpID : Integer = 0; ANBASPermits : TNBASPermits = NBASNone);

var
  fmCMMSPermits: TfmCMMSPermits;
  FNBASPermitType : TNBASPermits;

implementation
uses
   DairyData, KDBRoutines, uNBASRep31A, uNBASRep31B, uMovedBy, uCustomers,
   uNBASRep31G, uNBASVenNoUpdate, KRoutines;

{$R *.DFM}

  Procedure ShowForm(AHerdID : Integer; AGrpID : Integer; ANBASPermits : TNBASPermits);
  begin
     FNBASPermitType := ANBASPermits;
     with TfmCMMSPermits.Create(nil) do
        try
           try
              FGrpID := AGrpID;
              FHerdID := AHerdID;
              if FNBASPermitType in [NBAS31A,NBASNone] then
                 begin
                    if rgFormType.ItemIndex = -1 then
                       rgFormType.ItemIndex := 0;
                 end
              else if FNBASPermitType = NBAS31B then
                 begin
                    rgFormType.ItemIndex := 1;
                 end
              else if FNBASPermitType = NBAS31G then
                 begin
                    rgFormType.ItemIndex := 2;
                 end;
              SelectFormType(rgFormType);
              ShowModal;
           except
           end;

        finally
           CMMSAnimals.Close;
           CMMSAnimals.DeleteTable;
           WinData.tMovedTo.Close;
           // GetAnimals.Cancel; SP
           // GetAnimals.Close; SP
           Free;
        end;
  end;


procedure TfmCMMSPermits.sbExitClick(Sender: TObject);
begin
   WinData.Customers.Filter := '';
   WinData.Customers.Filtered := False;
   Close;
end;

procedure TfmCMMSPermits.LoadAnimals;
begin
   Screen.Cursor := crHourGlass;
   Enabled := False;
   try
      if CMMSAnimals.Active then       //SP
         CMMSAnimals.Close;            //SP
      SQLEmptyTable(CMMSAnimals.TableName); //SP


      GetAnimals.Close;
      GetAnimals.SQL.Clear;
      GetAnimals.SQL.Add('Insert into CMMSAnimals(ID, NatIdNum, AnimalNo, Sex, DateOfBirth, SortNatID, SortAnimalNo)');
      GetAnimals.SQL.Add('Select Distinct A.ID, A.NatIdNum, A.AnimalNo, A.Sex, A.DateOfBirth, A.SortNatID, A.SortAnimalNo');
      GetAnimals.SQL.Add('From Animals A');
      GetAnimals.SQL.Add('Where ( A.Inherd = True )');
      GetAnimals.SQL.Add('And (A.Animaldeleted=False)');
      GetAnimals.SQL.Add('And (A.HerdID = :HID)');

      if ( FGrpID > 0 ) then
         begin
            GetAnimals.SQL.Add('And (A.ID in (Select G.AnimalID From GrpLinks G Where G.GroupID = '+IntToStr(FGrpID)+'))');
         end
      else
         begin
            GetAnimals.SQL.Add('And (A.ID in (Select F.AID From AFilters F))');
         end;

      GetAnimals.Params[0].AsInteger := FHerdID;
      GetAnimals.ExecSQL;

      //   30/06/11 [V4.1 R2.1] /MK Additional Feature - Default Search to NatIDNum As Its The First Field.
      CMMSAnimals.IndexName := 'SortNatID';

      CMMSAnimals.Active := True; //SP
      UpdateStatusBar;
   finally
      Screen.Cursor := crDefault;
      Enabled := True;
   end;
end;

procedure TfmCMMSPermits.HerdComboCloseUp(Sender: TObject);
begin
   try
      if ( Trim(HerdCombo.Value) <> '' ) or ( Trim(HerdCombo.Value) <> '0' ) then
         FHerdID := StrToInt(HerdCombo.Value);
   except
      MessageDlg('Unable to determine herd id. Please try again.',mtError,[mbOK],0);
      FHerdID := WinData.UserDefaultHerdID;
   end;
  LoadAnimals;
end;

procedure TfmCMMSPermits.TimerTimer(Sender: TObject);
begin
   Timer.Enabled := False;
   LoadAnimals;
end;

procedure TfmCMMSPermits.FormShow(Sender: TObject);
begin
//   pNBAS31AB.Show;
  // pNBAS31G.Hide;
   Timer.Enabled := True;
end;

procedure TfmCMMSPermits.FormCreate(Sender: TObject);
begin
   WinData.Customers.Filter := 'CMMSForms = True';
   WinData.Customers.Filtered := True;
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbView.Glyph,cBtnImgPreview);
   WinData.LoadBtnImage(WinData.Images,sbPrint.Glyph,cBtnImgPrint);
   WinData.LoadBtnImage(WinData.Images,sbOptions.Glyph,cBtnImgOptions);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph,cBtnImgHelp);
   WinData.tMovedTo.Open;
   CreateTempTables;
   HerdCombo.KeyValue := WinData.UserDefaultHerdID;
//   SelectFormType(rgFormType);
end;

procedure TfmCMMSPermits.CreateTempTables;
begin
   with CMMSAnimals do
      begin
         TableName := 'CMMSAnimals';
         with FieldDefs do
            begin
               Add('ID',ftAutoInc,0,FALSE);
               Add('NatIdNum',ftString,20,FALSE);
               Add('AnimalNo',ftString,10,FALSE);
               Add('Sex',ftString,10,FALSE);
               Add('DateOfBirth',ftDate,0,FALSE);
               Add('SortNatID',ftString,20,FALSE);
               Add('SortAnimalNo',ftString,10,FALSE);
               Add('Selected',ftBoolean,0,FALSE);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('ID', 'ID', [ixPrimary,ixUnique]);
               Add('NatIDNum', 'NatIDNum', [ixDescending,ixCaseInsensitive]);
               Add('AnimalNo', 'AnimalNo', [ixDescending,ixCaseInsensitive]);
               Add('Sex', 'Sex', [ixCaseInsensitive]);
               Add('DateOfBirth', 'DateOfBirth', [ixCaseInsensitive]);
               Add('SortNatID', 'SortNatID', [ixCaseInsensitive]);
               Add('SortAnimalNo', 'SortAnimalNo', [ixCaseInsensitive]);
            end;
         CreateTable;
         Open;
      end;
end;

procedure TfmCMMSPermits.AnimalGridDblClick(Sender: TObject);
begin
   CMMSAnimals.Edit;
   CMMSAnimals.FieldByName('Selected').AsBoolean := not(CMMSAnimals.FieldByName('Selected').AsBoolean);
   CMMSAnimals.Post;
{
   if CMMSAnimals.FieldByName('Selected').AsBoolean then
      CMMSAnimals.FieldByName('Selected').AsBoolean := FALSE
   else                                                      //'selected' field (boolean)
      CMMSAnimals.FieldByName('Selected').AsBoolean := TRUE;
   CMMSAnimals.Post;
   CMMSAnimals.Refresh;              // refresh grid upon exit
}
end;



procedure TfmCMMSPermits.AnimalGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   if CMMSAnimals.FieldByName('Selected').AsBoolean then
      Background := cl3DLight;
end;

procedure TfmCMMSPermits.sbViewClick(Sender: TObject);
begin

   if CountOfSelected <= 0 then
      begin
         MessageDlg('No animals have been selected',mtinformation,[mbOK],0);
         Exit;
      end;


   Viewing := (TRxSpeedButton( Sender ).Tag = 0);

   if rgFormType.ItemIndex = 0 then
      PreviewAForm
   else if rgFormType.ItemIndex = 1 then
      PreviewBForm
   else
      PreviewGForm;

end;

procedure TfmCMMSPermits.CMMSAnimalsAfterPost(DataSet: TDataSet);
begin
   UpdateStatusBar;
end;

function TfmCMMSPermits.CountOfSelected: Integer;
begin
   Result := 0;
   with GenQuery do
      try
         SQL.Clear;
         SQL.Add('Select Count (ID) CID From CMMSAnimals  Where Selected = True');
         Open;
         First;
         Result := FieldByName('CID').AsInteger;
      finally
         Close;
      end;
end;

procedure TfmCMMSPermits.SelectAll(ASelect: Boolean);
var
   SelectStr : String;
begin
   if ( not CMMSAnimals.Active ) or (CMMSAnimals.RecordCount <= 0) then
      Exit;

   if ASelect then
      SelectStr := 'Select all, '
   else
      SelectStr := 'Deselect all, ';

   if MessageDlg(SelectStr + 'are you sure?',mtConfirmation,[mbYes, mbNo],0) = idNo then Exit;

   with GenQuery do
      try
         SQL.Clear;
         SQL.Add('Update CMMSAnimals');
         if ASelect then
            SQL.Add('Set Selected = True')
         else
            SQL.Add('Set Selected = False');
         ExecSQL;

      finally
         CMMSAnimals.Refresh;
         UpdateStatusBar;
      end;
end;

procedure TfmCMMSPermits.SelectAll1Click(Sender: TObject);
begin
   SelectAll(True);
end;

procedure TfmCMMSPermits.DeselectAll1Click(Sender: TObject);
begin
   SelectAll(False);
end;

procedure TfmCMMSPermits.UpdateStatusBar;
begin
   StatusBar1.Panels[0].Text := 'Applying for ('+IntToStr(CountOfSelected)+') Animal Permits';
   StatusBar1.Panels[1].Text := 'Total Animals: ('+IntToStr(CMMSAnimals.RecordCount)+') ';
end;

procedure TfmCMMSPermits.GetBuyer;
begin

end;

procedure TfmCMMSPermits.PreviewAForm;
begin
   with TNBASRep31A.Create(nil) do
      try
         lSellerName.Caption := '';
         lSellerAdd1.Caption := '';
         lSellerAdd2.Caption := '';
         lSellerTelNo.Caption := '';
         lBuyerherdNo.Caption := '';
         lBuyerName.Caption   := '';
         lBuyerAdd1.Caption   := '';
         lBuyerAdd2.Caption   := '';
         lBuyerTelNo.Caption  := '';

         CMMSAnimals.Filter := 'Selected = True';
         CMMSAnimals.Filtered := True;
         with GenQuery do
            try   // Bring in Herd Owner Details
               SQL.Clear;
               SQL.Add('SELECT HerdIdentity, Name, Address1, Address2, Address3, Phone');      //KVB HerdIdentifier not HerdIdentity???
               SQL.Add('FROM Owners O');                                                //SP Wrong Keith, HerdIdentity not HerdIdentifier!!!
               SQL.Add('WHERE (O.ID = "' + HerdCombo.Value + '" )');
               Open;
               First;
               if FieldByName('HerdIdentity').AsString <> '' then
                  lSellerHerdNo.Caption := FieldByName('HerdIdentity').AsString
               else
                  lSellerHerdNo.Caption := '';

               if FieldByName('Name').AsString <> '' then
                  lSellerName.Caption := FieldByName('Name').AsString
               else
                  lSellerName.Caption := '';


               if FieldByName('Address1').AsString <> '' then
                  lSellerAdd1.Caption := FieldByName('Address1').AsString
               else
                  lSellerAdd1.Caption := '';

               if (Trim(FieldByName('Address2').AsString) <> '') And (Trim(FieldByName('Address3').AsString) <> '') then
                  lSellerAdd2.Caption := FieldByName('Address2').AsString + ', ' + FieldByName('Address3').AsString
               else if
                  (Trim(FieldByName('Address2').AsString) <> '') And (Trim(FieldByName('Address3').AsString) = '') then
                  lSellerAdd2.Caption := FieldByName('Address2').AsString
               else
                  lSellerAdd2.Caption := '';

               if FieldByName('Phone').AsString <> '' then
                  lSellerTelNo.Caption := FieldByName('Phone').AsString
               else
                  lSellerTelNo.Caption := '';

               if ( Trim(Buyer.Value) = '' ) or ( Trim(Buyer.Value) = '0' ) then
                  begin
                     if MessageDlg('No Buyer selected. Do you want to continue?', mtConfirmation ,[mbYes,mbNo],0) = idYes then
                        begin
                           lBuyerName.Caption := '';
                           lBuyerAdd1.Caption   := '';
                           lBuyerAdd2.Caption   := '';
                           lBuyerTelNo.Caption   := '';
                        end
                     else
                        Abort;
                  end
               else
                  begin
                     lBuyerName.Caption := WinData.Customers.FieldByName('Name').AsString;
                     lBuyerherdNo.Caption := UPPERCASE(WinData.Customers.FieldByName('BTEHerdNo').AsString);
                     if WinData.Customers.FieldByName('Address 1').AsString <> '' then
                        lBuyerAdd1.Caption := WinData.Customers.FieldByName('Address 1').AsString
                     else
                        lBuyerAdd1.Caption := '';

                     if (Trim(WinData.Customers.FieldByName('Address 2').AsString) <> '') And (Trim(WinData.Customers.FieldByName('Address 3').AsString) <> '') then
                        lBuyerAdd2.Caption := WinData.Customers.FieldByName('Address 2').AsString + ', ' + WinData.Customers.FieldByName('Address 3').AsString
                     else if
                        (Trim(WinData.Customers.FieldByName('Address 2').AsString) <> '') And (Trim(WinData.Customers.FieldByName('Address 3').AsString) = '') then
                        lBuyerAdd2.Caption := WinData.Customers.FieldByName('Address 2').AsString
                     else
                        lBuyerAdd2.Caption := '';

                     if WinData.Customers.FieldByName('Phone').AsString <> '' then
                        lBuyerTelNo.Caption := WinData.Customers.FieldByName('Phone').AsString
                     else
                        lBuyerTelNo.Caption := '';
                  end;
            finally
               Close;
            end;
         if Viewing then
            NBAS31A.Preview
         else
            NBAS31A.Print;
      finally
         CMMSAnimals.Filter := '';
         CMMSAnimals.Filtered := False;
         Free;
      end;
end;

procedure TfmCMMSPermits.SelectFormType(Sender: TObject);
   procedure SetActiveRGIndex(index : Integer);
   var
     i : Integer;
   begin
      for i := 0 to rgFormType.Items.Count-1 do
         begin
            if i = Index then
               begin
                  (rgFormType.Controls[i] as TRadioButton).Font.Style := [fsBold];
                  (rgFormType.Controls[i] as TRadioButton).Font.Color := clMaroon;
               end
            else
               begin
                  (rgFormType.Controls[i] as TRadioButton).Font.Style := [];
                  (rgFormType.Controls[i] as TRadioButton).Font.Color := clWindowText;
               end
         end;
   end;
begin
   SetActiveRGIndex(rgFormType.ItemIndex);
   if rgFormType.ItemIndex = 0 then
      begin
         lBuyerDestination.Caption := 'Select Customer Holding';
         pNBAS31AB.Show;
         pNBAS31G.Hide;
         Buyer.LookupSource := nil;
         Buyer.LookupField := 'ID';
         Buyer.LookupDisplay := 'Name';
         WinData.Customers.Filter := 'CMMSForms = True';
         WinData.Customers.Filtered := True;
         Buyer.LookupSource := WinData.dsCustomers;
      end
   else if rgFormType.ItemIndex = 1 then
      begin
         lBuyerDestination.Caption := 'Select B && B Holdings';
         pNBAS31AB.Show;
         pNBAS31G.Hide;
         WinData.Customers.Filter := '';
         WinData.Customers.Filtered := False;
         Buyer.LookupSource := nil;
         Buyer.LookupField := 'ID';
         Buyer.LookupDisplay := 'Name;HerdIdentity';
         Buyer.LookupSource := dsMoveTo;
      end
   else if rgFormType.ItemIndex = 2 then
      begin
          deMovementDate.Date := Date;
          PrintCopies.AsInteger := 3;
          pNBAS31AB.Visible := False;
          pNBAS31G.Visible := True;
      end;
   Update;
end;

procedure TfmCMMSPermits.PreviewBForm;
begin
   with TNBASRep31B.Create(nil) do
      try
         lBuyerherdNo.Caption := '';
         lBuyerName.Caption := '';
         lBuyerAdd1.Caption := '';
         lBuyerAdd2.Caption := '';
         lBuyerTelNo.Caption := '';
         lSellerHerdNo.Caption := '';
         lSellerName.Caption := '';
         lSellerAdd1.Caption := '';
         lSellerAdd2.Caption := '';
         lSellerTelNo.Caption := '';
         CMMSAnimals.Filter := 'Selected = True';
         CMMSAnimals.Filtered := True;
         with GenQuery do
            try   // Bring in Herd Owner Details
               SQL.Clear;
               SQL.Add('SELECT HerdIdentity, Name, Address1, Address2, Address3, Phone');      //KVB HerdIdentifier not HerdIdentity???
               SQL.Add('FROM Owners O');                                                //SP Wrong Keith, HerdIdentity not HerdIdentifier!!!
               SQL.Add('WHERE (O.ID = "' + HerdCombo.Value + '" )');
               Open;
               First;
               if FieldByName('HerdIdentity').AsString <> '' then
                  lSellerHerdNo.Caption := FieldByName('HerdIdentity').AsString;
               if FieldByName('Name').AsString <> '' then
                  lSellerName.Caption := FieldByName('Name').AsString;
               if FieldByName('Address1').AsString <> '' then
                  lSellerAdd1.Caption := FieldByName('Address1').AsString;
               if (Trim(FieldByName('Address2').AsString) <> '') And (Trim(FieldByName('Address3').AsString) <> '') then
                  lSellerAdd2.Caption := FieldByName('Address2').AsString + ', ' + FieldByName('Address3').AsString
               else if (Trim(FieldByName('Address2').AsString) <> '') And (Trim(FieldByName('Address3').AsString) = '') then
                  lSellerAdd2.Caption := FieldByName('Address2').AsString;
               if FieldByName('Phone').AsString <> '' then
                  lSellerTelNo.Caption := FieldByName('Phone').AsString;

               if ( Trim(Buyer.Value) = '' ) or ( Trim(Buyer.Value) = '0' ) then
                  begin
                     if MessageDlg('No Destination selected. Do you want to continue?', mtConfirmation ,[mbYes,mbNo],0) = idYes then
                        begin
                           lBuyerherdNo.Caption := '';
                           lBuyerName.Caption := '';
                           lBuyerAdd1.Caption   := '';
                           lBuyerAdd2.Caption   := '';
                           lBuyerTelNo.Caption   := '';
                        end
                     else
                        Abort;
                  end
               else
                  begin
                     lBuyerName.Caption := WinData.tMovedTo.FieldByName('Name').AsString;
                     if (Trim(WinData.tMovedTo.FieldByName('HerdIdentity').AsString) <> '') then
                        lBuyerherdNo.Caption := WinData.tMovedTo.FieldByName('HerdIdentity').AsString;
                     if (Trim(WinData.tMovedTo.FieldByName('Townland').AsString) <> '') then
                        lBuyerAdd1.Caption := WinData.tMovedTo.FieldByName('Townland').AsString;
                     if (Trim(WinData.tMovedTo.FieldByName('County').AsString) <> '') then
                        lBuyerAdd2.Caption := WinData.tMovedTo.FieldByName('County').AsString;
//                     if (Trim(WinData.tMovedTo.FieldByName('Phone').AsString) <> '') then
//                        lBuyerTelNo.Caption := WinData.tMovedTo.FieldByName('Phone').AsString
//                     else
//                  { There is not tel no field as of yet}
                     lBuyerTelNo.Caption := '';
                  end;
            finally
               Close;
            end;

         if Viewing then
            NBAS31B.Preview
         else
            NBAS31B.Print;
      finally
         CMMSAnimals.Filter := '';
         CMMSAnimals.Filtered := False;
         Free;
      end;
end;

procedure TfmCMMSPermits.BuyerCloseUp(Sender: TObject);
var
   CustomerID : Integer;
begin
   if ( Trim(Buyer.Value) = '' ) or ( Trim(Buyer.Value) = '0' ) then
      begin
         if ( rgFormType.ItemIndex = 0 ) then
            begin
               //   14/11/11 [V5.0 R2.1] /MK Bug Fix - Changed Message To That Of lBuyerDestination Label.
               //   if MessageDlg('Do you wish to add a Buyer/Destination?', mtConfirmation ,[mbYes,mbNo],0) = idYes then
               if MessageDlg('Do you wish to add a Customer Holding?', mtConfirmation ,[mbYes,mbNo],0) = idYes then
                  begin
                     WinData.NewCustomerAttributes := [caCMMSRegistered];
                     uCustomers.ShowTheForm(True, CustomerID);
                     if ( CustomerID > 0 ) then
                        Buyer.KeyValue := CustomerID;
                  end;
            end
         else if ( rgFormType.ItemIndex = 1 ) then
            begin
               //   14/11/11 [V5.0 R2.1] /MK Bug Fix - Changed Message To That Of lBuyerDestination Label.
               //   if MessageDlg('Do you wish to add a Destination?', mtConfirmation ,[mbYes,mbNo],0) = idYes then
               if MessageDlg('Do you wish to add a B && B Holding?', mtConfirmation ,[mbYes,mbNo],0) = idYes then
                  uMovedBy.ShowTheForm(TRUE);
            end;
      end;
end;

procedure TfmCMMSPermits.AnimalGridTitleClick(Column: TColumnEh);
begin
   if UPPERCASE(Column.FieldName) = 'NATIDNUM' then
      CMMSAnimals.IndexName := 'SortNatID'
   else if UPPERCASE(Column.FieldName) = 'ANIMALNO' then
      CMMSAnimals.IndexName := 'SortAnimalNo'
   else if CMMSAnimals.IndexDefs.IndexOf(Column.FieldName) <> -1 then
      CMMSAnimals.IndexName := Column.FieldName;
end;

procedure TfmCMMSPermits.UpdateCMMSTable(const Value: Boolean);
var
   i : Integer;
   Bookmark : TBookmark;
begin
   for i := 0 to AnimalGrid.SelectedRows.Count-1 do
      begin
         AnimalGrid.DataSource.DataSet.DisableControls;
         BookMark := AnimalGrid.DataSource.DataSet.GetBookmark;
         try
            if AnimalGrid.SelectedRows[I] <> '' then
               begin
                  if AnimalGrid.DataSource.DataSet.BookmarkValid(pointer(AnimalGrid.SelectedRows[I])) then
                     begin
                        AnimalGrid.DataSource.DataSet.GotoBookmark(pointer(AnimalGrid.SelectedRows[I]));
                        AnimalGrid.DataSource.DataSet.Edit;
                        AnimalGrid.DataSource.DataSet.FieldByName('Selected').AsBoolean := Value;
                        AnimalGrid.DataSource.DataSet.Post;
                     end;
               end;
         finally
            AnimalGrid.DataSource.DataSet.GotoBookmark(BookMark);
            AnimalGrid.DataSource.DataSet.FreeBookmark(BookMark);
            AnimalGrid.DataSource.DataSet.EnableControls;
         end;
      end;
end;

procedure TfmCMMSPermits.Select1Click(Sender: TObject);
begin
   UpdateCMMSTable(True);
end;

procedure TfmCMMSPermits.Deselect1Click(Sender: TObject);
begin
   UpdateCMMSTable(False);

end;

procedure TfmCMMSPermits.PreviewGForm;
const
   MaxAnimalsPerPage = 15;
var
   NoOfVenNoNeeded : Integer;
   tHerdId : string;
begin

   CheckHerdIsDealer;
   // Check Ven No Allocation
   if WinData.CheckCMMSAllocation(NBAS31G) then
      begin
         MessageDlg('Please ring Kingswood Computing for your next allocation of Permit Ven No''s',mtINformation,[mbOK],0);
         Exit;
      end
   else
      begin
         if not WinData.CMMSPermits.Locate('AllocationsUsed;PermitType', VarArrayOf([False,'G']),[]) then
            raise Exception.Create('Error locating CMMS Permit record')
         else
            begin

               NoOfVenNoNeeded := Trunc(CountOfSelected div MaxAnimalsPerPage);
               if ( CountOfSelected mod MaxAnimalsPerPage ) > 0 then
                  Inc(NoOfVenNoNeeded);

               if ( NoOfVenNoNeeded > WinData.CMMSPermits.FieldByName('Remaining').AsInteger ) then
                  raise Exception.Create('The number of NBAS 31 G permits being applied (%d) '+cCRLF+
                                         'exceeds the Ven No allocations remaining (%d).'+cCRLF+cCRLF+
                                         'Please use all remaining Ven No allocations and contact'+cCRLF+
                                         'Kingswood Computing for your next Ven No allocation.');
            end;
      end;

   with TNBASRep31G.Create(nil) do
      try
         NBAS31G.PrinterSettings.Copies := PrintCopies.AsInteger;
         if ( deMovementDate.Date > 0 ) then
            DateOfMovement := FormatDateTime(cIrishDateStyle,deMovementDate.Date)
         else
            DateOfMovement := FormatDateTime(cIrishDateStyle, Date );

         lBuyerherdNo.Caption := '';
         lBuyerName.Caption := '';
         lBuyerAdd1.Caption := '';
         lBuyerAdd2.Caption := '';
         lBuyerTelNo.Caption := '';
         lSellerHerdNoSect1.Caption := '';
         lSellerHerdNoSect2.Caption := '';
         lSellerHerdNoSect3.Caption := '';

         lSellerName.Caption := '';
         lSellerAdd1.Caption := '';
         lSellerAdd2.Caption := '';
         lSellerTelNo.Caption := '';
         CMMSAnimals.Filter := 'Selected = True';
         CMMSAnimals.Filtered := True;
         with GenQuery do
            try   // Bring in Herd Owner Details
               SQL.Clear;
               SQL.Add('SELECT HerdIdentity, Name, Address1, Address2, Address3, Phone');
               SQL.Add('FROM Owners O');
               SQL.Add('WHERE (O.ID = "' + HerdCombo.Value + '" )');
               Open;
               First;
               if FieldByName('HerdIdentity').AsString <> '' then
                  begin
                     tHerdId := UPPERCASE(Trim(FieldByName('HerdIdentity').AsString));
                     if ( Copy(tHerdID, 5, 2) <> '85' ) then
                        begin
                           MessageDlg(Format('Invalid Herd Identity format. '+cCRLF+cCRLF+
                                      'The selected Herd Identity "%s" is not the correct dealer format.',
                                      [tHerdID]),mtError,[mbOK],0);
                           Abort;
                        end
                     else
                        begin
                           lSellerHerdNoSect1.Caption := Copy(tHerdId, 1, 4);
                           lSellerHerdNoSect2.Caption := '85';
                           lSellerHerdNoSect3.Caption := Copy(tHerdId, 7, 2);
                        end;
                  end;

               if FieldByName('Name').AsString <> '' then
                  lSellerName.Caption := FieldByName('Name').AsString;
               if FieldByName('Address1').AsString <> '' then
                  lSellerAdd1.Caption := FieldByName('Address1').AsString;
               if (Trim(FieldByName('Address2').AsString) <> '') And (Trim(FieldByName('Address3').AsString) <> '') then
                  lSellerAdd2.Caption := FieldByName('Address2').AsString + ', ' + FieldByName('Address3').AsString
               else if (Trim(FieldByName('Address2').AsString) <> '') And (Trim(FieldByName('Address3').AsString) = '') then
                  lSellerAdd2.Caption := FieldByName('Address2').AsString;
               if FieldByName('Phone').AsString <> '' then
                  lSellerTelNo.Caption := FieldByName('Phone').AsString;

               if ( Trim(BuyerDestDetails.Value) = '' ) or ( Trim(BuyerDestDetails.Value) = '0' ) then
                  begin
                     if MessageDlg('No Buyer/Destination selected. Do you want to continue?', mtConfirmation ,[mbYes,mbNo],0) = idYes then
                        begin
                           lBuyerherdNo.Caption := '';
                           lBuyerName.Caption := '';
                           lBuyerAdd1.Caption   := '';
                           lBuyerAdd2.Caption   := '';
                           lBuyerTelNo.Caption   := '';
                        end
                     else
                        Abort;
                  end
               else
                  begin
                     lBuyerName.Caption := WinData.Customers.FieldByName('Name').AsString;
                     lBuyerherdNo.Caption := UPPERCASE(WinData.Customers.FieldByName('BTEHerdNo').AsString);
                     if WinData.Customers.FieldByName('Address 1').AsString <> '' then
                        lBuyerAdd1.Caption := WinData.Customers.FieldByName('Address 1').AsString
                     else
                        lBuyerAdd1.Caption := '';

                     if (Trim(WinData.Customers.FieldByName('Address 2').AsString) <> '') And (Trim(WinData.Customers.FieldByName('Address 3').AsString) <> '') then
                        lBuyerAdd2.Caption := WinData.Customers.FieldByName('Address 2').AsString + ', ' + WinData.Customers.FieldByName('Address 3').AsString
                     else if
                        (Trim(WinData.Customers.FieldByName('Address 2').AsString) <> '') And (Trim(WinData.Customers.FieldByName('Address 3').AsString) = '') then
                        lBuyerAdd2.Caption := WinData.Customers.FieldByName('Address 2').AsString
                     else
                        lBuyerAdd2.Caption := '';

                     if WinData.Customers.FieldByName('Phone').AsString <> '' then
                        lBuyerTelNo.Caption := WinData.Customers.FieldByName('Phone').AsString
                     else
                        lBuyerTelNo.Caption := '';
                  end;
            finally
               Close;
            end;

         if Viewing then
            begin
               NBAS31G.Preview
            end
         else
            begin
               NBAS31G.Print;
            end;

         //   14/12/11 [V5.0 R2.9] /MK Change - If Remaining Is Less Or Equal To 1 Show Message.
         if ( WinData.CMMSPermits.FieldByName('Remaining').AsInteger <= 1 ) then
            MessageDlg('The Ven No allocations are running low.'+#13#10+
                       'Please contact Kingswood Computing to update your Ven No allocations',mtWarning,[mbOK],0);

      finally
         CMMSAnimals.Filter := '';
         CMMSAnimals.Filtered := False;
         Free;
      end;

end;

procedure TfmCMMSPermits.UpdateVenNo;
begin

   CheckHerdIsDealer;
   // Check Ven No Allocation
   if WinData.CheckCMMSAllocation(NBAS31G) then
      begin
         TfmNBASVenNoUpdate.ShowNBASUpdateForm(NBAS31G);
      end
   else
      MessageDlg('No allocation update is needed at this time',mtInformation,[mbOK],0);
end;

procedure TfmCMMSPermits.VenNoAllocationUpdate1Click(Sender: TObject);
begin
   UpdateVenNo;
end;

procedure TfmCMMSPermits.CheckHerdIsDealer;
var
   HerdID : Integer;
begin
   HerdID := LookupComboValue(HerdCombo);
   if ( HerdID > 0 ) then
      begin
         if not WinData.CheckDealerHerd(HerdID) then
            raise Exception.CreateFmt('Invalid Herd Identity format. '+cCRLF+cCRLF+
                              'The selected Herd Identity "%s" is not the correct dealer format.',
                              [HerdCombo.Text]);
      end;
end;

procedure TfmCMMSPermits.BuyerDestDetailsCloseUp(Sender: TObject);
var
   CustomerID : Integer;
begin
   CustomerID := LookupComboValue(BuyerDestDetails);
   if ( CustomerID <= 0 ) then
      begin
         if MessageDlg('Do you wish to add a Buyer/Destination?', mtConfirmation ,[mbYes,mbNo],0) = idYes then
            begin
               WinData.NewCustomerAttributes := [caCMMSRegistered];
               uCustomers.ShowTheForm(True, CustomerID);
               if ( CustomerID > 0 ) then
                  BuyerDestDetails.KeyValue := CustomerID;
            end;
      end;
end;

procedure TfmCMMSPermits.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('movepermits.htm');
end;

end.
