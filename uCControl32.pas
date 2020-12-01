unit uCControl32;

interface
uses
  SysUtils, Windows, Dialogs;

   function CheckProtection (CheckForDaysToGo : Boolean ) : Boolean;

implementation

 type
    TccmbType = ^TccmbType;
    ccmbType = packed record
    CCMB          : array[0..3] of char;
    Func          : byte;
    R_Code        : smallint;
    Drive         : byte;
    Dir           : Pchar;
    MajorVersion  : byte;
    MinorVersion  : byte;
    SerialNumber  : word;
    ProductCode   : array[0..8] of char;
    ProgramName   : array[0..12] of char;
    CC_SN         : smallint;
    Master        : byte;
    DriveType     : byte;
    Copies        : word;
    Init_copies   : word;
    Num_uses      : word;
    I_Uses        : word;
    Exp_D         : byte;
    Exp_M         : byte;
    Exp_Y         : smallint;
    Feature       : word;
    Max_net_users : smallint;
    Secure_Msg    : array[0..256] of char;
    Old_Updates   : word;
    Flags1        : word;
    Net_User_Data : longint;
    Dos_Time      : array[0..3] of byte;
    Old_Maxdays   : word;
    Res2          : longint;
    Extended_Err  : array[0..5] of byte;
    Res3          : byte;
    Res4          : longint;
    Execs         : longint;
    Init_Execs    : longint;
    Features      : longint;
    Serial_Number : longint;
    Updates       : smallint;
    MaxDays       : word;
    Res_Expand    : array[0..147] of byte;
  end;

  TCC32 = function ( test : TccmbType) : Integer; pascal ;

var
  ccmb	: ccmbType;

function CheckProtection (CheckForDaysToGo : Boolean ) : Boolean;
var
   CC32DLLHandle : THandle;
   Mycc32 : Tcc32;
   Mycc32Ptr: TFarProc;
   Temp : pointer;

   CallResult : LongInt;
   i : integer;
   TempBool : Boolean;
   TempDate : TDateTime;
   NoDays,
   cDay,
   cMonth,
   cYear     : Integer;
begin

     try
        // load dll in dinamic type(mode)
        {$IFDEF VER_PLATFORM_WIN32_NT}
              CC32DLLHandle := loadLibrary (PChar( 'C:\Kingswood Herd Management\HerdMan.dll' ));
        {$ELSE}
              CC32DLLHandle := loadLibrary (PChar( 'HerdMan.dll' ));
        {$ENDIF}

        if CC32DLLHandle <> 0 then
           begin
              // get function address
              Mycc32Ptr := getProcAddress ( CC32DLLHandle, 'cc32' );

              // if function address exists
              if Mycc32Ptr <> nil then
                 begin
                    Result := False;
                    @Mycc32 := Mycc32Ptr;
                    { initialise CCMB structure }
                    Temp := @ccmb;
                    new(Temp);
                    ccmb.CCMB[0] := 'C';
                    ccmb.CCMB[1] := 'C';
                    ccmb.CCMB[2] := 'M';
                    ccmb.CCMB[3] := 'B';
                    ccmb.Func:= 0;
                    ccmb.R_Code:= -1;
                    ccmb.Drive:= 0;

                    { initialise CCMB structure }
                    for i:=0 to 147 do ccmb.res_expand[i]:=0;
                    FillChar ( ccmb, SizeOf(ccmb),chr(0));

                    {$I+}
                    try
                       CallResult := Mycc32(@ccmb);

                       TempBool := ( Integer ( i ) = 0 );
                       TempBool := ( ccmb.r_code = 0 );

                       if ( ccmb.r_code <> 0 ) then
                          case ccmb.r_code of
                               -25 : MessageDlg('Expiry Date Reached - Contact Kingswood Computing', mtInformation,[mbOK], 0);
                             else
                              MessageDlg('Control Control Error ' + IntToStr ( ccmb.r_code ) +
                                         ' - Contact Kingswood Computing', mtInformation,[mbOK], 0);
                          end
                       else
                          // check the Expiry Date to see how many days to go
                          if CheckForDaysToGo then
                             try
                                cDay   := ccmb.exp_d;
                                cMonth := ccmb.exp_m;
                                cYear  := ccmb.exp_y;
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
                 end
              else
                 begin
                    Result := False;
                 end;
           end
        else
           Result := False;

     finally
        FreeLibrary ( CC32DLLHandle );
     end;

end;


end.
