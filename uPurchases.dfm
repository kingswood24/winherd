�
 TFPURCHASES 0"6  TPF0TfPurchases
fPurchasesLeftRTopWidth�Height�CaptionPurchaseColor	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivateOnCloseQueryFormCloseQueryOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel2Left Top5Width�HeightzAlignalClient
BevelInner	bvLoweredFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrder  TLabellDefaultLeftTopWidthCHeightCaptionDefaults OnFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameVerdana
Font.Style 
ParentFontVisible  TPanel
pPurchasesLeftTopWidth�Height>AnchorsakLeftakTopakBottom 
BevelInner	bvLoweredTabOrder TLabelLabel2Left
TopWidth/HeightCaptionSupplier  TLabelLabel3Left
TopHWidthHeightCaptionDate  TLabellCommentLeft
Top� Width8HeightAnchorsakLeftakBottom CaptionComment  TLabellPriceLeft
Top� WidthHeightAnchorsakLeftakBottom CaptionPrice  TLabellWeightLeft
Top� Width� HeightAnchorsakLeftakBottom Caption*Weight                               (Kgs)  TLabelLabel7Left
Top*Width"HeightCaptionBuyer  TLabellPPKgLeft
Top� WidthEHeightAnchorsakLeftakBottom CaptionPrice per kg  TLabellOtherCostsLeft� Top� WidthXHeightAnchorsakLeftakBottom CaptionPurchase Costs  TLabellFarmWeightLeftITop� Width;HeightAnchorsakLeftakBottom Caption	Farm Wgt.  TLabellFarmWgtDateLeft�Top� Width-HeightAnchorsakLeftakBottom Captionon Date  TLabel	lPurchGrpLeftITop� WidthKHeightAnchorsakLeftakBottom CaptionPurch. Group  TLabelLabel12LeftITopWidth(HeightCaptionLot No.  TLabellFQASLeft
TopfWidthHeightCaptionFQASVisible  TLabel
lTransportLeftITop9Width7HeightCaption	TransportEnabled  TLabellCommissionLeftITopZWidthFHeightCaption
CommissionEnabled  TLabel	lFQASDaysLeft� TopfWidth� HeightCaptionDays (on day of purchase)Visible  TLabel
lFeedGroupLeftITop� WidthBHeightAnchorsakLeftakBottom Caption
Feed Group  TLabellBatchGroupLeftITop� WidthGHeightAnchorsakLeftakBottom CaptionBatch Group  TLabel	lFQASDateLeft
Top� Width>HeightCaption	FQAS DateVisible  TRxDBLookupComboSupplierLeftXTop	Width� HeightHintPlace PurchasedDropDownCountColorclTeal	DataFieldSupplier
DataSourceWinData.dsPurchasesDisplayEmpty<Add>
EmptyValue0EmptyItemColorclTealFont.CharsetANSI_CHARSET
Font.ColorclHighlightTextFont.Height�	Font.NameVerdana
Font.Style LookupFieldIDLookupDisplayNameLookupSourceWinData.dsQuerySuppliers
ParentFontParentShowHintShowHint	TabOrder OnChangeSupplierChange	OnCloseUpSupplierCloseUp
OnDropDownSupplierDropDownOnEnterSupplierEnter  TDBDateEditDateOfPurchaseLeftXTopEWidth}Height	DataField	EventDate
DataSourceWinData.EventSourceColorclTealFont.CharsetANSI_CHARSET
Font.ColorclHighlightTextFont.Height�	Font.NameVerdana
Font.Style 	NumGlyphs
ParentFontParentShowHintShowHint	TabOrderWeekendsSunSat WeekendColorclBlue
YearDigitsdyTwoOnChangeDateOfPurchaseChangeOnEnterSupplierEnterOnExitDateOfPurchaseExit  TDBEditPriceLeftXTop� WidthKHeightAnchorsakLeftakBottom 	DataFieldPrice
DataSourceWinData.dsPurchasesParentShowHintShowHint	TabOrderOnChangePriceChangeOnEnterSupplierEnterOnExit	PriceExit  TDBEditWeightLeftXTop� WidthLHeightHintWeight from Mart DocumentsAnchorsakLeftakBottom 	DataFieldWeight
DataSourceWinData.dsPurchasesParentShowHintShowHint	TabOrderOnChangeWeightChangeOnEnterSupplierEnterOnExit
WeightExit  TRxDBLookupComboBuyersLeftXTop'Width� HeightHintPurchasing IndividualDropDownCount	DataFieldBuyer
DataSourceWinData.dsPurchasesDisplayEmpty<Add>
EmptyValue0LookupFieldIDLookupDisplayNameLookupSourceWinData.dsQueryBuyersParentShowHintShowHint	TabOrderOnChangeBuyersChange	OnCloseUpBuyersCloseUp
OnDropDownBuyersDropDownOnEnterBuyersEnter  TCurrencyEdit
PricePerKgLeftXTop� Width;HeightTabStopAutoSizeBorderStylebsNoneColor��� AnchorsakLeftakBottom ReadOnly	TabOrder
  TDBEdit
dbeFarmWgtLeft�Top� WidthLHeightAnchorsakLeftakBottom 	DataFieldMeasuredWeight
DataSourceWinData.dsPurchasesTabOrderOnChangedbeFarmWgtChange  	TComboBoxdbcPurchGrpLeft�Top� Width� HeightStylecsDropDownListAnchorsakLeftakBottom 
ItemHeightTabOrderOnChangedbcPurchGrpChange  TDBEditDBEdit1Left�Top	Width� Height	DataField	LotNumber
DataSourceWinData.dsPurchasesTabOrderOnChangeDBEdit1Change  TDBDateEditdbFarmWgtDateLeft)Top� WidthcHeight	DataFieldMeasuredWtDate
DataSourceWinData.dsPurchasesAnchorsakLeftakBottom 	NumGlyphsTabOrderWeekendsSunSat 
YearDigitsdyTwoOnChangedbFarmWgtDateChange  TDBEditCommentLeftXTop� Width� HeightAnchorsakLeftakBottom 	DataField	EventDesc
DataSourceWinData.EventSourceParentShowHintShowHint	TabOrderOnChangeCommentChangeOnEnterSupplierEnter  TDBEdit	eFQASDaysLeftXTopcWidth-Height	DataFieldFQASDays
DataSourceWinData.dsPurchasesParentShowHintShowHint	TabOrderVisibleOnChangeeFQASDaysChangeOnEnterSupplierEnterOnExit	PriceExit  TDBEdit
dbeHaulageLeft�Top6WidthLHeight	DataFieldHaulage
DataSourceWinData.dsPurchasesEnabledTabOrder	OnChangeDBEdit1Change  TDBEditdbeCommissionLeft�TopXWidthKHeight	DataField
Commission
DataSourceWinData.dsPurchasesEnabledTabOrderOnChangeDBEdit1Change  TcxDBCurrencyEditdbceOtherCostsLeft� Top� TabStopAnchorsakLeftakBottom AutoSizeDataBinding.DataFieldSupplierCostsDataBinding.DataSourceWinData.dsPurchasesProperties.ReadOnly	Style.BorderStyleebsNoneStyle.Color��� Style.LookAndFeel.KindlfFlatStyleDisabled.LookAndFeel.KindlfFlatStyleFocused.LookAndFeel.KindlfFlatStyleHot.LookAndFeel.KindlfFlatTabOrderHeightWidth;  TcxGroupBoxgbPurchaseCostsLeft
TopAnchorsakLeftakBottom 
ParentFontStyle.Font.CharsetANSI_CHARSETStyle.Font.ColorclWindowTextStyle.Font.Height�Style.Font.NameVerdanaStyle.Font.Style Style.IsFontAssigned	TabOrderHeight"Width� TcxLabelcxLabel1LeftTopAutoSizeCaptionSupplier
CommissionHeightWidthC  TcxCurrencyEdit	ceSuppComLeftJTop	TabStopProperties.ReadOnly	Style.BorderStyleebsNoneStyle.Color��� TabOrderWidth9  TcxLabelcxLabel2Left� TopAutoSizeCaptionSupplier
TransportHeightWidthC  TcxCurrencyEditceSuppTransLeft� Top	TabStopProperties.ReadOnly	Style.BorderStyleebsNoneStyle.Color��� TabOrderWidth9  TcxLabelcxLabel3LeftTopAutoSizeCaptionBuyer
CommissionHeightWidthC  TcxCurrencyEdit
ceBuyerComLeftNTop	TabStopProperties.ReadOnly	Style.BorderStyleebsNoneStyle.Color��� TabOrderWidth9   TcxCheckBoxcbChangeCostsLeftFTop CaptionChange Default CostsTabOrderOnClickcbChangeCostsClickWidth�   	TComboBoxdbcFeedGroupLeft�Top� Width� HeightStylecsDropDownListAnchorsakLeftakBottom 
ItemHeightTabOrderOnChangedbcPurchGrpChange  	TComboBoxdbcBatchGroupLeft�Top� Width� HeightStylecsDropDownListAnchorsakLeftakBottom 
ItemHeightTabOrderOnChangedbcPurchGrpChange  TcxLabellFQASDateDateLeftXTop~AutoSizeCaption
00/00/0000ParentColorStyle.BorderColor��� Style.BorderStyle	ebsSingleStyle.Color��� HeightWidthK   
TStatusBar
StatusBar1LeftTopeWidth�HeightPanelsWidth2  SimplePanel  TPanelpOtherPurchaseOptionsLeft�TopWidth� Height`TabOrderVisible TLabelLabel9LeftTop(Width#HeightCaptionGroupVisible  TLabelLabel6LeftTopWidth#HeightCaptionGradeVisible  TDBEditGroupLeftfTop(Width;HeightCharCaseecUpperCase
DataSourceWinData.dsPurchasesTabOrder VisibleOnEnterSupplierEnter  TDBEditGradeLeftdTop
Width;HeightHintPurchase GradeCharCaseecUpperCase	DataFieldGrade
DataSourceWinData.dsPurchasesTabOrderVisibleOnEnterSupplierEnter  TDBCheckBoxFQASLeftTopDWidth7Height	AlignmenttaLeftJustifyCaptionFQASColor	clBtnFace	DataFieldFQAS
DataSourceWinData.dsPurchasesParentColorTabOrderValueCheckedTrueValueUncheckedFalseVisibleOnClick	FQASClick    TToolBarToolBar1Left Top Width�Height5ButtonHeight/ButtonWidthVEdgeBordersebLeftebTopebRightebBottom TabOrder TToolButtonToolButton1Left TopWidthCaptionToolButton1
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbExitLeftTopWidth4Height/CaptionE&xitFlat	
Glyph.Data
F  B  BMB      B   (                                   |  �     �=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=��=��=�=�=�=   < < < < < < <� <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=������=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=����=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=����������=��=�=�=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=	NumGlyphsOnClickExitButtonClick  TToolButtonToolButton2Left8TopWidthCaptionToolButton2
ImageIndexStyle
tbsDivider  TKwDBNavigatorNavPurchaseLeft<TopWidth� Height/
DataSourceWinData.EventSourceVisibleButtonskwnbPost
kwnbCancel Flat	Ctl3DParentCtl3DTabOrder BeforeActionNavPurchaseBeforeActionOnClickNavPurchaseClick  TRxSpeedButtonsbDeleteLeft� TopWidthAHeight/CaptionDeleteFlat	
Glyph.Data
J  F  BMF      v   (               �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 33333333333333  33333333333333  33333333333333  33333333333333  33333338������  3     3833333�  3     3833333�  3     3833333�  33333338������  33333333333333  33333333333333  33333333333333  33333333333333  	NumGlyphsOnClickbDeleteClick  TToolButtonToolButton4LeftTopWidthCaptionToolButton4
ImageIndexStyle
tbsDivider  TRxSpeedButton
sbDefaultsLeftTopWidthcHeight/CaptionSave as DefaultFlat	Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
Glyph.Data
R  N  BMN      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333   3 3333333   0� 333333   0LD 33333   3�D 3333   3|�D 333   30���@33   30L|�@@33   33|�@3   33�@�@�3   330D�`   330 ��v�    333D�    3330 ~� �   3333gh   33330 ��v   33333 ��   333330�~�   LayoutblGlyphRight
ParentFontWordWrap	OnClicksbDefaultsClick  TToolButtonToolButton5LeftuTopWidthCaptionToolButton5
ImageIndexStyle
tbsDivider  TRxSpeedButtonRxSpeedButton3LeftyTopWidthZHeight/CaptionGroup MovementsFlat	WordWrap	OnClickRxSpeedButton3Click  TToolButtonToolButton3Left�TopWidthCaptionToolButton3
ImageIndexStyle
tbsDivider  TRxSpeedButtonRxSpeedButton2Left�TopWidthJHeight/CaptionAccountsFlat	
Glyph.Data
�   �   BM�       v   (               �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� UUUP  UUUU ��UUP0�30UU���3U;��33P���;��0P��;��30P��;��;0P��3�3�P�33����P�3333�U3�3;�U�30��UUP�3��UUU �30UUUUU  UUOnClickRxSpeedButton2Click  TToolButtonToolButton6Left!TopWidthCaptionToolButton6
ImageIndexStyle
tbsDivider  TRxSpeedButtonRxSpeedButton1Left%TopWidth:Height/Caption&HelpFlat	
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
wTw����OnClicksbHelpClick   TQuery
qSuppliersDatabaseNameKingswdSQL.Strings$Select * From "SuppliersBreeders.db"Where (AnimalSupplier = True) LeftnTop  TDataSourcedsSuppliersDataSet
qSuppliersLeftnTop%   