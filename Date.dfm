object RangeForm: TRangeForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'RangeForm'
  ClientHeight = 149
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 280
    Height = 149
    Align = alClient
    ExplicitLeft = 8
    ExplicitWidth = 282
    ExplicitHeight = 184
  end
  object Label1: TLabel
    Left = 8
    Top = 23
    Width = 93
    Height = 15
    Caption = '&'#1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 66
    Width = 86
    Height = 15
    Caption = '&'#1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BegDTP: TDateTimePicker
    Left = 119
    Top = 23
    Width = 132
    Height = 21
    Date = 43979.000000000000000000
    Time = 0.489069074072176600
    TabOrder = 0
    OnChange = BegDTPChange
  end
  object EndDTP: TDateTimePicker
    Left = 119
    Top = 66
    Width = 132
    Height = 21
    Date = 43979.000000000000000000
    Time = 0.489125173611682800
    TabOrder = 1
    OnChange = BegDTPChange
  end
  object OkBitBt: TBitBtn
    Left = 26
    Top = 106
    Width = 75
    Height = 25
    Caption = #1054#1082
    ModalResult = 1
    TabOrder = 2
  end
  object CancelBitBt: TBitBtn
    Left = 149
    Top = 104
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
end
