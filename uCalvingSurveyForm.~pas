{
   12/05/11 [V4.1 R1.1] /MK Additional Feature - Changed seScore DisplayFormat and EditFormat To Decimal Value (#.##)

   09/02/12 [V5.0 R3.7] /MK Additional Feature - SetupCalvingSurveyForm - Take Results From WinData.GetCalvingSurvey
}

unit uCalvingSurveyForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxCheckBox, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxLabel, cxControls, cxContainer, cxEdit, cxGroupBox, GenTypesConst,
  uCalvingSurvey;

type
  TfmCalvingSurveyForm = class(TForm)
    gbConditionScore: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    seScore: TcxSpinEdit;
    teCSComment: TcxTextEdit;
    gbBirthProblems: TcxGroupBox;
    btnOK: TcxButton;
    cbAbortedCalving: TcxCheckBox;
    cbAssistedCalvingModerate: TcxCheckBox;
    cbAssistedCalvingSerious: TcxCheckBox;
    cbMilkFever: TcxCheckBox;
    cbRetainedCleansing: TcxCheckBox;
    cbDisplacedAbomasums: TcxCheckBox;
    cbRegisterCalves: TcxCheckBox;
    procedure seScorePropertiesChange(Sender: TObject);
    procedure teCSCommentPropertiesChange(Sender: TObject);
    procedure cbMilkFeverPropertiesChange(Sender: TObject);
    procedure cbRetainedCleansingPropertiesChange(Sender: TObject);
    procedure cbDisplacedAbomasumsPropertiesChange(Sender: TObject);
    procedure cbAssistedCalvingModeratePropertiesChange(Sender: TObject);
    procedure cbAbortedCalvingPropertiesChange(Sender: TObject);
    procedure cbAssistedCalvingSeriousPropertiesChange(Sender: TObject);
    procedure cbRegisterCalvesPropertiesChange(Sender: TObject);
  private
    { Private declarations }

    FCalvingSurvey : TCalvingSurvey;
    procedure SetupCalvingSurveyForm;
  public
    { Public declarations }
    class procedure ShowSurvey(var ACalvingSurvey : TCalvingSurvey);
  end;

var
  fmCalvingSurveyForm: TfmCalvingSurveyForm;

implementation

uses DairyData;

{$R *.DFM}

{ TfmCalvingSurvey }

class procedure TfmCalvingSurveyForm.ShowSurvey(var ACalvingSurvey: TCalvingSurvey);
begin
   with TfmCalvingSurveyForm.Create(nil) do
      try
         FCalvingSurvey := ACalvingSurvey;
         SetupCalvingSurveyForm;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCalvingSurveyForm.seScorePropertiesChange(Sender: TObject);
begin
   FCalvingSurvey.ConditionScore := seScore.Value;
end;

procedure TfmCalvingSurveyForm.teCSCommentPropertiesChange(Sender: TObject);
begin
   FCalvingSurvey.ConditionScoreComment := teCSComment.Text;
end;

procedure TfmCalvingSurveyForm.SetupCalvingSurveyForm;
begin
   cbRegisterCalves.Checked := WinData.GlobalSettings.ShowCalfReg;
   cbAbortedCalving.Checked := FCalvingSurvey.AbortedCalving;
   cbAssistedCalvingModerate.Checked := FCalvingSurvey.AssistedCalvingModerate;
   teCSComment.Text := FCalvingSurvey.ConditionScoreComment;

   gbConditionScore.Visible := FCalvingSurvey.ShowCSInfo;
   gbBirthProblems.Visible := FCalvingSurvey.ShowBirthTypeInfo;

   if (gbConditionScore.Visible) and (not gbBirthProblems.Visible) then
      begin
         gbConditionScore.Top := 12;
         btnOK.Top := 174;
         cbRegisterCalves.Top := 176;
         Height := btnOK.Top + 82;
      end
   else if (not gbConditionScore.Visible) and (gbBirthProblems.Visible) then
      begin
         gbBirthProblems.Top := 12;
         btnOK.Top := 174;
         cbRegisterCalves.Top := 176;
         Height := btnOK.Top + 82;

         //   09/02/12 [V5.0 R3.7] /MK Additional Feature - Take Results From WinData.GetCalvingSurvey
         cbAbortedCalving.Checked := FCalvingSurvey.AbortedCalving;
         cbAssistedCalvingModerate.Checked := FCalvingSurvey.AssistedCalvingModerate;
         cbAssistedCalvingSerious.Checked := FCalvingSurvey.AssistedCalvingSerious;
         cbMilkFever.Checked := FCalvingSurvey.MilkFever;
         cbRetainedCleansing.Checked := FCalvingSurvey.RetainedCleansing;
         cbDisplacedAbomasums.Checked := FCalvingSurvey.DisplacedAbomasums;
      end;
end;

procedure TfmCalvingSurveyForm.cbMilkFeverPropertiesChange(
  Sender: TObject);
begin
   FCalvingSurvey.MilkFever := cbMilkFever.Checked;
end;

procedure TfmCalvingSurveyForm.cbRetainedCleansingPropertiesChange(
  Sender: TObject);
begin
   FCalvingSurvey.RetainedCleansing := cbRetainedCleansing.Checked;
end;

procedure TfmCalvingSurveyForm.cbDisplacedAbomasumsPropertiesChange(
  Sender: TObject);
begin
   FCalvingSurvey.DisplacedAbomasums := cbDisplacedAbomasums.Checked;
end;

procedure TfmCalvingSurveyForm.cbAssistedCalvingModeratePropertiesChange(
  Sender: TObject);
begin
   FCalvingSurvey.AssistedCalvingSerious := cbAssistedCalvingModerate.Checked;
   if cbAssistedCalvingModerate.Checked then
      cbAssistedCalvingSerious.Checked := False;
end;

procedure TfmCalvingSurveyForm.cbAbortedCalvingPropertiesChange(
  Sender: TObject);
begin
   FCalvingSurvey.AbortedCalving := cbAbortedCalving.Checked;
end;

procedure TfmCalvingSurveyForm.cbAssistedCalvingSeriousPropertiesChange(
  Sender: TObject);
begin
   FCalvingSurvey.AssistedCalvingSerious := cbAssistedCalvingSerious.Checked;
   if cbAssistedCalvingSerious.Checked then
      cbAssistedCalvingModerate.Checked := False;
end;

procedure TfmCalvingSurveyForm.cbRegisterCalvesPropertiesChange(
  Sender: TObject);
begin
   FCalvingSurvey.RegisterCalves := cbRegisterCalves.Checked;
end;

end.
