ECHO ON
CD\
CD "Kingswood"
CD "Delphi Development"
CD "Delphi 5"
CD "Herd"
CD "Development"
DEL WINHERD.RES
CD\
CD "Program Files (x86)"
CD "Borland"
CD "Delphi5"
CD "Bin"
DEL WINHERD.RES
BRCC32 WINHERD.RC -fo WINHERD.REC
ECHO OFF