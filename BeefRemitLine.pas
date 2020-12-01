{
   17/04/18 [V5.7 R8.8] /MK Bug Fix - Changed length of idNational to 15 to allow for 372 tags.
                            Change - Changed the start of idSex and idGrade as all data was not been taken.

   01/10/18 [V5.8 R3.0] /MK Change - Need to allow for some factories on the old 32 start so increase length to 5 - Barbara (Kepak).

   17/10/18 [V5.8 R3.2] /MK Change - CSV converted to RMT puts the grade at position 33 where standard RMT files are at position 32.
                                     Changed length of grade to 6 to allow for this difference.

   17/10/18 [V5.8 R4.0] /MK Additional Feature - Added new consts for line carcase line lenghts as An ABP file has a different carcase line length to the default line length.
                                                 Therefore some fields on the ABP file are in different positions to the default line length.
                                               - Added new consts for the ABP fields that are at different positions to the standard line length.
                                               - Load - Check for length of the carcase line to see if file is an ABP or default line length.

   08/01/19 [V5.8 R6.1] /MK Change - Load - Dawn meats are now producing a file with an extra space before the tag number. This is
                                            off setting the grade so that a character before the grade i.e. the sex, is being included in the grade
                                            as well as a space and then the grade. We need to only take the grade - Aubrey Pearson/GL.
}

unit BeefRemitLine;

interface
uses
    SysUtils, Dialogs;

type
    TBeefRemitCarcaseLineType = (clIrl, clGB);
    TBeefRemitCarcaseLine = class
     private
      fsNational  : string;
      fsCarcase   : string;
      fsSex       : string;
      fsGrade     : string;
      ffLWeight   : double;
      ffRWeight   : double;
      fsCondemned : string;
      ffCWeight   : double;
      ffPricePer  : double;
      ffValue     : double;
      ffTotalDeductions: Double;
      ffLiveWeight: Double;
      FBeefRemitCarcaseLineType : TBeefRemitCarcaseLineType;
      procedure   SetStringNational(Value : String);
      procedure   SetStringCarcase(Value : String);
      procedure   SetStringSex(Value : String);
      procedure   SetStringGrade(Value : String);
      procedure   SetFloatLWeight(Value : Double);
      procedure   SetFloatRWeight(Value : Double);
      procedure   SetStringCondemned(Value : String);
      procedure   SetFloatCWeight(Value : Double);
      procedure   SetFloatPricePer(Value : Double);
      procedure   SetFloatValue(Value : Double);
      procedure   SetLiveWeightValue(const Value: Double);
      procedure   SetTotalDeductions(const Value: Double);
     public
      constructor Create(ABeefRemitCarcaseLineType : TBeefRemitCarcaseLineType = clIrl);
      destructor  Destroy;override;

      procedure   Load(Line : String);
      function    Save : string;

     published
      property    National  : string read fsNational  write SetStringNational;
      property    Carcase   : string read fsCarcase   write SetStringCarcase;
      property    Sex       : string read fsSex       write SetStringSex;
      property    Grade     : string read fsGrade     write SetStringGrade;
      property    LWeight   : Double  read ffLWeight  write SetFloatLWeight;
      property    RWeight   : Double  read ffRWeight  write SetFloatRWeight;
      property    Condemned : string read fsCondemned write SetStringCondemned;
      property    CWeight   : Double  read ffCWeight  write SetFloatCWeight;
      property    PricePer  : Double  read ffPricePer write SetFloatPricePer;
      property    Value     : Double  read ffValue    write SetFloatValue;
      property    LiveWeight : Double  read ffLiveWeight write SetLiveWeightValue;
      property    TotalDeductions : Double  read ffTotalDeductions write SetTotalDeductions;
    end;

type
    TBeefRemitDeductionLine = class
     private
      fsDescription : String;
      fsDetails     : String;
      ffDetailAmt   : double;
      fsDetailType  : string;
      ffDetailValue : double;
      ffDeducted    : double;
      ffVat         : double;

     public
      constructor Create;
      destructor  Destroy;override;

      procedure   Load(s : string);
     published
      property    Description : string read fsDescription;
      property    Details     : string read fsDetails;
      property    DetailAmt   : double read ffDetailAmt;
      property    DetailType  : string read fsDetailType;
      property    DetailValue : double read ffDetailValue;
      property    Deducted    : double read ffDeducted;
      property    Vat         : double read ffVat;
    end;


implementation
uses
    DaZMisc;

const
   idStartPos   = 0;
   idLength     = 1;
   idJustify    = 2;

   JustifyLeft  = 0;
   JustifyRight = 1;

   //   17/10/18 [V5.8 R4.0] /MK Additional Feature - An ABP file has a different carcase line length to the default line length.
   //                                                 Therefore some fields on the ABP file are in different positions to the default line length.
   iDefCarcLineLength = 100;
   iABPCarcLineLength = 101;

   //   17/04/18 [V5.7 R8.8] /MK Bug Fix - Changed length of idNational to 15 to allow for 372 tags.
   idNATIONAL  : array[0..2] of integer = (1,15,JustifyLeft);
   idCARCASE   : array[0..2] of integer = (16,8,JustifyLeft);

   //   17/04/18 [V5.7 R8.8] /MK Change - Changed the start of idSex and idGrade as all data was not been taken.
   idSEX       : array[0..2] of integer = (24,6,JustifyLeft);
   //   01/10/18 [V5.8 R3.0] /MK Change - Need to allow for some factories on the old 32 start so increase length to 5 - Barbara (Kepak).
   //   17/10/18 [V5.8 R3.2] /MK Change - CSV converted to RMT puts the grade at position 33 where standard RMT files are at position 32.
   //                                     Changed length of grade to 6 to allow for this difference.
   idGRADE     : array[0..2] of integer = (31,6,JustifyLeft);

   idLWEIGHT   : array[0..2] of integer = (39,7,JustifyRight);
   idRWEIGHT   : array[0..2] of integer = (48,8,JustifyRight);
   idCONDEMNED : array[0..2] of integer = (57,10,JustifyLeft);
   idCWEIGHT   : array[0..2] of integer = (68,8,JustifyRight);
   idPRICEPER  : array[0..2] of integer = (77,9,JustifyRight);
   idVALUE     : array[0..2] of integer = (87,14,JustifyRight);
   idLIVEWEIGHT : array[0..2] of integer = (102,15,JustifyRight);
   idTOTALDEDUCTIONS : array[0..2] of integer = (118,15,JustifyRight);

   //   17/10/18 [V5.8 R4.0] /MK Additional Feature - Added new consts for the ABP fields that are at different positions to the standard line length.
   idABPLenLWEIGHT   : array[0..2] of integer = (40,8,JustifyRight);
   idABPLenRWEIGHT   : array[0..2] of integer = (49,8,JustifyRight);
   idABPLenCONDEMNED : array[0..2] of integer = (59,10,JustifyLeft);
   idABPLenCWEIGHT   : array[0..2] of integer = (70,8,JustifyRight);
   idABPLenPRICEPER  : array[0..2] of integer = (79,9,JustifyRight);
   idABPLenVALUE     : array[0..2] of integer = (89,13,JustifyRight);

   idGBDNATIONAL  : array[0..2] of integer = (1,24,JustifyLeft);
   idGBDCARCASE   : array[0..2] of integer = (26,8,JustifyLeft);
   idGBDSEX       : array[0..2] of integer = (36,5,JustifyLeft);
   idGBDGRADE     : array[0..2] of integer = (42,4,JustifyLeft);
   idGBDLWEIGHT   : array[0..2] of integer = (49,7,JustifyRight);
   idGBDRWEIGHT   : array[0..2] of integer = (58,8,JustifyRight);
   idGBDCONDEMNED : array[0..2] of integer = (67,10,JustifyLeft);
   idGBDCWEIGHT   : array[0..2] of integer = (78,8,JustifyRight);
   idGBDPRICEPER  : array[0..2] of integer = (87,9,JustifyRight);
   idGBDVALUE     : array[0..2] of integer = (97,14,JustifyRight);
   idGBDLIVEWEIGHT : array[0..2] of integer = (112,15,JustifyRight);
   idGBDTOTALDEDUCTIONS : array[0..2] of integer = (128,15,JustifyRight);

   idDESCRIPTION : array[0..1] of integer = (1,19);
   idDETAILS     : array[0..1] of integer = (21,23);

   idDETAILAMT   : array[0..1] of integer = (2,7);
   idDETAILTYPE  : array[0..1] of integer = (8,4);
   idDETAILVALUE : array[0..1] of integer = (11,9);

   idDEDUCTED    : array[0..1] of integer = (50,16);
   idVAT         : array[0..1] of integer = (70,10);

constructor TBeefRemitCarcaseLine.Create(ABeefRemitCarcaseLineType : TBeefRemitCarcaseLineType);
begin
 FBeefRemitCarcaseLineType := ABeefRemitCarcaseLineType;
end;

destructor  TBeefRemitCarcaseLine.Destroy;
begin
 inherited;
end;

procedure   TBeefRemitCarcaseLine.Load(Line : String);
begin
 Line := Trim(Line);
 if FBeefRemitCarcaseLineType = clIrl then
    begin
       fsNational:=Trim(copy(Line,idNational[idStartPos],idNational[idLength]));
       fsCarcase:=Trim(copy(Line,idCarcase[idStartPos],idCarcase[idLength]));
       fsSex:=Trim(copy(Line,idSex[idStartPos],idSex[idLength]));
       fsGrade:=Trim(copy(Line,idGrade[idStartPos],idGrade[idLength]));

       //   08/01/19 [V5.8 R6.1] /MK Change - Dawn meats are now producing a file with an extra space before the tag number. This is
       //                                     off setting the grade so that a character before the grade i.e. the sex, is being included in the grade
       //                                     as well as a space and then the grade. We need to only take the grade - Aubrey Pearson/GL. 
       if ( Length(fsGrade) = 6 ) and ( Pos(' ',fsGrade) > 0 ) then
          fsGrade := Copy(fsGrade,Pos(' ',fsGrade)+1,Length(fsGrade)-Pos(' ',fsGrade)+1);

       //   17/10/18 [V5.8 R4.0] /MK Additional Feature - Check for length of the carcase line to see if file is an ABP or default line length.
       if ( Length(Line) = iABPCarcLineLength ) then
          begin
             try
                ffLWeight:=StrToFloatEx(Trim(copy(Line,idABPLenLWEIGHT[idStartPos],idABPLenLWEIGHT[idLength])));
             except
             end;

             try
                ffRWeight:=StrToFloatEx(Trim(copy(Line,idABPLenRWEIGHT[idStartPos],idABPLenRWEIGHT[idLength])));
             except
             end;

             try
                fsCondemned:=Trim(copy(Line,idABPLenCONDEMNED[idStartPos],idABPLenCONDEMNED[idLength]));
             except
             end;

             try
                ffCWeight:=StrToFloatEx(Trim(copy(Line,idABPLenCWEIGHT[idStartPos],idABPLenCWEIGHT[idLength])));
             except
             end;

             try
                ffPricePer:=StrToFloatEx(Trim(copy(Line,idABPLenPRICEPER[idStartPos],idABPLenPRICEPER[idLength])));
             except
             end;

             try
                ffValue:=StrToFloatEx(Trim(copy(Line,idABPLenVALUE[idStartPos],idABPLenVALUE[idLength])));
             except
             end;
          end
       else
          begin
             try
                ffLWeight:=StrToFloatEx(Trim(copy(Line,idLWeight[idStartPos],idLWeight[idLength])));
             except
             end;

             try
                ffRWeight:=StrToFloatEx(Trim(copy(Line,idRWeight[idStartPos],idRWeight[idLength])));
             except
             end;

             try
                fsCondemned:=Trim(copy(Line,idCondemned[idStartPos],idCondemned[idLength]));
             except
             end;

             try
                ffCWeight:=StrToFloatEx(Trim(copy(Line,idCWeight[idStartPos],idCWeight[idLength])));
             except
             end;

             try
                ffPricePer:=StrToFloatEx(Trim(copy(Line,idPricePer[idStartPos],idPricePer[idLength])));
             except
             end;

             try
                ffValue:=StrToFloatEx(Trim(copy(Line,idValue[idStartPos],idValue[idLength])));
             except
             end;

             try
                ffLiveWeight:=StrToFloatEx(Trim(copy(Line,idLIVEWEIGHT[idStartPos],idLIVEWEIGHT[idLength])));
             except
             end;

             try
                ffTotalDeductions:=StrToFloatEx(Trim(copy(Line,idTOTALDEDUCTIONS[idStartPos],idTOTALDEDUCTIONS[idLength])));
             except
             end;
          end;
    end
 else if FBeefRemitCarcaseLineType = clGB then
    begin
       fsNational:=Trim(copy(Line,idGBDNational[idStartPos],idGBDNational[idLength]));
       fsCarcase:=Trim(copy(Line,idGBDCarcase[idStartPos],idGBDCarcase[idLength]));
       fsSex:=Trim(copy(Line,idGBDSex[idStartPos],idGBDSex[idLength]));
       fsGrade:=Trim(copy(Line,idGBDGrade[idStartPos],idGBDGrade[idLength]));

       try
        ffLWeight:=StrToFloatEx(Trim(copy(Line,idGBDLWeight[idStartPos],idGBDLWeight[idLength])));
       except
       end;

       try
       ffRWeight:=StrToFloatEx(Trim(copy(Line,idGBDRWeight[idStartPos],idGBDRWeight[idLength])));
       except
       end;

       fsCondemned:=Trim(copy(Line,idGBDCondemned[idStartPos],idGBDCondemned[idLength]));

       try
       ffCWeight:=StrToFloatEx(Trim(copy(Line,idGBDCWeight[idStartPos],idGBDCWeight[idLength])));
       except
       end;

       try
        ffPricePer:=StrToFloatEx(Trim(copy(Line,idGBDPricePer[idStartPos],idGBDPricePer[idLength])));
       except
       end;

       try
        ffValue:=StrToFloatEx(Trim(copy(Line,idGBDValue[idStartPos],idGBDValue[idLength])));
       except
       end;

       try
        ffLiveWeight:=StrToFloatEx(Trim(copy(Line,idGBDLIVEWEIGHT[idStartPos],idGBDLIVEWEIGHT[idLength])));
       except
       end;

       try
        ffTotalDeductions:=StrToFloatEx(Trim(copy(Line,idGBDTOTALDEDUCTIONS[idStartPos],idGBDTOTALDEDUCTIONS[idLength])));
       except
       end;
    end;
end;

function   TBeefRemitCarcaseLine.Save : String;
var
   s : string;
begin

   if FBeefRemitCarcaseLineType = clIrl then
      begin
         s:=trim(fsNational);
         s:=PadString(s,#32,idNational[idLength],idNational[idJustify]=JustifyLeft);
         Result:=S;
         Result:=PadRight(Result,#32,idCarcase[idStartPos]-1);

         s:=trim(fsCarcase);
         s:=PadString(s,#32,idCarcase[idLength],idCarcase[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idSex[idStartPos]-1);

         s:=trim(fsSex);
         s:=PadString(s,#32,idSex[idLength],idSex[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGrade[idStartPos]-1);

         s:=trim(fsGrade);
         s:=PadString(s,#32,idGrade[idLength],idGrade[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idLWeight[idStartPos]-1);

         s:=trim(format('%.1f',[ffLWeight]));
         s:=PadString(s,#32,idLWeight[idLength],idLWeight[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idRWeight[idStartPos]-1);

         s:=trim(format('%.1f',[ffRWeight]));
         s:=PadString(s,#32,idRWeight[idLength],idRWeight[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idCondemned[idStartPos]-1);

         s:=trim(fsCondemned);
         s:=PadString(s,#32,idCondemned[idLength],idCondemned[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idCWeight[idStartPos]-1);

         s:=trim(format('%.1f',[ffCWeight]));
         s:=PadString(s,#32,idCWeight[idLength],idCWeight[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idPricePer[idStartPos]-1);

         s:=trim(format('%.3f',[ffPricePer]));
         s:=PadString(s,#32,idPricePer[idLength],idPricePer[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idValue[idStartPos]-1);

         s:=trim(format('%.2f',[ffValue]));
         s:=PadString(s,#32,idValue[idLength],idValue[idJustify]=JustifyLeft);

         s:=trim(format('%.2f',[ffLiveWeight]));
         s:=PadString(s,#32,idLIVEWEIGHT[idLength],idLIVEWEIGHT[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idLIVEWEIGHT[idStartPos]-1);

         s:=trim(format('%.2f',[ffTotalDeductions]));
         s:=PadString(s,#32,idTOTALDEDUCTIONS[idLength],idTOTALDEDUCTIONS[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idTOTALDEDUCTIONS[idStartPos]-1);

         Result:=Result+S;
      end
   else
      begin
         s:=trim(fsNational);
         s:=PadString(s,#32,idGBDNational[idLength],idGBDNational[idJustify]=JustifyLeft);
         Result:=S;
         Result:=PadRight(Result,#32,idGBDCarcase[idStartPos]-1);

         s:=trim(fsCarcase);
         s:=PadString(s,#32,idGBDCarcase[idLength],idGBDCarcase[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGBDSex[idStartPos]-1);

         s:=trim(fsSex);
         s:=PadString(s,#32,idGBDSex[idLength],idGBDSex[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGBDGrade[idStartPos]-1);

         s:=trim(fsGrade);
         s:=PadString(s,#32,idGBDGrade[idLength],idGBDGrade[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGBDLWeight[idStartPos]-1);

         s:=trim(format('%.1f',[ffLWeight]));
         s:=PadString(s,#32,idGBDLWeight[idLength],idGBDLWeight[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGBDRWeight[idStartPos]-1);

         s:=trim(format('%.1f',[ffRWeight]));
         s:=PadString(s,#32,idRWeight[idLength],idRWeight[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idCondemned[idStartPos]-1);

         s:=trim(fsCondemned);
         s:=PadString(s,#32,idGBDCondemned[idLength],idGBDCondemned[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGBDCWeight[idStartPos]-1);

         s:=trim(format('%.1f',[ffCWeight]));
         s:=PadString(s,#32,idGBDCWeight[idLength],idGBDCWeight[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGBDPricePer[idStartPos]-1);

         s:=trim(format('%.3f',[ffPricePer]));
         s:=PadString(s,#32,idGBDPricePer[idLength],idGBDPricePer[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGBDValue[idStartPos]-1);

         s:=trim(format('%.2f',[ffValue]));
         s:=PadString(s,#32,idGBDValue[idLength],idGBDValue[idJustify]=JustifyLeft);

         s:=trim(format('%.2f',[ffLiveWeight]));
         s:=PadString(s,#32,idGBDLIVEWEIGHT[idLength],idGBDLIVEWEIGHT[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGBDLIVEWEIGHT[idStartPos]-1);

         s:=trim(format('%.2f',[ffTotalDeductions]));
         s:=PadString(s,#32,idGBDTOTALDEDUCTIONS[idLength],idGBDTOTALDEDUCTIONS[idJustify]=JustifyLeft);
         Result:=Result+S;
         Result:=PadRight(Result,#32,idGBDTOTALDEDUCTIONS[idStartPos]-1);

         Result:=Result+S;
      end;
end;

procedure   TBeefRemitCarcaseLine.SetStringNational(Value : String);
begin
 if Value<>'' then
  fsNational:=Value;
end;

procedure   TBeefRemitCarcaseLine.SetStringCarcase(Value : String);
begin
 if Value<>'' then
  fsCarcase:=Value;
end;

procedure   TBeefRemitCarcaseLine.SetStringSex(Value : String);
begin
 if Value<>'' then
  fsSex:=Value;
end;

procedure   TBeefRemitCarcaseLine.SetStringGrade(Value : String);
begin
 if Value<>'' then
  fsGrade:=Value;
end;

procedure   TBeefRemitCarcaseLine.SetFloatLWeight(Value : Double);
begin
 ffLWeight:=Value;
end;

procedure   TBeefRemitCarcaseLine.SetFloatRWeight(Value : Double);
begin
 ffRWeight:=Value;
end;

procedure   TBeefRemitCarcaseLine.SetStringCondemned(Value : String);
begin
 fsCondemned:=Value;
end;

procedure   TBeefRemitCarcaseLine.SetFloatCWeight(Value : Double);
begin
 ffCWeight:=Value;
end;

procedure   TBeefRemitCarcaseLine.SetFloatPricePer(Value : Double);
begin
 ffPricePer:=Value;
end;

procedure   TBeefRemitCarcaseLine.SetFloatValue(Value : Double);
begin
 ffValue:=Value;
end;

procedure TBeefRemitCarcaseLine.SetLiveWeightValue(const Value: Double);
begin
  ffLiveWeight := Value;
end;

procedure TBeefRemitCarcaseLine.SetTotalDeductions(const Value: Double);
begin
  ffTotalDeductions := Value;
end;


{-----------------------------------------------------
  [daz]
 -----------------------------------------------------}

constructor TBeefRemitDeductionLine.Create;
begin
 inherited;
end;

destructor  TBeefRemitDeductionLine.Destroy;
begin
 inherited;
end;

{   idDESCRIPTION : array[0..1] of integer = (1,19);
   idDETAILS     : array[0..1] of integer = (21,23);

   idDETAILAMT   : array[0..1] of integer = (2,7);
   idDETAILTYPE  : array[0..1] of integer = (8,4);
   idDETAILVALUE : array[0..1] of integer = (11,9);

   idDEDUCTED    : array[0..1] of integer = (50,16);
   idVAT         : array[0..1] of integer = (70,10);}


procedure   TBeefRemitDeductionLine.Load(s : string);
begin
 s:=trim(s);
 fsDescription:=trim(copy(s,idDESCRIPTION[idStartPos],idDESCRIPTION[idLength]));
 fsDetails:=trim(copy(s,idDETAILS[idStartPos],idDETAILS[idLength]));
 try
  ffDeducted:=StrToFloatEx(trim(copy(s,idDEDUCTED[idStartPos],idDEDUCTED[idLength])));
 except
  ffDeducted:=0;
 end;

 try
  ffVat:=StrToFloatEx(trim(copy(s,idVAT[idStartPos],idDEDUCTED[idLength])));
 except
  ffVat:=0;
 end;

 s:=trim(copy(s,idDETAILS[idStartPos],idDETAILS[idLength]));

 try
  ffDetailAmt:=StrToFloatEx(trim(copy(s,idDETAILAMT[idStartPos],idDETAILAMT[idLength])));
 except
  ffDetailAmt:=0;
 end;

 fsDetailType:=trim(copy(s,idDETAILTYPE[idStartPos],idDETAILTYPE[idLength]));

 try
  ffDetailValue:=StrToFloatEx(trim(copy(s,idDETAILVALUE[idStartPos],idDETAILVALUE[idLength])));
 except
  ffDetailValue:=0;
 end;

end;

end.
