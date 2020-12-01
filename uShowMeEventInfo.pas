unit uShowMeEventInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, cxButtons, uHerdLookup, uImageStore, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, GenTypesConst;

type
  TfmShowMeEventInfo = class(TForm)
    btnShowMe: TcxButton;
    btnClose: TcxButton;
    ActionList: TActionList;
    actShowMe: TAction;
    actClose: TAction;
    pInfo: TPanel;
    lEventInfo: TcxLabel;
    procedure actShowMeExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm;
  end;

var
  fmShowMeEventInfo: TfmShowMeEventInfo;

implementation

const
   cShowMeBottomText = 'Click the Show Me button to see the %s.';

{$R *.DFM}

{ TfmShowMeEventInfo }

class procedure TfmShowMeEventInfo.ShowTheForm;
begin
   with TfmShowMeEventInfo.Create(nil) do
      try
         case HerdLookup.FShowMeEventInfoType of
            setIndividualVetFeeds : begin
                                       Caption := cShowMeEventInfo_VetFeeds;
                                       lEventInfo.Caption := 'Click on the Vet Treatment button to enter treatment data'+cCRLF+
                                                             'for individual animals. You can also record veterinary and'+cCRLF+
                                                             'feed purchases in this section.';
                                    end;
            setBlockHealth : begin
                                Caption := cShowMeEventInfo_BlockHealth;
                                lEventInfo.Caption := 'You can record treatments for groups of animals and for the'+cCRLF+
                                                      'whole herd, by clicking "On Farm Events" and then the'+cCRLF+
                                                      'Vet/Dosing button. You can also record Vaccinations and'+cCRLF+
                                                      'Herd Tests in this area.';
                             end;
            setVetLink : begin
                            Caption := cShowMeEventInfo_VetLink;
                            lEventInfo.Caption := 'Ask your local vet to email you a VetLink file (to your Kingswood'+cCRLF+
                                                  'Gmail address). Contact Kingswood at 01-4599491 to help'+cCRLF+
                                                  'you read in your veterinary purchases (and veterinary treatments,'+cCRLF+
                                                  'where appropriate).';
                         end;
            setPhoneApp : begin
                             Caption := cShowMeEventInfo_PhoneApp;
                             lEventInfo.Caption := 'Kingswood''s Phone App allows you record veterinary treatments'+cCRLF+
                                                   'as they happen - as well as calf registrations, heats, services,'+cCRLF+
                                                   'movements and weighings. Ring us at 01-4596677 for more info.';
                          end;
         end;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmShowMeEventInfo.actShowMeExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmShowMeEventInfo.actCloseExecute(Sender: TObject);
begin
   HerdLookup.FShowMeEventInfoType := setNone;
   Close;
end;

end.
