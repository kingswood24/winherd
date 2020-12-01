unit uDrugFinderWithdMsg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel,
  uDrugFinder, ShellAPI;

type
  TfmDrugFinderWithdMsg = class(TForm)
    btnYes: TcxButton;
    btnNo: TcxButton;
    pDefault: TPanel;
    lInformation: TcxLabel;
    lReponsibilityMsg: TcxLabel;
    lConfirmation: TcxLabel;
    pDrugInfo: TPanel;
    lDrugName: TcxLabel;
    lMilkHead: TcxLabel;
    lMilkDays: TcxLabel;
    lMeatHead: TcxLabel;
    lMeatDays: TcxLabel;
    lPeriodMsg: TcxLabel;
    lHPRALink: TcxLabel;
    procedure lHPRALinkClick(Sender: TObject);
  private
    { Private declarations }
    procedure WMSyscommand(Var msg: TWmSysCommand); message WM_SYSCOMMAND;
  public
    { Public declarations }
    class function WithdrawalConfirmed (ADrugItem : TDrugItem) : Boolean;
  end;

var
  fmDrugFinderWithdMsg: TfmDrugFinderWithdMsg;

implementation

{$R *.DFM}

{ TfmDrugFinderWithdMsg }

class function TfmDrugFinderWithdMsg.WithdrawalConfirmed (ADrugItem : TDrugItem) : Boolean;
begin
   with TfmDrugFinderWithdMsg.Create(nil) do
      try
         lDrugName.Caption := ADrugItem.DrugName;

         lMilkDays.Caption := '';
         lMeatDays.Caption := '';

         if ( ADrugItem.MilkWDDays > 0 ) then
            lMilkDays.Caption := IntToStr(ADrugItem.MilkWDDays) + ' day(s)'
         else
            lMilkDays.Caption := 'N/A';

         if ( ADrugItem.MeatWDDays > 0 ) then
            lMeatDays.Caption := IntToStr(ADrugItem.MeatWDDays) + ' day(s)'
         else
            lMeatDays.Caption := 'N/A';

         ShowModal;

         Result := ( ModalResult = mrOK );
         if ( ModalResult = mrCancel ) then
            begin
               ADrugItem.MilkWDDays := 0;
               ADrugItem.MeatWDDays := 0;
            end;
      finally
         Free;
      end;
end;

procedure TfmDrugFinderWithdMsg.WMSyscommand(var msg: TWmSysCommand);
begin
   if ( (msg.cmdtype and $FFF0) = SC_CLOSE ) then
      ModalResult := mrCancel
   else
   inherited;
end;

procedure TfmDrugFinderWithdMsg.lHPRALinkClick(Sender: TObject);
begin
   ShellExecute(0,'open','https://www.hpra.ie/homepage/veterinary',nil,nil,SW_SHOWNORMAL);
end;

end.
