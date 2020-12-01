object fmSyncWarning: TfmSyncWarning
  Left = 413
  Top = 219
  BorderStyle = bsDialog
  Caption = 'Sync Warnings'
  ClientHeight = 353
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 17
  object AnimalGrid: TcxGrid
    Left = 16
    Top = 42
    Width = 605
    Height = 253
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object AnimalGridTableView: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = True
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = True
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = True
      NavigatorButtons.Delete.Visible = True
      NavigatorButtons.Edit.Visible = True
      NavigatorButtons.Post.Visible = True
      NavigatorButtons.Cancel.Visible = True
      NavigatorButtons.Refresh.Visible = True
      NavigatorButtons.SaveBookmark.Visible = True
      NavigatorButtons.GotoBookmark.Visible = True
      NavigatorButtons.Filter.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.DataRowHeight = 124
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 28
      OptionsView.Indicator = True
      object AnimalGridTableViewNatIdNo: TcxGridColumn
        Caption = 'Nat. Id. No'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 146
      end
      object AnimalGridTableViewWarning: TcxGridColumn
        Caption = '       Warning'
        PropertiesClassName = 'TcxMemoProperties'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 800
      end
      object AnimalGridTableViewIsCurrent: TcxGridColumn
        Caption = 'IsCurrent'
        DataBinding.ValueType = 'Boolean'
        Visible = False
        Hidden = True
      end
    end
    object AnimalGridLevel: TcxGridLevel
      GridView = AnimalGridTableView
    end
  end
  object btnClose: TcxButton
    Left = 549
    Top = 307
    Width = 75
    Height = 32
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
    LookAndFeel.NativeStyle = True
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 3
    AutoSize = False
    Caption = 
      'Please review the following list which contains animals along wi' +
      'th a reason as to why their event(s) could not be recorded. '
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.WordWrap = True
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.TextColor = clRed
    Style.IsFontAssigned = True
    Height = 40
    Width = 599
  end
  object cbShowAllWarnings: TcxCheckBox
    Left = 16
    Top = 305
    Caption = 'Show All Warnings'
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 3
    OnClick = cbShowAllWarningsClick
    Width = 145
  end
end
