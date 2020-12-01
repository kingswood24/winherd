unit uSalesDeaths;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, RXLookup, ToolEdit,
  RXDBCtrl, Buttons, DBTables, RXCtrls, uListAnimals, CurrEdit, quickrpt,
  Qrctrls;

type
  TAddOrAmendSaleDeath = (AddSaleDeath, AmendSaleDeath);
  TfSalesDeaths = class(TkwEventForm)
    SaleDeathNav: TDBNavigator;
    Panel1: TPanel;
    KillDied: TPanel;
    HelpBtn: TBitBtn;
    MyQuery: TQuery;
    Label2: TLabel;
    Label3: TLabel;
    CommentLabel: TLabel;
    Customers: TRxDBLookupCombo;
    DateOfSaleDeath: TDBDateEdit;
    dbComment: TDBEdit;
    SaleWtLabel: TLabel;
    PriceLabel: TLabel;
    Weight: TDBEdit;
    Price: TDBEdit;
    Label6: TLabel;
    SearchForAnimal: TComboEdit;
    PricePerKgLabel: TLabel;
    ColdDeadWtLabel: TLabel;
    ColdDeadWt: TDBEdit;
    GradeLabel: TLabel;
    Grade: TDBEdit;
    KillOutLabel: TLabel;
    AnimalStatusLabel: TLabel;
    NumAnimalsLabel: TLabel;
    AnimalStatus: TDBRadioGroup;
    PricePerKg: TCurrencyEdit;
    KillOut: TDBText;
    ExitButton: TBitBtn;
    qNumAnimals: TQuery;
    NumAnimals: TEdit;
    bDelete: TBitBtn;
    NatIDNumLabel: TLabel;
    NatIDNum: TDBText;
    KillNumberLabel: TLabel;
    KillNumber: TDBEdit;
    procedure oldExitButtonClick(Sender: TObject);
    procedure CustomersCloseUp(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SaleDeathNavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure CustomersChange(Sender: TObject);
    procedure WeightExit(Sender: TObject);
    procedure PriceExit(Sender: TObject);
    procedure PricePerKgExit(Sender: TObject);
    procedure ColdDeadWtExit(Sender: TObject);
    procedure SearchForAnimalExit(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AnimalStatusExit(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure SaleDeathNavClick(Sender: TObject; Button: TNavigateBtn);
  private
    { private declarations }
    ShowSalesDeathsInd : Boolean;
    dbCommentTop : Integer;
    dbCommentLeft : Integer;
    dbCommentTabOrder : Integer;
    CommentLabelTop : Integer;
    CommentLabelLeft : Integer;
    WeightTop : Integer;
    WeightLeft : Integer;
    WeightTabOrder : Integer;
    SaleWtLabelTop : Integer;
    SaleWtLabelLeft : Integer;
    NatIDNumLabelTop : Integer;
    NatIDNumLabelLeft : Integer;
    NatIDNumTop : Integer;
    NatIDNumLeft : Integer;
    fSalesDeathsWidth : Integer;
    KillDiedWidth : Integer;
    OldAnimalID : Integer;
    CurrentAnimalID : Integer;
    procedure CalcNumAnimals;
    procedure CheckSalesEvent;

  public
    { public declarations }

  end;

{
var
  fSalesDeaths: TfSalesDeaths;
}
procedure ShowSalesDeaths(AddorAmend : TAddOrAmendSaleDeath; PreSalesInd : Boolean );

implementation
Uses
    Dialogs,
    uCustomers,
    GenTypesConst,
    uSalePurchDelete,
    DairyData;

{$R *.DFM}


procedure ShowSalesDeaths(AddorAmend : TAddOrAmendSaleDeath; PreSalesInd : Boolean );
begin
     with TfSalesDeaths.Create(nil) do
        try
           //Need to set the global IsItPreSale boolean.
           WinData.IsItPreSale := PreSalesInd;
           //Need to record Current and Old Animal ID's for comparison later
           OldAnimalID := 0;  //No Old Animal ID
           CurrentAnimalID := WinData.AnimalFileByIDID.AsInteger;
           
           WinData.EventType := TSaleDeath;
           ThisCombo := SearchForAnimal;
           ThisNav := SaleDeathNav;
           ThisComment := dbComment;
           pSexToList := '';

           SaleDeathNav.VisibleButtons := [nbPost,nbCancel];

           // Set the Animal Number to the one on the Grid
           SearchForAnimal.Text := WinData.AnimalFileByIDAnimalNo.AsString;
           //ShowSalesDeathsInd := True;     //Indicator no longer needed

           CheckSalesEvent;
           ShowModal;
     finally
           Free;
     end;
end;

procedure TfSalesDeaths.oldExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfSalesDeaths.CustomersCloseUp(Sender: TObject);
begin
     if Customers.Value = '0' then
        WinData.CreateAndShowForm(TfCustomers);
end;

procedure TfSalesDeaths.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK );
end;

procedure TfSalesDeaths.SaleDeathNavBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
   RecordOk : Boolean;
begin
     if ( Button = nbPost ) And ( WinData.SaleDeath.FieldByName('Sold').AsBoolean ) then
        begin
           // Check you're not selling pre retension date
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('SELECT * FROM BeefSub');
           MyQuery.SQL.Add('WHERE (AnimalID = ' + WinData.AnimalFileByIDID.AsString + ')');
           MyQuery.Open;
           MyQuery.First;
           RecordOk := TRUE;
           while NOT MyQuery.EOF do
              begin
                 if RecordOK then
                    RecordOK := ( MyQuery.FieldByName('RetensionDate').AsDateTime <= WinData.EventsEventDate.AsDateTime );
                 MyQuery.Next;
              end;
           MyQuery.Close;
           if NOT RecordOK then
              begin
                 if MessageDLG('Pre-Retension Date - Are you sure you want to Sell',mtWarning,[mbYes,mbNo],0) = mrNo then
                    Abort;
              end
           else if ( Customers.Field.AsInteger = 0 ) then
              begin
                 MessageDLG('You must enter a Customer',mtWarning,[mbOK],0);
                 Abort;
              end;

//        else
//         Removed the following code to prevent the Sales Screen from disappearing when
//         a sales screen record has been saved.
{              Close;   }
        end;
//      Removed the following code to prevent the SalesDeaths Screen from disappearing when
//      a Death record has been saved
{     else
        Close;    }
end;

procedure TfSalesDeaths.SearchForAnimalButtonClick(Sender: TObject);
begin
     SearchButtonClick(Sender);
     //Assigns current AnimalID to CurrentAnimalID for comparison with OldAnimalID
     CurrentAnimalID := WinData.AnimalFileByIDID.AsInteger;
     OldAnimalID := 0;  //Ensures that Sales Event is located - grid has lost focus
     If SaleDeathNav.Enabled = True then
        NatIDNum.Font.Color := clWindowText
     Else
         NatIDNum.Font.Color := NatIDNum.Color;
     CheckSalesEvent;
     FormShow(Sender);
end;

procedure TfSalesDeaths.SearchForAnimalChange(Sender: TObject);
begin
     OldAnimalID := 0;
     SearchAnimalChange(Sender);
     // Now to erase NatID Num until entire Animal Number is input
     NatIDNum.Font.Color := NatIDNum.Color
end;

procedure TfSalesDeaths.CustomersChange(Sender: TObject);
begin
//    WinData.SetEventsToEdit;
end;

procedure TfSalesDeaths.WeightExit(Sender: TObject);
begin
     //Calculates Kill Out% on Sales or Death Screen
     Try
        If WinData.IsItPreSale = False then    //Not a PreSale Event
           Begin
                If WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat = 0 then
                   WinData.SaleDeath.FieldByName('KillOut').AsFloat := 0.00
                Else
                    If WinData.SaleDeath.FieldByName('Weight').AsFloat = 0 then
                       WinData.SaleDeath.FieldByName('KillOut').AsFloat := 0.00
                    Else
                        WinData.SaleDeath.FieldByName('KillOut').AsFloat :=
                           ( WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat * 100 ) /
                        WinData.SaleDeath.FieldByName('Weight').AsFloat;
                        //Rounds Kill Out% to two decimal places.
           End;
     Except
     End;
End;

procedure TfSalesDeaths.PriceExit(Sender: TObject);
begin
     Try
//   Calculates PricePerKg on Sales or Death Screen
     If WinData.SaleDeath.FieldByName('Price').AsFloat = 0 then
        PricePerKg.Value := 0.00
     Else
         If WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat = 0 then
            PricePerKg.Value := 0.00
         Else if Weight.Modified or Price.Modified then
             PricePerKg.Value := ((WinData.SaleDeath.FieldByName('Price').AsFloat)/
             (WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat));
     Except
     End;
End;

procedure TfSalesDeaths.PricePerKgExit(Sender: TObject);
begin
     Try
//   Calculates Price on Sales or Death Screen after input of PricePerKg

//   Removed the following code to allow a residue cash value for a dead animal to be input.
{       If WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat = 0 then
           WinData.SaleDeath.FieldByName('Price').AsFloat := 0.00
        Else
            If PricePerKg.Value = 0 then
               WinData.SaleDeath.FieldByName('Price').AsFloat := 0.00
            Else}
        if PricePerKg.Modified then
           begin
                WinData.SaleDeath.FieldByName('Price').AsFloat := PricePerKg.Value *
                      (WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat);
                PricePerKg.Modified := FALSE;
           end;
     Except
     End;
End;

procedure TfSalesDeaths.ColdDeadWtExit(Sender: TObject);
begin
     Try
        //   Calculates the Kill Out% on Sales or Death Screen
        WeightExit(Sender);

        //   Calculates PricePerKg on Sales or Death Screen
        If WinData.SaleDeath.FieldByName('Price').AsFloat = 0 then
           PricePerKg.Value := 0.00
        Else
            If WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat = 0 then
               PricePerKg.Value := 0.00
            Else If Weight.Modified or Price.Modified then
                 PricePerKg.Value := ((WinData.SaleDeath.FieldByName('Price').AsFloat)/
                 (WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat));

     Except
     End;
end;

procedure TfSalesDeaths.SearchForAnimalExit(Sender: TObject);
begin
    // If the User presses the Exit Button don't set the Dataset into Edit Mode
    if NOT ( Screen.ActiveControl is TBitBtn ) then
       begin
            if NOT SearchExit ( Sender ) then
               SearchForAnimal.SetFocus
            else
               begin
                  //Update CurrentAnimalID to compare against OldAnimalID
                  CurrentAnimalID := WinData.AnimalFileByIDID.AsInteger;
                  If ((WinData.IsItPreSale = True) and (WinData.AnimalFileByIDInHerd.AsBoolean = False)) then
                     Begin     // Can not process a non InHerd animal in the PreSale Screen
                          messagedlg('This animal is not in Herd, use Sale/Death Screen', mtInformation, [mbOK], 0);
                          SearchForAnimal.SetFocus;
                          SaleDeathNav.Enabled := FALSE;
                     End
                  Else
                      If SaleDeathNav.Enabled = True then
                         NatIDNum.Font.Color := clWindowText
                      Else
                          NatIDNum.Font.Color := NatIDNum.Color;
                      CheckSalesEvent;
               end;
       end;
end;

procedure TfSalesDeaths.ExitButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfSalesDeaths.CheckSalesEvent;
begin
     // First to check whether the AnimalID has changed - if not then there is nothing to do.
     If ( CurrentAnimalID <> OldAnimalID ) then
       Begin
            // Need to check whether a PreSales or a Sales event
            If ((WinData.IsItPreSale = True) and (WinData.AnimalFileByIDInHerd.AsBoolean = False)) then
               Begin     // Currently, can only select a Non-InHerd animal from front screen
                    messagedlg('This animal is not in Herd, use Sale/Death Screen', mtInformation, [mbOK], 0);
                    Abort;
               End
            Else    //PreSale or Sale Event - animal in herd
                If (WinData.IsItPreSale = True) then
                   Begin
                        // Need to adjust form for PreSale input
                        Caption := 'Pre-Sale';
                        AnimalStatusLabel.Visible := False;
                        AnimalStatus.Visible := False;
                        ColdDeadWtLabel.Visible := False;
                        ColdDeadWt.Visible := False;
                        PriceLabel.Visible := False;
                        Price.Visible := False;
                        PricePerKgLabel.Visible := False;
                        PricePerKg.Visible := False;
                        GradeLabel.Visible := False;
                        Grade.Visible := False;
                        KillOutLabel.Visible := False;
                        KillOut.Visible := False;
                        NumAnimalsLabel.Visible := False;
                        NumAnimals.Visible := False;
                        KillNumberLabel.Visible := False;
                        KillNumber.Visible := False;
                        // Now to record and reposition some components
                        dbCommentTop := dbComment.Top;
                        dbCommentLeft := dbComment.Left;
                        dbCommentTabOrder := dbComment.TabOrder;
                        CommentLabelTop := CommentLabel.Top;
                        CommentLabelLeft := CommentLabel.Left;
                        WeightTop := Weight.Top;
                        WeightLeft := Weight.Left;
                        WeightTabOrder := Weight.TabOrder;
                        SaleWtLabelTop := SaleWtLabel.Top;
                        SaleWtLabelLeft := SaleWtLabel.Left;
                        NatIDNumLabelTop := NatIDNumLabel.Top;
                        NatIDNumLabelLeft := NatIDNumLabel.Left;
                        NatIDNumTop := NatIDNum.Top;
                        NatIDNumLeft := NatIDNum.Left;

                        //NatIDNum is displaying the NatID Number of the first animal
                        //that matches the input in the Animal Number field, as determined
                        //by the main screen grid. This could be misleading, especially
                        //where the Animal Number does not exist. The simplest solution is
                        //to hid the NatID Number fields on the Pre-Sale screen.
                        //NatIDNumLabel.Visible := False;
                        //NatIDNum.Visible := False;

                        dbComment.Top := ColdDeadWt.Top;
                        dbComment.Left := ColdDeadWt.Left;
                        dbComment.TabOrder := ColdDeadWt.TabOrder;
                        CommentLabel.Top := ColdDeadWtLabel.Top;
                        CommentLabel.Left := ColdDeadWtLabel.Left;
                        // Animal Status is much larger than the Weight component.
                        Weight.Top := AnimalStatus.Top + AnimalStatus.Height - Weight.Height;
                        Weight.Left := AnimalStatus.Left;
                        Weight.TabOrder := AnimalStatus.TabOrder;
                        SaleWtLabel.Top := AnimalStatusLabel.Top;
                        SaleWtLabel.Left := AnimalStatusLabel.Left;
                        NatIDNumLabel.Top := PricePerKgLabel.Top;
                        NatIDNumLabel.Left := PricePerKgLabel.Left;
                        NatIDNum.Top := PricePerKg.Top;
                        NatIDNum.Left := PricePerKg.Left;

                        // Now to resize the form to the size of the Button Bar
                        fSalesDeathsWidth := Width;
                        KillDiedWidth := KillDied.Width;
                        Width := Panel1.Width + 8;
                        KillDied.Width := Width - (2 * KillDied.Left);

                        //Now to locate any existing PreSale Event or create a new PreSale Event
                        if WinData.Events.Locate('AnimalId;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsVariant,cSaleDeathEvent]),[] ) then
                           WinData.Events.Edit      //Existing event
                        else
                            begin   //New event
                                 WinData.Events.Append;
                                 // Now to ensure that animal remains in herd
                                 {
                                 if NOT ( WinData.AnimalFileByID.state in dsEditmodes ) then
                                    WinData.AnimalFileById.Edit;
                                 WinData.AnimalFileByIdInHerd.Value := True;
                                 WinData.AnimalFileById.Post;
                                 }
                                 WinData.SaleDeath.Edit;
                                 //Now to prefill the some fields for New PreSale
                                 WinData.Events.FieldByName('EventDesc').AsString := 'Pre-Sale';
                                 WinData.SaleDeath.FieldByName('PreSale').Value := True;
                                 WinData.SaleDeath.FieldByName('Sold').Value := True;
                            end;
                   End
                Else       // IsItPreSale = False, then a SalesDeaths event
                    Begin
                         // Need to adjust form for Sale or Death input
                         Caption := 'Sale or Death';
                         AnimalStatusLabel.Visible := True;
                         AnimalStatus.Visible := True;
                         ColdDeadWtLabel.Visible := True;
                         ColdDeadWt.Visible := True;
                         PriceLabel.Visible := True;
                         Price.Visible := True;
                         PricePerKgLabel.Visible := True;
                         PricePerKg.Visible := True;
                         GradeLabel.Visible := True;
                         Grade.Visible := True;
                         KillOutLabel.Visible := True;
                         KillOut.Visible := True;
                         NumAnimalsLabel.Visible := True;
                         NumAnimals.Visible := True;
                         KillNumberLabel.Visible := True;
                         KillNumber.Visible := True;

                         if WinData.Events.Locate('AnimalId;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsVariant,cSaleDeathEvent]),[] ) then
                            Begin
                                 WinData.Events.Edit;   //Existing event (could be Sale or PreSale)
                                 //Now to prefill the some fields for New Sale event
                                 If WinData.Events.FieldByName('EventDesc').AsString = 'Pre-Sale' then
                                    WinData.Events.FieldByName('EventDesc').AsString := 'Sale';
                                 WinData.SaleDeath.FieldByName('PreSale').Value := False;
                            end
                         else
                             begin     //New Sale Event
                                  WinData.Events.Append;
                                  WinData.SaleDeath.Edit;
                                  WinData.SaleDeath.FieldByName('Sold').Value := True;
                                  WinData.SaleDeath.FieldByName('PreSale').Value := False;
                             end;
                    end;
            //Now to write CurrentAnimalID to OldAnimalID
            OldAnimalID := CurrentAnimalID;
       End;
end;

procedure TfSalesDeaths.FormShow(Sender: TObject);
begin
     Try
//      Calculates the Price Per Kg figure and displays it on the Sales or Death Screen
        If WinData.SaleDeath.FieldByName('Price').AsFloat = 0 then
           PricePerKg.Value := 0.00
        Else
            If WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat = 0 then
               PricePerKg.Value := 0.00
            Else
                 PricePerKg.Value := ((WinData.SaleDeath.FieldByName('Price').AsFloat)/
                 (WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat));
     Except
     End;

     CalcNumAnimals;     //Procedure to Calculate the number of animals
end;

procedure TfSalesDeaths.AnimalStatusExit(Sender: TObject);
begin
     If WinData.SaleDeath.FieldByName('Sold').AsBoolean = True then
        begin
           if ( WinData.Events.FieldByName('EventDesc').AsString = 'Sale' ) or
              ( WinData.Events.FieldByName('EventDesc').AsString = 'Death' ) then
              WinData.Events.FieldByName('EventDesc').AsString := 'Sale';
        end
     else
        begin
           if ( WinData.Events.FieldByName('EventDesc').AsString = 'Sale' ) or
              ( WinData.Events.FieldByName('EventDesc').AsString = 'Death' ) then
              WinData.Events.FieldByName('EventDesc').AsString := 'Death';
        end;
end;

procedure TfSalesDeaths.CalcNumAnimals;
begin
     Try
//      If the all herds option is selected on the main screen, then the following calculates
//      the number of animals in all herds. Otherwise, it calculates the number of animals
//      in the herd as determined by the animal selected in the Sales screen.
        If WinData.UserDefaultHerdID = 0 then       //User selected all Herds
           Begin
                qNumAnimals.SQL.Clear;     //Clears Query
                qNumAnimals.SQL.Add('SELECT COUNT(AnimalNo) AnimalCount');  //Counts selected Animals
                qNumAnimals.SQL.Add('FROM Animals.DB');
                qNumAnimals.SQL.Add('WHERE (InHerd=True)');
                qNumAnimals.Open;          //Activates query

                NumAnimalsLabel.Caption := 'Number of Animals in All Herds:';
                NumAnimals.Text := IntToStr(qNumAnimals.FieldByName('AnimalCount').AsInteger);

           End
        Else      //User has selected a specific herd - use herd from animal onscreen.
            Begin

                qNumAnimals.SQL.Clear;     //Clears Query
                qNumAnimals.SQL.Add('SELECT COUNT(AnimalNo) AnimalCount');  //Counts selected Animals
                qNumAnimals.SQL.Add('FROM Animals.DB');
                qNumAnimals.SQL.Add('WHERE (InHerd=True) AND (HerdID = "' + WinData.AnimalFileByIDHerdID.AsString + '") ');
                qNumAnimals.Open;          //Activates query

                NumAnimalsLabel.Caption := 'Number of Animals in This Herd:';
                NumAnimals.Text := IntToStr(qNumAnimals.FieldByName('AnimalCount').AsInteger);

            End;
     Finally
     End;
End;

procedure TfSalesDeaths.bDeleteClick(Sender: TObject);
begin
    // User want to delete the Sales Record for this animal
    // check they are sure
    if SearchExit(SearchForAnimal) then
       begin
          uSalePurchDelete.ShowSalePurchaseDeleteScreen ( SaleDelete );
          ExitButton.Click;
       end;
end;

procedure TfSalesDeaths.SaleDeathNavClick(Sender: TObject; Button: TNavigateBtn);
begin
     // Erase Price Per Kg field
     PricePerKg.Value := 0;
     // Calc Number of Animals
     CalcNumAnimals;
     // Set the Animal Number to the one on the Grid
     SearchForAnimal.Text := WinData.AnimalFileByIDAnimalNo.AsString;
     // Reset Old & New Animal Numbers to ensure that Sales event is found, grid loses focus
     OldAnimalID := 0;
     CurrentAnimalID := WinData.AnimalFileByIDID.AsInteger;
     // Now to locate or create new Sales event.
     CheckSalesEvent;
     // Sets focus on the Animal Number field
     SearchForAnimal.SetFocus;
end;

end.
