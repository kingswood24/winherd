�
 TFFEEDPURCH 0[/  TPF0TfFeedPurch
fFeedPurchLeft�TopPWidth%Height�CaptionFeed PurchaseColor	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivateOnCloseQueryFormCloseQueryOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel2LeftTopDWidthHeight
BevelInner	bvLoweredTabOrder  TLabelLabel1LeftTopWidth:HeightCaption	Feed TypeFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabel
lPurchDateLeftTop� WidthSHeightCaptionPurchase DateFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabelLabel3Left"TopWidthBHeightCaptionQuantity (t)FocusControlQuantityFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabelLabel4Left"Top;WidthAHeightCaption
Cost/TonneFocusControlCostUnitFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabelLabel5LeftTop:Width/HeightCaptionSupplierFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabelLabel6LeftTop]WidthKHeightCaptionManufacturerFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabelLabel7Left"Top\WidthDHeightCaptionOther CostsFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabelLabel8LeftTop� WidthSHeightCaptionBatch/Invoice NumberFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontWordWrap	  TLabelLabel9Left"TopvWidth>HeightCaptionTotal Feed PriceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontWordWrap	  TLabelLabel10Left"Top� Width8HeightCaptionCommentFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabellExpiryDateLeftTop� WidthCHeightCaptionExpiry DateFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TDBEditQuantityLeftsTopWidth{Height	DataFieldQuantity
DataSourceWinData.dsFdStkEventsFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrderOnChangeFeedTypeOldExitOnExitFeedTypeOldExit  TDBEditCostUnitLeftsTop7Width{Height	DataFieldUnitCost
DataSourceWinData.dsFdStkEventsFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrderOnChangeCostUnitChangeOnExitCostUnitExit  TDBDateEdit	PurchDateLeftiTop}WidthhHeight	DataField	EventDate
DataSourceWinData.dsFdStkEventsFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 	NumGlyphs
ParentFontTabOrderWeekendsSunSat 
YearDigitsdyFourOnChangePurchDateChange  TRxDBLookupComboFeedTypeOldLeft1TopWidth� HeightDropDownCount	DataFieldFeedType
DataSourceWinData.dsFdStkEventsDisplayEmpty<Add>
EmptyValue0Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style LookupFieldIDLookupDisplayName; DescriptionLookupSourceWinData.dsFeedTypes
ParentFontTabOrderTabStopVisibleOnChangeFeedTypeOldExit	OnCloseUpFeedTypeOldCloseUpOnExitFeedTypeOldExit  TRxDBLookupCombo
SupplierIDLeftiTop7Width� HeightDropDownCount	DataFieldSupplier
DataSourceWinData.dsFdStkEventsDisplayEmpty<Add>
EmptyValue0Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style LookupFieldIDLookupDisplayNameLookupSource
dsSupplier
ParentFontTabOrderOnChangeSupplierIDChange	OnCloseUpSupplierIDCloseUp  TRxDBLookupComboManufacturerLeftiTopZWidth� HeightDropDownCount	DataFieldManufacturer
DataSourceWinData.dsFdStkEventsDisplayEmpty<Add>
EmptyValue0Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style LookupFieldIDLookupDisplayNameLookupSourceWinData.dsManufacturers
ParentFontTabOrderOnChangeManufacturerChange	OnCloseUpManufacturerCloseUp  TDBEdit
OtherCostsLeftsTopZWidth{Height	DataField
OtherCosts
DataSourceWinData.dsFdStkEventsFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrderOnChangeOtherCostsChangeOnExitOtherCostsExit  TDBEditdbeBatchLeftiTop� Width� Height	DataFieldBatchNumber
DataSourceWinData.dsFdStkEventsFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrderOnChangedbeBatchChange  TDBEdit
TotalCostsLeftsTop}Width{Height	DataFieldTotFeedPrice
DataSourceWinData.dsFdStkEventsFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrder	OnChangeTotalCostsChange  TDBMemoDBMemo1Left$Top� Width� HeightQ	DataFieldComment
DataSourceWinData.dsFdStkEventsFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 	MaxLength� 
ParentFontTabOrder
OnChangeDBMemo1Change  TcxGridcxgFeedPurchGridLeft�TopWidth� Height� Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrderTabStopOnEntercxgFeedPurchGridEnterLookAndFeel.KindlfFlat TcxGridDBTableViewcxgFeedPurchGridDBTableViewNavigatorButtons.ConfirmDeleteDataController.DataSourceWinData.dsFdStkEvents"DataController.DetailKeyFieldNamesIDDataController.KeyFieldNamesID/DataController.Summary.DefaultGroupSummaryItems )DataController.Summary.FooterSummaryItems $DataController.Summary.SummaryGroups Filtering.MRUItemsListFiltering.ColumnMRUItemsListOptionsData.CancelOnExitOptionsData.Deleting OptionsData.DeletingConfirmationOptionsData.EditingOptionsData.InsertingOptionsView.GridLinesglHorizontalOptionsView.GroupByBox TcxGridDBColumn$cxgFeedPurchGridDBTableViewEventDateCaptionPurchase DateDataBinding.FieldName	EventDate	SortIndex 	SortOrdersoDescendingWidthx  TcxGridDBColumn#cxgFeedPurchGridDBTableViewFeedTypeCaptionFeedDataBinding.FieldNameFeedTypePropertiesClassNameTcxLookupComboBoxPropertiesProperties.KeyFieldNamesIDProperties.ListColumns	SortOrdersoAscendingWidth� 	FieldNameDescription  Properties.ListSourceWinData.dsFeedTypesWidthz   TcxGridLevelcxgFeedPurchGridLevelGridViewcxgFeedPurchGridDBTableView   TDBDateEditdbExpiryDateLeftiTop� WidthhHeight	DataField
ExpiryDate
DataSourceWinData.dsFdStkEventsFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 	NumGlyphs
ParentFontTabOrderWeekendsSunSat 
YearDigitsdyFourOnChangePurchDateChange  TcxDBLookupComboBoxFeedTypeLeftiTopDataBinding.DataFieldFeedTypeDataBinding.DataSourceWinData.dsFdStkEvents
ParentFontProperties.DropDownAutoSize	Properties.DropDownListStylelsFixedListProperties.DropDownSizeable	Properties.KeyFieldNamesIDProperties.ListColumnsWidthd	FieldNameName Widthd	FieldNameDescription  Properties.ListSourceWinData.dsFeedTypesStyle.Font.CharsetANSI_CHARSETStyle.Font.ColorclWindowTextStyle.Font.Height�Style.Font.NameVerdanaStyle.Font.Style Style.IsFontAssigned	TabOrder Width�    TToolBarToolBar1Left Top WidthHeight7ButtonHeight0ButtonWidthVEdgeBordersebLeftebTopebRightebBottom TabOrder TToolButtonToolButton3Left TopWidthCaptionToolButton3
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbExitLeftTopWidth:Height0CaptionE&xitFlat	
Glyph.Data
F  B  BMB      B   (                                   |  �     �=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=��=��=�=�=�=   < < < < < < <� <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=������=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=����=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=����������=��=�=�=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=	NumGlyphsOnClick
bExitClick  TToolButtonToolButton1LeftBTopWidthCaptionToolButton1
ImageIndex Style
tbsDivider  TKwDBNavigatordbnMediPurchaseLeftJTopWidth� Height0
DataSourceWinData.dsFdStkEventsVisibleButtonskwnbPost
kwnbCancel
kwnbInsert
kwnbDelete Flat	Ctl3DCaptions.Strings&Save&Cancel&Add&Delete&Edit&Refresh&First&Prev.&Next&Last ParentCtl3DTabOrder OnClickdbnMediPurchaseClick  TToolButtonToolButton2Left2TopWidthCaptionToolButton2
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbFeedPurchaseReportLeft9TopWidthpHeight0CaptionFeed Purchase 
ReportFlat	OnClicksbFeedPurchaseReportClick  TToolButtonToolButton5Left�TopWidthCaptionToolButton5
ImageIndexStyle
tbsDivider  TRxSpeedButtonbtnFeedTypesLeft�TopWidth\Height0Caption
Feed TypesFlat	OnClickbtnFeedTypesClick  TToolButtonToolButton4LeftTopWidthCaptionToolButton4
ImageIndexStyle
tbsDivider  TRxSpeedButtonRxSpeedButton2LeftTopWidthKHeight0CaptionAccountsFlat	
Glyph.Data
�   �   BM�       v   (               �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� UUUP  UUUU ��UUP0�30UU���3U;��33P���;��0P��;��30P��;��;0P��3�3�P�33����P�3333�U3�3;�U�30��UUP�3��UUU �30UUUUU  UUOnClickRxSpeedButton2Click  TToolButtonToolButton6Left\TopWidthCaptionToolButton6
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbHelpLeftdTopWidth:Height0Caption&HelpFlat	
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
wTw����OnClicksbHelpClick   TQuery	qSupplierDatabaseNameKingswdSQL.StringsSELECT * FROM SuppliersBreedersWHERE FeedSupplier = True Left�Top  TDataSource
dsSupplierDataSet	qSupplierLeft�Top   