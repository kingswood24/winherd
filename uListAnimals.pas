{
   09/10/13 [V5.2 R3.2] /MK Bug Fix - If Events.State In Edit or Insert, when moving to the next AnimalFileByID record,
                                      Events table is naturally posted. If moving to next animal cancel Events updates
                                      before locate of animal.
}

unit uListAnimals;

{ Changes needed }

interface
uses
    ToolEdit,
    Forms,
    dbctrls,
    GenTypesConst,
    stdctrls,
    Classes,
    Controls,
    MenuUnit,
    EventDefaults;

type
    TkwEventForm = class(TForm)
    published
       procedure AddEvent;
       procedure EditEvent;
       procedure SearchAnimalChange(Sender: TObject);
       procedure SearchButtonClick(Sender: TObject; lNo : TLabel);
    private
       SexToList : String;
       // procedure AnimalNoChange;
       procedure AnimalNoChange( NewNo : String );
       function  GetSexToList : String;
       procedure SetSexToList ( SToList : String );
    protected
       FFormShowing : Boolean;
       FModified : Boolean;
       procedure FormActivate(Sender: TObject);
       procedure SetModifiedFlag;
    public
        NoLabel   : String;
        ThisCombo : TComboEdit;
        ThisNav   : TControl;
        ThisComment : TDBEdit;
        CurrentID : Integer;
        property pSexToList : String read GetSexToList write SetSexToList;
        procedure SetSearchField ( SearchF : TComboEdit );
        constructor Create(AOwner: TComponent); override;
    end;

implementation
uses
    Dialogs,
    DB,
    DairyData,
    uSrchDLG,
    Sysutils;

const
    cAnimalNo   = 'Animal No:';
    cNationalID = 'Nat Id No:';

constructor TkwEventForm.Create ( AOwner : TComponent );
begin
    inherited Create(AOwner);
    FFormShowing := False;
    FModified := False;
    if ( WinData.SearchField = 'AnimalNo' ) then
       NoLabel := cAnimalNo
    else
       NoLabel := cNationalID;
end;

procedure TkwEventForm.SetSearchField ( SearchF : TComboEdit );
begin
    // Set up the Field to search on
    try
    if WinData.SearchField = 'AnimalNo' then
       begin
          SearchF.Text := WinData.AnimalFileByIDAnimalNo.AsString;
          SearchF.MaxLength := 15{WinData.AnimalFileByIDAnimalNo.Size}; // changed
//          SearchF.Width := 125;                                       // 20/3/00
       end                                                              // to stop
    else                                                                // NatID edit
       begin                                                            // boxes
          SearchF.Text := WinData.AnimalFileByIDNatIDNum.AsString;      // auto
          SearchF.MaxLength := 20{WinData.AnimalFileByIDNatIDNum.Size}; // resizing
//          SearchF.Width := 170;                                       //  - kr
       end;
    except
    end;
end;

{
// *** Start of Animals Listing routines for Events
These routines need an event Identifier - Bulling, Service e.t.c.
}

function TkwEventForm.GetSexToList : String;
begin
    ReSult := SexToList;
end;

procedure TkwEventForm.SetSexToList ( SToList : String );
begin
    SexToList := SToList;
end;

procedure TkwEventForm.AddEvent;
begin
   WinData.Events.Append;
end;

procedure TkwEventForm.SearchAnimalChange(Sender: TObject);
begin
   // Locate this new animal in the animals file, if the user modifies the search
   if (Sender is TComboEdit) then
      if (Sender as TComboEdit).Modified then
         AnimalNoChange((Sender as TComboEdit).Text);
end;

procedure TkwEventForm.AnimalNoChange( NewNo : String );
var
   LocateStr : String;
   SearchStr : Variant;
begin
   // Search the Animal table - this shifts the focus to the selected record
   // Only search if the fields been modified
   if pSexToList = 'Female' then
      begin
         LocateStr := 'Sex;' + WinData.SearchField;
         SearchStr := VarArrayOf([pSexToList,NewNo]);
      end
   else
      begin
         LocateStr := WinData.SearchField; //'AnimalNo';
         SearchStr := NewNo;
      end;

   WinData.Events.CancelUpdates;

   // Set to Not found
   ThisNav.Enabled := FALSE;
   if NOT ( WinData.EventType in [TReTag,TGeneralRemark,TInterHerd] ) then
      ThisComment.Text := '';

   // Only search if there is a Character in NewNo
   if ((Length(NewNo) > 0) and (WinData.AnimalFileByID.Locate(LocateStr,SearchStr,[loPartialKey]))) then
         begin
            if NOT ( WinData.EventType in [TReTag,TGeneralRemark,TInterHerd] ) then
               AddEvent;

            // Check you have an exact match
            if ( WinData.SearchField = 'AnimalNo' ) then
               ThisNav.Enabled := ( WinData.AnimalFileByIDAnimalNo.AsString = NewNo )
            else
               ThisNav.Enabled := ( WinData.AnimalFileByIDNatIDNum.AsString = NewNo );
         end;
//    else
//       MessageDlg('No animals have been found matching the search criteria.',mtWarning,[mbOK],0);
end;

// SP 24/07/2013 - Revised to stop the SearchButtonClick event calling the  AnimalNoChange event.
// Instead, try locate the animal on the AnimalFileByID dataset directly from this event.
// Also, where the default search is animal no and the selected animal does not contain
// an animal no, default to display Nat Id No
procedure TkwEventForm.SearchButtonClick(Sender: TObject; lNo : TLabel);
begin
     // Display the Search window and if user selects from it search for the animal
     // and call the routine to change the animal
     // Selected Record or previous record deleted - indicated by -1 in ResultID
     ThisNav.Enabled := FALSE;

     if ( fSearchDlg.ShowModalDams ( pSexToList, WinData.EventType ) = mrOK ) and ( fSearchDLG.ResultID <> -1 ) then
        begin
           //   09/10/13 [V5.2 R2.0] /MK Bug Fix - If Events.State In Edit or Insert, when moving to the next AnimalFileByID record,
           //                                      Events table is naturally posted. If moving to next animal cancel Events updates
           //                                      before locate of animal.
           WinData.Events.CancelUpdates;
           if WinData.AnimalFileByID.Locate('ID',fSearchDlg.ResultID,[]) then
              begin
                 CurrentID := fSearchDLG.ResultID; // Used in search of retention date

                 if NOT ( WinData.EventType in [TReTag,TGeneralRemark,TInterHerd] ) then
                    begin
                       ThisComment.Text := '';
                       AddEvent;
                       // Check you have an exact match
                       if ( WinData.SearchField = 'AnimalNo' ) and (Length(Trim(WinData.AnimalFileByIDAnimalNo.AsString)) > 0) then
                          ThisCombo.Text := WinData.AnimalFileByIDAnimalNo.AsString
                       else
                          ThisCombo.Text := WinData.AnimalFileByIDNatIDNum.AsString;
                       ThisNav.Enabled := True;
                    end;
              end;
        end
     else
        ThisNav.Enabled := True;

     if lNo <> nil then
        if ( WinData.SearchField = 'AnimalNo' ) and (Length(Trim(WinData.AnimalFileByIDAnimalNo.AsString)) > 0) then
           lNo.Caption := cAnimalNo
        else
           lNo.Caption := cNationalID;
end;

procedure TkwEventForm.FormActivate(Sender: TObject);
begin
   FFormShowing := True;
end;

// *** End of Animals Listing routines for Events
procedure TkwEventForm.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
end;

procedure TkwEventForm.EditEvent;
begin
   WinData.Events.Edit;
end;

end.
