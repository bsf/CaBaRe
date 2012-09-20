inherited frCBROrderPaytView: TfrCBROrderPaytView
  Caption = 'frCBROrderPaytView'
  ClientHeight = 511
  ClientWidth = 1056
  ExplicitWidth = 1062
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 13
  inherited ViewControl: TcxGroupBox
    ExplicitWidth = 1056
    ExplicitHeight = 511
    Height = 511
    Width = 1056
    object cxGroupBox1: TcxGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Margins.Right = 0
      Align = alLeft
      PanelStyle.Active = True
      PanelStyle.OfficeBackgroundKind = pobkStyleColor
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfOffice11
      Style.TransparentBorder = False
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.Kind = lfOffice11
      TabOrder = 1
      Height = 505
      Width = 382
      object cxGroupBox3: TcxGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 55
        Align = alClient
        PanelStyle.Active = True
        PanelStyle.OfficeBackgroundKind = pobkStyleColor
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfOffice11
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.Kind = lfOffice11
        TabOrder = 0
        Height = 447
        Width = 376
        object grOrder: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 370
          Height = 444
          Margins.Top = 0
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          object grOrderView: TcxGridDBBandedTableView
            DataController.DataSource = dsItems
            DataController.KeyFieldNames = 'ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.InvertSelect = False
            OptionsView.FocusRect = False
            OptionsView.ScrollBars = ssVertical
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            OptionsView.RowSeparatorWidth = 3
            OptionsView.BandHeaders = False
            Bands = <
              item
              end>
            object grOrderViewColumnID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              Options.Focusing = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object grOrderViewColumnRECNO: TcxGridDBBandedColumn
              Caption = #1087#1087
              DataBinding.FieldName = 'RECNO'
              Visible = False
              Options.Focusing = False
              VisibleForCustomization = False
              Width = 39
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object grOrderViewColumnMARK: TcxGridDBBandedColumn
              Caption = '#'
              DataBinding.FieldName = 'FKORD'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.Alignment = taCenter
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Visible = False
              Options.Focusing = False
              VisibleForCustomization = False
              Width = 24
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object grOrderViewColumnDISH: TcxGridDBBandedColumn
              Caption = #1041#1083#1102#1076#1086
              DataBinding.FieldName = 'DISH'
              Options.Focusing = False
              Width = 197
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object grOrderViewColumnUNT: TcxGridDBBandedColumn
              Caption = #1087#1086#1088'.'
              DataBinding.FieldName = 'UNT'
              Options.Focusing = False
              Width = 50
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object grOrderViewColumnQTY: TcxGridDBBandedColumn
              Caption = #1082#1086#1083'-'#1074#1086
              DataBinding.FieldName = 'QTY'
              Options.Focusing = False
              Width = 85
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 1
            end
            object grOrderViewColumnPRICE: TcxGridDBBandedColumn
              Caption = #1094#1077#1085#1072
              DataBinding.FieldName = 'PRICE'
              Options.Focusing = False
              Width = 102
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 1
            end
            object grOrderViewColumnSUMM: TcxGridDBBandedColumn
              Caption = #1089#1091#1084#1084#1072
              DataBinding.FieldName = 'SUMM'
              Options.Focusing = False
              Width = 101
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 1
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = grOrderView
          end
        end
      end
      object cxGroupBox2: TcxGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Align = alTop
        PanelStyle.Active = True
        PanelStyle.OfficeBackgroundKind = pobkStyleColor
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfOffice11
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.Kind = lfOffice11
        TabOrder = 1
        Height = 46
        Width = 376
        object cxGroupBox7: TcxGroupBox
          Left = 0
          Top = 19
          Align = alClient
          PanelStyle.Active = True
          PanelStyle.OfficeBackgroundKind = pobkStyleColor
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.Kind = lfOffice11
          Style.TransparentBorder = False
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.Kind = lfOffice11
          TabOrder = 0
          Height = 27
          Width = 376
          object cxDBLabel4: TcxDBLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alClient
            DataBinding.DataField = 'TBL'
            DataBinding.DataSource = dsHead
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            Properties.LineOptions.Alignment = cxllaBottom
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -21
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.Kind = lfOffice11
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.Kind = lfOffice11
            Transparent = True
            Height = 21
            Width = 370
            AnchorY = 14
          end
        end
        object cxGroupBox8: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          PanelStyle.Active = True
          PanelStyle.OfficeBackgroundKind = pobkStyleColor
          Style.BorderStyle = ebsNone
          Style.TransparentBorder = False
          TabOrder = 1
          Height = 19
          Width = 376
          object cxDBLabel1: TcxDBLabel
            Left = 255
            Top = 0
            Align = alRight
            DataBinding.DataField = 'STATE'
            DataBinding.DataSource = dsHead
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Transparent = True
            Height = 19
            Width = 121
            AnchorX = 376
            AnchorY = 10
          end
          object cxDBLabel5: TcxDBLabel
            Left = 0
            Top = 0
            Align = alLeft
            DataBinding.DataField = 'ROOM'
            DataBinding.DataSource = dsHead
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            Transparent = True
            Height = 19
            Width = 121
            AnchorY = 10
          end
        end
      end
    end
    object pnMenu: TcxGroupBox
      AlignWithMargins = True
      Left = 388
      Top = 3
      Align = alClient
      PanelStyle.Active = True
      PanelStyle.OfficeBackgroundKind = pobkStyleColor
      Style.BorderStyle = ebsNone
      Style.TransparentBorder = False
      TabOrder = 0
      Height = 505
      Width = 665
      object cxGroupBox4: TcxGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 432
        Align = alBottom
        PanelStyle.Active = True
        PanelStyle.OfficeBackgroundKind = pobkStyleColor
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfOffice11
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.Kind = lfOffice11
        TabOrder = 1
        Height = 70
        Width = 659
        object btClose: TcxButton
          AlignWithMargins = True
          Left = 594
          Top = 5
          Width = 60
          Height = 60
          Margins.Left = 15
          Align = alRight
          Caption = #1047#1072#1082#1088#1099#1090#1100
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 0
        end
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 3
        AutoSize = False
        Caption = #1050' '#1086#1087#1083#1072#1090#1077
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -21
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Properties.LineOptions.Visible = True
        Transparent = True
        Height = 28
        Width = 289
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 79
        AutoSize = False
        Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1086#1090' '#1082#1083#1080#1077#1085#1090#1072
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -21
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Properties.LineOptions.Visible = True
        Transparent = True
        Height = 29
        Width = 289
      end
      object btOrderClose: TcxButton
        AlignWithMargins = True
        Left = 16
        Top = 261
        Width = 289
        Height = 60
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1077
        LookAndFeel.Kind = lfOffice11
        SpeedButtonOptions.CanBeFocused = False
        TabOrder = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 179
        AutoSize = False
        Caption = #1057#1076#1072#1095#1072
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -21
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Properties.LineOptions.Visible = True
        Transparent = True
        Height = 28
        Width = 289
      end
      object lbSummRet: TcxDBLabel
        Left = 24
        Top = 213
        DataBinding.DataField = 'SUMM_RET'
        DataBinding.DataSource = dsHead
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -21
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
        Height = 26
        Width = 281
        AnchorX = 305
      end
      object cxDBLabel2: TcxDBLabel
        AlignWithMargins = True
        Left = 16
        Top = 37
        DataBinding.DataField = 'SUMM'
        DataBinding.DataSource = dsHead
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LineOptions.Alignment = cxllaBottom
        Style.BorderStyle = ebsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -27
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfOffice11
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.Kind = lfOffice11
        Transparent = True
        Height = 29
        Width = 289
        AnchorX = 305
        AnchorY = 52
      end
      object popupCalc: TcxPopupEdit
        Left = 80
        Top = 155
        TabStop = False
        AutoSize = False
        ParentFont = False
        Properties.PopupAlignment = taRightJustify
        Properties.PopupControl = pnCalc
        Properties.PopupSizeable = False
        Properties.UseLeftAlignmentOnEditing = False
        Properties.ValidateOnEnter = False
        Properties.OnChange = edSummPaytPropertiesChange
        Style.BorderStyle = ebsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -21
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.PopupBorderStyle = epbsDefault
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        TabOrder = 8
        Height = 18
        Width = 225
      end
      object edSummPayt: TcxCurrencyEdit
        Left = 16
        Top = 114
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AssignedValues.DisplayFormat = True
        Properties.AutoSelect = False
        Properties.UseLeftAlignmentOnEditing = False
        Properties.ValidateOnEnter = False
        Properties.OnChange = edSummPaytPropertiesChange
        Properties.OnEditValueChanged = edSummPaytPropertiesEditValueChanged
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -27
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 225
      end
      object pnCalc: TcxGroupBox
        Left = 355
        Top = 22
        PanelStyle.Active = True
        PanelStyle.OfficeBackgroundKind = pobkStyleColor
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        TabOrder = 9
        Visible = False
        Height = 274
        Width = 273
        object cxButton1: TcxButton
          Tag = 7
          AlignWithMargins = True
          Left = 12
          Top = 9
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '7'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton2: TcxButton
          Tag = 4
          AlignWithMargins = True
          Left = 12
          Top = 75
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '4'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton3: TcxButton
          Tag = 1
          AlignWithMargins = True
          Left = 12
          Top = 141
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '1'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton4: TcxButton
          AlignWithMargins = True
          Left = 12
          Top = 207
          Width = 125
          Height = 60
          Margins.Left = 15
          Caption = '0'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton5: TcxButton
          Tag = 8
          AlignWithMargins = True
          Left = 76
          Top = 9
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '8'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton6: TcxButton
          Tag = 5
          AlignWithMargins = True
          Left = 76
          Top = 75
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '5'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton7: TcxButton
          Tag = 2
          AlignWithMargins = True
          Left = 76
          Top = 141
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '2'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton8: TcxButton
          Tag = 9
          AlignWithMargins = True
          Left = 140
          Top = 9
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '9'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton9: TcxButton
          Tag = 6
          AlignWithMargins = True
          Left = 140
          Top = 75
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '6'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton10: TcxButton
          Tag = 3
          AlignWithMargins = True
          Left = 140
          Top = 141
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '3'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 9
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton11: TcxButton
          Tag = 12
          AlignWithMargins = True
          Left = 204
          Top = 141
          Width = 60
          Height = 127
          Margins.Left = 15
          Caption = '='
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton12: TcxButton
          Tag = 10
          AlignWithMargins = True
          Left = 140
          Top = 207
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = '.'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 11
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
        object cxButton13: TcxButton
          Tag = 11
          AlignWithMargins = True
          Left = 204
          Top = 9
          Width = 60
          Height = 60
          Margins.Left = 15
          Caption = 'C'
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = CalcButtonClick
        end
      end
      object btCalc: TcxButton
        AlignWithMargins = True
        Left = 243
        Top = 114
        Width = 60
        Height = 40
        Margins.Left = 15
        OptionsImage.Glyph.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000500000010000000160000001600000016000000160000
          0016000000160000001600000016000000160000001600000016000000160000
          0016000000160000001600000016000000160000001600000016000000160000
          0016000000160000001000000005000000000000000000000000000000000000
          0000000000000000001000000031000000420000004300000043000000430000
          0043000000430000004300000043000000430000004300000043000000430000
          0043000000430000004300000043000000430000004300000043000000430000
          0043000000420000003100000010000000000000000000000000000000000000
          00000000000000000016868686F38B8B8BFF898989FF888888FF888888FF8888
          88FF888888FF888888FF888888FF888888FF888888FF888888FF888888FF8888
          88FF888888FF888888FF888888FF888888FF888888FF888888FF888888FF8989
          89FF8B8B8BFF868686F300000016000000000000000000000000000000000000
          000000000000000000168B8B8BFFFFFFFFFFFCFBFBFFFBFAFAFFFBFAFAFFFBFA
          FAFFFBFAFAFFFBFAFAFFFBFAFAFFFBFAFAFFFBFAFAFFFBFAFAFFFBFAFAFFFBFA
          FAFFFBFAFAFFFBFAFAFFFBFAFAFFFBFAFAFFFBFAFAFFFBFAFAFFFBFAFAFFFCFB
          FBFFFFFFFFFF8B8B8BFF00000016000000000000000000000000000000000000
          00000000000000000016898989FFFBFAFBFFF2F1F1FFF1F0F0FFF1F0F1FFF2F1
          F1FFF1F0F0FFF1F0F0FFF1F0F1FFF2F1F1FFF1F0F0FFF1F0F0FFF1F0F1FFF2F1
          F1FFF1F0F0FFF1F0F0FFF1F0F1FFF1F1F2FFF1F1F2FFF1F0F1FFF1F0F0FFF2F1
          F1FFFBFAFBFF898989FF00000016000000000000000000000000000000000000
          00000000000000000016888889FFFAF9F8FFF0EFEEFFF0EFEEFFF4F3F2FFF5F4
          F3FFF3F2F1FFF2F1F0FFF4F3F2FFF5F4F3FFF3F2F1FFF2F1F0FFF4F3F2FFF5F4
          F3FFF3F2F1FFF0F1F2FFF0F3F6FFF0F4F9FFF0F4F9FFEFF2F6FFEEEFF0FFF0EF
          EEFFFAF9F8FF888889FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF8F7F7FFEEEDECFFF1F0EFFF8B8986FF8E8C
          89FFA4A5A5FFF5F4F3FF8C8A87FF8E8C89FFA4A5A5FFF5F4F3FF8C8A87FF8E8C
          89FFA4A5A6FFF1F5F8FFDB944BFFDB9853FFDC9853FFD79C54FFEDF0F3FFEEED
          EDFFF8F7F7FF898989FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF7F6F6FFECEBEBFFEDECECFFC1C1C0FFC6C5
          C4FFA6A6A6FFF3F2F2FFC3C2C0FFC6C5C4FFA6A6A6FFF3F2F2FFC3C2C0FFC6C5
          C4FFA5A6A7FFF0F5FBFFE8A661FFE8AB6BFFE9AB6BFFD8A05CFFECEFF6FFECEB
          ECFFF7F6F6FF898989FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF6F5F5FFE9E8E8FFE9E8E8FFF6F6F6FFFAF9
          F9FFA2A2A2FFEDECECFFF7F6F7FFFAF9F9FFA2A2A2FFEDECECFFF7F6F7FFFAF9
          F9FFA2A3A4FFECF1F8FFE8A964FFE7AE6EFFE8AE6FFFD8A15DFFE9EDF4FFE9E9
          EAFFF6F5F5FF898989FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF5F4F4FFE9E6E6FFE9E7E7FFECEAEAFFEFEC
          ECFFEFECECFFECEAEAFFEDEAEBFFEFECECFFEFECECFFECEAEAFFEDEAEBFFEFEC
          ECFFEEEDEEFFEAEEF4FFE8A964FFE8AD6EFFE9AE6EFFD8A15EFFE8EBF2FFE8E7
          E8FFF5F4F4FF898989FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF4F3F3FFE7E6E4FFE9E8E7FF8C8A88FF8F8D
          8AFFA6A6A7FFEDECEBFF8D8B88FF8F8D8AFFA6A6A7FFEDECEBFF8D8B88FF8F8D
          8AFFA6A7A8FFE9EDF2FFE9A964FFE8AD6DFFE9AD6EFFD8A05CFFE6EAEFFFE6E6
          E6FFF4F3F3FF898989FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF3F2F2FFE4E3E3FFE6E5E5FFC3C2C1FFC6C5
          C4FFA6A7A7FFEAE9EAFFC3C2C1FFC6C5C4FFA6A7A7FFEAE9EAFFC3C2C1FFC6C5
          C4FFA6A7A8FFE7EAEFFFF2B269FFF1B56FFFF2B570FFD89D55FFE3E6EBFFE4E4
          E4FFF3F2F2FF898989FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF3F1F1FFE3E1E1FFE3E1E1FFF8F7F7FFFBFA
          FAFFA3A4A4FFE6E4E4FFF8F7F8FFFBFAFAFFA3A4A4FFE6E4E4FFF8F7F8FFFBFA
          FAFFA3A4A4FFE6E5E7FFE3E5E9FFE2E5ECFFE2E6ECFFE3E5E9FFE2E2E4FFE3E1
          E1FFF3F1F1FF898989FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF0F0F0FFE1DFDFFFE2E0E0FFE4E2E2FFE6E4
          E4FFE6E4E4FFE4E2E2FFE5E3E3FFE6E4E4FFE6E4E4FFE4E2E2FFE5E3E3FFE6E4
          E4FFE6E4E4FFE4E3E3FFE5E3E4FFE6E4E6FFE5E4E5FFE4E3E3FFE2E0E0FFE1DF
          DFFFF0F0F0FF898989FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF1F0F0FFDFDEDDFFE1E0DFFF8D8B89FF908E
          8BFFA7A8A8FFE5E4E3FF8E8C89FF908E8BFFA7A8A8FFE5E4E3FF8E8C89FF908E
          8BFFA7A8A8FFE5E4E3FF8E8C89FF908E8CFF908E8CFFA6A7A7FFE1E0DFFFDFDE
          DDFFF1F0F0FF898989FF00000016000000000000000000000000000000000000
          00000000000000000016898989FFF0EFEFFFDDDCDAFFDEDDDCFFC3C3C1FFC6C5
          C4FFA7A8A8FFE2E1E0FFC4C3C2FFC6C5C4FFA7A8A8FFE2E1E0FFC4C3C2FFC6C5
          C4FFA7A8A8FFE2E1E0FFC4C3C2FFC5C4C3FFC7C6C5FFA7A7A7FFE0DFDDFFDDDC
          DBFFF0EFEFFF898989FF00000016000000000000000000000000000000000000
          0000000000000000001689898AFFF0EFEEFFDBD9D9FFDBD9D9FFFAF8F7FFFDFB
          F9FFA6A5A4FFDFDCDCFFF9F9F9FFFBFAFAFFA4A5A5FFDEDCDCFFF9F8F9FFFBFA
          FAFFA4A5A5FFDFDCDCFFFAF8F7FFFAF8F7FFFDFBF9FFA6A5A4FFDEDCDBFFDCDA
          DAFFF0EFEEFF89898AFF00000016000000000000000000000000000000000000
          00000000000000000016898A8AFFEFEEEEFFDAD7D7FFDCD9D5FFE3DCD3FFE7DE
          D3FFE6DED5FFDFDBD8FFDDDADAFFDEDCDCFFDEDCDCFFDCDADAFFDCDADAFFDEDC
          DCFFDFDCDCFFDFDBD7FFE3DCD3FFE7DDD2FFE7DED3FFE6DED5FFDEDAD7FFDAD7
          D7FFEFEEEEFF898A8AFF00000016000000000000000000000000000000000000
          000000000000000000168A8A8AFFEFEEEDFFD9D7D4FFE2DBD1FF2B77FFFF337B
          FFFF2E7FFFFFE5DFD5FF908D89FF918E8CFFA8A9A9FFDDDCDBFF8F8D8AFF918E
          8CFFA9A9A8FFE5DED5FF2C77FFFF357CFFFF357CFFFF2D7FFFFFE2DCD2FFD9D7
          D4FFEFEEEDFF8A8A8AFF00000016000000000000000000000000000000000000
          000000000000000000168A8A8AFFEEEDEDFFD8D5D2FFE4DACEFF318FFFFF3B94
          FFFF3582FFFFE5DCD0FFC6C5C2FFC7C6C5FFA8A8A9FFDBD9D8FFC5C4C3FFC7C6
          C5FFAAA9A8FFE7DDD2FF3290FFFF3D94FFFF3D95FFFF3582FFFFE4DACEFFD8D5
          D2FFEEEDEDFF8A8A8AFF00000016000000000000000000000000000000000000
          000000000000000000168A8A8AFFEEEDEDFFD6D2D0FFDFD5CDFF29A1FFFF30A5
          FFFF2E7EFFFFDED7CDFFFBFAF8FFFBFAFBFFA5A5A6FFD6D4D2FFFAF9F9FFFBFA
          FBFFA7A6A5FFE1D8D0FF29A1FFFF32A4FFFF32A5FFFF2E7EFFFFDFD7CDFFD6D2
          D0FFEEEDEDFF8A8A8AFF00000016000000000000000000000000000000000000
          000000000000000000168A8A8AFFEFEEECFFD2CFCEFFD5D0CDFFDDD3CBFFDFD5
          CAFFDCD4CBFFD5D1CDFFD1CECDFFD1CFCEFFD3D0CFFFD2D0CFFFD0CECDFFD1CF
          CEFFD4D1CFFFD7D2CEFFDDD3CBFFE0D4CAFFE0D5CAFFDCD4CBFFD5D1CDFFD2CF
          CEFFEFEEECFF8A8A8AFF00000016000000000000000000000000000000000000
          000000000000000000168A8A8AFFEFEEEDFFD0CECDFFD1CECCFFD2CFCCFFD2CF
          CCFFD2CFCCFFD1CECDFFD0CECDFFD0CECDFFD0CECDFFD0CECDFFD0CECDFFD0CE
          CDFFD0CECDFFD1CECDFFD2CFCCFFD3CFCCFFD3CFCCFFD2CFCCFFD1CECCFFD0CE
          CDFFEFEEEDFF8A8A8AFF00000016000000000000000000000000000000000000
          000000000000000000168C8C8CFFF3F0F1FFEEECEDFFEDEBEDFFEDEBEDFFEDEB
          EDFFEDEBEDFFEDEBEDFFEDEBEDFFEDEBEDFFEDEBEDFFEDEBEDFFEDEBEDFFEDEB
          EDFFEDEBEDFFEDEBEDFFEDEBEDFFEDEBEDFFEDEBEDFFEDEBEDFFEDEBEDFFEEEC
          EDFFF3F0F1FF8C8C8CFF00000016000000000000000000000000000000000000
          000000000000000000168F8F8FFF92908DFF8E8E8CFF8A8D8EFF888C8FFF878D
          90FF878D90FF878D90FF878D90FF878D90FF878D90FF878D90FF878D90FF878D
          90FF878D90FF878D90FF878D90FF878D90FF878D90FF888C8FFF8A8D8EFF8E8E
          8CFF92908DFF8F8F8FFF00000016000000000000000000000000000000000000
          00000000000000000016909091FFA4A2A2FF898A8CFFFFB36EFFF9AC64FFF8AC
          66FFF8AC66FFF8AC66FFF8AC66FFF8AC66FFF8AC66FFF8AC66FFF8AC66FFF8AC
          66FFF8AC66FFF8AC66FFF8AC66FFF8AC66FFF8AC66FFF9AC64FFFFB36EFF898A
          8CFFA5A3A2FF909091FF00000016000000000000000000000000000000000000
          00000000000000000016909090FFACABAAFF7F8285FFF4B97DFFE69F58FFE5A0
          5BFFE5A15BFFE5A15BFFE5A15BFFE5A15BFFE5A15BFFE5A15BFFE5A15BFFE5A1
          5BFFE5A15BFFE5A15BFFE5A15BFFE5A15BFFE5A05BFFE69F58FFF4B87DFF7E82
          85FFADAAACFF909090FF00000016000000000000000000000000000000000000
          00000000000000000016909090FFB5B3B4FF77797BFFF5CA9DFFDA9143FFD992
          47FFD99247FFD99247FFD99247FFD99247FFD99247FFD99247FFD99247FFD992
          47FFD99247FFD99247FFD99247FFD99247FFD99247FFDA9143FFF5CA9DFF7778
          7BFFB6B6B6FF909090FF00000016000000000000000000000000000000000000
          000000000000000000168F8F8FFFBFBDBEFF707171FFF7CEA0FFF2CDA2FFF1CD
          A4FFF1CDA4FFF1CDA4FFF1CDA4FFF1CDA4FFF1CDA4FFF1CDA4FFF1CDA4FFF1CD
          A4FFF1CDA4FFF1CDA4FFF1CDA4FFF1CDA4FFF1CDA4FFF2CDA2FFF7CEA0FF6F70
          71FFC2C1C0FF8F8F8FFF00000016000000000000000000000000000000000000
          000000000000000000168E8E8EFFCAC9C9FF686565FF666568FF646568FF6465
          68FF646569FF646569FF646569FF646569FF646569FF646569FF646569FF6465
          69FF646569FF646569FF646569FF646569FF646568FF646568FF666568FF6765
          65FFCDCDCDFF8E8E8EFF00000015000000000000000000000000000000000000
          000000000000000000108E8E8EFFD8D7D7FFE2E1E0FFE2E1E1FFE2E1E1FFE2E1
          E1FFE2E1E1FFE2E1E1FFE2E1E1FFE2E1E1FFE2E1E1FFE2E1E1FFE2E1E1FFE2E1
          E1FFE2E1E1FFE2E1E1FFE2E1E1FFE2E1E1FFE2E1E1FFE2E1E1FFE2E1E1FFE1E1
          E0FFDDDCDCFF8E8E8EFF0000000F000000000000000000000000000000000000
          00000000000000000005878787F08E8E8EFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
          8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
          8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
          8DFF8E8E8EFF7B7B7BDC00000005000000000000000000000000}
        SpeedButtonOptions.CanBeFocused = False
        TabOrder = 10
        OnClick = btCalcClick
      end
    end
  end
  object dsHead: TDataSource
    Left = 136
    Top = 184
  end
  object dsItems: TDataSource
    Left = 56
    Top = 184
  end
end
