�
 TFSALESDEATHS 0�9  TPF0TfSalesDeathsfSalesDeathsLeftnTop� Width�Height�ActiveControlSearchForAnimalCaptionSale or DeathColor	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style OldCreateOrder	PositionpoScreenCenterScaled
OnActivateFormActivateOnClose	FormCloseOnCloseQueryFormCloseQuery	OnDestroyFormDestroyOnShowFormShowPixelsPerInch`
TextHeight TLabellDefaultLeft�Top7WidthCHeightCaptionDefaults OnFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameVerdana
Font.Style 
ParentFontVisible  TPanelKillDiedLeftTopGWidth�Height		AlignmenttaLeftJustify
BevelInner	bvLoweredTabOrder  TLabel	lCustomerLeftTopKWidth>HeightCaptionCustomer  TLabellSaleDeathDateLeftTophWidthHeightCaptionDate  TLabellNoLeftTopWidthgHeightCaptionAnimal No/Code  TLabelAnimalStatusLabelLeftTop-Width[HeightCaptionAnimal Status  TLabellCostsLeft	Top� WidthlHeightCaptionDeduct./Transp.  TLabelCommentLabelLeft�TopIWidth=HeightCaptionComment  TLabelNatIDNumLabelLeft�TopWidth`HeightCaptionNat ID Number  TLabellCullingLeft�Top%WidthDHeight CaptionCause of Cull/DeathWordWrap	  TDBTextNatIDNumLeft�TopWidth� HeightColor��� 	DataFieldNatIDNum
DataSourceWinData.AnimalSourceByIDParentColor  TLabellDisposalTypeLeft&Top� WidthjHeightCaptionDisposal MannerVisible  TLabellbFallenStkNoLeft�TophWidthlHeightCaptionFallen Stock No.  TLabellDeductionsLeft	Top� WidthOHeightCaptionOther Costs  TDBRadioGroupAnimalStatusLeft� TopWidth� Height&Color	clBtnFaceColumns	DataFieldSold
DataSourceWinData.dsSaleDeathItems.StringsSoldDied ParentColorTabOrderTabStop	Values.StringsTrueFalse OnChangeAnimalStatusChangeOnClickAnimalStatusClickOnEnterAnimalStatusEnterOnExitAnimalStatusExit  
TComboEditSearchForAnimalLeft� TopWidth� Height
ButtonHintSearch for AnimalsCharCaseecUpperCaseColorclTealFont.CharsetANSI_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameVerdana
Font.Style 
Glyph.Data
F  B  BMB      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 3333333��   333333?��   333333���   33333?��6   33333���7   3334D��36   333D�O�31   334��336   334HO�330   334�tH336   33D��C330   3D��D3330   4H�C33330   4�w333330   4�t33333?   4DC333330   333333337   	MaxLength	NumGlyphs
ParentFontTabOrder OnButtonClickSearchForAnimalButtonClickOnChangeSearchForAnimalChangeOnEnterSearchForAnimalEnterOnExitSearchForAnimalExit  TRxDBLookupCombo	CustomersLeft� TopHWidth� HeightDropDownCountColorclTeal	DataFieldCustomer
DataSourceWinData.dsSaleDeathDisplayEmpty<Add>
EmptyValue0EmptyItemColorclTealFont.CharsetANSI_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameVerdana
Font.Style LookupFieldIDLookupDisplayNameLookupSourceWinData.dsQueryCustomers
ParentFontTabOrderOnChangeCustomersChange	OnCloseUpCustomersCloseUp  TDBDateEditDateOfSaleDeathLeft� TopfWidthyHeight	DataField	EventDate
DataSourceWinData.EventSourceColorclTealFont.CharsetANSI_CHARSET
Font.ColorclHighlightTextFont.Height�	Font.NameVerdana
Font.Style 	NumGlyphs
ParentFontTabOrderWeekendsSunSat WeekendColorclBlue
YearDigitsdyFourOnChangeDateOfSaleDeathChangeOnExitDateOfSaleDeathChange  TDBEdit	dbCommentLeft�TopFWidth� Height	DataField	EventDesc
DataSourceWinData.EventSourceTabOrderOnChangedbCommentChange  TRxDBLookupCombo
rxcCullingLeft�Top*Width� HeightDropDownCountDropDownWidth,	DataFieldCulled
DataSourceWinData.dsSaleDeathLookupFieldIDLookupDisplayDescriptionLookupSourceWinData.dsCullingTabOrderOnChangerxcCullingChange  TCurrencyEditceCostsLeft� Top� WidthyHeightAutoSizeBorderStylebsNoneColor��� ReadOnly	TabOrder	Visible  TDBEdit	CustCostsLeft� Top� WidthyHeightTabStopColor��� 	DataFieldCustomerCosts
DataSourceWinData.dsSaleDeathReadOnly	TabOrder  TPanelpSalesControlsLeftTop~Width�HeightS
BevelOuterbvNoneTabOrder TLabel
PriceLabelLeftTopWidth HeightCaptionPrice  TLabel
GradeLabelLeftTopAWidth&HeightCaptionGrade  TLabelKillOutLabelLeftTop"Width;HeightCaption	Kill Out%  TLabelSaleWtLabelLeftTop"WidthMHeightCaptionLive Weight  TLabelPricePerKgLabelLeft�TopWidth5HeightCaptionPrice/kg  TLabelColdDeadWtLabelLeftTopWidthTHeightCaptionDead Weight  TLabelKillNumberLabelLeftTopAWidthGHeightCaptionKill Number  TLabellWgtDateLeft�Top"Width6HeightCaptionOn Date  TLabel	lSalesGrpLeft�TopAWidthGHeightCaption
Sale Group  TDBEditWeightLeftnTopWidthyHeightHintWeight from Mart Documents	DataFieldWeight
DataSourceWinData.dsSaleDeathTabOrderOnChangeWeightChangeOnExit
WeightExit  TDBEditPriceLeftxTopWidthyHeight	DataFieldPrice
DataSourceWinData.dsSaleDeathTabOrder OnChangePriceChangeOnExit	PriceExit  TDBEdit
ColdDeadWtLeftnTopWidthyHeight	DataField
ColdDeadWt
DataSourceWinData.dsSaleDeathTabOrderOnChangeColdDeadWtChangeOnExitColdDeadWtExit  TDBEditGradeLeftxTop;WidthyHeightHint
Sale Grade	DataFieldGrade
DataSourceWinData.dsSaleDeathTabOrderOnChangeGradeChange  TCurrencyEdit
PricePerKgLeftETopWidthyHeightAutoSizeTabOrderOnChangePricePerKgChangeOnExitPricePerKgExit  TDBEdit
KillNumberLeftnTop;WidthyHeight	DataField
KillNumber
DataSourceWinData.dsSaleDeathTabOrderOnChangeKillNumberChange  	TComboBox
cbSalesGrpLeftETop;WidthyHeightStylecsDropDownList
ItemHeightTabOrderOnChangecbSalesGrpChange  TDBDateEdit
dbeWgtDateLeftETopWidthyHeight	DataFieldWeighingDate
DataSourceWinData.dsSaleDeath	NumGlyphsTabOrderWeekendsSunSat 
YearDigitsdyFourOnChangedbeWgtDateChange  TDBEditKillOutLeftxTopWidthyHeight	DataFieldKillOut
DataSourceWinData.dsSaleDeathTabOrderOnChangeKillOutChange   TRxDBLookupCombodbcmbDisposalType1Left�Top� Width� HeightDropDownCountColorclTeal	DataFieldDisposal
DataSourceWinData.dsSaleDeathDisplayEmpty<Select Disposal Type>
EmptyValue0EmptyItemColorclTealFont.CharsetANSI_CHARSET
Font.ColorclHighlightTextFont.Height�	Font.NameVerdana
Font.Style LookupFieldIDLookupDisplayDescription;LookupCodeLookupSourceHerdLookup.dsqGenLook
ParentFontTabOrderTabStopVisibleOnChangedbcmbDisposalType1Change  TDBEditdbeFallenStkNoLeft�TopdWidthuHeight	DataFieldFallenStkNo
DataSourceWinData.dsSaleDeathTabOrder  TDBEditTotalDeductionsLeftvTop� WidthyHeightHintWeight from Mart Documents	DataFieldTotalDeductions
DataSourceWinData.dsSaleDeathTabOrder
OnChangeWeightChangeOnExit
WeightExit  TcxDBLookupComboBoxdbcmbDisposalTypeLeft�Top� TabStopRepositoryItem!HerdLookup.erLookupDisposalMannerDataBinding.DataFieldDisposalDataBinding.DataSourceWinData.dsSaleDeathProperties.ListColumns Properties.OnCloseUp"dbcmbDisposalTypePropertiesCloseUpProperties.OnInitPopup$dbcmbDisposalTypePropertiesInitPopupStyle.StyleController#WinData.RequiredEditStyleControllerTabOrderVisible	OnKeyDowndbcmbDisposalTypeKeyDownWidth�    TToolBarToolBar1Left Top Width�Height5ButtonHeight/ButtonWidthVEdgeBordersebLeftebTopebRightebBottom TabOrder TToolButtonToolButton2Left TopWidthCaptionToolButton2
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbExitLeftTopWidth:Height/HintClick Here To ExitCaptionE&xitFlat	
Glyph.Data
F  B  BMB      B   (                                   |  �     �=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=��=��=�=�=�=   < < < < < < <� <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=������=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=����=��=�=��=�=�=�=   < <����� < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=��=�=�=�=�=�=�=�=�=��=�=�=�=   < < < < < < < < <  �=�=�=�=�=�=����������=��=�=�=�=                      �=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=�=	NumGlyphsOnClickExitButtonClick  TToolButtonToolButton1LeftBTopWidthCaptionToolButton1
ImageIndex Style
tbsDivider  TKwDBNavigatorSaleDeathNavLeftJTopWidth~Height/
DataSourceWinData.EventSourceVisibleButtonskwnbPost
kwnbCancel Flat	Ctl3DHints.Strings&Save&Cancel Captions.Strings&Save&Cancel ParentCtl3DTabOrder BeforeActionSaleDeathNavBeforeActionOnClickSaleDeathNavClick  TRxSpeedButtonsbDeleteLeft� TopWidth:Height/Caption&DeleteFlat	
Glyph.Data
J  F  BMF      v   (               �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 33333333333333  33333333333333  33333333333333  33333333333333  33333338������  3     3833333�  3     3833333�  3     3833333�  33333338������  33333333333333  33333333333333  33333333333333  33333333333333  	NumGlyphsOnClickbDeleteClick  TToolButtonToolButton3LeftTopWidthCaptionToolButton3
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbKillOutPercsLeft
TopWidth]Height/Caption
Kill Out %Flat	Font.CharsetANSI_CHARSET
Font.Color	clBtnTextFont.Height�	Font.NameVerdana
Font.Style 
Glyph.Data
:  6  BM6      6   (                  C  C          � �� ��hI�hI�hI�hI�hI�hI�hI�hI�hI�hI�hI�hI� �� �� �Жw�ū⽣⽣⽣⽣֦�צ�צ�ҝ~Иyˏg�xL�hI� �� �Жw�ū⽣�֥�{Z⽣�֥�{Zצ�)�Z cˏgǂ\�hI� �� �Жw�ū⽣����֥⽣����֥צ���)�Zˏgǂ\�hI� �� �Жw�ū⽣⽣⽣⽣֦�צ�צ�ҝ~Иyˏgǂ\�hI� �� �Жw�ū⽣�֥�{Z⽣�֥�{Zצ��� �^ ˏgǂ\�hI� �� �Жw�ū⽣����֥⽣����֥צ���{�� ˏgǂ\�hI� �� �Жw�ū⽣⽣⽣⽣֦�צ�צ�ҝ~Иyˏgǂ\�hI� �� �Жw�ū⽣�֥�{Z⽣�֥�{Zצ�c�Y�ˏgǂ\�hI� �� �Жw�ū⽣����֥⽣����֥צ����c�ˏgǂ\�hI� �� �Жw�ū⽣⽣⽣⽣֦�֦�֦�ҝ~Иyˏgǂ\�hI� �� �Жw���Δ�Δ�Δ�Δ�Δ�Δ�Δ�Δ�Δ�Δ�ǂ\�hI� �� �Жw����О�О�̒�ɉ�Ƃ��z{�sv�nu�mΔ�ǂ\�hI� �� �Жw����О�߭�ٞ�ԑ�ш~�~v�vm�mh�hΔ�ǂ\�hI� �� �Жw����������������������������������xL�hI� �� �� �ЖwЖwЖwЖwЖwЖwЖwЖwЖwЖwЖwЖw� �� �
ParentFontOnClicksbKillOutPercsClick  TToolButtonToolButton6LeftgTopWidthCaptionToolButton6
ImageIndexStyle
tbsDivider  TRxSpeedButton
sbDefaultsLeftoTopWidthiHeight/CaptionSave as DefaultFlat	Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
Glyph.Data
R  N  BMN      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333   3 3333333   0� 333333   0LD 33333   3�D 3333   3|�D 333   30���@33   30L|�@@33   33|�@3   33�@�@�3   330D�`   330 ��v�    333D�    3330 ~� �   3333gh   33330 ��v   33333 ��   333330�~�   
ParentFontWordWrap	OnClicksbDefaultsClick  TToolButtonToolButton5Left�TopWidthCaptionToolButton5
ImageIndexStyle
tbsDivider  TRxSpeedButtonRxSpeedButton2Left�TopWidthKHeight/CaptionAccountsFlat	
Glyph.Data
�   �   BM�       v   (               �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� UUUP  UUUU ��UUP0�30UU���3U;��33P���;��0P��;��30P��;��;0P��3�3�P�33����P�3333�U3�3;�U�30��UUP�3��UUU �30UUUUU  UUOnClickRxSpeedButton2Click  TToolButtonToolButton4Left+TopWidthCaptionToolButton4
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbHelpLeft3TopWidth:Height/HintClick Here For HelpCaption&HelpFlat	
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
wTw����OnClicksbHelpClick   TdxStatusBar	StatusBarLeft Top]Width�HeightPanelsPanelStyleClassNameTdxStatusBarTextPanelStyleWidthK PanelStyleClassNameTdxStatusBarTextPanelStylePanelStyle.AlignmenttaRightJustifyPanelStyle.Font.CharsetANSI_CHARSETPanelStyle.Font.ColorclBlackPanelStyle.Font.Height�PanelStyle.Font.NameTahomaPanelStyle.Font.Style PanelStyle.ParentFontWidth< PanelStyleClassNameTdxStatusBarTextPanelStyleWidthK PanelStyleClassNameTdxStatusBarTextPanelStyleWidthK PanelStyleClassNameTdxStatusBarTextPanelStyleWidthn PanelStyleClassNameTdxStatusBarTextPanelStyleWidthK PanelStyleClassNameTdxStatusBarTextPanelStylePanelStyle.Font.CharsetANSI_CHARSETPanelStyle.Font.ColorclRedPanelStyle.Font.Height�PanelStyle.Font.NameTahomaPanelStyle.Font.Style PanelStyle.ParentFontWidth�  PanelStyleClassNameTdxStatusBarTextPanelStyle  LookAndFeel.KindlfUltraFlatLookAndFeel.NativeStyleFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style   TQueryMyQueryDatabaseNamekingswdLeft|Top  TQueryqNumAnimalsDatabaseNameKingswdSQL.Strings"SELECT DISTINCT D.HerdID, D.InHerdFROM "Animals.DB" D Left�Top  TcxStyleRepositorycxStyleRepository1Left�Top   