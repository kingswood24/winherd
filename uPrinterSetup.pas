unit uPrinterSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxListBox, StdCtrls, cxButtons, cxEdit, cxLabel;

type
  TfmPrinterSetup = class(TForm)
    ListBox: TcxListBox;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    lDefaultPrinter: TcxLabel;
    btnPrinterHandle: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnPrinterHandleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowPrinterSetup;
  end;

var
  fmPrinterSetup: TfmPrinterSetup;

implementation

uses uPrinters, Printers;

{$R *.DFM}

procedure TfmPrinterSetup.FormCreate(Sender: TObject);
begin
   EnumPrinters(ListBox.Items);
   lDefaultPrinter.Caption := GetPrinter;
end;

procedure TfmPrinterSetup.cxButton1Click(Sender: TObject);
begin

   if ListBox.ItemIndex > -1 then
      begin

         SetDefaultPrinter(ListBox.Items[ListBox.ItemIndex]);
         lDefaultPrinter.Caption := GetPrinter;
      end
   else
      ShowMessage('No printer selected');

end;

class procedure TfmPrinterSetup.ShowPrinterSetup;
begin
   with TfmPrinterSetup.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmPrinterSetup.btnPrinterHandleClick(Sender: TObject);
begin
   ShowMessage( 'Name: '+ Printers.Printer.Printers[Printers.Printer.PrinterIndex] + ' , Index: '+IntToStr(Printers.Printer.PrinterIndex) + ', HDC: '+IntToStr(Printers.Printer.Handle));
end;

end.
