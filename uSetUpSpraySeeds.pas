unit uSetUpSpraySeeds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, RXLookup, ExtCtrls, RXCtrls, ComCtrls, ToolWin,
  RxDBComb, Db, Grids, DBGrids, RXDBCtrl, kwDBNavigator;

type
  TfSetUpSpraysSeeds = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    nbScroll: TkwDBNavigator;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    pMainDetails: TPanel;
    Label8: TLabel;
    Name: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    ActiveSource: TDataSource;
    procedure sbExitClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure nbScrollClick(Sender: TObject; Button: TKNavigateBtn);
  private
    { Private declarations }
    ActiveTableName : String;
    procedure CallSetUp(Sprays : Boolean);
  public
    { Public declarations }
  end;

procedure ShowTheForm ( Sprays : Boolean );

implementation
uses
   GenTypesConst,
   DiaryDataModule, DairyData;

var
  fSetUpSpraysSeeds: TfSetUpSpraysSeeds;

{$R *.DFM}

procedure ShowTheForm ( Sprays : Boolean );
begin
   try
      try
         fSetUpSpraysSeeds := TfSetUpSpraysSeeds.Create(Application);
         fSetUpSpraysSeeds.CallSetUp ( Sprays );
         fSetUpSpraysSeeds.ShowModal;
      except
         ShowMessage('Cannot create form - close program and re-boot');
      end;
   finally
      fSetUpSpraysSeeds.Free;
   end;
end;

procedure TfSetUpSpraysSeeds.CallSetUp(Sprays : Boolean);
begin
    if Sprays then
       begin
           ActiveSource.DataSet := dmFarmDiary.SprayTypes;
           Caption := 'Set Up Sprays';
       end
    else
       begin
           ActiveSource.DataSet := dmFarmDiary.SeedTypes;
           Caption := 'Set Up Seeds';
       end;
end;

procedure TfSetUpSpraysSeeds.sbExitClick(Sender: TObject);
begin
    Close;  // Close the Form
end;

procedure TfSetUpSpraysSeeds.sbSaveClick(Sender: TObject);
begin
    if ActiveSource.State in dsEditModes then
       ActiveSource.DataSet.Post;
end;

procedure TfSetUpSpraysSeeds.FormCreate(Sender: TObject);
begin
    // as the Form is being created Open all the Paddock File
    dmFarmDiary.OpenDiaryTables;
end;

procedure TfSetUpSpraysSeeds.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := WinData.DataSetApplyUpdates(ActiveSource.DataSet, ModalResult = mrOK );
end;

procedure TfSetUpSpraysSeeds.nbScrollClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if ( Button = kwnbPost ) then
      begin
         if ActiveSource.State in dsEditModes then
            ActiveSource.DataSet.Post;
      end
end;

end.
