object fmHerdSelect: TfmHerdSelect
  Left = 325
  Top = 233
  Width = 291
  Height = 97
  Caption = 'Switch to Herd '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pHerd: TPanel
    Left = 0
    Top = 0
    Width = 283
    Height = 63
    Align = alClient
    BevelInner = bvRaised
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 9
      Width = 83
      Height = 14
      Caption = 'Herd Identity'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object sbSelect: TRxSpeedButton
      Left = 183
      Top = 25
      Width = 82
      Height = 25
      Caption = 'Switch'
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C10000002000210001F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1000000200020002000210001F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C100000020002000200020002000210001F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1000000200020002E003000200020002000210001F7C1F7C1F7C
        1F7C1F7C1F7C000200020002E0031F7CE00300020002000210001F7C1F7C1F7C
        1F7C1F7C1F7CE0030002E0031F7C1F7C1F7CE00300020002000210001F7C1F7C
        1F7C1F7C1F7C1F7CE0031F7C1F7C1F7C1F7C1F7CE00300020002000210001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CE0030002000200021000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CE003000200020002
        10001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CE00300020002
        000210001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CE0030002
        0002000210001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CE003
        0002000210001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        E003000200021F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7CE0031F7C}
      Layout = blGlyphLeft
      Spacing = 8
      OnClick = sbSelectClick
    end
    object HerdCombo: TDBComboBoxEh
      Left = 18
      Top = 26
      Width = 153
      Height = 22
      AlwaysShowBorder = True
      Color = clWhite
      DropDownBox.AutoDrop = True
      EditButton.ShortCut = 16463
      EditButton.Width = 14
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Flat = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
  end
end