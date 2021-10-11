object Form1: TForm1
  Left = 222
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'Nstruct - '#1056#1072#1073#1086#1090#1072' '#1089' DBF'
  ClientHeight = 645
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000311133000000000
    0000000000000001119333000000000000000000033133111113308000000000
    0000003331110911113888000000000000033301919911191330800833000003
    3333311991991019131888399300031111331999911990018833333331100111
    118319999911110083333333111001113B313111999138331011199911100083
    3103301111188133011911191110000008333380000000311011999191300000
    0000000000000001111011119910000000000310000000019191091911000000
    0000000000000001911911919300000000000000000000019119910910000000
    0000000000000001991999111000000000000000000000019911199913000000
    0000000000000003191911999100000000000000000100031119999110000000
    0000000000030000101999991300000000000000000300008009911913000000
    0000000000000000810399911300000000000000000000000311119130000000
    000000000000000003100111100000000000000000000000003033B330000000
    0000000000000000000133311000000000000000000000000008131110000000
    0000000000000000000033111000000000000000000000000000038130000000
    000000000000000000000033000000000000000000000000000000000000FFFF
    FFFFFFFFF81FFFFFE01FFFF8001FFFC0003FFE000063E0000003800000018000
    000180000001C0000001F81F0001FFFCA001FF83A003FFFF6003FFFF6007FFFF
    6007FFFEE003FFFEE003FFFEE007FFFEF003FFFEF003FFFFF003FFFFF807FFFF
    F807FFFFFC07FFFFFE07FFFFFE07FFFFFF07FFFFFF87FFFFFFCFFFFFFFFF}
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    921
    645)
  PixelsPerInch = 120
  TextHeight = 16
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 8
    Width = 161
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083
    OnClick = SpeedButton1Click
  end
  object SpeedButton3: TSpeedButton
    Left = 704
    Top = 8
    Width = 209
    Height = 25
    Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1090#1088#1091#1082#1090#1091#1088#1091
    OnClick = SpeedButton3Click
  end
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 95
    Height = 16
    Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091':'
  end
  object MaskEdit1: TMaskEdit
    Left = 112
    Top = 48
    Width = 553
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '.DBF'
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 606
    Width = 921
    Height = 20
    Align = alBottom
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 626
    Width = 921
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 88
    Width = 921
    Height = 518
    ActivePage = TabSheet1
    Align = alBottom
    HotTrack = True
    MultiLine = True
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 913
        Height = 487
        Hint = #1044#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082' - '#1074' '#1073#1091#1092#1077#1088
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 20
        MultiSelect = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = ListBox1DblClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 913
        Height = 449
        Hint = #1044#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082' - '#1074'  '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
        Align = alTop
        DataSource = DataSource1
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 456
        Width = 300
        Height = 25
        DataSource = DataSource1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object Button1: TButton
        Left = 736
        Top = 456
        Width = 169
        Height = 25
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button1Click
      end
      object Edit2: TEdit
        Left = 504
        Top = 455
        Width = 153
        Height = 24
        TabOrder = 3
        Text = #1063#1090#1086' '#1080#1097#1077#1084
      end
      object ComboBox2: TComboBox
        Left = 304
        Top = 455
        Width = 193
        Height = 24
        ItemHeight = 16
        TabOrder = 4
        Text = #1048#1084#1103' '#1087#1086#1083#1103
      end
      object Button2: TButton
        Left = 664
        Top = 456
        Width = 65
        Height = 25
        Caption = #1053#1072#1081#1090#1080
        TabOrder = 5
        OnClick = Button2Click
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 176
    Top = 8
    Width = 281
    Height = 24
    Hint = #1048#1085#1076#1077#1082#1089#1099
    Style = csDropDownList
    ItemHeight = 16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnChange = ComboBox1Change
  end
  object Edit1: TEdit
    Left = 672
    Top = 48
    Width = 241
    Height = 25
    Enabled = False
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 89
    Top = 130
  end
  object Table1: TTable
    Exclusive = True
    StoreDefs = True
    TableType = ttFoxPro
    Left = 126
    Top = 131
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'dbf'
    Filter = 'dbf|*.dbf'
    Title = #1042#1099#1073#1080#1088#1077#1090#1077' DBF '#1092#1072#1081#1083' '
    Left = 51
    Top = 164
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 128
    object N2: TMenuItem
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1089' '#1090#1072#1073#1083#1080#1094#1077#1081
      object Mpack: TMenuItem
        Caption = #1059#1087#1072#1082#1086#1074#1072#1090#1100
        OnClick = MpackClick
      end
      object DosWin: TMenuItem
        Caption = #1055#1077#1088#1077#1082#1086#1076#1080#1088#1086#1074#1072#1090#1100' DOS-> WIN'
        OnClick = DosWinClick
      end
      object WINDOS: TMenuItem
        Caption = #1055#1077#1088#1077#1082#1086#1076#1080#1088#1086#1074#1072#1090#1100' WIN->DOS'
        OnClick = WINDOSClick
      end
      object MdelAll: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        OnClick = MdelAllClick
      end
      object Mzap: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1080' '#1091#1087#1072#1082#1086#1074#1072#1090#1100
        OnClick = MzapClick
      end
      object MdellInd: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1076#1077#1082#1089#1085#1099#1081
        OnClick = MdellIndClick
      end
      object N9: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100', '#1091#1087#1072#1082#1086#1074#1072#1090#1100' '#1080' '#1091#1076#1072#1083#1080#1090#1100' '#1080#1085#1076#1077#1082#1089#1085#1099#1081
        OnClick = N9Click
      end
    end
    object N1: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N1Click
    end
    object N7: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N7Click
    end
  end
  object BatchMove1: TBatchMove
    Left = 52
    Top = 129
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 89
    Top = 165
  end
  object Table2: TTable
    DefaultIndex = False
    TableType = ttFoxPro
    Left = 126
    Top = 165
  end
end
