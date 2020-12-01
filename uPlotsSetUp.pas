unit uPlotsSetUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, RXCtrls, ComCtrls, ToolWin, ExtCtrls, DBCtrls,
  DBTables, Db, StdCtrls, Mask, DBCGrids, RxDBComb;

type
  TfPlotsSetUp = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    DBGGroups: TRxDBGrid;
    DBGAnimals: TRxDBGrid;
    DBNavigator1: TDBNavigator;
    bAddSelected: TButton;
    qPaddocks: TQuery;
    dsAnimalsNotInGroup: TDataSource;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    bAddAll: TButton;
    bClearGroup: TButton;
    Label4: TLabel;
    NoInGroup: TQuery;
    dsNoInGroup: TDataSource;
    DBEdit3: TDBEdit;
    Panel1: TPanel;
    ePaddock: TEdit;
    Label5: TLabel;
    sbDeselectGroups: TRxSpeedButton;
    ToolButton4: TToolButton;
    cbPlotTypes: TRxDBComboBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure sbExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bAddSelectedClick(Sender: TObject);
    procedure DBGAnimalsGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure DBGGroupsDblClick(Sender: TObject);
    procedure bAddAllClick(Sender: TObject);
    procedure bClearGroupClick(Sender: TObject);
    procedure DBGAnimalsDblClick(Sender: TObject);
    procedure ePaddockChange(Sender: TObject);
    procedure sbDeselectGroupsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function PlotsOK : Boolean;
    function CheckIfInGroup ( AID : Integer; GType : String ) : Boolean;
    procedure AddToGroup(AID : Integer; GroupID : Integer; AllowDeletion : Boolean);
  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation
uses
    GenTypesConst,
    DiaryDataModule,
    DairyData;

var
  fPlotsSetUp: TfPlotsSetUp;

{$R *.DFM}

procedure ShowTheForm;
begin
    try
        if ( fPlotsSetUp = nil ) then
            Application.CreateForm(TfPlotsSetUp, fPlotsSetUp );
        fPlotsSetUp.ShowModal;
    except
        ShowMessage('Cannot create form - close program and re-boot');
    end;
end;

procedure TfPlotsSetUp.sbExitClick(Sender: TObject);
begin
    Close;
end;

procedure TfPlotsSetUp.FormActivate(Sender: TObject);
begin
    qPaddocks.SQL.Clear;
    qPaddocks.SQL.Add('SELECT * FROM ' + dmFarmDiary.Paddocks.TableName);
    qPaddocks.SQL.Add('WHERE (FarmID= ' + IntToStr(dmFarmDiary.DefaultFarmID) + ')');
    qPaddocks.Open;
    NoINGroup.Open;
end;

function TfPlotsSetUp.CheckIfInGroup ( AID : Integer; GType : String ) : Boolean;
var
   MyQuery : TQuery;
begin
   try
      Result := FALSE;
      MyQuery := TQuery.Create(nil);
      MyQuery.DatabaseName := WinData.KingData.DatabaseName;
      MyQuery.SQL.Add('SELECT PlotID, PaddockID, TypeOfRecord ');
      MyQuery.SQL.Add('FROM ' + dmFarmDiary.Plots.TableName + ' Plots,' + dmFarmDiary.PlotsPaddocksLinks.TableName + ' PP ');
      MyQuery.SQL.Add('WHERE (PaddockID=' + IntToStr(AID) + ')');
      MyQuery.SQL.Add('AND   (TypeOfRecord="' + GType + '")');
      MyQuery.SQL.Add('AND   (ID=PlotID)');
      MyQuery.Open;
      if NOT MyQuery.IsEmpty then
         begin
            if MessageDLG('Paddock is already in a ' + GType + ' Group - remove it from that Group', mtWarning, [mbYes,mbNo],0) = mrYes then
               while NOT MyQuery.EOF do
                  begin
                     dmFarmDiary.PlotsPaddocksLinks.Filter := 'PlotID = ' + MyQuery.FieldByName('PlotID').AsString + ' And PaddockID = ' + MyQuery.FieldByName('PaddockID').AsString;
                     dmFarmDiary.PlotsPaddocksLinks.Filtered := TRUE;
                     while NOT dmFarmDiary.PlotsPaddocksLinks.EOF do
                        dmFarmDiary.PlotsPaddocksLinks.Delete;
                     dmFarmDiary.PlotsPaddocksLinks.Filter := '';
                     dmFarmDiary.PlotsPaddocksLinks.Filtered := FALSE;
                     MyQuery.Next;
                  end
            else
               Result := TRUE;
         end;
   finally
      MyQuery.Close;
      MyQuery.Free;
   end;
end;

procedure TfPlotsSetUp.AddToGroup(AID : Integer; GroupID : Integer; AllowDeletion : Boolean);
begin
    if NOT dmFarmDiary.PlotsPaddocksLinks.Locate('PaddockID;PlotID',VarArrayOf([AID,GroupID]),[]) then
       begin
          if NOT CheckIfInGroup ( AID, dmFarmDiary.Plots.FieldByName('TypeOfRecord').AsString ) then
             begin // Transfer to the Group Grid
                dmFarmDiary.PlotsPaddocksLinks.Append;
                dmFarmDiary.PlotsPaddocksLinks.FieldByName('PaddockID').AsInteger := AID;
                dmFarmDiary.PlotsPaddocksLinks.FieldByName('PlotID').AsInteger := GroupID;
                dmFarmDiary.PlotsPaddocksLinks.Post;
             end;
       end
    else if AllowDeletion then
       // Delete the Paddock From the Plot
       dmFarmDiary.PlotsPaddocksLinks.Delete;
end;

procedure TfPlotsSetUp.bAddSelectedClick(Sender: TObject);
var
   i : Integer;
   MyBookMark : TBookMark;
begin
    if PlotsOK then
       try
          MyBookMark := DBGAnimals.DataSource.DataSet.GetBookmark;

          DBGAnimals.DataSource.DataSet.DisableControls;
          DBGAnimals.DataSource.DataSet.First;
          while NOT DBGAnimals.DataSource.DataSet.EOF do
             begin
                if DBGAnimals.SelectedRows.CurrentRowSelected then
                   AddToGroup (qPaddocks.FieldByName('ID').AsInteger,dmFarmDiary.Plots.FieldByName('ID').AsInteger, TRUE);
                DBGAnimals.DataSource.DataSet.Next;
             end;
       finally
          DBGAnimals.DataSource.DataSet.GotoBookmark(MyBookMark);
          DBGAnimals.DataSource.DataSet.FreeBookmark(MyBookMark);
          DBGAnimals.DataSource.DataSet.EnableControls;
          NoInGroup.DataSource.DataSet.Refresh;
       end;
end;

procedure TfPlotsSetUp.DBGAnimalsGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
    // Shows if the Paddock is on the Selected Group
    if dmFarmDiary.PlotsPaddocksLinks.Locate('PaddockID;PlotID',VarArrayOf([qPaddocks.FieldByName('ID').AsInteger,dmFarmDiary.Plots.FieldByName('ID').AsInteger]),[] ) then
       begin
          AFont.Color := clNavy;
          AFont.Style := [fsBold];
       end;
end;

procedure TfPlotsSetUp.DBGGroupsDblClick(Sender: TObject);
begin
    try
       if NOT ( WinData.Groups.State in dsEditModes ) then
          WinData.Groups.Edit;
       if WinData.Groups.FieldByName('Selected').AsBoolean then
          WinData.Groups.FieldByName('Selected').AsBoolean := FALSE
       else
          WinData.Groups.FieldByName('Selected').AsBoolean := TRUE;
       WinData.Groups.Post;
    except
       ShowMessage('Update Failed');
    end;
end;

procedure TfPlotsSetUp.bAddAllClick(Sender: TObject);
var
   MyBookMark : TBookMark;
begin
    if PlotsOK then
       begin
          // Process All animals from the Grid
          MyBookMark := DBGAnimals.DataSource.DataSet.GetBookmark;

          DBGAnimals.DataSource.DataSet.First;
          while NOT DBGAnimals.DataSource.DataSet.EOF do
             begin
                AddToGroup ( DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger,
                             dmFarmDiary.Plots.FieldByName('ID').AsInteger, FALSE );
                DBGAnimals.DataSource.DataSet.Next;
             end;

          DBGAnimals.DataSource.DataSet.GoToBookmark(MyBookMark);
          DBGAnimals.DataSource.DataSet.FreeBookmark(MyBookMark);
          DBGAnimals.DataSource.DataSet.Refresh;
          NoInGroup.DataSource.DataSet.Refresh;
       end;
end;

procedure TfPlotsSetUp.bClearGroupClick(Sender: TObject);
var
   MyQuery : TQuery;
begin
    // Clear all the Animals From the Group
    if PlotsOK then
       if ( MessageDLG('Clear all Animals from Group ' +
            WinData.Groups.FieldByName('Code').AsString + ' ' +
            WinData.Groups.FieldByName('Description').AsString,
            mtWarning, [mbYes,mbNo],0 ) = mrYes ) then
         try
            MyQuery := TQuery.Create(nil);
            MyQuery.DatabaseName := WinData.KingData.DatabaseName;
            MyQuery.SQL.Add('DELETE FROM GrpLinks');
            MyQuery.SQL.Add('WHERE (GroupID=' + WinData.Groups.FieldByName('ID').AsString + ')');
            MyQuery.ExecSQL;
         finally
            MyQuery.Close;
            MyQuery.Free;
            DBGAnimals.DataSource.DataSet.Refresh;
            NoInGroup.DataSource.DataSet.Refresh;
         end;
end;

function TfPlotsSetUp.PlotsOK : Boolean;
begin
    Result := FALSE;
    if dmFarmDiary.Plots.Active then
       begin
          if dmFarmDiary.Plots.IsEmpty then
             MessageDLG('You need to set up and select a Plot',mtinformation,[mbOK],0)
          else
             Result := TRUE;
       end;
end;

procedure TfPlotsSetUp.DBGAnimalsDblClick(Sender: TObject);
begin
    if PlotsOK then
       if NOT DBGAnimals.DataSource.DataSet.EOF then
          begin
             AddToGroup (qPaddocks.FieldByName('ID').AsInteger,dmFarmDiary.Plots.FieldByName('ID').AsInteger, TRUE );
             NoInGroup.DataSource.DataSet.Refresh;
          end;
end;

procedure TfPlotsSetUp.ePaddockChange(Sender: TObject);
begin
    // Start to Search for this Animal
    if Length(ePaddock.Text) > 0 then
       if NOT DBGAnimals.DataSource.DataSet.Locate('Name',ePaddock.Text,[loPartialKey] ) then
          ShowMessage('Cannot find Paddock ' + ePaddock.Text);
end;

procedure TfPlotsSetUp.sbDeselectGroupsClick(Sender: TObject);
begin
    try
       with WinData.GenQuery do
          begin
             SQL.Clear;
             SQL.Add('UPDATE ' + WinData.Groups.TableName );
             SQL.Add('SET Selected=FALSE');
             ExecSQL;
             DBGGroups.DataSource.DataSet.Refresh;
          end;
    except
        ShowMessage('Cannot Clear the Selection');
    end;
end;

procedure TfPlotsSetUp.FormCreate(Sender: TObject);
begin
    // Add the Type to the Plot Types
    cbPlotTypes.Values.Clear;
    cbPlotTypes.Items.Clear;
    cbplotTypes.Items[0] := cPlot;
    cbplotTypes.Items[1] := cField;
    cbplotTypes.Items[2] := cAreaAid;
    cbPlotTypes.Values := cbPlotTypes.Items;
end;

end.
