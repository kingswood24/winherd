�
 TFMEDIPURCH 0R  TPF0TfMediPurch
fMediPurchLeftTop� Width�HeightMCaptionMedicine PurchaseColor	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style OldCreateOrder	PositionpoScreenCenterShowHint	
OnActivateFormActivateOnCloseQueryFormCloseQueryOnCreate
FormCreate	OnDestroyFormDestroyOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel2Left Top5Width�Height� AlignalTop
BevelInner	bvLoweredFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrder TLabelLabel1LeftTopWidth1HeightCaptionMedicineFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabelLabel2LeftTopHWidthKHeightCaptionPurchase DateFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabelLabel3LeftTopfWidthaHeightCaptionPurchase QuantityFocusControlQuantityOldFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabelLabel4Left�TopHWidthEHeightCaptionCost Per UnitFocusControlCostUnitFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabelLabel5LeftTop*Width+HeightCaptionSupplierFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabelLabel6Left�TopWidth4HeightCaption	Batch No.Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabelLabel7Left�Top*Width:HeightCaptionExpiry DateFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabel
lPurchUnitLeft TopfWidth8HeightCaption
lPurchUnitFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabellPurchUnit2LeftaTopHWidth8HeightCaption
lPurchUnitFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabelLabel8Left�TopfWidthRHeightCaptionQty. RemainingFocusControlCostUnitFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabellCommentLeftTop� Width6HeightCaptionCommentFocusControlQuantityOldFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TcxLabellHintLocationLeft[TopAutoSizeOnMouseEnterlHintLocationMouseEnterOnMouseLeavelHintLocationMouseLeaveHeight Width"  TDBEditQuantityOldLeft�Top`Width{HeightTabStopColorclTeal	DataFieldQuantity
DataSourceWinData.dsMediPurchFont.CharsetANSI_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFontTabOrder	Visible  TDBEditCostUnitLeft�TopFWidth{Height	DataFieldCostUnit
DataSourceWinData.dsMediPurchFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFontTabOrderOnChangeCostUnitChange  TDBDateEditDateLeft� TopFWidth|Height	DataField	PurchDate
DataSourceWinData.dsMediPurchColorclTealFont.CharsetANSI_CHARSET
Font.ColorclWindowFont.Height�	Font.NameSegoe UI
Font.Style 	NumGlyphs
ParentFontTabOrderWeekendsSunSat WeekendColorclBlue
YearDigitsdyFourOnChange
DateChange  TRxDBLookupCombo
SupplierIDLeft� Top(Width� HeightDropDownCountColorclTeal	DataFieldSuppID
DataSourceWinData.dsMediPurchDisplayEmpty<Add>
EmptyValue0Font.CharsetANSI_CHARSET
Font.ColorclWindowFont.Height�	Font.NameSegoe UI
Font.Style LookupFieldIDLookupDisplayNameLookupSourcedsSuppliers
ParentFontTabOrderOnChangeSupplierIDChange	OnCloseUpSupplierIDCloseUp
OnDropDownSupplierIDDropDown  TDBEditBatchNoLeft�Top
Width|HeightColorclTeal	DataFieldBatchNo
DataSourceWinData.dsMediPurchFont.CharsetANSI_CHARSET
Font.ColorclWindowFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFontTabOrderOnChangeBatchNoChange  TDBDateEdit
ExpiryDateLeft�Top(Width|Height	DataField
ExpiryDate
DataSourceWinData.dsMediPurchColorclTealFont.CharsetANSI_CHARSET
Font.ColorclWindowFont.Height�	Font.NameSegoe UI
Font.Style 	NumGlyphs
ParentFontTabOrderWeekendsSunSat WeekendColorclBlue
YearDigitsdyFourOnChangeExpiryDateChange  TRxDBLookupComboMedicineLeft� Top
Width� HeightDropDownCountColorclTeal	DataFieldDrugID
DataSourceWinData.dsMediPurchDisplayEmpty<Add New Medicine>
EmptyValue0EmptyItemColorclTealFont.CharsetANSI_CHARSET
Font.ColorclWindowFont.Height�	Font.NameSegoe UI
Font.Style LookupFieldIDLookupDisplayNameLookupSourceHerdLookup.dsDrugList
ParentFontTabOrder OnChangeMedicineChange	OnCloseUpMedicineCloseUpOnExitMedicineExit  TDBCheckBoxDBCheckBox1LeftTop� WidthzHeight	AlignmenttaLeftJustifyCaptionBatch In Use	DataFieldInUse
DataSourceWinData.dsMediPurchFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFontTabOrderValueCheckedTrueValueUncheckedFalseOnClickDBCheckBox1Click  TcxDBCurrencyEditQuantityLeft� TopdDataBinding.DataFieldQuantityDataBinding.DataSourceWinData.dsMediPurch
ParentFont'Properties.AssignedValues.DisplayFormat	Properties.OnChangeQuantityPropertiesChangeProperties.OnValidateQuantityPropertiesValidateStyle.BorderStyleebs3DStyle.ColorclTealStyle.Font.CharsetANSI_CHARSETStyle.Font.ColorclWindowStyle.Font.Height�Style.Font.NameSegoe UIStyle.Font.Style Style.IsFontAssigned	TabOrderWidthy  TcxDBCurrencyEditQtyRemainingLeft�TopdTabStopDataBinding.DataFieldQtyRemainingDataBinding.DataSourceWinData.dsMediPurch
ParentFontProperties.Alignment.HorztaLeftJustifyProperties.Alignment.Vert	taVCenterProperties.DisplayFormat0.00Properties.ReadOnly	$Properties.UseLeftAlignmentOnEditingProperties.OnChangeQuantityPropertiesChangeStyle.BorderStyleebs3DStyle.Color��� Style.Font.CharsetANSI_CHARSETStyle.Font.ColorclBlackStyle.Font.Height�Style.Font.NameSegoe UIStyle.Font.Style Style.IsFontAssigned	TabOrderWidth{  	TcxDBMemo
dbmCommentLeft� Top� DataBinding.DataFieldCommentDataBinding.DataSourceWinData.dsMediPurchTabOrder
Height1Width�  	TcxButtonbtnQueryBatchTreatsLeft]Top	WidthHeightHint?Click this button to view the treatments for this batch number.ParentShowHintShowHint	TabOrderOnClickbtnQueryBatchTreatsClick
Glyph.Data
:  6  BM6      6   (                  B  B          � �!s�cks� �� �� �� �� �� �� �� �� �� �� �� �� �!s�!��!s�cks� �� �� �� �� �� �� �� �� �� �� �� �1��R��!��!s�cks� �� �� �� �� �� �� �� �� �� �� �� �1��R��!��!s�cks� �� �� �� �� �� �� �� �� �� �� �� �1��R��!��!s�cks� �� �� �� �� �� �� �� �� �� �� �� �1��R��!��Zks� �չ�֭�֭�֭�չ�� �� �� �� �� �� �� �1��1��JB9������������������֭�� �� �� �� �� �� �� �� ������������������������֭�� �� �� �� �� �� �չ������������������������֭�� �� �� �� �� �� �֭������������������������֭�� �� �� �� �� �֭��������������������������˯�� �� �� �� �� �֭��޲����������������������ҳ�� �� �� �� �� �չ��ذ����������������֭�� �� �� �� �� �� �� �֭��߼������������չ�� �� �� �� �� �� �� �� �֭��Ե�޴�ޱ�۱֭�չ�� �� �� �� �� �� �� �� �� �� �չ�֭�֭�ٷ�� �� �� �� �LookAndFeel.Kind
lfOffice11  	TcxButtonbtnDisposeBatchNoLeft]TopcWidthHeightHint?Click this button to view the treatments for this batch number.ParentShowHintShowHint	TabOrderOnClickbtnDisposeBatchNoClick
Glyph.Data
:  6  BM6      6   (                  �  �          ���������                        ������������������bbb������������������������bbb������������������ccc���222��ˁ��}}}���...���ccc������������������ccc���222��ˁ��}}}���...���ccc������������������ccc���222��ˁ��}}}���...���ccc������������������ccc���222��ˁ��}}}���...���ccc������������������ccc���222��ˁ��}}}���...���ccc������������������ccc���222��ˁ��}}}���...���ccc������������������ccc���222��ˁ��}}}���...���ccc������������������ccc���222��ˁ��}}}���...���ccc������������������ccc������������������������ccc���������������***DDDDDDDDDDDDDDDDDDDDDDDD***������������BBB������������������������������BBB������������""""""""""""""""""""""""""""""���������������������������������������������������������������			            			���������������LookAndFeel.Kind
lfOffice11   TToolBarToolBar1Left Top Width�Height5ButtonHeight0ButtonWidthVEdgeBordersebLeftebTopebRightebBottom TabOrder  TToolButtonToolButton3Left TopWidthCaptionToolButton3
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbExitLeftTopWidth:Height0CaptionE&xitFlat	
Glyph.Data
F  B  BMB      B   (                                   |  �     �=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=��=��=�=�=�=   < < < < < < <� <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=������=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=����=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=����������=��=�=�=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=	NumGlyphsOnClick
bExitClick  TToolButtonToolButton1Left@TopWidthCaptionToolButton1
ImageIndex Style
tbsDivider  TKwDBNavigatordbnMediPurchaseLeftFTopWidth� Height0
DataSourceWinData.dsMediPurchVisibleButtonskwnbPost
kwnbCancel
kwnbInsert
kwnbDelete Flat	Ctl3DCaptions.Strings&Save&Cancel&Add&Delete&Edit&Refresh&First&Prev.&Next&Last  ParentCtl3DTabOrder BeforeActiondbnMediPurchaseBeforeActionOnClickdbnMediPurchaseClick  TToolButtonToolButton2Left*TopWidthCaptionToolButton2
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbMedicineSetupLeft0TopWidth`Height0CaptionMedicine SetupFlat	
Glyph.Data
:  6  BM6      6   (                              � �� �� �� �� �� �� �������� �� �� �� �� �� �� �� �� �� �� ���������ƚ������������ �� �� �� �� �� �� �������t��r�����o�������˦��� �� �� �� �� �� �� �k�t��|��t��x�����{������������������ �� �� ����v��h��o��������������������������� �� �� �� ����k��s��������������������p�������Ś������ �������v��r��r��s��y��������y�������Ɉ��������� �������|��������y��������������������f������ �� �� ����������y��s��������|�������ָ�ۘ�������ȩ��� �������{��t��n��h��i}{o����������䝽���������� ����������\yzVpsGacNffa|z��������w��������� �� �� �������Yz|A]bB^`G`_k�������ѕ�������ç��� �� �� ����~��������m��p�������i��h��������� �� �� �� �� �� �������������r��d|z������������� �� �� �� �� �� �� ����� �{��������������� �� �� �� �� �� �� �� �� �� �� �������� �� �� �� �� �� �� �OnClicksbMedicineSetupClick  TToolButtonToolButton6Left�TopWidthCaptionToolButton6
ImageIndexStyle
tbsDivider  	TcxButton
btnVetLinkLeft�TopWidthKHeight0CaptionVet LinkTabOrderTabStopOnClickbtnVetLinkClickDropDownMenupmVetLinkScreen
Glyph.Data
:  6  BM6      6   (                                  �������������������Ǵ�ҳ�̢������Ḙ�������������������������Ү�΢�Ѧ�Ԭ�ԭ�Ȝ�����|����������������������ѩ��У�������ܼ�ϧ�������������������������Ӯ�͟����������޿�Ѫ�������¡�������������������ͯ�̞����������۹�Τ�������������������������������͢�ֹ��ݱ���ӯ�ŗ�������������������������������ʾ�úb��Gz�������⽡������������������������������N��Fy�Dq�Xt����������������������������������z��_��U��T��u����������������������������������ꀳ�v��l��c��h����������������������������������ٙ������y��o�ى�������������������������������ٲ����������VbnVVW������������������������������MR��������ʢӳ��xk������������������������������hm�����ٽ�ɡ�×�Ǡ����������������������������ĺ�ʤ�˦�и�������̮�������������������������������Ƽ�Ͻ������������������������������Layout
blGlyphTopLookAndFeel.KindlfFlatLookAndFeel.NativeStyle	  TToolButtonToolButton5Left�TopWidthCaptionToolButton5
ImageIndexStyle
tbsDivider  TRxSpeedButtonrxRecalcQtyRemainLeft�TopWidthIHeight0CaptionRe-Calc Qty 
RemainFlat	
Glyph.Data
:  6  BM6      6   (                  R  R          � �� ����������������������������������������� �� �� ������������������������������������Ҝ��� �� �� �����������4����4�4��������������ל��� �� �� �����������;�4�4�;�4�����������ݜ��� �� �� �����������;L̅�4�������4��������✟�� �� �� �����������;�;�;�4�������4�����蜟�� �� �� ������������������������������������ꜟ�� �� �� ��������4�������;�4�4�4��������휟�� �� �� �����������4�������;L̅�4��������𜟡� �� �� ��������������4�4�4�;�4��������ꜟ�� �� �� �����������������;�;����;��������ݜ��� �� �� ����������������������������������������� �� �� ������������������������������������期�� �� �� ���������������������������������曝�� �� �� �� ����������������������������������� �� �� �� �� �������������������������������� �� �� �� �OnClickrxRecalcQtyRemainClick  TToolButtonToolButton7Left0TopWidthCaptionToolButton7
ImageIndexStyle
tbsDivider  TRxSpeedButtonbtnPrintGridLeft6TopWidth2Height0CaptionPrintFlat	
Glyph.Data
:  6  BM6      6   (                  R  R          � �� ����������������������������������������� �� �� �cks��������������������������������Ҝ��� �� �cks7u�cks�����������������������������ל��� �� �1��Z��/v�cks��������������������������ݜ��� �� �� �1��Z��/v���������������������������✟�� �� �� ����1��JB9����ņ̃�Ӷ��ź�����������蜟�� �� �� ���������խ���֪�����Ԯ̧���������ꜟ�� �� �� �������׹��ݭ���������ޭӺ������휟�� �� �� �������̧��ܬ�����������̧������𜟡� �� �� �������׹��ԧ�����������׹������ꜟ�� �� �� �����������ȩ��������ޮ׾���������ݜ��� �� �� ����������̧��î�ɦ�ʦھ�Զ���뜟�������� �� �� ����������������׹�׹���������������期�� �� �� ���������������������������������曝�� �� �� �� ����������������������������������� �� �� �� �� �������������������������������� �� �� �� �OnClickbtnPrintGridClick  TToolButtonToolButton4LefthTopWidthCaptionToolButton4
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbHelpLeftnTopWidth:Height0Caption&HelpFlat	
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
wTw����OnClicksbHelpClick   TcxGridcxGridMediPurchLeft TopWidth�HeightAlignalClient	PopupMenupmQueryBatchTreatmentsTabOrderLookAndFeel.KindlfFlat TcxGridDBTableViewcxGridMediPurchDBTableView
OnDblClick"cxGridMediPurchDBTableViewDblClickNavigatorButtons.ConfirmDeleteFilterBox.CustomizeDialogOnFocusedRecordChanged.cxGridMediPurchDBTableViewFocusedRecordChangedDataController.DataSourceWinData.dsMediPurchDataController.KeyFieldNamesIDDataController.OptionsdcoAnsiSortdcoCaseInsensitivedcoAssignMasterDetailKeysdcoSaveExpandingdcoFocusTopRowAfterSortingdcoImmediatePostdcoInsertOnNewItemRowFocusing /DataController.Summary.DefaultGroupSummaryItems )DataController.Summary.FooterSummaryItems $DataController.Summary.SummaryGroups OptionsBehavior.FocusCellOnTab	 OptionsBehavior.FocusCellOnCycle	OptionsCustomize.ColumnGroupingOptionsSelection.InvertSelectOptionsView.FocusRectOptionsView.DataRowHeightOptionsView.GridLinesglHorizontalOptionsView.GroupByBoxOptionsView.HeaderHeight"OptionsView.Indicator	Styles.InactivecxStyle1Styles.SelectioncxStyle1Styles.GroupByBoxcxStyle1 TcxGridDBColumn cxGridMediPurchDBTableViewDrugIDCaptionMedicineDataBinding.FieldNameDrugIDRepositoryItemHerdLookup.erMedicineLookupHeaderAlignmentVertvaCenterOptions.EditingOptions.GroupingWidth�   TcxGridDBColumn cxGridMediPurchDBTableViewSuppIDCaptionSupplierDataBinding.FieldNameSuppIDRepositoryItemHerdLookup.erSupplierLookupHeaderAlignmentVertvaCenterOptions.EditingOptions.GroupingWidth�   TcxGridDBColumn#cxGridMediPurchDBTableViewPurchDateCaptionPurchase 
Date
DataBinding.FieldName	PurchDateHeaderAlignmentVertvaCenterOptions.EditingOptions.Grouping	SortIndex 	SortOrdersoDescendingWidthZ  TcxGridDBColumn"cxGridMediPurchDBTableViewQuantityDataBinding.FieldNameQuantityHeaderAlignmentVertvaCenterOptions.EditingOptions.FilteringOptions.GroupingWidthF  TcxGridDBColumncxGridMediPurchDBTableViewInUseCaptionBatch 
In UseDataBinding.FieldNameInUseHeaderAlignmentVertvaCenterOptions.GroupingWidth<  TcxGridDBColumn!cxGridMediPurchDBTableViewBatchNoTagCaption	Batch No.DataBinding.FieldNameBatchNoHeaderAlignmentVertvaCenterOptions.EditingOptions.FilteringOptions.GroupingWidthQ  TcxGridDBColumn$cxGridMediPurchDBTableViewExpiryDateCaptionExpiry 
DateDataBinding.FieldName
ExpiryDateHeaderAlignmentVertvaCenterOptions.EditingOptions.GroupingWidthZ  TcxGridDBColumn"cxGridMediPurchDBTableViewCostUnitCaptionCost Per UnitDataBinding.FieldNameCostUnitHeaderAlignmentVertvaCenterOptions.EditingOptions.FilteringOptions.GroupingWidthQ  TcxGridDBColumn cxGridMediPurchDBTableViewQtyRemCaptionQuantity 
RemainingDataBinding.FieldNameQtyRemainingHeaderAlignmentVertvaCenterOptions.EditingOptions.FilteringOptions.GroupingWidthF  TcxGridDBColumn%cxGridMediPurchDBTableViewDrugPurchIDDataBinding.FieldNameIDVisibleIsCaptionAssigned	   TcxGridLevelcxGridMediPurchLevelGridViewcxGridMediPurchDBTableView   TdxStatusBar	StatusBarLeft TopWidth�HeightPanelsPanelStyleClassNameTdxStatusBarTextPanelStyleWidth�   Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style   TQuery
qSuppliersDatabaseNameKingswdSQL.Strings$SELECT * FROM "SuppliersBreeders.db"WHERE (MedicineSupplier = True) Left�Top�   TDataSourcedsSuppliersDataSet
qSuppliersLeft�Top�   TcxStyleRepositorycxStyleRepository1Left�Top�  TcxStylecxStyle1AssignedValuessvColorsvFontsvTextColor Color��� Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style 	TextColorclBlack   
TPopupMenupmVetLinkScreenLeft�Top` 	TMenuItempmiVetLinkScreenCaptionVet Link ScreenOnClickpmiVetLinkScreenClick   TdxComponentPrinter	PrintGridCurrentLinkPrintGridLinkVersion Left�TopA TdxGridReportLinkPrintGridLinkActive		ComponentcxGridMediPurchPrinterPage.DMPaper	PrinterPage.Footer�PrinterPage.Header�PrinterPage.Margins.Bottom�1PrinterPage.Margins.Left�1PrinterPage.Margins.Right�1PrinterPage.Margins.Top�1PrinterPage.OrientationpoLandscapePrinterPage.PageSize.XP4 PrinterPage.PageSize.Y(�  PrinterPage._dxMeasurementUnits_ PrinterPage._dxLastMU_ReportDocument.CaptionTestReportDocument.CreationDate ���͹�@ReportTitle.TextTestOptionsView.ExpandButtonsOptionsView.GroupFootersBuiltInReportLink	   
TPopupMenupmQueryBatchTreatmentsLeft�Top�  	TMenuItempmiQueryBatchTreatmentsCaptionQuery Batch TreatmentsOnClickpmiQueryBatchTreatmentsClick    