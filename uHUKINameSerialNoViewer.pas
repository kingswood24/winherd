{
  22/01/16 [V5.5 R2.3] /MK Change - HUKI have a redirect problem with their URL so I need to change the URL to dairyfacts.co.uk.
}

unit uHUKINameSerialNoViewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Db, dxmdaset,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls,
  RxLookup, ExtCtrls, TB97Ctls, RXCtrls, ComCtrls, ToolWin, MSXML2_TLB,
  OleServer, ComObj;

type
  TfmHUKINameSerialNoViewer = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton6: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    XMLSerialNoData: TdxMemData;
    XMLSerialNoDataName: TStringField;
    XMLSerialNoDataSerialNo: TIntegerField;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1Name: TcxGridDBColumn;
    cxGrid1DBTableView1SerialNo: TcxGridDBColumn;
    DataSource1: TDataSource;
    procedure sbExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    MyXMLHTTP     : IXMLHTTPRequest;
    XMLResponse : String;
    FXMLData : WideString;

    procedure LoadDatasetFromXML;
  public
    { Public declarations }
    class procedure ShowForm( var ALogIn : Boolean );
  end;

var
  fmHUKINameSerialNoViewer: TfmHUKINameSerialNoViewer;

implementation

uses uHUKIRegistrationLogin, GenTypesConst, kRoutines;

{$R *.DFM}

{ TfmHUKINameSerialNoViewer }

class procedure TfmHUKINameSerialNoViewer.ShowForm( var ALogIn : Boolean );
var
   bConnected : Boolean;
begin
   with TfmHUKINameSerialNoViewer.Create(nil) do
      try
         ConnectToNet(bConnected);

         if bConnected then
            begin

               if ALogIn then
                  begin
                     if not THUKIRegistrationLogin.CalfRegistrationLogin then
                        begin
                           Update;
                           MessageDlg('HUK Calf Registration login failed.',mtError,[mbOK],0);
                        end
                     else
                        begin
      //                     LoginTimer.Enabled := True;
                           ALogIn := False;
                        end;
                  end;

               if not ALogIn then // logged on
                  begin
                     MyXMLHTTP := CreateOleObject('MSXML2.XMLHTTP.3.0') as IXMLHTTPRequest;
                     // Test Server         MyXMLHTTP.open('POST', 'http://195.153.22.94/CalfRegistration/MaxSerNoList.asp', FALSE, EmptyParam, EmptyParam);
                     MyXMLHTTP.open('POST', 'http://'+HUKINewServerIPAdd+'/CalfRegistration/MaxSerNoList.asp', FALSE, EmptyParam, EmptyParam);

                     MyXMLHTTP.Send(EmptyParam);

                     if ( MyXMLHTTP.Status = 200 ) then
                        begin
                           XMLResponse := MyXMLHTTP.responseText;
                        end
                     else
                        begin
                           ShowMessage('Error: ' + IntToStr( MyXMLHTTP.Status ) + ' - ' + MyXMLHTTP.statusText);
                           SysUtils.Abort;
                        end;

                     if XMLResponse <> '' then
                        begin
                           FXMLData := XMLResponse;
                           LoadDatasetFromXML;
                           ShowModal;
                        end
                     else
                        ShowMessage('Unexpected response from HUK Server.');
                  end;

            end
         else
            MessageDlg(cINTERNET_CONNECTION_NOT_ESTABLISHED,mtError,[mbOK],0);

      finally
         Free;
      end;
end;

procedure TfmHUKINameSerialNoViewer.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmHUKINameSerialNoViewer.LoadDatasetFromXML;
var
   MyDOMDocument : IXMLDOMDocument;
   XMLDOMNode : IXMLDOMNode;
   XMLDOMNodeList : IXMLDOMNodeList;
   i : Integer;
   Name : String;
   SerialNo : Integer;
begin
    XMLSerialNoData.Close;
     XMLSerialNoData.Open;
   MyDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   MyDOMDocument.loadXML(Trim(FXMLData));

   XMLDOMNode := MyDOMDocument.documentElement;
   if XMLDOMNode <> nil then
      begin
         XMLDOMNodeList := XMLDOMNode.selectNodes('DAM');
         if XMLDOMNodeList <> nil then
            try
               XMLSerialNoData.DisableControls;
               for i := 0 to XMLDOMNodeList.length-1 do
                  begin
                     Name := XMLDOMNodeList[i].childNodes[0].text;
                     try
                        SerialNo := StrToInt(XMLDOMNodeList[i].childNodes[1].text);
                     except
                        SerialNo := -1;
                     end;
                     XMLSerialNoData.Append;
                     XMLSerialNoDataName.AsString := Name;
                     XMLSerialNoDataSerialNo.AsInteger := SerialNo;
                     XMLSerialNoData.Post;
                  end;
            finally
               XMLSerialNoData.First;
               XMLSerialNoData.EnableControls;
            end;
      end;
end;

procedure TfmHUKINameSerialNoViewer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    XMLSerialNoData.Close;

end;

end.
