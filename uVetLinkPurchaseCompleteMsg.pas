unit uVetLinkPurchaseCompleteMsg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxLabel, ActnList, StdCtrls, cxButtons,
  ExtCtrls, GenTypesConst;

type
  TfmVetLinkPurchaseCompleteMsg = class(TForm)
    pInfo: TPanel;
    ActionList: TActionList;
    lInfo: TcxLabel;
    pButton: TPanel;
    btnContinue: TcxButton;
    btnClose: TcxButton;
    actContinue: TAction;
    actClose: TAction;
    procedure actContinueExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
  private
    FCloseVetLink : Boolean;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm(ACompleteRecordCount : Integer; var ACloseVetLink : Boolean);
  end;

var
  fmVetLinkPurchaseCompleteMsg: TfmVetLinkPurchaseCompleteMsg;

implementation

{$R *.DFM}

class procedure TfmVetLinkPurchaseCompleteMsg.ShowTheForm(ACompleteRecordCount : Integer;
   var ACloseVetLink : Boolean);
begin
   with TfmVetLinkPurchaseCompleteMsg.Create(nil) do
      try
         if ( ACompleteRecordCount > 0 ) then
            begin
               lInfo.Caption := Format('You have successfully recorded %d medicine purchase(s).'+cCRLFx2+
                                       'If you would like to record treatments immediately from the VetLink File click Record Treatments.'+cCRLFx2+
                                       'Remember you may already have recorded these treatments either by using your phone App'+cCRLF+
                                       'or directly into the Kingswood Herd. Untick these treatments to avoid duplicate entry.'+cCRLFx2+
                                       'You may also record these treatments later using the VetLink file by going to'+cCRLF+
                                       'Block Events > On-Farm Events > Vet/Dosing > VetLink Drugs.',[ACompleteRecordCount]);
               ShowModal;
               ACloseVetLink := FCloseVetLink;
            end;
      finally
         Free;
      end;
end;

procedure TfmVetLinkPurchaseCompleteMsg.actContinueExecute(
  Sender: TObject);
begin
   Close;
end;

procedure TfmVetLinkPurchaseCompleteMsg.actCloseExecute(Sender: TObject);
begin
   FCloseVetLink := True;
   Close;
end;

end.
