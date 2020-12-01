unit uInterHerd;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, RXLookup, ToolEdit,
  RXDBCtrl, Buttons, DBTables, RXCtrls, uListAnimals, CurrEdit, ComCtrls,
  ToolWin, kwDBNavigator;

type
  TAddOrAmendInterHerd = (AddInterHerd, AmendInterHerd);
  TfInterHerd = class(TkwEventForm)
    KillDied: TPanel;
    qHerd: TQuery;
    dsHerds: TDataSource;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    dbnInterHerd: TkwDBNavigator;
    Label3: TLabel;
    lNo: TLabel;
    Label11: TLabel;
    lRemark: TLabel;
    dblNewHerd: TRxDBLookupCombo;
    dbdMoved: TDBDateEdit;
    SearchForAnimal: TComboEdit;
    dbeRemark: TDBEdit;
    Panel1: TPanel;
    Label1: TLabel;
    cbDefaults: TCheckBox;
    qihm: TQuery;
    procedure dblNewHerdCloseUp(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure SearchForAnimalExit(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure dbnInterHerdBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure dbnInterHerdClick(Sender: TObject; Button: TKNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblNewHerdChange(Sender: TObject);
    procedure dbdMovedChange(Sender: TObject);
    procedure dbeRemarkChange(Sender: TObject);
  private
    { private declarations }
//    Continue : Boolean;
    procedure SetUpHerdQuery;
    procedure CheckIHM;
  public
    { public declarations }
  end;

{
var
  fSalesDeaths: TfSalesDeaths;
}
  procedure ShowInterHerd(AddorAmend : TAddOrAmendInterHerd );

implementation
Uses
    Dialogs,
    GenTypesConst,
    DairyData,
    uHerdSetUp;


{$R *.DFM}

procedure ShowInterHerd(AddorAmend : TAddOrAmendInterHerd );
begin
     with TfInterHerd.Create(nil) do
        try
           WinData.tIntHerd.Open;
           SetUpHerdQuery;

           WinData.EventType := TInterHerd;
           ThisCombo := SearchForAnimal;
           ThisNav := dbnInterHerd;
           ThisComment := dbeRemark;
           pSexToList := '';

           dbnInterHerd.VisibleButtons := [kwnbPost,kwnbCancel];

           // Set the Animal Number to the one on the Grid
           SetSearchField ( SearchForAnimal );

           // Append a New Record
           WinData.tIntHerd.Append;
           ShowModal;
        finally
           qHerd.Close;
           // Cancel any unsaved items
           WinData.tIntHerd.CancelUpdates;
           WinData.tIntHerd.Close;
           Free;
        end;
end;

procedure TfInterHerd.SetUpHerdQuery;
begin
   with qHerd do
      begin
         SQL.Clear;
         SQL.Add ( 'SELECT ID, Name || " " || HerdIdentity HID FROM Owners');
         SQL.Add ( 'WHERE (ID<>' + WinData.AnimalFileByIDHerdID.AsString + ')');
//         SQL.Add ( 'WHERE (ID<>' + WinData.AnimalFileByID2HerdID.AsString + ')'); // Removed by SP 21/03/2003
         SQL.Add ( 'AND   (ID<>' + IntToStr(WinData.NONEHerdID) + ')');
         SQL.Add ( 'ORDER BY HID');
         Open;
      end;
end;

procedure TfInterHerd.dblNewHerdCloseUp(Sender: TObject);
begin
     if ( dblNewHerd.Value = '0' ) then
        begin
//           WinData.CreateAndShowForm(TfHerdSetUp);            // changed 1/00 to show
//         uHerdSetUp.ShowTheForm(TRUE);                        // blank record on open
           qHerd.Close;
           qHerd.Open;
        end;
end;

procedure TfInterHerd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := WinData.DataSetApplyUpdates(Windata.tIntHerd, ModalResult = mrOK, FModified );
end;

procedure TfInterHerd.SearchForAnimalButtonClick(Sender: TObject);
begin
     SearchButtonClick(Sender, lNo);
     SetSearchField(SearchForAnimal);
end;

procedure TfInterHerd.SearchForAnimalChange(Sender: TObject);
begin
   SetModifiedFlag;
     SearchAnimalChange(Sender);
end;

procedure TfInterHerd.SearchForAnimalExit(Sender: TObject);
begin
    // If the User presses the Exit Button don;t set the Dataset into Edit Mode
    if NOT ( Screen.ActiveControl is TBitBtn ) then
       begin
          // WinData.SetEventsToEdit;
          SetUpHerdQuery;
       end;
end;

procedure TfInterHerd.ExitButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfInterHerd.CheckIHM;
begin
{   Continue := False;

   qihm.sql.clear;
   qihm.sql.add('Select * from IHM ');
   qihm.sql.add('Where AnimalID = ' + IntToStr(WinData.AnimalFileByIDID.AsInteger) + '');
   qihm.Open;
   if NOT qihm.IsEmpty then
      begin
         if ((StrToInt(dblNewHerd.Value)) = (qihm.FieldByName('LastHerdID').AsInteger)) then
            begin
               if MessageDlg('WARNING: You are about to transfer this animal ' + WinData.AnimalFileByIDNatIdNum.AsString + ' back to its original herd.'+#13+
                             'Your Stock-On-Hand Report may not always be correct, Do you wish to continue?',mtWarning,[mbYes,mbNo],0) = mrYes then
                  Continue := True
               else
                  Continue := False;
            end
        else
           Continue := True;
      end
   else
      Continue := True; }
end;

procedure TfInterHerd.dbnInterHerdBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
begin
{   CheckIHM;
   if NOT(Continue) then
      Abort
   else
      begin                       }
   if Button = kwnbPost then
         begin
            // check the DOB of the Animal and if its already sold
            if ( Windata.AnimalFileByIDDateOfBirth.AsDateTime > dbdMoved.Date ) then
               begin
                  MessageDLG('Date of Birth is after Date Moved',mtinformation,[mbOk],0);
                  dbdMoved.SetFocus;
                  Abort;
               end
            else if WinData.CheckEvents.Locate('AnimalId;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsInteger,CSaleDeathEvent]),[] ) then
               begin
                  MessageDLG('This animal has been Sold or is Dead',mtinformation,[mbOk],0);
                  SearchForAnimal.SetFocus;
                  Abort;
               end
            // Test the Animal No Doesn;t already exist
            else
               if NOT ( Windata.AnimalFileByIDAnimalNo.IsNull ) then
                  if WinData.LookUpDamSire.Locate('AnimalNo;HerdID',VarArrayOf([Windata.AnimalFileByIDAnimalNo.AsVariant,WinData.tIntHerdNewHerdID.AsVariant]),[] ) then
                     begin
                        MessageDLG('This Animal No. Already exists in the Herd you are Transfering to' + #13 +
                                   'You will have to re-number to allow the Transfer',mtinformation,[mbOk],0);
                        SearchForAnimal.SetFocus;
                        Abort;
                     end;
         end;
 //     end;
   // save defaults
   if cbDefaults.checked then
      begin
         if NOT (dblNewHerd.Field.IsNull) then
            WinData.iNewHerd := dblNewHerd.Field.Value;
         if NOT (dbdMoved.Field.IsNull) then
            WinData.iMoved := dbdMoved.Field.Value;
         if dbeRemark.Text <> '' then
            WinData.iRemark := dbeRemark.Text;
         WinData.iDefNOTHeld := False;
      end;
end;

procedure TfInterHerd.dbnInterHerdClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
//   if WinData.AnimalFileByID.Locate('ID',WinData.AnimalFileByIDID.AsInteger,[]) then
//      begin
         if Button = kwnbPost then
            begin
               WinData.tIntHerd.Append;
            end
         else
            begin
               WinData.tIntHerd.CancelUpdates;
               if MessageDLG('Do you want to exit the Interherd Sale/Purchase',mtWarning,[mbNo,mbYes],0) = mrYes then
                  Close
               else
                  WinData.tIntHerd.Append;
            end;
//      end;
   // update fields
   FormShow(Sender);
end;

procedure TfInterHerd.FormShow(Sender: TObject);
begin
  // if defaults are held AND the fields are empty, insert defaults to fields
  if NOT WinData.iDefNOTHeld then
     begin
        if dblNewHerd.Field.IsNull then
           dblNewHerd.Field.Value := WinData.iNewHerd;
        if dbdMoved.Field.IsNull then
           dbdMoved.Field.Value := WinData.iMoved;
        if dbeRemark.Text = '' then
           dbeRemark.Text := WinData.iRemark;
     end;
   cbDefaults.Checked := False;
end;

procedure TfInterHerd.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('InterHerd.htm')
end;


procedure TfInterHerd.FormActivate(Sender: TObject);
begin
   inherited FormActivate(Sender);
end;

procedure TfInterHerd.dblNewHerdChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfInterHerd.dbdMovedChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfInterHerd.dbeRemarkChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

end.
