�
 TFSELECTANIMALBYNATID 0�  TPF0TfSelectAnimalByNatIDfSelectAnimalByNatIDLeftxTop� BorderStylebsDialogCaptionSelect AnimalClientHeight�ClientWidth�Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style PositionpoScreenCenterOnClose	FormClosePixelsPerInch`
TextHeight TDBGridDBGrid1Left Top Width�Height�AlignalClient
DataSourceDataSource1OptionsdgTitles
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExit TabOrder TitleFont.CharsetANSI_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameVerdanaTitleFont.Style 
OnDblClickDBGrid1DblClick
OnKeyPressDBGrid1KeyPressColumns	FieldNamenatidnumTitle.CaptionNational IDWidth�  	FieldNameNameTitle.CaptionAnimal NameWidth 	FieldNameSexWidthK    TPanelPanel1Left Top�Width�Height2AlignalBottom
BevelOuterbvNoneTabOrder TButtonbOkLeft	TopWidth� Height'Caption&OKEnabledModalResultTabOrder   TButtonbCancelLeftmTopWidth� Height'Cancel	Caption&CancelModalResultTabOrder   TStaticTextStaticText1LeftTopxWidthRHeightBorderStyle	sbsSunkenCaptionStaticText1ColorclInfoBkFont.CharsetANSI_CHARSET
Font.Color
clInfoTextFont.Height�	Font.NameVerdana
Font.Style ParentColor
ParentFontTabOrderVisible  TDataSourceDataSource1DataSetQuery1OnDataChangeDataSource1DataChangeLeft Top  TQueryQuery1DatabaseNameKingswdSQL.Strings)select id, NatIdNum,Name,Sex from animals,where natidnum is not null order by NatIdNum LeftHTop  TTimerTimer1Interval�OnTimerTimer1TimerLeft�Top    