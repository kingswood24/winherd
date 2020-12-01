unit uSrchdlg;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons,
  RXDBCtrl,GenTypesConst, RXCtrls, ComCtrls, ToolWin, Menus, KRoutines;

const
  ListCalveTypes = '7';
  ListBirthTypes = '6';

type
// TListType indicates the type of Listing being displayed
  TListType = (Breeds, Owners, Sires, Dams, BirthTypes, CalveTypes );

  TfSearchDlg = class(TForm)
    dsSearch: TDataSource;
    SearchEd: TEdit;
    lSearchFor: TLabel;
    qList: TQuery;
    SearchGrid: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbSave: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    RxSpeedButton1: TRxSpeedButton;
    pColours: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    AnimalCode1: TMenuItem;
    NationalIDNumber1: TMenuItem;
    StatusBar1: TStatusBar;
    Query1: TQuery;
    tListit: TTable;
    pSorting: TPanel;
    procedure SearchEdChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure SearchGridDblClick(Sender: TObject);
    procedure SearchGridTitleClick(Column: TColumn);
    procedure SearchGridGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure sbExitClick(Sender: TObject);
    procedure AnimalCode1Click(Sender: TObject);
    procedure NationalIDNumber1Click(Sender: TObject);
    procedure SearchEdExit(Sender: TObject);
  private
    OrigAnimal  : Integer;  // Store the animals that was selected before running form
//    FieldToSearchOn : String;
    WhichList : TListType;
    ThisSexToList : String;     // current Sex to List
    MultiSex : Boolean;         // True if looking at Male & Female
    ThisEventType : TEventType;
    procedure RunQuery;
  public
    ResultID  : Integer; // ID for the record selected
    // All these functions return mrOK if the user dlbclicks or presses OK
    //function ShowModalDams: Integer;
    function ShowModalDams ( SexToList : String; ThisEvent : TEventType ): Integer;
  end;

var
  fSearchDlg: TfSearchDlg;

implementation

uses SetUpAnimals,
     SetUpBreeds,
     uListAnimals,
     DairyData;

{$R *.DFM}

procedure TfSearchDlg.RunQuery;
begin

  with qList do
     begin
        SQL.Clear;
        SQL.Add('SELECT * FROM listit');
        if ( ThisEventType = TCalving ) And ( WinData.UserTypeOfHerd = 'Dairy' ) then
           SQL.Add(',Events');

        SQL.Add('WHERE ( InHerd = TRUE )');
        MultiSex := TRUE;
        if ( ThisSexToList = 'Female' ) then
           begin
              SQL.Add('AND ( Sex = ' + '''Female''' + ')');
              MultiSex := FALSE;
           end;

        // exclude the NONE herd.
        SQL.Add('AND NOT ( HerdID = ' + IntToStr(WinData.NONEHerdID) + ')');
        // exclude the Deleted Animals.
        SQL.Add('AND ( AnimalDeleted =FALSE )');
        // if user has a herd selected then only show animals in that herd.
        if WinData.UserDefaultHerdID > 0 then
           SQL.Add('AND ( HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');

        if ( ThisEventType = TCalving ) And ( WinData.UserTypeOfHerd = 'Dairy' ) then
           begin
              SQL.Add('AND ( Events.AnimalID = Listit.ID )');
              SQL.Add('AND ( Events.AnimalLactNo = Listit.LactNo )');
              SQL.Add('AND ( Events.EventType = ' + IntToStr(CDryOffEvent) + ')');
           end;

        if WinData.SearchField = 'AnimalNo' then
           SQL.Add('ORDER BY SortAnimalNo, SortNatID')
        else
           SQL.Add('ORDER BY SortNatID, SortAnimalNo');

        if MultiSex then
           qList.SQL.Add(', Sex');

        Open;  // Run the Query
     end;
end;

function TfSearchDlg.ShowModalDams ( SexToList : String; ThisEvent : TEventType ): Integer;
var i : Integer;
begin

try
  WinData.SearchField;  // This set the the Herd Type

  // Set the EventType
  ThisEventType := ThisEvent;
  // Set the Sex to List
  ThisSexToList := SexToList;

  // Clear the Search Field
  SearchEd.Text := '';

  tListit.TableName := 'listit';
  with tListit do
     begin
         FieldDefs.Clear;
         FieldDefs.Add('ID',ftInteger,0,FALSE);
         FieldDefs.Add('LactNo',ftInteger,0,FALSE);
         FieldDefs.Add('AnimalNo',ftString,10,FALSE);
         FieldDefs.Add('NatIdNum',ftString,20,FALSE);
         FieldDefs.Add('Sex',ftString,10,FALSE);
         FieldDefs.Add('HerdID',ftInteger,0,FALSE);
         FieldDefs.Add('SortAnimalNo',ftString,10,FALSE);
         FieldDefs.Add('SortNatId',ftString,20,FALSE);
         FieldDefs.Add('InHerd',ftBoolean,0,FALSE);
         FieldDefs.Add('AnimalDeleted',ftBoolean,0,FALSE);
     end;
  tListit.CreateTable;

  qList.SQL.Clear;
  qList.SQL.Add('INSERT INTO listit');
  qList.SQL.Add('(ID, LactNo, AnimalNo, SortAnimalNo, NatIDNum, SortNatId, Sex, HerdID, InHerd, AnimalDeleted)');
  qList.SQL.Add('SELECT ID, LactNo, AnimalNo, SortAnimalNo, NatIDNum, SortNatId, Sex, HerdID, InHerd, AnimalDeleted');
  qList.SQL.Add('FROM Animals');
  if WinData.ActiveFilter then
     begin
        qList.SQL.Add(',' + WinData.FilteredAnimals.TableName + ' FA');
        qList.SQL.Add('WHERE (Animals.ID=FA.AID)');
     end;
  qList.ExecSQL;

  RunQuery;

  // Try and find the current animal
  qList.Locate('ID',WinData.AnimalFileByIDID.AsInteger,[]);

  WhichList := Dams;

  // Show the colour legend
  if MultiSex then
     pColours.Show
  else
     pColours.Hide;

  SearchGrid.Columns.Clear;
  SearchGrid.Columns.Add.FieldName := 'ID';
  SearchGrid.Columns[0].Width := 0;

  if WinData.SearchField = 'AnimalNo' then
     begin
        SearchGrid.Columns.Add.FieldName := 'AnimalNo';
        SearchGrid.Columns[1].Title.Caption := 'Animal No';
        SearchGrid.Columns[1].Width := 100;
        SearchGrid.Columns.Add.FieldName := 'NatIDNum';
        SearchGrid.Columns[2].Title.Caption := 'Nat. ID Num';
//        SearchGrid.Columns[2].Width := 120;
        SearchGrid.Columns[2].Width := 165; // changed 20/3/00 - kr
     end
  else
     begin
        SearchGrid.Columns.Add.FieldName := 'NatIDNum';
        SearchGrid.Columns[1].Title.Caption := 'Nat. ID Num';
//        SearchGrid.Columns[1].Width := 120;
        SearchGrid.Columns[1].Width :=165; // changed 20/3/00 - kr
        SearchGrid.Columns.Add.FieldName := 'AnimalNo';
        SearchGrid.Columns[2].Title.Caption := 'Animal No';
        SearchGrid.Columns[2].Width := 100;
     end;

  dsSearch.Dataset := qList;
  Caption := 'Select Animal';
  Result := ShowModal;

finally

end;

end;

procedure TfSearchDlg.SearchEdChange(Sender: TObject);
begin
   If WinData.UseScanner = False then   //Use Scanner option is not selected
      begin      //If UseScanner = False then search after every keypress
         if ( Length ( SearchEd.Text ) > 0 ) then
            if not dsSearch.Dataset.Locate(WinData.SearchField, SearchEd.Text, [loCaseInsensitive, loPartialKey]) then
               begin
                   MessageBeep(10);
                   with StatusBar1.Canvas do
                        begin
                             Brush.Color := clRed;
                             Font.Color := clwhite;
                             Font.Name := 'Verdana';
                             Font.Size:= 10;
                             TextOut(5,2, 'Error: No match found.');
                             Floodfill(0,0,$000000FF,fsBorder);
                        end;
               end     //EndIf Not dsSearch
            Else       //Else If Not dsSearch
               begin
                    Statusbar1.Hide;
                    Statusbar1.show;
               end    //EndElse If Not dsSearch
         Else        //Else  If ( Length > 0 )
            begin
                 Statusbar1.Hide;
                 Statusbar1.show;
            end;     //EndElse  If ( Length > 0 )
      end;  //EndIf  UseScanner = False
end;

procedure TfSearchDlg.FormActivate(Sender: TObject);
begin
     // Check the AddButton property
     ResultID := -1;
     OrigAnimal := WinData.AnimalFileByIDID.AsInteger;
     SearchGridTitleClick(SearchGrid.Columns[1]);
     pSorting.Hide;
end;

procedure TfSearchDlg.OKBtnClick(Sender: TObject);
begin
     ResultID := qList.Fields[0].AsInteger;
end;

procedure TfSearchDlg.bAddClick(Sender: TObject);
var
   AnimalBefore,
   LastAnimalSelected : Integer;
begin
    AnimalBefore := WinData.AnimalFileByIDID.AsInteger;
    WinData.AnimalFileByID.Insert;
    fSetUpAnimals.ShowForm(False);
    LastAnimalSelected := WinData.AnimalFileByIDID.AsInteger;
    qlist.DisableControls;
    qList.Close;
    qList.Open;
    // try and locate the last animal accessed
    if NOT qList.Locate('ID',LastAnimalSelected,[]) then
       begin
          // If you cannot then move to record before insert
          if NOT qList.Locate('ID',AnimalBefore,[]) then
             begin
                // if you cannot find this then move to the first record in the list
                // user must have deleted these records
                qList.First;
                // Shift the Main Table to this record
                WinData.AnimalFileByID.Locate('ID',qList.FieldByName('ID').AsInteger,[]);
                // Shifts the event to this record
                ResultID := WinData.AnimalFileByIDID.AsInteger;
                // Reset the original as its been deleted
                OrigAnimal := ResultID;
             end
          else
             // Shift the Main Table to this record
             WinData.AnimalFileByID.Locate('ID',qList.FieldByName('ID').AsInteger,[]);
       end
       // if the Original animal has changed
    else if ( LastAnimalSelected <> OrigAnimal ) then
          begin
             // Shifts the event to this record
             ResultID := WinData.AnimalFileByIDID.AsInteger;
             // Reset the original as its been deleted
             OrigAnimal := ResultID;
          end;
    qlist.EnableControls;
end;

procedure TfSearchDlg.SearchGridDblClick(Sender: TObject);
begin
  ResultID := qList.Fields[0].AsInteger;
  ModalResult := mrOK;
end;

procedure TfSearchDlg.SearchGridTitleClick(Column: TColumn);
var
   TempID : Integer;
begin
  try
     WinData.SearchField := Column.FieldName;
     pSorting.Show;
     pSorting.ReFresh;

     if qList.Active then
        TempID := qList.FieldByName('ID').AsInteger
     else
        TempID := 0;

     if Column.FieldName = 'AnimalNo' Then
        begin
           SearchEd.MaxLength := 10;
           AnimalCode1.Checked := True;
           StatusBar1.Panels.Items[0].Text := 'Searching for Animal Code';
        end
     else                      // Nat ID Num
        begin
           SearchEd.MaxLength := 20;
           NationalIDNumber1.Checked := True;
           StatusBar1.Panels.Items[0].Text := 'Searching for National ID Number';
        end;

     // ReRun the Query to reorder the list
     RunQuery;
     SearchEd.Text := '';
     SearchEd.SetFocus;
  finally
     pSorting.Hide;
     // Try and find the Last Animal
     qList.Locate('ID',TempID,[]);
  end;
end;

procedure TfSearchDlg.SearchGridGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if MultiSex then
     if UPPERCASE(qList.FieldByName('Sex').AsString) = 'FEMALE' then
        AFont.Color := clRed
     else
        AFont.Color := clBlue;
end;

procedure TfSearchDlg.sbExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfSearchDlg.AnimalCode1Click(Sender: TObject);
begin
     WinData.SearchField := 'AnimalNo';
     SearchEd.MaxLength := 10;
     StatusBar1.Panels.Items[0].Text := 'Searching for Animal Code';
     AnimalCode1.Checked := True;
     SearchEd.Text := '';
end;

procedure TfSearchDlg.NationalIDNumber1Click(Sender: TObject);
begin
     WinData.SearchField := 'NatIdNum';
     SearchEd.MaxLength := 20;
     StatusBar1.Panels.Items[0].Text := 'Searching for National ID Number';
     NationalIDNumber1.Checked := True;
     SearchEd.Text := '';
end;

procedure TfSearchDlg.SearchEdExit(Sender: TObject);
Var
   NewNatID : String;        //Formatted NatID

begin      //If UseScanner = True and NatID Number input then format and search after exit
     If (( WinData.UseScanner ) AND ( NationalIDNumber1.Checked = True )) then
        Begin     //First check length
             if ( Length ( SearchEd.Text ) > 0 ) then
                Begin    //First format input
                      if NOT CheckNatID(SearchEd.Text,NewNatId,FALSE) then
                         Begin   //CheckNatID returns false
                              SearchEd.SetFocus;
                              //Now to print error message
                              MessageBeep(10);
                              with StatusBar1.Canvas do
                                   begin
                                        Brush.Color := clRed;
                                        Font.Color := clwhite;
                                        Font.Name := 'Verdana';
                                        Font.Size:= 10;
                                        TextOut(5,2, 'Unrecognised NatID Format');
                                        Floodfill(0,0,$000000FF,fsBorder);
                                   end;      //EndWith
                         End     //EndIf Not CheckNatID
                      else    //CheckNatID passed
                           Begin
                                SearchEd.Text := NewNatID;
                                //Now to search for NatID.
                                if not dsSearch.Dataset.Locate(WinData.SearchField, SearchEd.Text,
                                       [loCaseInsensitive, loPartialKey]) then
                                   begin    //Input not found
                                        MessageBeep(10);
                                        with StatusBar1.Canvas do
                                             begin
                                                  Brush.Color := clRed;
                                                  Font.Color := clwhite;
                                                  Font.Name := 'Verdana';
                                                  Font.Size:= 10;
                                                  TextOut(5,2, 'Error: No match found.');
                                                  Floodfill(0,0,$000000FF,fsBorder);
                                             end;      //EndWith
                                   end       //EndIf Not dsSearch
                                Else    //Else If Not dsSearch
                                    begin
                                         Statusbar1.Hide;
                                         Statusbar1.show;
                                    end;     //EndElse If Not dsSearch
                           End; //EndElse CheckNatID passed
                End;  //EndIf Length > 0
        End;     //EndIf UseScanner = True
end;

end.
