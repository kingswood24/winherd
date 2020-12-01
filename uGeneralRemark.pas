unit uGeneralRemark;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, DBCGrids, RXLookup,
  ToolEdit, RXDBCtrl, Db, DBTables, uListAnimals, RXCtrls, ToolWin;

type
  TfGeneralRemark = class(TkwEventForm)
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbSave: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    Label1: TLabel;
    Label4: TLabel;
    lNo: TLabel;
    Label3: TLabel;
    lGeneralRemark: TLabel;
    SearchForAnimal: TComboEdit;
    dbeNatId: TDBEdit;
    DBEdit1: TDBEdit;
    eRemark: TEdit;
    procedure ExitButtonClick(Sender: TObject);

    procedure SearchForAnimalChange(Sender: TObject);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowGeneralRemark;

implementation
uses
    GenTypesConst,
    DairyData,
    uRemarks;

{$R *.DFM}

procedure ShowGeneralRemark;
begin
     with TfGeneralRemark.Create(nil) do
        try
           // Mark sure to clear the Remarks
           fRemarks.RemarksAdded := FALSE;

           WinData.EventType := TGeneralRemark;
           ThisCombo := SearchForAnimal;
           ThisNav := sbSave;

           // Set the Animal Number to the one on the Grid
           SetSearchField ( SearchForAnimal );
           ShowModal;
        finally
           Free;
        end;
end;

procedure TfGeneralRemark.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfGeneralRemark.SearchForAnimalChange(Sender: TObject);
begin
     SearchAnimalChange(Sender);
end;

procedure TfGeneralRemark.SearchForAnimalButtonClick(Sender: TObject);
begin
     SearchButtonClick(Sender, lNo);
     SetSearchField(SearchForAnimal);
end;

procedure TfGeneralRemark.sbSaveClick(Sender: TObject);
var
   TestStr : String;
   CancelledChanges : Boolean;
begin

    TestStr := WinData.StripSpaces(eRemark.Text);
    if Length(TestStr) = 0 then
       MessageDLG('Cannot Save a Blank Remark',mtWarning,[mbOK],0)
    else
       with WinData do
          try
             // Open the Tables
             tRemarks.Open;
             tSysUser.Open;
             // Add a Record
             tRemarks.Append;
             tRemarks.FieldByName('AID').AsInteger := AnimalFileByIDID.AsInteger;
             tRemarks.FieldByName('DateChanged').AsDateTime := Date();
             tRemarks.FieldByName('TimeChanged').AsDateTime := Time();
             tRemarks.FieldByName('ItemChanged').AsInteger  := uReMarks.cGeneralRemark;
             tRemarks.FieldByName('OldItem').AsString       := '';
             tRemarks.FieldByName('Remark').AsString        := eRemark.Text;
             // Get the Current User Name
             try
                if tSysUser.Locate('ID',DefaultSysUser,[] ) then
                   tRemarks.FieldByName('ChangedBy').AsString := tSysUser.FieldByName('Name').AsString
                else
                   raise EInvalidOp.CreateFmt('SetUp a Default User Name - Changes NOT saved',[0]);
                CancelledChanges := FALSE;
             except
                tRemarks.Cancel;
                CancelledChanges := TRUE;
             end;
             // Only try and save changes if the default is set.
             if NOT CancelledChanges then
                begin
                   tRemarks.Post;
                   WinData.Kingdata.ApplyUpdates([tRemarks]);
                   Close;   // Close the Form
                end;
          finally
             tSysUser.Close;
             tRemarks.Close;
          end;
end;

procedure TfGeneralRemark.sbHelpClick(Sender: TObject);
begin
     WinData.HTMLHelp('registerremarks.htm');
end;

procedure TfGeneralRemark.FormActivate(Sender: TObject);
begin
    lNo.Caption := NoLabel;
end;

end.
