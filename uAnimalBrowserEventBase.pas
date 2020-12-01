unit uAnimalBrowserEventBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, cxButtons;

type
  TfmAnimalBrowserEventBase = class(TForm)
    btnAddEvent: TcxButton;
    ActionList: TActionList;
    actSave: TAction;
    actCancel: TAction;
    cxButton1: TcxButton;
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  protected
    { Private declarations }
    FEventSaved : Boolean;
    procedure SaveEvent; virtual;
    procedure CancelEvent; virtual;
    procedure ValidateEvent;
    procedure SetGroupBoxCaption(AGroupBox: TGroupBox;
       AAnimalNo, ANatIDNum : String);
  public
    { Public declarations }
  end;

var
  fmAnimalBrowserEventBase: TfmAnimalBrowserEventBase;

implementation

uses uNewUIHealthEvent, DairyData;

{$R *.DFM}

procedure TfmAnimalBrowserEventBase.actSaveExecute(Sender: TObject);
begin
   SaveEvent;
end;

procedure TfmAnimalBrowserEventBase.actCancelExecute(Sender: TObject);
begin
   CancelEvent;
end;

procedure TfmAnimalBrowserEventBase.CancelEvent;
begin
   Close;
end;

procedure TfmAnimalBrowserEventBase.SaveEvent;
begin
   Close;
end;

procedure TfmAnimalBrowserEventBase.ValidateEvent;
begin
// Validate Event Date - Cannot Be After Today.
end;

procedure TfmAnimalBrowserEventBase.SetGroupBoxCaption(
   AGroupBox: TGroupBox; AAnimalNo, ANatIDNum : String);
begin
   if not (AGroupBox is TGroupBox) then Exit;

   AGroupBox.Caption := '';
   if ( WinData.OwnerFile.FieldByName('SearchField').AsString = 'AnimalNo' ) then
      begin
         if Trim(AAnimalNo) <> '' then
            AGroupBox.Caption := Format('%s - (%s)', [AAnimalNo,ANatIDNum])
         else
            AGroupBox.Caption := ANatIDNum
      end
   else if ( WinData.OwnerFile.FieldByName('SearchField').AsString = 'NatIDNum' ) then
      begin
         if Trim(ANatIDNum) <> '' then
            AGroupBox.Caption := Format('%s - (%s)', [ANatIDNum, AAnimalNo])
         else
            AGroupBox.Caption := AAnimalNo;
      end;
end;

procedure TfmAnimalBrowserEventBase.FormCreate(Sender: TObject);
begin
   FEventSaved := False; 
end;

end.
