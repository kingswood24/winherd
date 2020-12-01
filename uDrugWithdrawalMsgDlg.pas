{
   21/01/13 [V5.1 R3.8] /MK Change - Rules updated to allow for if Milk and Meat and Other withdrawal dates are all after requested date.

   02/01/14 [V5.2 R7.3] /MK Bug Fix - FormShow - Rule change by GL to only show warning with Milk Withdrawal regardless of Herd Type.
}

unit uDrugWithdrawalMsgDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxStyles,
  cxInplaceContainer, cxTL, uHerdLookup, StdCtrls, cxButtons,
  GenTypesConst;

type
  TDrugWithdrawalMsgDlg = class(TForm)
    Image1: TImage;
    TreeList: TcxTreeList;
    MasterColumn: TcxTreeListColumn;
    DetailColumn: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    WarningStyle: TcxStyle;
    HeadingStyle: TcxStyle;
    lWarning: TcxLabel;
    WarningEditStyle: TcxEditStyleController;
    cxLabel1: TcxLabel;
    btnOK: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FHealthWithDrawalInfo : THealthWithDrawalInfo;
    FEventDate : TDateTime;
  public
    { Public declarations }
    class procedure ShowMessage(AHealthWithDrawalInfo : THealthWithDrawalInfo; AEventDate : TDateTime);
  end;

var
  DrugWithdrawalMsgDlg: TDrugWithdrawalMsgDlg;

implementation

{$R *.DFM}

class procedure TDrugWithdrawalMsgDlg.ShowMessage(AHealthWithDrawalInfo : THealthWithDrawalInfo; AEventDate : TDateTime);
begin
   with TDrugWithdrawalMsgDlg.Create(nil) do
      try
         FHealthWithDrawalInfo := AHealthWithDrawalInfo;
         FEventDate := AEventDate;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TDrugWithdrawalMsgDlg.FormCreate(Sender: TObject);
var
   tln : tcxTreeListNode;
   Ico :Ticon;
begin
   Ico := Ticon.Create;
   try
      Ico.Handle := LoadIcon(0,IDI_EXCLAMATION);

    with Image1.Picture Do
    begin
    Ico.Height;
    Ico.Width;
     Image1.Picture.Graphic := Ico;
    end;
   finally
      Ico.Free;
   end;
end;

procedure TDrugWithdrawalMsgDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ( key in [VK_ESCAPE, VK_RETURN]) then
      Close;
end;

procedure TDrugWithdrawalMsgDlg.FormShow(Sender: TObject);
begin
   with FHealthWithDrawalInfo do
      begin
         if DryOff then
            TreeList.Items[0].Values[0] := 'Dry Off Event Date'
         else
            TreeList.Items[0].Values[0] := 'Health Event Date';
         TreeList.Items[0].Values[1] := FormatDateTime(cIrishDateStyle, StartDate);
         TreeList.Items[1].Values[1] := IntToStr( NoDaysSinceStart );

         //   21/01/13 [V5.1 R3.8] /MK Change - Rules updated to allow for if Milk and Meat and other withdrawal dates are all after
         //                                     StartDate - which date gets priority.
         //TreeList.Items[2].Values[1] := FormatDateTime(cIrishDateStyle, FHealthWithDrawalInfo.WithDrawalDate);

         //   02/01/14 [V5.2 R7.3] /MK Bug Fix - Rule change by GL to only show warning with Milk Withdrawal regardless of Herd Type.
         TreeList.Items[2].Values[1] := FormatDateTime(cIrishDateStyle, FHealthWithDrawalInfo.MilkWithDrawalDate);

         {
         if ( not(HerdLookup.HerdOwnerData.OrganicHerd) ) then
            begin
               // MilkWithDrawalDate is always first priority warning
               if ( MilkWithDrawalDate > FEventDate ) and
                  ( (MilkWithDrawalDate < MeatWithDrawalDate) or (MeatWithDrawalDate < FEventDate) or (MeatWithDrawalDate = 0) ) and
                  ( (MilkWithDrawalDate < OtherWithDrawalDate) or (OtherWithDrawalDate < FEventDate) or (OtherWithDrawalDate = 0) ) then
                  TreeList.Items[2].Values[1] := FormatDateTime(cIrishDateStyle, FHealthWithDrawalInfo.MilkWithDrawalDate)
               // MeatWithDrawalDate is second priority warning
               else if ( MeatWithDrawalDate > FEventDate ) and
                       ( (MeatWithDrawalDate < MilkWithDrawalDate) or (MilkWithDrawalDate < FEventDate) or (MilkWithDrawalDate = 0) ) and
                       ( (MeatWithDrawalDate < OtherWithDrawalDate) or (OtherWithDrawalDate < FEventDate) or (OtherWithDrawalDate = 0) ) then
                  TreeList.Items[2].Values[1] := FormatDateTime(cIrishDateStyle, FHealthWithDrawalInfo.MeatWithDrawalDate)
               // OtherWithDrawalDate is last priority warning
               else if ( OtherWithDrawalDate > FEventDate ) and
                       ( (OtherWithDrawalDate < MilkWithDrawalDate) or (MilkWithDrawalDate < FEventDate) or (MilkWithDrawalDate = 0) ) and
                       ( (OtherWithDrawalDate < MeatWithDrawalDate) or (MeatWithDrawalDate < FEventDate) or (MeatWithDrawalDate = 0) ) then
                  TreeList.Items[2].Values[1] := FormatDateTime(cIrishDateStyle, FHealthWithDrawalInfo.OtherWithDrawalDate);
            end
         else
            begin
               // MilkWithDrawalDate is always first priority warning
               if ( OrganicMilkWithDrawalDate > FEventDate ) and
                  ( (OrganicMilkWithDrawalDate < OrganicMeatWithDrawalDate) or (OrganicMeatWithDrawalDate < FEventDate) or (OrganicMeatWithDrawalDate = 0) ) and
                  ( (OrganicMilkWithDrawalDate < OrganicOtherWithDrawalDate) or (OrganicOtherWithDrawalDate < FEventDate) or (OrganicOtherWithDrawalDate = 0) ) then
                  TreeList.Items[2].Values[1] := FormatDateTime(cIrishDateStyle, FHealthWithDrawalInfo.OrganicMilkWithDrawalDate)
               // MeatWithDrawalDate is second priority warning
               else if ( OrganicMeatWithDrawalDate > FEventDate ) and
                       ( (OrganicMeatWithDrawalDate < OrganicMilkWithDrawalDate) or (OrganicMilkWithDrawalDate < FEventDate) or (OrganicMilkWithDrawalDate = 0) ) and
                       ( (OrganicMeatWithDrawalDate < OrganicOtherWithDrawalDate) or (OrganicOtherWithDrawalDate < FEventDate) or (OrganicOtherWithDrawalDate = 0) ) then
                  TreeList.Items[2].Values[1] := FormatDateTime(cIrishDateStyle, FHealthWithDrawalInfo.OrganicMeatWithDrawalDate)
               // OtherWithDrawalDate is last priority warning
               else if ( OrganicOtherWithDrawalDate > FEventDate ) and
                       ( (OrganicOtherWithDrawalDate < OrganicMilkWithDrawalDate) or (OrganicMilkWithDrawalDate < FEventDate) or (OrganicMilkWithDrawalDate = 0) ) and
                       ( (OrganicOtherWithDrawalDate < OrganicMeatWithDrawalDate) or (OrganicMeatWithDrawalDate < FEventDate) or (OrganicMeatWithDrawalDate = 0) ) then
                  TreeList.Items[2].Values[1] := FormatDateTime(cIrishDateStyle, FHealthWithDrawalInfo.OrganicOtherWithDrawalDate);
            end
         }
      end;
end;

end.
