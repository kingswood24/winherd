unit uBladeFileUpdate;

interface

uses
   Classes, SysUtils, ComCtrls;

const
   HTTPFileLocatation = 'http://www.blade.com/update/';
   FeedFile = 'feedcode.dat';
   SupplierFile = 'suppliers.dat';
   DiagnosisFile = 'diagnosis.dat';
   TreatmentsFile = 'treatments.dat';

type
   TBladeFileType = (bftFeedCode, bftSupplier, bftDiagnosis, bftTreatment);
   TBladeFileUpdate = class

   private

      HTTPAddress : string;
      FProgressBar : TProgressBar;

      FFileType : TBladeFileType;
      procedure SetFileType(const Value: TBladeFileType);
      procedure SetProgressBar(const Value: TProgressBar);
   public
      property FileType : TBladeFileType write SetFileType;
      property ProgressBar : TProgressBar write SetProgressBar;
      constructor create;
      destructor Destroy;override;
   end;

implementation

{ TBladeFileUpdate }

constructor TBladeFileUpdate.create;
begin

end;

destructor TBladeFileUpdate.Destroy;
begin


   inherited;
end;

procedure TBladeFileUpdate.SetFileType(const Value: TBladeFileType);
begin

   if Value <> FFileType then
      begin
         FFileType := Value;

         if FFileType = bftFeedCode then
            HTTPAddress := HTTPFileLocatation+FeedFile
         else if FFileType = bftSupplier then
            HTTPAddress := HTTPFileLocatation+SupplierFile
         else if FFileType = bftDiagnosis then
            HTTPAddress := HTTPFileLocatation+DiagnosisFile
         else if FFileType = bftTreatment then
            HTTPAddress := HTTPFileLocatation+TreatmentsFile
         else
            raise Exception.Create('Invalid file type specified for Blade download')

      end;

end;

procedure TBladeFileUpdate.SetProgressBar(const Value: TProgressBar);
begin

end;

end.
