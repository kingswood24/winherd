{

 SP 18/12/2008 - proc blbUpdateClick Update NatIDNum Field, only update for Sire.
                 proc blbUpdateClick Update PrimaryBreed Field if required, only update for Sire.
                 proc blbUpdateClick Update Name Field, concatenate the HerdPrefix + Name into Animals.Name field.


 08/01/2009 [V3.9 R5.7] /SP Additional Feature - By default sort the grid by Animal Name

 28/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow update via Tdataset component, as well as animals.db update via sql

 22/01/16 [V5.5 R2.3] /MK Change - HUKI have a redirect problem with their URL so I need to change the URL to dairyfacts.co.uk.
}

unit uHUKISireDamListing;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Db, dxmdaset,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxBarExtItems, cxContainer, cxEdit, cxGroupBox, dxBar,
  MSXML2_TLB, OleServer, ComObj, cxLabel, cxTextEdit, DBTables;

type
  THUKIListingType = (hDam, hSire);
  TfmHUKISireDamListing = class(TForm)
    dxBarManager1: TdxBarManager;
    blbClose: TdxBarLargeButton;
    blbHelp: TdxBarLargeButton;
    gbListingType: TcxGroupBox;
    dxBarStatic1: TdxBarStatic;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    mdListing: TdxMemData;
    mdListingID: TStringField;
    mdListingPREFIX: TStringField;
    mdListingNAME: TStringField;
    mdListingBREED: TStringField;
    mdListingHBN: TStringField;
    mdListingSRCODE: TStringField;
    mdListingFLAG: TStringField;
    mdListingEARTAG: TStringField;
    mdListingDOB: TStringField;
    mdListingLINENO: TStringField;
    DataSource1: TDataSource;
    cxGridDBTableViewRecId: TcxGridDBColumn;
    cxGridDBTableViewID: TcxGridDBColumn;
    cxGridDBTableViewPREFIX: TcxGridDBColumn;
    cxGridDBTableViewNAME: TcxGridDBColumn;
    cxGridDBTableViewBREED: TcxGridDBColumn;
    cxGridDBTableViewHBN: TcxGridDBColumn;
    cxGridDBTableViewSRCODE: TcxGridDBColumn;
    cxGridDBTableViewFLAG: TcxGridDBColumn;
    cxGridDBTableViewEARTAG: TcxGridDBColumn;
    cxGridDBTableViewDOB: TcxGridDBColumn;
    cxGridDBTableViewLINENO: TcxGridDBColumn;
    teTagNo: TcxTextEdit;
    cxLabel1: TcxLabel;
    lBreed: TcxLabel;
    teBreed: TcxTextEdit;
    lName: TcxLabel;
    teName: TcxTextEdit;
    lAnimalNo: TcxLabel;
    teAnimalNo: TcxTextEdit;
    lNoticeInfo: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    lListingType: TcxLabel;
    blbUpdate: TdxBarLargeButton;
    UpdateAnimal: TQuery;
    QueryAnimal: TQuery;
    cxLabel2: TcxLabel;
    teHBN: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure blbCloseClick(Sender: TObject);
    procedure blbUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FHUKIListingType : THUKIListingType;
    XMLDOMNode : IXMLDOMNode;
    MyDOMDocument : IXMLDOMDocument;
    MyXMLHTTP     : IXMLHTTPRequest;
    AnimalID : Integer;
    HUKIResponseText : String;
    FDataset : TDataset;
    FAnimalBreed : Integer;
    procedure LoadAnimals;
    procedure GetAnimalDetails;
    function IsListingNode(AValue : String) : Boolean;
  public
    { Public declarations }
    class procedure CreateForm;
    class procedure ShowAsSireListing(ExistingSire : Integer; ADataset : TDataSet = nil);  // 28/01/2009 [V3.9 R5.8] /SP
    class procedure ShowAsDamListing(ExistingDam : Integer; ADataset : TDataSet = nil);  // 28/01/2009 [V3.9 R5.8] /SP
  end;

var
  fmHUKISireDamListing: TfmHUKISireDamListing;

implementation

uses uImageStore, KRoutines, GenTypesConst, SetUpBreeds;

{$R *.DFM}

{ TForm5 }

class procedure TfmHUKISireDamListing.CreateForm;
begin
   Application.CreateForm(TfmHUKISireDamListing, fmHUKISireDamListing);
   fmHUKISireDamListing.FDataset := nil;
end;

class procedure TfmHUKISireDamListing.ShowAsDamListing(ExistingDam : Integer; ADataset : TDataSet);
begin
   CreateForm;
   try
      with fmHUKISireDamListing do
         begin
            FDataset := ADataset;
            FHUKIListingType := hDam;
            AnimalID := ExistingDam;
            ShowModal;
         end;
   finally
      FreeAndNil(fmHUKISireDamListing);
   end;
end;

class procedure TfmHUKISireDamListing.ShowAsSireListing(ExistingSire : Integer; ADataset : TDataSet);
begin
   CreateForm;
   try
      with fmHUKISireDamListing do
         begin
            FDataset := ADataset;
            FHUKIListingType := hSire;
            AnimalID := ExistingSire;
            ShowModal;
         end;
   finally
      FreeAndNil(fmHUKISireDamListing);
   end;
end;

procedure TfmHUKISireDamListing.FormShow(Sender: TObject);
begin
   case FHUKIListingType of
   hDam : begin
             lListingType.Caption := 'Dam Listing';
          end;
   hSire: begin
             lListingType.Caption := 'Sire Listing';
          end;
   end;
   Caption := 'HUK '+ lListingType.Caption;

  // lNoticeInfo.Caption := 'This animal has not been found in your current HUKI listing. '+
  //                        'If you find the animal on the listing below, click on the update details '+
  //                        'button to ensure the sire has all the up to date information from HUKI.';
   cxGridDBTableViewLINENO.Visible := ( FHUKIListingType = hDam );
   GetAnimalDetails;
end;

procedure TfmHUKISireDamListing.FormActivate(Sender: TObject);
begin
   Update;
   LoadAnimals;
end;

procedure TfmHUKISireDamListing.LoadAnimals;
var
   i : Integer;
   Listing : TStringList;
   fName : string;
begin
   Screen.Cursor := crHourGlass;
   Listing := TStringList.Create;
   ForceApplicationDirectories('HUKI Download Files');
   if FHUKIListingType = hDam then
      fName := ApplicationPath + 'HUKI Download Files\DamListing.xml'
   else if FHUKIListingType = hSire then
      fName := ApplicationPath + 'HUKI Download Files\SireListing.xml'
   else
      Abort;

   try
   mdListing.Close;
   mdListing.Open;
   mdListing.DisableControls;

   if not FileExists(fName) then
      begin
         MyXMLHTTP := CreateOleObject('MSXML2.XMLHTTP.3.0') as IXMLHTTPRequest;
         if FHUKIListingType = hDam then
            MyXMLHTTP.open('POST', 'http://'+HUKINewServerIPAdd+'/CalfRegistration/CowList.asp', FALSE, EmptyParam, EmptyParam)
         else if FHUKIListingType = hSire then
            MyXMLHTTP.open('POST', 'http://'+HUKINewServerIPAdd+'/CalfRegistration/BullList.asp', FALSE, EmptyParam, EmptyParam)
         else
            Abort;

         MyXMLHTTP.Send(EmptyParam);

         if ( MyXMLHTTP.Status = 200 ) then
            begin
               HUKIResponseText := MyXMLHTTP.responseText;
               HUKIResponseText := Trim(HUKIResponseText);
               Listing.Text := HUKIResponseText;
               Listing.SaveToFile(fName);
               Listing.LoadFromFile(fName);
               HUKIResponseText := Listing.Text;
            end
         else
            begin
               ShowMessage('Error: ' + IntToStr( MyXMLHTTP.Status ) + ' - ' + MyXMLHTTP.statusText);
               Abort;
            end;
      end
   else
      begin
         Listing.LoadFromFile(fName);
         HUKIResponseText := Listing.Text;
      end;

   if HUKIResponseText <> '' then
      begin

         MyDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
         MyDOMDocument.async := False;
         MyDOMDocument.loadXML(HUKIResponseText);

         if ( MyDOMDocument.documentElement.childNodes.Get_length > 0 ) then
            begin
               for i := 0 to MyDOMDocument.documentElement.childNodes.Get_length-1 do
                  begin
                     if IsListingNode(MyDOMDocument.documentElement.childNodes[i].Get_nodeName) then
                        begin
                           mdListing.Append;
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('ID');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingID.AsString := XMLDOMNode.Text;
                              end;
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('PREFIX');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingPREFIX.AsString := XMLDOMNode.Text;
                              end;
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('NAME');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingNAME.AsString := XMLDOMNode.Text;
                              end;
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('BREED');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingBREED.AsString := XMLDOMNode.Text;
                              end;
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('HBN');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingHBN.AsString := XMLDOMNode.Text;
                              end;
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('SRCODE');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingSRCODE.AsString := XMLDOMNode.Text;
                              end;
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('FLAG');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingFLAG.AsString := XMLDOMNode.Text;
                              end;

                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('EARTAG');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingEARTAG.AsString := XMLDOMNode.Text;
                              end;
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('DOB');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingDOB.AsString := XMLDOMNode.Text;
                              end;
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].selectSingleNode('LINENO');
                           if XMLDOMNode <> nil then
                              begin
                                 mdListingLINENO.AsString := XMLDOMNode.Text;
                              end;
                           mdListing.Post;
                        end;
                  end;
            end;
      end;
     mdListing.First;
     mdListing.EnableControls;
   finally
      FreeAndNil(Listing);
      Screen.Cursor := crDefault;
   end;
end;

function TfmHUKISireDamListing.IsListingNode(AValue: String): Boolean;
begin
   Result := (UPPERCASE(AValue) = 'COW') or (UPPERCASE(AValue) = 'BULL');
end;

procedure TfmHUKISireDamListing.blbCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfmHUKISireDamListing.blbUpdateClick(Sender: TObject);
const
   cUpdateError = 'Error updating database.';
   cUpdateSuccessful = 'All details have been updated successfully.';
   cSQLBreedUpdate = 'UPDATE Animals SET PrimaryBreed = :PD WHERE ID = :ID';

var
   PedigreeBreedID : Integer;
   PedigreeBreedCode : string;
   AnimalIdent : string;
   UpdateOK : Boolean;
   EMessage : string;
begin

   if ( AnimalID <= 0 ) then
      begin
         MessageDlg('No animal has been selected for update.',mtError,[mbOK],0);
         Exit;
      end;


   if MessageDlg('Update Animals details?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin

         if FHUKIListingType = hSire then
            begin

                // SP 18/12/2008 - Update PrimaryBreed Field if required, update only required for Sire, not Dam.
                PedigreeBreedCode := mdListingBREED.AsString;
                if ((mdListingEARTAG.AsString <> '') and (mdListingName.AsString <> '')) then
                   AnimalIdent := mdListingEARTAG.AsString+'/'+mdListingName.AsString
                else if (mdListingEARTAG.AsString <> '') then
                   AnimalIdent := mdListingEARTAG.AsString
                else if (mdListingName.AsString <> '') then
                   AnimalIdent := mdListingName.AsString
                else
                   AnimalIdent := 'Unknown';
               UpdateOK := False;
               if FDataset <> nil then // 28/01/2009 [V3.9 R5.8] /SP
                  begin

                     FDataset.Edit;
                     try
                        FDataset.FieldByName('NAME').AsString := mdListingPREFIX.AsString + ' ' + mdListingName.AsString;
                        FDataset.FieldByName('HERDBOOKNO').AsString := mdListingHBN.AsString;

                        PedigreeBreedCode := mdListingBREED.AsString;
                        FDataset.Post;
                        UpdateOK := True;
                     except
                        on e : exception do
                           begin
                              FDataset.Cancel;
                              EMessage := e.Message;
                           end;
                     end;

                  end
               else
                  begin
                     UpdateAnimal.SQL.Clear;
                     // SP 18/12/2008 - Update NatIDNum Field, only update for Sire.
                     try
                        UpdateAnimal.SQL.Text := Format('UPDATE ANIMALS SET NATIDNUM= "%s", NAME = "%s", HERDBOOKNO = "%s" WHERE ID=%d', [mdListingEARTAG.AsString, Trim(mdListingPREFIX.AsString + ' ' + mdListingName.AsString), mdListingHBN.AsString,AnimalID]);
                        UpdateAnimal.ExecSQL;
                        UpdateOK := True;
                     except
                        on e : exception do
                           EMessage := e.Message;
                     end;
                  end;


               with UpdateAnimal do
                  begin
                     SQL.Clear;
                     SQL.Text := 'SELECT ID FROM Breeds WHERE PedigreeBreed=:PB';
                     Params[0].AsString := PedigreeBreedCode;
                     Open;
                     PedigreeBreedID := Fields[0].AsInteger;
                     Close;

                     if (PedigreeBreedID<=0) then
                        begin

                           if MessageDlg(Format('The Pedigree Breed Code "%s" for sire "%s"'+cCRLF+
                                                'has not been found in your herd database.'+cCRLFx2+
                                                'Do you want to add this breed now?',[PedigreeBreedCode,AnimalIdent]),mtInformation,[mbYes,mbNo],0) = idYes then
                              begin
                                 PedigreeBreedID := TfSetUpBreeds.SetupBreedFromPedigreeCode(PedigreeBreedCode);
                              end;
                        end;

                     if ((PedigreeBreedID>0) and (FAnimalBreed <> PedigreeBreedID) and (UpdateOK)) then
                        begin
                           if ( FDataset <> nil ) then // 28/01/2009 [V3.9 R5.8] /SP
                              begin
                                 if (FDataset.FindField('PrimaryBreed')<>nil) then
                                 try
                                    FDataset.Edit;
                                    FDataset.FieldByName('PrimaryBreed').AsInteger := PedigreeBreedID;
                                    FDataset.Post;
                                 except
                                    UpdateOK := False;
                                    FDataset.Cancel;
                                 end;
                              end
                           else
                              begin
                                 try
                                    SQL.Clear;
                                    SQL.Text := cSQLBreedUpdate;
                                    Params[0].AsInteger := PedigreeBreedID;
                                    Params[1].AsInteger := AnimalID;
                                    ExecSQL;
                                 except
                                    UpdateOK := False;
                                 end;
                              end;
                        end;

                     if UpdateOk then
                        MessageDlg(cUpdateSuccessful,mtInformation,[mbOK],0)
                     else
                        MessageDlg(cUpdateError,mtError,[mbOK],0);
                  end;
            end
         else
            begin
               UpdateOK := False;
               if FDataset <> nil then // 28/01/2009 [V3.9 R5.8] /SP
                  begin
                     FDataset.Edit;
                     try
                        FDataset.FieldByName('NAME').AsString := mdListingPREFIX.AsString + ' ' + mdListingName.AsString;
                        FDataset.FieldByName('HERDBOOKNO').AsString := mdListingHBN.AsString;
                        FDataset.Post;
                        UpdateOK := True;
                     except
                        on e : exception do
                           begin
                              FDataset.Cancel;
                              EMessage := e.Message;
                           end;
                     end;
                  end
               else
                  begin
                     try
                        UpdateAnimal.SQL.Text := Format('UPDATE ANIMALS SET NAME = "%s", HERDBOOKNO = "%s" WHERE ID=%d', [mdListingPREFIX.AsString + ' ' + mdListingName.AsString, mdListingHBN.AsString,AnimalID]);
                        UpdateAnimal.ExecSQL;
                        UpdateOK := True;
                     except
                        on e : exception do
                           EMessage := e.Message;
                     end;
                  end;
               if UpdateOk then
                  MessageDlg('Name and Herdbook No. have been updated succesfully.',mtInformation,[mbOK],0)
               else
                  MessageDlg(EMessage + cCRLFx2 + cUpdateError,mtError,[mbOK],0);

            end;
         GetAnimalDetails;
      end;
end;

procedure TfmHUKISireDamListing.GetAnimalDetails;
begin
   teTagNo.Text := '';
   teName.Text := '';
   teBreed.Text := '';
   teAnimalNo.Text := '';
   teHBN.Text := '';
   if (AnimalID>0) then
      begin
         gbListingType.Visible := True;
         blbUpdate.Visible := ivAlways;
         QueryAnimal.Close;
         QueryAnimal.Params[0].AsInteger := AnimalID;
         QueryAnimal.Open;
         try
            teTagNo.Text := QueryAnimal.FieldByName('NatIDNum').AsString;
            teName.Text := QueryAnimal.FieldByName('Name').AsString;
            teBreed.Text := QueryAnimal.FieldByName('PedigreeBreed').AsString;
            teAnimalNo.Text := QueryAnimal.FieldByName('AnimalNo').AsString;
            teHBN.Text := QueryAnimal.FieldByName('HerdBookNo').AsString;
            FAnimalBreed := QueryAnimal.FieldByName('PrimaryBreed').AsInteger;
         finally
            QueryAnimal.Close;
         end;
      end
   else
      begin
         blbUpdate.Visible := ivNever;
         gbListingType.Visible := False;
      end;

end;

procedure TfmHUKISireDamListing.FormCreate(Sender: TObject);
begin
   ImageStore := TImageStore.Create(nil);
   FAnimalBreed := 0;
end;

procedure TfmHUKISireDamListing.FormDestroy(Sender: TObject);
begin
   FreeAndNil(ImageStore);
end;


end.
