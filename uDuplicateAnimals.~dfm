object fmDuplicateAnimals: TfmDuplicateAnimals
  Left = 718
  Top = 256
  BorderStyle = bsDialog
  Caption = 'Duplicate Animals'
  ClientHeight = 416
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object AnimalGrid: TcxGrid
    Left = 16
    Top = 82
    Width = 605
    Height = 281
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
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 28
      OptionsView.Indicator = True
      object AnimalGridTableViewId: TcxGridColumn
        Caption = 'ID'
        Visible = False
        Hidden = True
        Options.Editing = False
        Options.Filtering = False
      end
      object AnimalGridTableViewAnimalNo: TcxGridColumn
        Caption = 'Animal No'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 80
      end
      object AnimalGridTableViewNatIdNo: TcxGridColumn
        Caption = 'Nat. Id. No'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 148
      end
      object AnimalGridTableViewDateOfBirth: TcxGridColumn
        Caption = 'Date Of Birth'
        DataBinding.ValueType = 'DateTime'
        OnGetDisplayText = AnimalGridTableViewDateOfBirthGetDisplayText
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 92
      end
      object AnimalGridTableViewSex: TcxGridColumn
        Caption = 'Sex'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 70
      end
      object AnimalGridTableViewLeftHerd: TcxGridColumn
        Caption = 'Left Herd'
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 70
      end
      object AnimalGridTableViewNewNumber: TcxGridColumn
        Caption = 'New Animal No.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 115
      end
      object AnimalGridTableViewHerdId: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
        Hidden = True
      end
      object AnimalGridTableViewHerdBookNo: TcxGridColumn
        Caption = 'Herd Book No.'
        Visible = False
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 150
      end
      object AnimalGridTableViewName: TcxGridColumn
        Caption = 'Name'
        Visible = False
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 150
      end
    end
    object AnimalGridLevel1: TcxGridLevel
      GridView = AnimalGridTableView
    end
  end
  object btnUpdate: TcxButton
    Left = 379
    Top = 376
    Width = 163
    Height = 32
    Caption = 'Update Numbers'
    Default = True
    TabOrder = 1
    OnClick = btnUpdateClick
    LookAndFeel.NativeStyle = True
  end
  object btnClose: TcxButton
    Left = 549
    Top = 376
    Width = 75
    Height = 32
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 2
    LookAndFeel.NativeStyle = True
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 4
    AutoSize = False
    Caption = 
      'Duplicate Animal No.'#39's have been detected. You must change the a' +
      'nimal containing the duplicate number. '#13#10'It is advised that you ' +
      're-number the animal if it have left the herd - check the left h' +
      'erd column for indication. '#13#10'To renumber an animal, simply enter' +
      ' the new number into the "New Animal No." column. '#13#10'When all dup' +
      'licates have been changed, click the Update Numbers button to co' +
      'nfirm changes.'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Height = 75
    Width = 607
  end
  object btnAutoFix: TcxButton
    Left = 16
    Top = 376
    Width = 97
    Height = 32
    Caption = 'Auto Fix'
    TabOrder = 4
    OnClick = btnAutoFixClick
    LookAndFeel.NativeStyle = True
  end
  object PopupMenu1: TPopupMenu
    Left = 282
    Top = 379
    object Removeallotherinstancesofthisanimal1: TMenuItem
      Caption = 'Remove all other instances of this animal'
      OnClick = Removeallotherinstancesofthisanimal1Click
    end
  end
end
