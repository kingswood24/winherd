�
 TFSALESREP 0�M TPF0
TfSalesRep	fSalesRepLeft�Top� 
AutoScrollCaptionCattle MarginsClientHeightClientWidth�Color	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style OldCreateOrder	PositionpoScreenCenterScaled
OnActivateFormActivateOnCreate
FormCreate	OnDestroyFormDestroyOnShowFormShowPixelsPerInch`
TextHeight TPanel	pSalesRepLeft Top5Width�Height�AlignalClient
BevelOuterbvNoneTabOrder  TLabellWaitLeftTop�WidthMHeightCaptionPlease WaitFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameVerdana
Font.Style 
ParentFontVisible  TRadioGroupgOrderLeft�TopSWidth� HeightNCaption
Sort Order	ItemIndex Items.Strings
As&cending&Descending TabOrderTabStop	  TRadioGroupgSortByLeftTopSWidth�HeightNCaptionSort ByColumns	ItemIndex Items.Strings&Animal Number&National Identity Number&National Identity Check Digit&Sales Date&Days On Farm&Live Weight TabOrderTabStop	  TPanelpSupplierCustomerLeftTopJWidth� Height� 
BevelInnerbvRaised
BevelOuter	bvLoweredTabOrder TLabel	lSupplierLeftTop/Width4HeightCaptionSupplier  TLabelLabel9LeftTop{Width>HeightCaptionCustomer  TLabelLabel12LeftTopUWidth%HeightCaptionBuyer  TLabelLabel6LeftTopWidth� HeightCaption!Limit Animals Purchased/Sold to :  TRxDBLookupCombo
cbSupplierLeftGTop+Width� HeightDropDownCountDisplayEmpty<All>
EmptyValue0LookupFieldIDLookupDisplayNameLookupSourceWinData.dsQuerySuppliersTabOrder   TRxDBLookupCombo
cbCustomerLeftGTopwWidth� HeightDropDownCountDisplayEmpty<All>
EmptyValue0LookupFieldIDLookupDisplayNameLookupSourceWinData.dsQueryCustomersTabOrder  TRxDBLookupCombocbBuyerLeftGTopQWidth� HeightDropDownCountDisplayEmpty<All>
EmptyValue0LookupFieldIDLookupDisplayNameLookupSourceWinData.dsQueryBuyersTabOrder   TPanelpPurchaseDatesLeft� Top3Width�Height
BevelInnerbvRaised
BevelOuter	bvLoweredTabOrderVisible TLabelLabel10Left7TopWidthHeightCaptionTo  TLabelLabel11LeftTopWidth� Height	AlignmenttaRightJustifyCaptionPurchase Date From  	TDateEditToPurchDateLeftVTopWidthoHeight	NumGlyphsWeekendsSunSat 
YearDigitsdyFourTabOrder  	TDateEditFromPurchDateLeft� TopWidthoHeight	NumGlyphsWeekendsSunSat 
YearDigitsdyFourTabOrder    TPanel
pSaleDatesLeft� TopWidth�Height
BevelInnerbvRaised
BevelOuter	bvLoweredTabOrder	Visible TLabelSwitchLabelLeftTopWidtheHeight	AlignmenttaRightJustifyCaptionSale Date From  TLabelLabel2Left7TopWidthHeightCaptionTo  	TDateEditFromDateLeft� TopWidthoHeight	NumGlyphsWeekendsSunSat 
YearDigitsdyFourTabOrder   	TDateEditToDateLeftVTopWidthoHeight	NumGlyphsWeekendsSunSat 
YearDigitsdyFourTabOrder   	TCheckBoxcbSalesLeftTopWidth� HeightCaptionSold Animals OnlyTabOrderOnClickcbSalesClick  	TCheckBoxcbPurchLeftTop:Width� HeightCaptionPurchased Animals OnlyTabOrder
OnClickcbPurchClick  TRadioGrouprgSexLeft� Top� Width�Height$ColumnsItems.Strings
Bulls OnlySteers OnlyFemale Only TabOrderVisible  	TCheckBoxcbSexLeftTop� Width� HeightCaptionLimit Animals By SexTabOrderOnClick
cbSexClick  TcxGroupBoxgbGradeFilterLeftTopCCaptionFilter By Sale GradesStyle.LookAndFeel.KindlfFlatStyleDisabled.LookAndFeel.KindlfFlatStyleFocused.LookAndFeel.KindlfFlatStyleHot.LookAndFeel.KindlfFlatTabOrderHeightLWidth� TLabelLabel15Left
TopWidth&HeightCaptionGrade  TLabelLabel16Left� TopWidthAHeightCaption	Fat Score  	TCheckBoxcbFilterBySaleGradeLeft� TopWidthHeight	AlignmenttaLeftJustifyTabOrder OnClickcbFilterBySaleGradeClick  TcxCheckComboBoxccbSaleGradesLeft
Top&EnabledProperties.Delimiter|Properties.DropDownSizeable	Properties.ImmediatePost	Properties.Items Style.LookAndFeel.Kind
lfStandardStyleDisabled.LookAndFeel.Kind
lfStandardStyleFocused.LookAndFeel.Kind
lfStandardStyleHot.LookAndFeel.Kind
lfStandardTabOrderWidth�   TcxCheckComboBoxccbSaleWeightsLeft� Top&EnabledProperties.Delimiter|Properties.ImmediatePost	Properties.Items Style.LookAndFeel.Kind
lfStandardStyleDisabled.LookAndFeel.Kind
lfStandardStyleFocused.LookAndFeel.Kind
lfStandardStyleHot.LookAndFeel.Kind
lfStandardTabOrderWidth�    TcxCheckBoxcbFavouriteLeftTop.AutoSizeCaptionAdd Report As FavouriteProperties.OnChangecbFavouritePropertiesChangeTabOrderHeightWidth�   TcxRadioGrouprgShowSuppOrBuyerLeftTop� BiDiModebdLeftToRightCaptionShow:ParentBiDiModeProperties.ColumnsProperties.ItemsCaptionBuyer CaptionSupplier  	ItemIndex Style.BorderStyleebsFlatStyle.TransparentBorder	TabOrderHeight/Width�  TPanelpInfoLeftTopWidth�Height
BevelInner	bvLowered
BevelOuterbvNoneTabOrder  TLabelLabel8LeftTopWidth�HeightAlignalClient	AlignmenttaCenterCaption�NOTE:  Due to the extensive processing that occurs in this report for 
every animal selected, this report will take some time to be displayedFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameVerdana
Font.Style 
ParentFont   	TCheckBoxcbUseFilterLeft�Top0Width� HeightCaptionApply Animal Grid FilterTabOrderOnClickcbUseFilterClick  	TQuickRepqrCattleMarginsLeft�TopWidthcHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSet	qSalesRepFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.OrientationpoLandscapePage.PaperSizeA4Page.Values       �@      @�
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.OutputBinAutoPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage "PrinterSettings.UseStandardprinter PrinterSettings.UseCustomBinCodePrinterSettings.CustomBinCode PrinterSettings.ExtendedDuplex "PrinterSettings.UseCustomPaperCodePrinterSettings.CustomPaperCode PrinterSettings.PrintMetaFilePrintIfEmpty	
SnapToGrid	UnitsMMZoomdPrevFormStylefsNormalPreviewInitialStatewsMaximized TQRBandQRBand2Left&Top&WidthHeight� Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightFrame.WidthAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������ҿ@      #�
@ BandTyperbColumnHeader TQRLabel
TitleLabelLeftTopWidth� Height#Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU5�@������*�@��������@������z�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionCattle MarginsColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameTimes New Roman
Font.StylefsItalicfsUnderline 
ParentFontTransparentWordWrap	FontSize  TQRShape	QRShape27Left�Top.WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@VXUUUUU��痪���j�@��������
@ Shape
qrsHorLine
VertAdjust   TQRLabel	SortLabelLeftWTopWidth(HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      c�
@       �@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption	SortLabelColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel
OrderLabelLeftWTopWidth.HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      c�
@��������@������j�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
OrderLabelColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabelSortOptionsLabelLeftTopWidth7HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      w�
@       �@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionOrdered By :ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  
TQRSysData
QRSysData1Left�TopWidth[HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@��������
@       �@TUUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeColorclWhiteDataqrsDateTimeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTextDate : TransparentFontSize  
TQRSysData
QRSysData2Left�TopWidth[HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@��������
@��������@TUUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeColorclWhiteDataqrsPageNumberFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTextPage : TransparentFontSize  TQRShape	QRShape28Left Top� WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@          ZUUUU5�@��������
@ 	Pen.WidthShape
qrsHorLine
VertAdjust   TQRShape	QRShape29Left Top WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@                    ��������
@ 	Pen.WidthShape
qrsHorLine
VertAdjust   TQRLabel	QRLabel20Left� TopWidth%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUU��@       �@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption	Supplier:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabelSupplierLabelLeft� TopWidth4HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUUe�@       �@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionAll SuppliersColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel
BuyerLabelLeft� TopWidth,HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUUe�@��������@VUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
All BuyersColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel23Left� TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUU��@��������@UUUUUUu�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionBuyer:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel24Left� Top"Width-HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUU��@�������@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption	Customer:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabelCustomerLabelLeft� Top"Width<HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUUe�@�������@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionAll CustomersColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel26LeftfTopWidth4HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUU��@��������@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionSales From:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel27Left�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      ��	@��������@������*�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTo:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel28LeftfTop"WidthIHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUU��@�������@UUUUUU%�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionPurchases From:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel29Left�Top"WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      ��	@�������@������*�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTo:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel	lSaleFromLeft�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      ��	@��������@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption.  /  /    ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel
lPurchFromLeft�Top"Width"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      ��	@�������@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption.  /  /    ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabellSaleToLeft�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@�������	@��������@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption.  /  /    ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabellPurchToLeft�Top"Width"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@�������	@�������@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption.  /  /    ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel35LeftfTopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUU��@       �@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionSex:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabellSexTypeLeft�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      ��	@       �@VUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionAllColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRShape	QRShape30LeftuTop8WidthHeightWFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      0�@      Y�
@�����*�@RFUUUUU�@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape31Left�Top8WidthHeightWFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      0�@      �	@�����*�@RFUUUUU�@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape32LeftTop8WidthHeightWFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      0�@      ��	@�����*�@RFUUUUU�@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape33Left�Top8WidthHeightWFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      0�@aUUUU��	@�����*�@RFUUUUU�@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape34Left� Top8WidthHeightWFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      0�@������@�����*�@RFUUUUU�@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape35Left� Top8WidthHeightWFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      0�@�������@�����*�@RFUUUUU�@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRLabel	QRLabel37Left*TopfWidth?Height!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@     @�@      ��@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption
Tag NumberColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel38Left� TopfWidth"Height!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ZUUUU]�@      ��@k������@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionPurch PriceColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel39Left"TopfWidth Height!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�����ҿ@      ��@�\UUUUU�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionPurch CostsColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel40Left�TopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@aUUUU��	@      ��@k�����
�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionOtherColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel41LeftTopfWidth%Height!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUUU�@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption
Animal No.ColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel42LeftGTopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      L�@      ��@      ��@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionFeedColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel43Left�TopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@𞪪��6�	@      ��@      ��@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionDays On FarmColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel44Left�Top[WidthHeight,Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValueshUUUU��@aUUUUy�	@�KUUUU��@      ��@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionAv Daily Wt GainColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel45Left�Top[WidthHeight,Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValueshUUUU��@aUUUUe�	@�KUUUU��@k�����
�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionFarm Costs Per DayColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel46Left
TopfWidth#Height!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      ��	@      ��@�QUUUU5�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption	Sale DateColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel47Left5TopfWidth#Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUUU�@������ܺ	@      ��@UUUUUU5�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption
Sale PlaceColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel48Left`TopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@aUUUU�	@      ��@�QUUUUu�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionLive WtColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel49Left�TopfWidthHeight#Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ XUUUU��	@      ��@k�����*�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionGradeColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel50Left�TopfWidth Height!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@aUUUU��	@      ��@�\UUUUU�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaption	Kill Out%ColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel51Left�TopfWidthHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@𞪪����	@      ��@�QUUUUu�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionDead WtColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel52Left�TopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      �	@      ��@k�����J�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionPrice Per KgColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel53LeftTopfWidth'Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@𞪪��R�	@      ��@      `�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaption
Sale PriceColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel54Left.TopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@xOUUUU��
@      ��@�QUUUUu�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaption
Sale CostsColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel55LeftPTopfWidth"Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@������:�
@      ��@k������@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionNet Sale PriceColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel56LeftzTopfWidth'Height!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@������,�
@      ��@      `�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionTotal IncomeColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel57Left�TopfWidth"Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@�������
@      ��@k������@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionTotal CostsColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel58Left�TopfWidth"Height!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�������
@      ��@k������@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaption
Net MarginColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel59Left�TopXWidth)Height/Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValueshUUUU��@      1�
@�KUUUU��@hUUUU��@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionNet Margin Per Day On FarmColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel60LeftTop8Width{Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUUU�@)�����*�@�����*�@      ��@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionAnimal IdentifiersColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel61Left� Top8WidthHHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@      ��@�����*�@      ��@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionAcquisition CostsColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel62Left� Top8WidthIHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@��������@�����*�@�KUUUU%�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionPurchase DetailsColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel63LeftTop8Width� Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@𞪪����	@�����*�@�������@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionDisposal Date/Place & QualityColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel64LeftTop8WidthoHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@𞪪��R�	@�����*�@      ؒ@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionSales Income & CostsColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel65Left|Top8Width� Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@xOUUUU��
@�����*�@      x�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaption#Final Income & Expenditure AnalysisColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel66Left�Top8WidthYHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@𞪪��6�	@�����*�@�����z�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaption
StatisticsColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel67LefthTopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@       �@      ��@UUUUUUu�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionVetColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel68Left� TopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ZUUUU��@      ��@k�����
�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionPurch WtColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelqrlBuyerSupplierLeft� TopgWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      0�@������B�@      ��@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionBuyerColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShape	QRShape36LeftCTop8WidthHeightWFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      0�@�������@�����*�@RFUUUUU�@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRLabel	QRLabel70LeftUTop8WidthHHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUUU�@�������@�����*�@      ��@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaption
Farm CostsColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel71Left� TopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�������@      ��@      @�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionSexColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabellGradesTitleLeft.TopWidth$HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      ��	@       �@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionlGradesTitleColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabellWeightsTitleLeft.TopWidth$HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      ��	@��������@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionlWeightsTitleColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabellGradesLeftVTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@��������	@       �@      �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionlGradesColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabellWeightsLeftVTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@��������	@��������@      �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionlWeightsColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel76LeftwTopfWidthHeight!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUUm�@      ��@������*�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchCaptionBreedColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel17LeftTop"Width7HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      w�
@�������@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionHerd Name :ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabelqrlHerdNameLeftWTop"Width=HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      c�
@�������@UUUUUUe�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionqrlHerdNameColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBandQRBand4Left&Top� WidthHeight|Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������
�@      #�
@ BandType	rbSummary TQRLabel	QRLabel77LeftTopWidth%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUU��@      ��@k������@k�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption	Totals : ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel78LeftTopPWidth*HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUU��@      ��@�������@      @�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption	Average: ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShape	QRShape45Left� Top WidthHeight|Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������
�@�������@                 �@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape46Left� Top WidthHeight|Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������
�@������@                 �@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape47Left�Top WidthHeight|Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������
�@aUUUU��	@                 �@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape48LeftTop WidthHeight|Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������
�@      ��	@                 �@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape49Left�TopWidthHeight|Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������
�@      �	@UUUUUUU�@       �@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape50LeftuTop WidthHeight|Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������
�@      Y�
@                 �@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRExprQRExpr40Left� TopWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@�����
�@      ��@hUUUU�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.PurchPrice)Mask####0.00FontSize  TQRExprQRExpr41Left?TopWidth$HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@aUUUU�@      ��@      ��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.FeedCosts)Mask####0.00FontSize  TQRExprQRExpr42Left�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      �	@      ��@      ��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.DaysOnFarm)Mask###0FontSize  TQRExprQRExpr43LeftTop"Width&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@�����޹@k������@hUUUU�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.PurchCosts)Mask####0.00FontSize  TQRExprQRExpr44Left~TopWidth,HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@�=UUUU��@      ��@hUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.OtherCosts)Mask####0.00FontSize  TQRExprQRExpr45Left�Top0Width2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      Ț	@       �@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.FarmCostsPerDay)Mask####0.00FontSize  TQRExprQRExpr46Left�Top"Width'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@      Ԕ	@�������@      `�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.AvDailyWtGain)Mask##0.00FontSize  TQRExprQRExpr47LeftJTopWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@𞪪����	@      ��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.LiveWt)Mask####0.00FontSize  TQRExprQRExpr48LeftkTop"Width2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@𞪪����	@k������@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.DeadWt)Mask####0.00FontSize  TQRExprQRExpr49LeftATop0Width2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@��������
@       �@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.NetSalePrice)Mask####0.00FontSize  TQRExprQRExpr50LeftTop"Width2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@xOUUUU"�
@k������@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.SaleCosts)Mask####0.00FontSize  TQRExprQRExpr51Left�Top"Width2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      O�
@k������@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.TotalCosts)Mask####0.00FontSize  TQRExprQRExpr52Left�TopWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@𞪪��\�	@      ��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.SalePrice)Mask####0.00FontSize  TQRExprQRExpr53Left�TopWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@�������
@      ��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.NetMargin)Mask####0.00FontSize  TQRExprQRExpr54LeftoTopWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      [�
@      ��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.TotalIncome)Mask####0.00FontSize  TQRExprQRExpr55Left�Top"Width2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@UUUUUUޤ
@�������@������J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.NetMarginPerDay)Mask####0.00FontSize  TQRExprQRExpr56Left� TopHWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@�����
�@      ��@hUUUU�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.PurchPrice)Mask####0.00FontSize  TQRExprQRExpr57LeftTopXWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@�����޹@�KUUUU��@hUUUU�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.PurchCosts)Mask####0.00FontSize  TQRExprQRExpr58Left9TopHWidth,HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@�KUUUU	�@      ��@hUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.FeedCosts)Mask####0.00FontSize  TQRExprQRExpr59Left}TopHWidth,HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      �@      ��@hUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.OtherCosts)Mask####0.00FontSize  TQRExprQRExpr60Left�TopHWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@aUUUU��	@      ��@�QUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.DaysOnFarm)Mask###0FontSize  TQRExprQRExpr61Left�TopXWidth%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@𞪪��(�	@�KUUUU��@k�������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
Expression AVERAGE(qSalesRep.AvDailyWtGain)Mask#0.00FontSize  TQRExprQRExpr62Left�TopeWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@aUUUUq�	@ZUUUU��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
Expression"AVERAGE(qSalesRep.FarmCostsPerDay)Mask####0.00FontSize  TQRExprQRExpr63LeftJTopHWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@𞪪����	@      ��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.LiveWt)Mask####0.00FontSize  TQRExprQRExpr64LeftkTopXWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@𞪪����	@hUUUU��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.DeadWt)Mask####0.00FontSize  TQRExprQRExpr65Left�TopHWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@𞪪����	@      ��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
Expression<AVERAGE(qSalesRep.DeadWt) * 100  / AVERAGE(qSalesRep.LiveWt)Mask#0.00'%'FontSize  TQRExprQRExpr66Left�TopXWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@𞪪��x�	@�KUUUU��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.PricePerKg)Mask####0.00FontSize  TQRExprQRExpr67Left�TopHWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@aUUUU��	@      ��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.SalePrice)Mask####0.00FontSize  TQRExprQRExpr68LeftTopXWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@������͂
@�KUUUU��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.SaleCosts)Mask####0.00FontSize  TQRExprQRExpr69LeftBTopeWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      �
@ZUUUU��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.NetSalePrice)Mask####0.00FontSize  TQRExprQRExpr70LeftoTopHWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@      [�
@      ��@������J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.TotalIncome)Mask####0.00FontSize  TQRExprQRExpr71Left�TopHWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU��@�������
@      ��@������J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.NetMargin)Mask####0.00FontSize  TQRExprQRExpr72Left�TopXWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@xOUUUUy�
@hUUUU��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.TotalCosts)Mask####0.00FontSize  TQRExprQRExpr73Left�TopXWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@��������
@hUUUU��@�����J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionD( (AVERAGE(qSalesRep.NetMargin)) / (AVERAGE(qSalesRep.DaysOnFarm)) )Mask####0.00FontSize  TQRExprQRExpr74Left9TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�\UUUU��@      Ж@k������@k������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionCOUNTMask#####FontSize  TQRExprQRExpr75Left_Top"Width,HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      ,�@k������@hUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.VetCosts)Mask####0.00FontSize  TQRExprQRExpr76Left_TopXWidth,HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      ,�@�KUUUU��@hUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.VetCosts)Mask####0.00FontSize  TQRExprQRExpr77Left� TopWidth)HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      ��@      ��@hUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(qSalesRep.PurchWt)Mask####0.00FontSize  TQRExprQRExpr78Left� TopHWidth,HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�QUUUU��@      �@      ��@hUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(qSalesRep.PurchWt)Mask####0.00FontSize  TQRShape	QRShape51LeftCTop WidthHeight|Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������
�@�������@                 �@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust    TQRBandQRBand5Left&TopNWidthHeight"Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values�������@      #�
@ BandTyperbPageFooter TQRLabel	QRLabel79LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUUU�@UUUUUUU�@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionKingswood Computing Ltd.ColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRLabelPremVerLabelLeft�TopWidthdHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Valuesk������@𞪪����	@RFUUUUU�@�����z�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchCaptionHerd ManagementColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRShape	QRShape52Left TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@          k�����*�@��������
@ 	Pen.WidthShape
qrsHorLine
VertAdjust    TQRBand
DetailBandLeft&Top� WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      ��@      #�
@ BandTyperbDetail TQRShape	QRShape37Left� Top�WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      �@      >�@�������� �      ��@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape38Left� Top�WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      �@�������@�������� �      ��@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape39LeftCTop�WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      �@UUUUUջ�@�������� �      ��@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape40Left�Top�WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      �@UUUUUU��	@�������� �      ��@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape41LeftTop�WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      �@UUUUUՐ�	@�������� �      ��@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape42Left�Top�WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      �@      �	@�������� �      ��@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   TQRShape	QRShape43LeftuTop�WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      �@      Y�
@�������� �      ��@ 	Pen.StylepsDotShapeqrsVertLine
VertAdjust   	TQRDBText	QRDBText5Left&TopWidthXHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUU�@       �@VUUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldNatIDFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBText	qrdbBreedLeftTopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�������@       �@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldBreedFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style OnPrintQRDBText3Print
ParentFontTransparentWordWrap	FontSize  	TQRDBText	QRDBText7Left� TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@��������@       �@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldSexFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style OnPrintQRDBText3Print
ParentFontTransparentWordWrap	FontSize  	TQRDBTextBuyer_SupplierLeft� TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@     0�@       �@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldBuyerFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style OnPrintPurchPrice1Print
ParentFontTransparentWordWrap	FontSize  	TQRDBText
PurchCostsLeft� TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      �@       �@k������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldPurchWtFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextPurchasePriceLeft� TopWidth HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�������@       �@UUUUUUU�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField
PurchPriceFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextPurchaseCostsLeftTopWidth%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      ��@       �@��������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField
PurchCostsFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText	FeedCostsLeftFTopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@��������@       �@������
�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField	FeedCostsFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextVetCostsLeftgTopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@������v�@       �@      ��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldVetCostsFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText
OtherCostsLeft�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@aUUUU��	@       �@k�����
�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField
OtherCostsFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask####0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText
DaysOnFarmLeft�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@𞪪��6�	@       �@������j�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField
DaysOnFarmFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0
ParentFontTransparentWordWrap	FontSize  	TQRDBTextAvDailyWtGainLeft�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      Ж	@       �@�\UUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldAvDailyWtGainFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask#0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextFarmCostsPerDayLeft�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@𞪪���	@       �@k������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldFarmCostsPerDayFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextSaleDateLeftTopWidth(HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@��������	@       �@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldSaleDateFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Maskdd/mm/yyOnPrintSaleDate1Print
ParentFontTransparentWordWrap	FontSize  	TQRDBTextCustomerLeft5TopWidth,HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@������ܺ	@       �@VUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldCustomerFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style OnPrintCustomer1Print
ParentFontTransparentWordWrap	FontSize  	TQRDBTextLiveWtLeftbTopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@𞪪����	@       �@�QUUUUu�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldLiveWtFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextDeadWtLeft�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@𞪪����	@       �@      ��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldDeadWtFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextKillOutLeft�TopWidth HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@aUUUU��	@       �@�QUUUUU�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldKillOutFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask#0.00'%'
ParentFontTransparentWordWrap	FontSize  	TQRDBText
SalesGradeLeft�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      $�	@       �@       �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField
SalesGradeFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBText
PricePerKgLeft�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      �	@       �@       �@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField
PricePerKgFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText	SalePriceLeftTopWidth'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@VUUUUU��	@       �@      `�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField	SalePriceFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask###0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText	SaleCostsLeft.TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@xOUUUU��
@       �@�QUUUUu�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField	SaleCostsFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask#0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextNetSalePriceLeftOTopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@xOUUUU�
@       �@k������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldNetSalePriceFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextTotalIncomeLeftzTopWidth'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@������,�
@       �@      `�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldTotalIncomeFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask###0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText
TotalCostsLeft�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�������
@       �@k������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField
TotalCostsFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask####0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText	NetMarginLeft�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      ��
@       �@k������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField	NetMarginFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBTextNetMarginPerDayLeft�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      ��
@       �@k������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldNetMarginPerDayFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText	QRDBText4LeftTopWidth%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUUU�@       �@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldAnimalNoFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize    	TCheckBoxcbIncludeDeadAnimalsLeftTop� Width� HeightCaptionInclude Dead AnimalsTabOrderOnClick
cbSexClick   	TQRDBText
QRDBText26LeftdTopWidth'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�UUUU��
@       �@      `�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldTotalIncomeFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask
'�'###0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText
QRDBText27Left�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�UUUUi�
@       �@痪����@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField	NetMarginFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask	'�'##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText
QRDBText28Left�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�UUUUY�
@       �@痪����@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataFieldNetMarginPerDayFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask	'�'##0.00
ParentFontTransparentWordWrap	FontSize  	TQRDBText
QRDBText29Left�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      Η
@       �@痪����@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField
TotalCostsFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBText
QRDBText30Left�TopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      Η
@       �@痪����@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qSalesRep	DataField
TotalCostsFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style Mask	'�'##0.00
ParentFontTransparentWordWrap	FontSize  TToolBarToolBar1Left Top Width�Height5ButtonHeight-ButtonWidthVEdgeBordersebLeftebTopebRightebBottom TabOrder TToolButtonToolButton2Left TopWidthCaptionToolButton2
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbExitLeftTopWidth:Height-HintClick Here To ExitCaptionE&xitFlat	
Glyph.Data
F  B  BMB      B   (                                   |  �     �=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=��=��=�=�=�=   < < < < < < <� <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=������=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=����=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=����������=��=�=�=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=	NumGlyphsOnClickExitBtnClick  TToolButtonToolButton1LeftBTopWidthCaptionToolButton1
ImageIndex Style
tbsDivider  TRxSpeedButtonsbViewLeftJTopWidthVHeight-Hint(Click Here To View This Report On ScreenCaption&ViewFlat	Font.CharsetANSI_CHARSET
Font.Color�5 Font.Height�	Font.NameVerdana
Font.StylefsBold 
Glyph.Data
F  B  BMB      B   (                                   |  �     �=                          �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=��=�=  �����������  �=�=�=�=�=��=��=��=��=��=�=�=�=�=�=  �  �  �  �  �  �=�=�=�=��=��=�=�=�=�=�=�=�=�=���        �������        �=�=�=�=�=�=�������=�=�=�=�  ���^              �^��  �=�=��=��=�=�=�=�=�=�=�=���=�  � |��������        �=�=��=�=�=�=�=�=�=�=�=�=�=�=�=�  �������������  �=�=�=�������������=�=�=                          �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=                  �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=��=�=�=�=�=�=  �������  �=�=�=�=�=�=�=�=��=������=��=�=�=�=�=�=  �          �  �=�=�=�=�=�=�=�=��=�=�=�=�=��=��=�=�=�=�=�=  �  ���  �  �=�=�=�=�=�=�=�=��=��=�=�=��=��=�=�=�=�=�=  �  |�|  �  �=�=�=�=�=�=�=�=��=����=��=��=�=�=�=�=�=  �          �  �=�=�=�=�=�=�=�=��=�=�=�=�=�=�=��=�=�=�=�=�=  �������  �=�=�=�=�=�=�=�=��������=��=�=�=�=�=�=                  �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=	NumGlyphs
ParentFontOnMouseLeavesbViewMouseLeaveOnClickViewBtnClick  TRxSpeedButtonsbPrintLeft� TopWidthVHeight-HintClick Here To Print This ReportCaption&PrintFlat	
Glyph.Data
F  B  BMB      B   (                                   |  �     <<<<<<                    <<<<<��=�=�=�=�=�=�=�=�=�=<<<<      ��������  <<<��=�=�=�<����<<�=<<      �  �        ���  <��=�=�=��=��=�=�=�=<<<�=      �  �  ��������  �=�=�=��=��=�<�������=  �  �  �  �            �  �=��=��=��=��=�=�=�=�=�=<�=  �  �  �  ��������  �=��=��=��=�<�������=  �  �  �  �            �  �=��=��=��=��=�=�=�=�=�=<�=  �  �  �  ��������  �=��=��=��=�<���<<<�=  �  �  �  �      ����  �=��=��=��=��=�=�=<<���=  �  �  �  �����        �=��=��=��=�<��<�=�=�=�=  �  �  �  �    ��  �  <�=��=��=��=��=�=<<�=��=<  �  �  �  �����    <<�=��=��=��=������=�=<<  �  �  �              <<<�=��=��=��=�=�=�=�=�=�=<<<  �  �              <<<<<�=��=��=�=�=�=�=�=�=<<<<<  �              <<<<<<<�=��=�=�=�=�=�=�=<<<<<<<              <<<<<<<<<�=�=�=�=�=�=�=<<<<<<<<<	NumGlyphsOnClickViewBtnClick  TToolButtonToolButton5Left� TopWidthCaptionToolButton5
ImageIndexStyle
tbsDivider  TRxSpeedButton
btnOptionsLeft� TopWidthHHeight-CaptionFormat 
OptionsFlat	OnClickbtnOptionsClick  TToolButtonToolButton4LeftFTopWidthCaptionToolButton4
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbHelpLeftNTopWidth:Height-Caption&HelpFlat	
Glyph.Data
�  �  BM�      B   (              �                   |  �     ���������wZkZk[k�s���������������ZkB-%� �  1!UJ�s�������������R   ��	O	  P%Zg����������sN m �r�,
�� �{o��������Zk L ��s �	���� �5��������1F
 ��S���R;??�hYg�������{! Qr		o�U� � � ��N�������w� .	�	�V8[�$�I2V/VFO>�������{�m�/W&�-�!�kA�j@@�f�9�����w9gcK��#�C�J?6>O=H^wwFZ2B����{o�s�w4BI�
-�#�C�K_6>�(�=�I�I+-_�����s��{kj�
�'�37'��E�j#{ {�f�{�����s�{{o{o�:��
�S0.N
�I�j# 
w�{�����s��s�s�s�6���M

� �9`f{# 4s�����s�{{o{o{o{k�R.*���� 
HV�r$"wzs����s�{{o{o{o{oZk�s�R�R�RRJ�Z�skf�r# s�{���s��s�s�s�s�s�{9gg�Z)ZCbkk bw { Uw���s��s�s�s�s{o9g�^�b@f B�rF=�r#{ uw���s������{Zk9g�wjb #"�fDZ#{#{ {x{���s�s�s�s�s�s{og���w�r  $$  {s���������������Tww$$
wTw����OnClicksbHelpClick  TToolButtonToolButton3Left�TopWidthCaptionToolButton3
ImageIndexStyle
tbsDivider  TPanelPanel1Left�TopWidth� Height-
BevelOuterbvNoneTabOrder  TLabelLabel7LeftTopWidthWHeightCaptionHerd I&dentity  TRxDBLookupCombo	HerdComboLeftTopWidthxHeightDropDownCountDisplayEmpty	All HerdsLookupFieldIDLookupDisplayHerdIdentityLookupSourceWinData.dsHerdDefaultsTabOrder     TProgressBarpbWaitLeftTop�Width�HeightMinMaxdPositionStepTabOrderVisible  TQuery	qSalesRepDatabaseNameKingswdLeft�Topd  TQuery	qPremiumsDatabaseNameKingswdLeft�Top�   TTabletSlghtAppliedForDatabaseNameKingswd	TableNameSlghtAppliedFor.dbLeft�Top�   TQueryqHealthDatabaseNameKingswdLeft�Top�   TQueryqFeedDatabaseNameKingswdLeft�Top�   TQRTextFilterQRTextFilter1Left�Topf  TQRCSVFilterQRCSVFilter1	Separator,Left�Top�   TQRHTMLFilterQRHTMLFilter1Left�Top�   TQRExcelFilterQRExcelFilter1Left�Top�   TQRRTFFilterQRRTFFilter1Left�Top�   TQRWMFFilterQRWMFFilter1EnhancedLeft�Top�   
TPopupMenupmIncludeOptionsOnPopuppmIncludeOptionsPopupLeft�Top�  	TMenuItempmiExtendedSuppBuyFieldsCaption6Show Extended Supplier/Buyer columns (Hide Farm Costs)	RadioItem	OnClickpmiExtendedSuppBuyFieldsClick  	TMenuItempmiIncludeCrushWeightCaption#Show Crush Weight (Hide Feed Costs)	RadioItem	OnClickpmiIncludeCrushWeightClick  	TMenuItempmiCattleCostingsCaptionShow Cattle Costings ReportOnClickpmiCattleCostingsClick    