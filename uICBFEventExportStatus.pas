unit uICBFEventExportStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TStatusType = (stListingData, stReviewPeriod);
  TfmICBFEventExportStatus = class(TForm)
    lWait: TLabel;
    lNoEvents: TLabel;
    btnNoEventsOK: TButton;
    procedure btnNoEventsOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FStatusType : TStatusType;
  public
    { Public declarations }
  end;

  procedure ShowStatus(AStatusType : TStatusType; UserChanges : Boolean);
  procedure HideStatus();

var
  fmICBFEventExportStatus: TfmICBFEventExportStatus;

implementation

{$R *.DFM}

  procedure HideStatus();
  begin
     fmICBFEventExportStatus.Close;
  end;

  procedure ShowStatus(AStatusType : TStatusType; UserChanges : Boolean);
  begin
     Application.CreateForm(TfmICBFEventExportStatus, fmICBFEventExportStatus);
     with fmICBFEventExportStatus do
        begin
           if AStatusType = stListingData then
              begin
                Height := 95;
                lNoEvents.Visible := False;
                btnNoEventsOK.Visible := False;
                lWait.Visible := True;
                Show;
                Update;
              end
           else
              begin
                Height := 150;
                lNoEvents.Visible := True;
                btnNoEventsOK.Visible := True;
                lWait.Visible := False;
                ShowModal;
              end;
        end;
  end;

procedure TfmICBFEventExportStatus.btnNoEventsOKClick(Sender: TObject);
begin
   Close;
end;

procedure TfmICBFEventExportStatus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action := cafree;
end;

end.
