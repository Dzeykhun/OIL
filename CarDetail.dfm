﻿object CarDetailForm: TCarDetailForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'CarDetailForm'
  ClientHeight = 792
  ClientWidth = 402
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
  object TehPropGB: TGroupBox
    Left = 0
    Top = 0
    Width = 402
    Height = 366
    Align = alClient
    Caption = '&'#1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1072#1103' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072' '#1058#1057
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 17
      Width = 136
      Height = 13
      Hint = #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1082' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1102
      AutoSize = False
      Caption = '&'#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1085#1072#1082'*'
    end
    object Label2: TLabel
      Left = 5
      Top = 46
      Width = 198
      Height = 13
      Hint = #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1082' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1102
      AutoSize = False
      Caption = '&'#1048#1076#1077#1085#1090#1077#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088'(VIN)*'
    end
    object Label3: TLabel
      Left = 5
      Top = 75
      Width = 84
      Height = 15
      AutoSize = False
      Caption = '&'#1052#1072#1088#1082#1072', '#1084#1086#1076#1077#1083#1100
    end
    object Label4: TLabel
      Left = 5
      Top = 104
      Width = 49
      Height = 15
      AutoSize = False
      Caption = '&'#1058#1080#1087' '
    end
    object Label5: TLabel
      Left = 5
      Top = 133
      Width = 155
      Height = 15
      Caption = '&'#1050#1072#1090#1077#1075#1086#1088#1080#1103'  (ABCD, '#1087#1088#1080#1094#1077#1087')'
    end
    object Label6: TLabel
      Left = 5
      Top = 162
      Width = 72
      Height = 15
      Caption = '&'#1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072
    end
    object Label7: TLabel
      Left = 5
      Top = 192
      Width = 57
      Height = 15
      AutoSize = False
      Caption = '&'#1064#1072#1089#1089#1080' '#8470
    end
    object Label8: TLabel
      Left = 5
      Top = 221
      Width = 49
      Height = 15
      Caption = '&'#1050#1091#1079#1086#1074' '#8470
    end
    object Label9: TLabel
      Left = 5
      Top = 250
      Width = 28
      Height = 15
      Caption = '&'#1062#1074#1077#1090
    end
    object Label10: TLabel
      Left = 5
      Top = 279
      Width = 160
      Height = 15
      Caption = '&'#1052#1086#1097#1085#1086#1089#1090#1100' '#1076#1074#1080#1075#1072#1090#1077#1083#1103', '#1082#1042#1090'/'#1083
    end
    object Label11: TLabel
      Left = 6
      Top = 308
      Width = 123
      Height = 15
      Caption = '&'#1069#1082#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1081' '#1082#1083#1072#1089#1089
    end
    object Label22: TLabel
      Left = 2
      Top = 334
      Width = 60
      Height = 15
      Caption = '&'#1057#1086#1089#1090#1086#1103#1085#1080#1077
    end
    object REGSymbolEdit: TEdit
      Left = 225
      Top = 14
      Width = 162
      Height = 23
      MaxLength = 15
      TabOrder = 0
    end
    object VinEdit: TEdit
      Left = 225
      Top = 43
      Width = 162
      Height = 23
      MaxLength = 20
      TabOrder = 1
    end
    object ModelEdit: TEdit
      Left = 162
      Top = 72
      Width = 225
      Height = 23
      MaxLength = 50
      TabOrder = 2
    end
    object TypeEdit: TEdit
      Left = 162
      Top = 101
      Width = 225
      Height = 23
      MaxLength = 30
      TabOrder = 3
    end
    object CategoryCB: TComboBox
      Left = 306
      Top = 130
      Width = 81
      Height = 23
      Style = csDropDownList
      MaxLength = 5
      TabOrder = 4
      Items.Strings = (
        'A'
        'A1'
        'B'
        'B1'
        'C'
        'C1'
        'D'
        'D1'
        'BE'
        'CE'
        'CIE'
        'DE'
        'DIE'
        'M'
        'M1'
        'Tm'
        'Tb')
    end
    object YearEdit: TSpinEdit
      Left = 306
      Top = 159
      Width = 81
      Height = 24
      MaxValue = 0
      MinValue = 0
      TabOrder = 5
      Value = 0
    end
    object ChassisEdit: TEdit
      Left = 225
      Top = 189
      Width = 162
      Height = 23
      TabOrder = 6
    end
    object CarcassEdit: TEdit
      Left = 225
      Top = 218
      Width = 162
      Height = 23
      MaxLength = 40
      TabOrder = 7
    end
    object ColorEdit: TEdit
      Left = 162
      Top = 247
      Width = 225
      Height = 23
      MaxLength = 40
      TabOrder = 8
    end
    object PowerEdit: TEdit
      Left = 225
      Top = 276
      Width = 162
      Height = 23
      NumbersOnly = True
      TabOrder = 9
    end
    object EcologyEdit: TEdit
      Left = 162
      Top = 305
      Width = 225
      Height = 23
      MaxLength = 30
      TabOrder = 10
    end
    object ReserveChB: TCheckBox
      Left = 290
      Top = 332
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = #1056#1077#1079#1077#1088#1074
      TabOrder = 11
    end
    object StateCB: TComboBox
      Left = 88
      Top = 334
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 12
      Items.Strings = (
        #1042' '#1088#1072#1073#1086#1095#1077#1084' '#1089#1086#1089#1090#1086#1103#1085#1080#1080
        #1042' '#1088#1077#1084#1086#1085#1090#1077
        #1058#1088#1077#1073#1091#1077#1090' '#1088#1077#1084#1086#1085#1090
        #1058#1054'1'
        #1058#1054'2'
        #1058#1054'3'
        #1050#1072#1087' '#1088#1077#1084#1086#1085#1090
        #1057#1088#1077#1076' '#1088#1077#1084#1086#1085#1090)
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 751
    Width = 402
    Height = 41
    Align = alBottom
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object ChanelBitBt: TBitBtn
      Left = 192
      Top = 7
      Width = 87
      Height = 25
      Caption = '&'#1054#1090#1084#1077#1085#1072
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000074120000741200000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECECEC9191916767676767
        67929292ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFECECEC666666676767B3B3B3B3B3B3767676676767EDEDEDFFFFFFEEEEEE
        8282825C5C5C5B5B5B5B5B5B6C6C6CFEFEFE9393936868685B5B5BB2B2B2FFFF
        FFFAFAFA777777959595FFFFFFA3A3A35B5B5B5B5B5B5B5B5B5B5B5B8A8A8AFF
        FFFF6A6A6AB9B9B9B1B1B15B5B5BB2B2B2FFFFFFB8B8B86B6B6BFFFFFF929292
        5B5B5B5B5B5BE9E9E9FFFFFFFFFFFFFFFFFF6B6B6BB8B8B8FFFFFFA7A7A75C5C
        5CB7B7B7B8B8B86C6C6CFFFFFF9292925B5B5B5B5B5B808080929292969696FC
        FCFC939393787878FAFAFAFFFFFFB1B1B15B5B5B676767959595FFFFFF929292
        5B5B5B5B5B5B7C7C7C878787878787E0E0E0ECECEC666666777777B3B3B3B3B3
        B3676767676767EDEDEDFFFFFF9292925B5B5B5B5B5BE7E7E7FFFFFFFFFFFFFF
        FFFFFFFFFFECECEC9292926F6F6F6F6F6F939393ECECECFFFFFFFFFFFF929292
        5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B6A6A6ACBCBCBFEFEFEFFFFFFFFFF
        FFFDFDFDE5E5E5FFFFFFFFFFFF9292925B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
        5B5B5B5B5B5B5B5B6A6A6A878787FFFFFF979797929292FFFFFFFFFFFF929292
        5B5B5B5B5B5BECECECFFFFFFFFFFFFFFFFFFFDFDFD8080805B5B5B5B5B5BFFFF
        FF949494959595FFFFFFFFFFFF9292925B5B5B5B5B5BEAEAEAFFFFFFFFFFFFFF
        FFFFFAFAFA8080805B5B5B5B5B5BFFFFFFECECECECECECFFFFFFFFFFFF929292
        5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5BFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A75B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
        5B5B5B5B5B5B5B5B5B5B5B717171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ModalResult = 2
      TabOrder = 0
    end
    object OkBitBt: TBitBtn
      Left = 71
      Top = 8
      Width = 84
      Height = 25
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000074120000741200000000000000000000C6C6C6686868
        8C8C8C9292929292929292929292929292929292929292929292929292929292
        928C8C8C686868C8C8C8666666727272FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7272726767675B5B5B747474
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7474745B5B5B5B5B5B747474FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7474745B5B5B5B5B5B747474
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7474745B5B5B5B5B5B747474FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7474745B5B5B5B5B5B747474
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7474745B5B5B5B5B5B696969F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F76969695B5B5B5B5B5B5B5B5B
        5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
        5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B67676771717171717171717171
        71717171717171717171716F6F6F5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
        5B5B5BECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBA8A8A8F8F8F88787
        875B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5BF2F2F2FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8181815B5B5BF2F2F28E8E8E5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
        5B5B5BF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8181815B5B5BF2F2F28E8E
        8E5B5B5B5B5B5B6161615B5B5B5B5B5B5B5B5BF2F2F2FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8181815B5B5BF2F2F28E8E8E5B5B5B5B5B5BB4B4B46666665B5B5B
        5B5B5BF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A7C7C7CF5F5F58C8C
        8C5B5B5BA2A2A2FFFFFFC6C6C66B6B6B5B5B5B8787879D9D9D9D9D9D9D9D9D9D
        9D9D9D9D9D9D9D9D9D9D9D989898676767B4B4B4FFFFFFFFFFFF}
      ModalResult = 1
      TabOrder = 1
    end
  end
  object InsuranceGB: TGroupBox
    Left = 0
    Top = 489
    Width = 402
    Height = 103
    Hint = #1053#1086#1084#1077#1088' '#1080' '#1089#1077#1088#1080#1103' '#1089#1090#1088#1072#1093#1086#1074#1082#1080
    Align = alBottom
    Caption = '&'#1057#1090#1088#1072#1093#1086#1074#1082#1072'*'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object Label17: TLabel
      Left = 168
      Top = 26
      Width = 36
      Height = 15
      Caption = '&'#1053#1086#1084#1077#1088
    end
    object Label18: TLabel
      Left = 6
      Top = 29
      Width = 35
      Height = 15
      Caption = '&'#1057#1077#1088#1080#1103
    end
    object Label19: TLabel
      Left = 6
      Top = 72
      Width = 9
      Height = 15
      Caption = '&'#1057
    end
    object Label20: TLabel
      Left = 168
      Top = 72
      Width = 15
      Height = 15
      Caption = '&'#1044#1086
    end
    object InsuranсeNumEdit: TEdit
      Left = 222
      Top = 23
      Width = 139
      Height = 23
      NumbersOnly = True
      TabOrder = 0
    end
    object InsuranceSerialEdit: TEdit
      Left = 48
      Top = 26
      Width = 111
      Height = 23
      NumbersOnly = True
      TabOrder = 1
    end
    object DateBegPicker: TDateTimePicker
      Left = 48
      Top = 69
      Width = 111
      Height = 23
      Date = 43972.000000000000000000
      Time = 0.699518506946333200
      TabOrder = 2
    end
    object DateEndPicker: TDateTimePicker
      Left = 222
      Top = 74
      Width = 139
      Height = 23
      Date = 43972.000000000000000000
      Time = 0.705889942131761900
      TabOrder = 3
    end
    object InsBitBt: TBitBtn
      Left = 367
      Top = 24
      Width = 33
      Height = 25
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000074120000741200000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFB
        DEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBB
        FBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDE
        BBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBAA6A8AC762AFC762AFAE5896FBDEBBFB
        DEBBF6D3A9EDBB85EDBB85EDBB85EDBB85F6D3A9FBDEBBFBDEBBFBDEBBFBDEBB
        AA6DBAAA6BBCC053AF9280C8F0C3B8FBDEBBF6D3A9EDBB85EDBB85EDBB85EDBB
        85F6D3A9FBDEBBFBDEBBFBDEBBFBDEBBE4A8B6DD9CC5EBC1D3D27DB5FBDEBBFB
        DEBBF2C797E0984FE0984FE0984FE0984FE0984FF2C797FBDEBBFBDEBB9A88C5
        A591C4E8B2B6E6ACB6D0B3BE6A5ECAFBDEBBF2C797E0984FE0984FE0984FE098
        4FF2C797FBDEBBFBDEBBFBDEBBF4D8BC6A5ECA5E54CB9180C63E37CEDAC0BEFB
        DEBBF6D3A9EDBB85EDBB85EDBB85EDBB85EDBB85F6D3A9FBDEBBFBDEBBFBDEBB
        FBDEBBA996C3574DCCF4D8BCFBDEBBFBDEBBF6D3A9EDBB85EDBB85EDBB85EDBB
        85EDBB85F6D3A9FBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFB
        DEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBB
        FBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDE
        BBFBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 4
      OnClick = InsBitBtClick
    end
  end
  object PssprotGB: TGroupBox
    Left = 0
    Top = 366
    Width = 402
    Height = 123
    Align = alBottom
    Caption = '&'#1055#1072#1089#1087#1086#1088#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object Label13: TLabel
      Left = 6
      Top = 53
      Width = 141
      Height = 15
      Caption = '&'#1056#1072#1079#1088#1077#1096#1077#1085#1085#1072#1103' max '#1084#1072#1089#1089#1072' ,'
    end
    object Label14: TLabel
      Left = 6
      Top = 82
      Width = 108
      Height = 15
      Caption = '&'#1052#1072#1089#1089#1072' '#1073#1077#1079' '#1085#1072#1075#1088#1091#1079#1082#1080
    end
    object Label12: TLabel
      Left = 168
      Top = 24
      Width = 42
      Height = 15
      Hint = #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1082' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1102
      AutoSize = False
      Caption = '&'#1053#1086#1084#1077#1088'*'
    end
    object Label21: TLabel
      Left = 3
      Top = 24
      Width = 41
      Height = 15
      Hint = #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1082' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1102
      AutoSize = False
      Caption = '&'#1057#1077#1088#1080#1103'*'
    end
    object PasNumEdit: TEdit
      Left = 222
      Top = 21
      Width = 165
      Height = 23
      NumbersOnly = True
      TabOrder = 0
    end
    object PasSerialEdit: TEdit
      Left = 48
      Top = 21
      Width = 111
      Height = 23
      NumbersOnly = True
      TabOrder = 1
    end
    object MaxMassEdit: TEdit
      Left = 222
      Top = 50
      Width = 165
      Height = 23
      TabOrder = 2
    end
    object MassLoadOutEdit: TEdit
      Left = 222
      Top = 79
      Width = 165
      Height = 23
      TabOrder = 3
    end
  end
  object SvidetGB: TGroupBox
    Left = 0
    Top = 592
    Width = 402
    Height = 72
    Hint = #1057#1077#1088#1080#1103' '#1080' '#1085#1086#1084#1077#1088' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
    Align = alBottom
    Caption = '&'#1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' *'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    object Label15: TLabel
      Left = 168
      Top = 33
      Width = 43
      Height = 15
      Caption = '&'#1053#1086#1084#1077#1088'*'
    end
    object Label16: TLabel
      Left = 5
      Top = 33
      Width = 42
      Height = 15
      Caption = '&'#1057#1077#1088#1080#1103'*'
    end
    object DocNumEdit1: TEdit
      Left = 222
      Top = 30
      Width = 165
      Height = 23
      NumbersOnly = True
      TabOrder = 0
    end
    object DocSerialEdit: TEdit
      Left = 51
      Top = 30
      Width = 108
      Height = 23
      NumbersOnly = True
      TabOrder = 1
    end
  end
  object PrimechGB: TGroupBox
    Left = 0
    Top = 664
    Width = 402
    Height = 87
    Align = alBottom
    Caption = '&'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    object PrimechMemo: TMemo
      Left = 2
      Top = 17
      Width = 398
      Height = 68
      Align = alClient
      TabOrder = 0
    end
  end
end
