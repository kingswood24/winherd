�
 TPURCHASESALESSCR 0�Q  TPF0TPurchaseSalesScrPurchaseSalesScrLeft Top Width�Height�Frame.ColorclBlackFrame.DrawTop	Frame.DrawBottom	Frame.DrawLeftFrame.DrawRightFrame.WidthDataSetqPurchSalesFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.OrientationpoLandscapePage.PaperSizeA4Page.Values       �@      @�
@       �@      ��
@       �@       �@           PrintIfEmptyPrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinFirstReportTitle Purchase / Sales Analysis Report
SnapToGrid	UnitsMMZoom< TQRBandPurchSalesDetailLeftTop`Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.Values  �q���@ �����k�
@ BandTyperbDetail 	TQRDBText	QRDBText1LeftTopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�q�@ �q�q�@ �8��8�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetqPurchSales	DataFieldAnimalNoTransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left&TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@  �qǑ�@ �q�q�@ @��8�c�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetqPurchSales	DataFieldNatIDTransparentWordWrap	FontSize
  	TQRDBText	QRDBText3LeftpTopWidth%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@  �q���@ �q�q�@ ��8��(�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetqPurchSales	DataField	PurchDateTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4LeftTopWidthRHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �����"�	@ �q�q�@ �q�q̴@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqPurchSales	DataFieldSupplierTransparentWordWrap	FontSize
  	TQRDBText	QRDBText6Left� TopWidth%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ ��8����@ �q�q�@ ��8��(�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqPurchSales	DataField
PurchPriceMask#####.00TransparentWordWrap	FontSize
  	TQRDBText	QRDBText7Left� TopWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ @��8�w�@ �q�q�@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqPurchSales	DataFieldPurchWeightMask#####.00TransparentWordWrap	FontSize
  	TQRDBText	QRDBText8Left� TopWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �8��8�	@ �q�q�@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqPurchSales	DataField
PurchGradeTransparentWordWrap	FontSize
  	TQRDBText	QRDBText5LeftlTopWidth%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�q��	@ �q�q�@ ��8��(�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetqPurchSales	DataField	SalesDateTransparentWordWrap	FontSize
  	TQRDBText	QRDBText9LeftTopWidthRHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ XUUUU��
@ �q�q�@ �q�q̴@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqPurchSales	DataFieldCustomerTransparentWordWrap	FontSize
  	TQRDBText
QRDBText10Left�TopWidth%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�qJ�	@ �q�q�@ ��8��(�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqPurchSales	DataField
SalesPriceMask#####.00TransparentWordWrap	FontSize
  	TQRDBText
QRDBText11Left�TopWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@  �q�#�	@ �q�q�@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqPurchSales	DataFieldSalesWeightMask#####.00TransparentWordWrap	FontSize
  	TQRDBText
QRDBText12Left�TopWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ p�q�
@ �q�q�@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqPurchSales	DataField
SalesGradeTransparentWordWrap	FontSize
  TQRExprMarginLeftfTopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ p�q9�
@ �q�q�@ �8��8�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
Expression(SalesPrice)-(PurchPrice)Mask
#######.00FontSize
   TQRBandColumnHeaderBand1LeftTopWidth�HeightIFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightFrame.WidthAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values �q�q��@ �����k�
@ BandTyperbColumnHeader TQRLabelPurchSalesRptTitleLeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ �q�q�@ �q�q�@ �8��8��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionPurchase / Sales AnalysisColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameTimes New Roman
Font.StylefsItalicfsUnderline 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel2LeftTop.Width!HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ XUUUUU�@ PUUUU�@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionAnimal NumberColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabelQRLabel4Left&Top.Width-HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values �������@ XUUUUU�@ PUUUU�@      p�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionNational ID NumberColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRShapeQRShape1LeftTop%Width�Height	Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ XUUUUU�@ �����
�@ �����m�
@ Shape
qrsHorLine  
TQRSysData
QRSysData1Left/TopWidthYHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ @��8��
@ �q�q�@ @��8�;�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeColorclWhiteDataqrsDateTimeTextDate : TransparentFontSize
  
TQRSysData
QRSysData2LeftLTopWidth=HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ ������
@ �q�q�@ p�q�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeColorclWhiteDataqrsPageNumberTextPage : TransparentFontSize
  TQRLabel	SortLabelLeftTopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �8��8�	@  �q���@ �8��8�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption	SortLabelColorclWhiteTransparentWordWrap	FontSize
  TQRLabel
OrderLabelLeftTopWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �8��8�	@ �������@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
OrderLabelColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel8Left� TopWidth/HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@  �q���@  �q���@  �q�A�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionSort Options:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRShapeQRShape2LeftnTop/Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ �����j�@     `�@      �	@ Shape
qrsHorLine  TQRLabel	QRLabel18Left� Top,Width(HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@       �@ p�q�@ @��8�c�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption	PurchasesColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabelQRLabel3LeftlTop:Width&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�q��	@ @��8���@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionDateColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel15LeftTop:Width%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ XUUUU��
@ @��8���@ ��8��(�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionCustomerColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel16Left�Top:Width&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�qJ�	@ @��8���@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionPriceColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel17Left�Top:Width&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@  �q�#�	@ @��8���@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionWeightColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel19Left�Top:Width&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ p�q�
@ @��8���@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionGradeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRShapeQRShape5LeftlTop/Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@     l�	@     `�@      �	@ Shape
qrsHorLine  TQRLabel	QRLabel20Left�Top,WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ @��8���
@ p�q�@ p�q�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionSalesColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel21LeftnTop:WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ @��8�m�
@ @��8���@       �@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionMarginColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabelQRLabel9Left� Top:Width&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ ��8����@ @��8���@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionPriceColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel10Left� Top:Width&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ @��8�w�@ @��8���@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionWeightColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabelQRLabel5LeftpTop:Width&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@  �q���@ @��8���@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionDateColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel11Left� Top:Width&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �8��8�	@ @��8���@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionGradeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabelQRLabel6LeftTop:Width!HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �����"�	@ @��8���@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionSupplierColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
   TQRBandPageFooterBand1LeftTop� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values @��8�c�@ �����k�
@ BandTyperbPageFooter TQRLabelQRLabel7LeftTopWidthiHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�q�@ �q�q�@ �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionKingswood Computing Ltd.ColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRLabelVerLabelLeft�TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�qh�	@ �q�q�@ @��8���@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchCaptionHerd ManagementColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTransparentWordWrap	FontSize
   TQRBandQRBand1LeftTopnWidth�Height:Frame.ColorclBlackFrame.DrawTop	Frame.DrawBottom	Frame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.Values @��8���@ �����k�
@ BandType	rbSummary TQRExprQRExpr1Left� TopWidth3HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ ��8����@ �������@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(Purchprice)Mask
#######.00FontSize
  TQRExprQRExpr2Left� TopWidth'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ @��8�w�@ �������@ �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(Purchweight)Mask
#######.00FontSize
  TQRLabel	QRLabel12LeftTopWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�q�@ �������@  �qǑ�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption	Averages:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel13LeftTop#WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�q�@ x�qW�@ �8��8N�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTotals:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRExprQRExpr3LeftTop#WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@  �q���@ x�qW�@       �@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
ExpressionCOUNTFontSize
  TQRExprQRExpr4Left� Top#Width'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ ��8����@ x�qW�@ �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
ExpressionSUM(Purchprice)Mask
#######.00FontSize
  TQRExprQRExpr5Left�TopWidth3HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ �q�qJ�	@ �������@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(Salesprice)Mask
#######.00FontSize
  TQRExprQRExpr6Left�TopWidth'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ ��8���	@ �������@ �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
ExpressionAVERAGE(Salesweight)Mask
#######.00FontSize
  TQRExprQRExpr7LeftfTopWidth"HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ p�q9�
@ �������@ �8��8�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
Expression"AVERAGE((SalesPrice)-(PurchPrice))Mask
#######.00FontSize
  TQRExprQRExpr8Left�Top#Width'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values p�q�@ @��8���	@ x�qW�@ �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
ExpressionSUM(Salesprice)Mask
#######.00FontSize
   TQueryqPurchSalesActive	DatabaseNamekingswdSQL.StringsSELECT * from Animals LeftTop   