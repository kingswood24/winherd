unit uNBAS10Print;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, QuickRpt, QRCtrls, ExtCtrls;

type
  TNBAS10Print = class(TForm)
    qrEMailApplic: TQuickRep;
    TitleBand1: TQRBand;
    QRImageEMailApplic: TQRImage;
    qrAddress3: TQRLabel;
    qrAddress2: TQRLabel;
    qrAddress1: TQRLabel;
    qrName: TQRLabel;
    qrHerdNumber: TQRLabel;
    qrHerdDesignator: TQRLabel;
    qrEmailAddress: TQRLabel;
    procedure qrNamePrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
     class procedure PrintNBAS10(AHerdId : Integer);
  end;

var
  NBAS10Print: TNBAS10Print;

implementation
uses
   DairyData, db, dbtables,uHerdSetUp;

{$R *.DFM}

{ TNBAS10Print }

class procedure TNBAS10Print.PrintNBAS10(AHerdId : Integer);
var
   bPrint : Boolean;
   sFieldName : string;
begin
   with TNBAS10Print.Create(nil) do
      try
         if ( AHerdId <= 0 ) then
            begin
               qrEMailApplic.Preview;
               Exit;
            end;

         with TQuery.Create(nil) do
            try
               DataBaseName := WinData.KingData.DatabaseName;
               SQL.Clear;
               SQL.Add('Select O.Name, O.Address1, O.Address2, O.Address3, O.Address4,');
               SQL.Add('O.HerdIdentity, O.HerdIdentifier, O.''E-mail'' From Owners O');
               SQL.Add('Where O.ID =:AHerdId');
               Params[0].AsInteger := AHerdId;
               Open;
               bPrint := True;
               try
                  First;
                  if Length(Trim( FieldByName('Name').AsString )) <= 0 then
                     begin
                        bPrint := False;
                        sFieldName := 'Name';
                        MessageDlg('Your Name has not been entered in the Herd Setup Screen' + #13#10 +
                                   'Please enter your Name before printing NBAS 10 Form.',mtError,[mbok],0);
                     end;
                  if Length(Trim( FieldByName('E-mail').AsString )) <= 0 then
                     begin
                        bPrint := False;
                        sFieldName := 'E-Mail';
                        MessageDlg('Your E-Mail Address has not been entered in the Herd Setup Screen' + #13#10 +
                                   'Please enter your E-Mail Address before printing NBAS 10 Form.',mtError,[mbok],0);
                     end;
                  if Length(Trim( FieldByName('HerdIdentity').AsString )) <= 0 then
                     begin
                        bPrint := False;
                        sFieldName := 'HerdIdentity';
                        MessageDlg('Your Herd No. has not been entered in the Herd Setup Screen' + #13#10 +
                                   'Please enter your Herd No. before printing NBAS 10 Form.',mtError,[mbok],0);
                     end;
                  if Length(Trim( FieldByName('HerdIdentifier').AsString )) <= 0 then
                     begin
                        bPrint := False;
                        sFieldName := 'HerdIdentifier';
                        MessageDlg('Your Herd Designator has not been entered in the Herd Setup Screen.' + #13#10 +
                                   'Please enter your Herd Designator before printing NBAS 10 Form.',mtError,[mbok],0);

                     end;


                  if bPrint then
                     begin
                        qrAddress3.Caption := FieldByName('Address3').AsString;
                        qrAddress2.Caption := FieldByName('Address2').AsString;
                        qrAddress1.Caption := FieldByName('Address1').AsString;
                        qrName.Caption := FieldByName('Name').AsString;
                        qrHerdNumber.Caption := FieldByName('HerdIdentity').AsString;
                        qrHerdDesignator.Caption := FieldByName('HerdIdentifier').AsString;
                        qrEmailAddress.Caption := FieldByName('E-mail').AsString;

                        Windata.CallPrintDialog(qrEMailApplic);
                     end
                  else
                     begin
                        if WinData.OwnerFile.Locate('ID',AHerdId,[]) then
                           uHerdSetUp.ShowTheForm(FALSE, sFieldName);
                     end;

               finally
                  Close;
               end;
            finally
               Free;
            end;
      finally
         Free;
      end
end;

procedure TNBAS10Print.qrNamePrint(sender: TObject; var Value: String);
begin

   if Value = (sender as TQRLabel).Name then
      Value := '';
end;

end.
