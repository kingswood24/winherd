unit uCControl;

interface

uses
  SysUtils, Windows, Dialogs;

function CheckProtection (CheckForDaysToGo : Boolean ) : Boolean;

implementation

type
  TDataPtr = ^ccmb_rec_type;
    ccmb_rec_type = record
    ccmb          : array[1..4] of char;
    func          : byte;
    r_code        : shortint;
    drive         : byte;
    dir           : dword;
    vers          : shortint;
    s_n           : word;
    p_code        : array[1..9]  of char;
    p_name        : array[1..13] of char;
    cc_sn         : word;
    master        : byte;
    dr_typ        : byte;
    copies        : Word;
    init_copies   : word;
    uses_left     : word;
    i_uses        : word;
    exp_d         : byte;
    exp_m         : byte;
    exp_y         : word;
    feature       : word;
    net_users     : word;
    secure_msg    : array[1..257] of char;
    update_num    : word;
    flags1        : word;
    net_user_data : array[1..4] of byte;
    dos_time      : array[1..4] of byte;
    max_days      : word;
    res2          : dword;
    extended_err  : array[1..6] of byte;
    res_expand    : array[1..173] of byte;
  end;

(*
  {$IFDEF VER_PLATFORM_WIN32_NT}
     function cc32( test : TDataPtr) : Integer ; pascal ; external 'C:\Kingswood Herd Management\WDAIRYCC.DLL';
  {$ELSE}
     function cc32( test : TDataPtr) : Integer ; pascal ; external 'WDAIRYCC.DLL';
  {$ENDIF}

*)

  TCC32 = function ( Test : TDataPtr) : Integer; pascal;

function CheckProtection (CheckForDaysToGo : Boolean ) : Boolean;
Var
   Temp : TDataPtr; { Pointer to Copy Control record structure }
   TCCRecord : ccmb_rec_type;
   i : Integer;
   x : Integer;
   TempBool : Boolean;
   TempDate : TDateTime;
   NoDays,
   cDay,
   cMonth,
   cYear     : Integer;

   DLLHandle : THandle;
   FuncCC32 : TCC32;


begin
   TempBool := False;
   Result := False;
  // SP rewrite to load dll dynamically, this is because of new Kcc
  
  {$IFDEF VER_PLATFORM_WIN32_NT}
     DLLHandle := loadLibrary (PChar( 'C:\Kingswood Herd Management\wdairycc.dll' ));
  {$ELSE}
     DLLHandle := loadLibrary (PChar( 'wdairycc.dll' ));
  {$ENDIF}


   if DLLHandle <> 0 then
      begin
         @FuncCC32 := getProcAddress ( DLLHandle, 'cc32' ); { get function address }
         if @FuncCC32 <> nil then
            begin
               Temp := @TCCRECORD;
               New ( Temp );

               { Initialise the Pointer Variable }
               FillChar ( Temp^, SizeOf(Temp^),chr(0));

               Temp^.ccmb[1] := 'C';
               Temp^.ccmb[2] := 'C';
               Temp^.ccmb[3] := 'M';
               Temp^.ccmb[4] := 'B';
               Temp^.r_code  := -1;
               Temp^.func    := 0;
               Temp^.drive   := 0;

               {$I+}
               try
                   i := FuncCC32(Temp);
                   x := Integer (i);
                   TempBool := ( Integer ( i ) = 0 );
                   TempBool := ( Temp^.r_code = 0 );

                   if ( Temp^.r_code <> 0 ) then
                      case Temp^.r_code of
                           -25 : MessageDlg('Expiry Date Reached - Contact Kingswood Computing', mtInformation,[mbOK], 0);
                         else
                          MessageDlg('Control Control Error ' + IntToStr ( Temp^.r_code ) +
                                     ' - Contact Kingswood Computing', mtInformation,[mbOK], 0);
                      end
                   else
                      // check the Expiry Date to see how many days to go
                      if CheckForDaysToGo then
                         try
                            cDay   := Temp^.exp_d;
                            cMonth := Temp^.exp_m;
                            cYear  := Temp^.exp_y;
                            if ( cDay in [1..31] ) and ( cMonth in [1..12] ) and ( cYear >= 1900 ) and ( cYear <= 3000 ) then
                               begin
                                  TempDate := StrToDate(IntToStr(cDay) + '/' + IntToStr(cMonth) + '/' + IntToStr(cYear));
                                  NoDays := Round(TempDate-Date());
                                  if ( NoDays < 30 ) then
                                     ShowMessage('Program will stop working in ' + IntToStr(NoDays) + #13#13 +
                                                 'Contact Kingswood Computing');
                               end;
                         except
                            // continue
                         end;
               except
                  TempBool := False;
                  Dispose ( Temp );
               end;
            end;
         FreeLibrary(DLLHandle);
      end
   else
      MessageDlg('Error starting program, required DLL WDAIRYCC.DLL not found',mtError,[mbOk],0);
   Result := TempBool;

(*
    {$I+}
    try
       i := CC32 ( Temp );

       x := Integer (i);

       TempBool := ( Integer ( i ) = 0 );

       TempBool := ( Temp^.r_code = 0 );

       if ( Temp^.r_code <> 0 ) then
          case Temp^.r_code of
               -25 : MessageDlg('Expiry Date Reached - Contact Kingswood Computing', mtInformation,[mbOK], 0);
             else
              MessageDlg('Control Control Error ' + IntToStr ( Temp^.r_code ) +
                         ' - Contact Kingswood Computing', mtInformation,[mbOK], 0);
          end
       else
          // check the Expiry Date to see how many days to go
          if CheckForDaysToGo then
             try
                cDay   := Temp^.exp_d;
                cMonth := Temp^.exp_m;
                cYear  := Temp^.exp_y;
                if ( cDay in [1..31] ) and ( cMonth in [1..12] ) and ( cYear >= 1900 ) and ( cYear <= 3000 ) then
                   begin
                      TempDate := StrToDate(IntToStr(cDay) + '/' + IntToStr(cMonth) + '/' + IntToStr(cYear));
                      NoDays := Round(TempDate-Date());
                      if ( NoDays < 30 ) then
                         ShowMessage('Program will stop working in ' + IntToStr(NoDays) + #13#13 +
                                     'Contact Kingswood Computing');
                   end;
             except
                // continue
             end;
    except
          TempBool := False;
          Dispose ( Temp );
    end;
    {$I-}

    Result := TempBool;
    *)

end;

end.
