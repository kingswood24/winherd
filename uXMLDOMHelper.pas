unit uXMLDOMHelper;

interface
uses
  MSXML2_TLB, ComObj;

type
  TXMLDOMHelper = class
  public
     class function LoadDocument(AFileName : string; ACreateASync : Boolean = False) : IXMLDOMDocument;
  end;

implementation
uses
   Sysutils;

{ TXMLDOMHelper }

class function TXMLDOMHelper.LoadDocument(
  AFileName: string; ACreateASync : Boolean): IXMLDOMDocument;
begin
   if not FileExists(AFileName) then
      raise Exception.CreateFmt('File does not exist "%s"',[AFileName]);

   Result := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   Result.async := ACreateASync;
   Result.load(AFileName);
end;

end.
