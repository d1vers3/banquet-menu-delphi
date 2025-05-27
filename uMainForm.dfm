object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1086#1076#1073#1086#1088' '#1073#1072#1085#1082#1077#1090#1085#1086#1075#1086' '#1084#1077#1085#1102
  ClientHeight = 601
  ClientWidth = 784
  Color = clBtnFace
  ParentFont = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 784
    Height = 601
    ActivePage = tsGuests
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    OwnerDraw = True
    ParentFont = False
    TabOrder = 0
    TabStop = False
    OnDrawTab = pcMainDrawTab
    ExplicitWidth = 782
    ExplicitHeight = 593
    object tsGuests: TTabSheet
      Caption = #1043#1086#1089#1090#1080
      object lblName: TLabel
        Left = 16
        Top = 16
        Width = 59
        Height = 15
        Caption = #1048#1084#1103' '#1075#1086#1089#1090#1103':'
      end
      object lblPref: TLabel
        Left = 16
        Top = 52
        Width = 38
        Height = 15
        Caption = #1044#1080#1077#1090#1072': '
      end
      object lblForbidden: TLabel
        Left = 16
        Top = 88
        Width = 157
        Height = 15
        Caption = #1047#1072#1087#1088#1077#1097#1105#1085#1085#1099#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099':'
      end
      object edGuestName: TEdit
        Left = 130
        Top = 14
        Width = 200
        Height = 23
        TabOrder = 0
        Text = #1043#1086#1089#1090#1100
      end
      object edForbidden: TEdit
        Left = 189
        Top = 85
        Width = 200
        Height = 23
        TabOrder = 1
        Text = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099
      end
      object btnAddGuest: TButton
        Left = 16
        Top = 140
        Width = 150
        Height = 32
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1086#1089#1090#1103
        TabOrder = 2
        TabStop = False
        OnClick = btnAddGuestClick
      end
      object lbGuests: TListBox
        Left = 0
        Top = 200
        Width = 776
        Height = 371
        Style = lbOwnerDrawVariable
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 20
        ParentFont = False
        TabOrder = 3
        OnDrawItem = lbGuestsDrawItem
        OnMeasureItem = lbGuestsMeasureItem
      end
      object btnDeleteGuest: TButton
        Left = 180
        Top = 140
        Width = 150
        Height = 32
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1086#1089#1090#1103
        TabOrder = 4
        TabStop = False
        OnClick = btnDeleteGuestClick
      end
      object btnSaveGuests: TButton
        Left = 340
        Top = 140
        Width = 210
        Height = 32
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1075#1086#1089#1090#1077#1081' '#1074' .txt'
        TabOrder = 5
        TabStop = False
        OnClick = btnSaveGuestsClick
      end
      object btnLoadGuests: TButton
        Left = 556
        Top = 140
        Width = 205
        Height = 32
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1075#1086#1089#1090#1077#1081' '#1080#1079' .txt'
        TabOrder = 6
        TabStop = False
        OnClick = btnLoadGuestsClick
      end
      object cbDiet: TComboBox
        Left = 130
        Top = 48
        Width = 200
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 7
        Text = #1085#1077#1090' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1081
        Items.Strings = (
          #1085#1077#1090' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1081
          #1074#1077#1075#1077#1090#1072#1088#1080#1072#1085#1077#1094
          #1074#1077#1075#1072#1085
          #1073#1077#1079' '#1075#1083#1102#1090#1077#1085#1072
          #1073#1077#1079' '#1083#1072#1082#1090#1086#1079#1099)
      end
    end
    object tsDishes: TTabSheet
      Caption = #1041#1083#1102#1076#1072
      ImageIndex = 1
      object lblDishName: TLabel
        Left = 16
        Top = 16
        Width = 55
        Height = 15
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      end
      object lblCategory: TLabel
        Left = 16
        Top = 52
        Width = 59
        Height = 15
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
      end
      object lblIngredients: TLabel
        Left = 16
        Top = 88
        Width = 77
        Height = 15
        Caption = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099':'
      end
      object lblAllergens: TLabel
        Left = 16
        Top = 124
        Width = 155
        Height = 15
        Caption = #1055#1086#1090#1077#1085#1094#1080#1072#1083#1100#1085#1099#1077' '#1072#1083#1083#1077#1088#1075#1077#1085#1099':'
      end
      object lblCalories: TLabel
        Left = 16
        Top = 160
        Width = 82
        Height = 15
        Caption = #1050#1072#1083#1086#1088#1080#1081#1085#1086#1089#1090#1100':'
      end
      object lblRating: TLabel
        Left = 230
        Top = 160
        Width = 47
        Height = 15
        Caption = #1056#1077#1081#1090#1080#1085#1075':'
      end
      object edDishName: TEdit
        Left = 130
        Top = 12
        Width = 200
        Height = 23
        TabOrder = 0
        Text = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object edIngredients: TEdit
        Left = 130
        Top = 84
        Width = 300
        Height = 23
        TabOrder = 1
        Text = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099
      end
      object edAllergens: TEdit
        Left = 241
        Top = 119
        Width = 250
        Height = 23
        TabOrder = 2
        Text = #1040#1083#1083#1077#1088#1075#1077#1085#1099
      end
      object edCalories: TEdit
        Left = 138
        Top = 156
        Width = 80
        Height = 23
        TabOrder = 3
        Text = #1050#1072#1083#1086#1088#1080#1080
      end
      object edRating: TEdit
        Left = 303
        Top = 156
        Width = 80
        Height = 23
        TabOrder = 4
        Text = #1056#1077#1081#1090#1080#1085#1075
      end
      object btnAddDish: TButton
        Left = 16
        Top = 200
        Width = 150
        Height = 32
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1073#1083#1102#1076#1086
        TabOrder = 5
        TabStop = False
        OnClick = btnAddDishClick
      end
      object lbDishes: TListBox
        Left = 0
        Top = 256
        Width = 776
        Height = 315
        Style = lbOwnerDrawVariable
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 20
        ParentFont = False
        TabOrder = 6
        OnDrawItem = lbDishesDrawItem
        OnMeasureItem = lbDishesMeasureItem
      end
      object cbCategory: TComboBox
        Left = 130
        Top = 47
        Width = 200
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 7
        Text = #1079#1072#1082#1091#1089#1082#1072
        Items.Strings = (
          #1079#1072#1082#1091#1089#1082#1072
          #1075#1086#1088#1103#1095#1077#1077
          #1076#1077#1089#1077#1088#1090
          #1085#1072#1087#1080#1090#1086#1082
          #1089#1072#1083#1072#1090
          #1089#1091#1087
          #1074#1099#1087#1077#1095#1082#1072
          #1089#1086#1091#1089)
      end
      object btnDeleteDish: TButton
        Left = 180
        Top = 200
        Width = 150
        Height = 32
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1073#1083#1102#1076#1086
        TabOrder = 8
        TabStop = False
        OnClick = btnDeleteDishClick
      end
      object btnSaveDishes: TButton
        Left = 340
        Top = 200
        Width = 151
        Height = 32
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1073#1083#1102#1076#1072
        TabOrder = 9
        TabStop = False
        OnClick = btnSaveDishesClick
      end
      object btnLoadDishes: TButton
        Left = 497
        Top = 200
        Width = 168
        Height = 32
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1073#1083#1102#1076#1072
        TabOrder = 10
        TabStop = False
        OnClick = btnLoadDishesClick
      end
      object cbSort: TComboBox
        Left = 504
        Top = 19
        Width = 150
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 11
        Text = #1082#1072#1083#1086#1088#1080#1080' '#8593
        Items.Strings = (
          #1082#1072#1083#1086#1088#1080#1080' '#8593
          #1082#1072#1083#1086#1088#1080#1080' '#8595
          #1088#1077#1081#1090#1080#1085#1075' '#8593
          #1088#1077#1081#1090#1080#1085#1075' '#8595)
      end
      object btnSortDishes: TButton
        Left = 660
        Top = 12
        Width = 113
        Height = 30
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 12
        TabStop = False
        OnClick = btnSortDishesClick
      end
      object cbFilterCategory: TComboBox
        Left = 504
        Top = 52
        Width = 150
        Height = 23
        Style = csDropDownList
        ItemIndex = 8
        TabOrder = 13
        Text = #1074#1089#1077
        Items.Strings = (
          #1079#1072#1082#1091#1089#1082#1072
          #1075#1086#1088#1103#1095#1077#1077
          #1076#1077#1089#1077#1088#1090
          #1085#1072#1087#1080#1090#1086#1082
          #1089#1072#1083#1072#1090
          #1089#1091#1087
          #1074#1099#1087#1077#1095#1082#1072
          #1089#1086#1091#1089
          #1074#1089#1077)
      end
      object btnFilterDishes: TButton
        Left = 660
        Top = 48
        Width = 113
        Height = 31
        Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100
        TabOrder = 14
        TabStop = False
        OnClick = btnFilterDishesClick
      end
    end
    object tsMenu: TTabSheet
      Caption = #1052#1077#1085#1102
      ImageIndex = 2
      object btnGenerateMenu: TButton
        Left = 16
        Top = 16
        Width = 177
        Height = 32
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1084#1077#1085#1102
        TabOrder = 0
        TabStop = False
        OnClick = btnGenerateMenuClick
      end
      object lbMenu: TListBox
        Left = 0
        Top = 228
        Width = 776
        Height = 343
        Style = lbOwnerDrawVariable
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 20
        ParentFont = False
        TabOrder = 1
        OnClick = lbMenuClick
        OnDrawItem = lbMenuDrawItem
        OnMeasureItem = lbMenuMeasureItem
      end
      object btnExcludeDish: TButton
        Left = 212
        Top = 16
        Width = 150
        Height = 32
        Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1073#1083#1102#1076#1086
        TabOrder = 2
        TabStop = False
        OnClick = btnExcludeDishClick
      end
      object btnExportMenu: TButton
        Left = 384
        Top = 16
        Width = 130
        Height = 32
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1084#1077#1085#1102
        TabOrder = 3
        TabStop = False
        OnClick = btnExportMenuClick
      end
      object memoDishInfo: TMemo
        Left = 0
        Top = 122
        Width = 777
        Height = 100
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object cbCategoryFilter: TComboBox
        Left = 16
        Top = 64
        Width = 129
        Height = 23
        Style = csDropDownList
        ItemIndex = 8
        TabOrder = 5
        Text = #1074#1089#1077
        Items.Strings = (
          #1079#1072#1082#1091#1089#1082#1072
          #1075#1086#1088#1103#1095#1077#1077
          #1076#1077#1089#1077#1088#1090
          #1085#1072#1087#1080#1090#1086#1082
          #1089#1072#1083#1072#1090
          #1089#1091#1087
          #1074#1099#1087#1077#1095#1082#1072
          #1089#1086#1091#1089
          #1074#1089#1077)
      end
      object cbOnlySuitable: TCheckBox
        Left = 151
        Top = 66
        Width = 281
        Height = 24
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1093#1086#1076#1103#1097#1080#1077
        TabOrder = 6
      end
    end
    object tsShopping: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1082#1091#1087#1086#1082
      ImageIndex = 3
      object btnGenerateList: TButton
        Left = 11
        Top = 16
        Width = 206
        Height = 32
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
        TabOrder = 0
        TabStop = False
        OnClick = btnGenerateListClick
      end
      object memoShopping: TMemo
        Left = 0
        Top = 88
        Width = 776
        Height = 483
        TabStop = False
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
        ExplicitTop = 80
        ExplicitWidth = 774
      end
      object btnExportShopping: TButton
        Left = 234
        Top = 16
        Width = 150
        Height = 32
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' .txt'
        TabOrder = 2
        TabStop = False
        OnClick = btnExportShoppingClick
      end
      object cbOnlyPerfectDishes: TCheckBox
        Left = 11
        Top = 60
        Width = 254
        Height = 17
        Caption = #1058#1086#1083#1100#1082#1086' '#1073#1083#1102#1076#1072', '#1087#1086#1076#1093#1086#1076#1103#1097#1080#1077' '#1074#1089#1077#1084' '#1075#1086#1089#1090#1103#1084
        TabOrder = 3
        OnClick = cbOnlyPerfectDishesClick
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Left = 65488
    Top = 408
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt'
    Left = 65512
    Top = 584
  end
end
