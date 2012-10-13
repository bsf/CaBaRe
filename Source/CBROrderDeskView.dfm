inherited frCBROrderDeskView: TfrCBROrderDeskView
  Caption = 'frCBROrderDeskView'
  ClientHeight = 541
  ClientWidth = 1101
  ExplicitWidth = 1107
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited ViewControl: TcxGroupBox
    ExplicitWidth = 1101
    ExplicitHeight = 541
    Height = 541
    Width = 1101
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
      TabOrder = 0
      Height = 535
      Width = 382
      object cxGroupBox3: TcxGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 55
        Margins.Bottom = 0
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
        Height = 284
        Width = 376
        object grOrder: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 370
          Height = 281
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
              Styles.Content = cxStyle2
              Width = 197
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object grOrderViewColumnQTY: TcxGridDBBandedColumn
              Caption = #1082#1086#1083'-'#1074#1086
              DataBinding.FieldName = 'QTY'
              Options.Focusing = False
              Styles.Content = cxStyle2
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
      object cxGroupBox6: TcxGroupBox
        Left = 0
        Top = 339
        Align = alBottom
        PanelStyle.Active = True
        PanelStyle.OfficeBackgroundKind = pobkStyleColor
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfOffice11
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.Kind = lfOffice11
        TabOrder = 1
        Height = 196
        Width = 382
        object cxGroupBox13: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Align = alClient
          PanelStyle.OfficeBackgroundKind = pobkStyleColor
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.Kind = lfOffice11
          Style.TransparentBorder = True
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.Kind = lfOffice11
          TabOrder = 0
          Height = 190
          Width = 376
          object cxGroupBox14: TcxGroupBox
            AlignWithMargins = True
            Left = 2
            Top = 45
            Margins.Left = 0
            Margins.Right = 0
            Margins.Bottom = 15
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
            Height = 63
            Width = 372
            object btItemQtyDec: TcxButton
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 69
              Height = 57
              Align = alLeft
              Caption = '-1'
              SpeedButtonOptions.CanBeFocused = False
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btItemQtyInc: TcxButton
              AlignWithMargins = True
              Left = 300
              Top = 3
              Width = 69
              Height = 57
              Align = alRight
              Caption = '+1'
              SpeedButtonOptions.CanBeFocused = False
              TabOrder = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object cxDBLabel3: TcxDBLabel
              AlignWithMargins = True
              Left = 78
              Top = 3
              Align = alClient
              DataBinding.DataField = 'QTY'
              DataBinding.DataSource = dsItems
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -19
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.LookAndFeel.Kind = lfOffice11
              Style.TransparentBorder = True
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.Kind = lfOffice11
              Transparent = True
              Height = 57
              Width = 216
              AnchorX = 186
              AnchorY = 32
            end
          end
          object cxGroupBox10: TcxGroupBox
            Left = 2
            Top = 123
            Align = alBottom
            PanelStyle.Active = True
            PanelStyle.OfficeBackgroundKind = pobkStyleColor
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.Kind = lfOffice11
            Style.TransparentBorder = False
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.Kind = lfOffice11
            TabOrder = 1
            Height = 65
            Width = 372
            object btItemCancel: TcxButton
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 69
              Height = 59
              Align = alLeft
              Caption = #1054#1090#1084#1077#1085#1080#1090#1100
              SpeedButtonOptions.CanBeFocused = False
              TabOrder = 0
              WordWrap = True
            end
            object btItemAddon: TcxButton
              AlignWithMargins = True
              Left = 278
              Top = 3
              Width = 91
              Height = 59
              Align = alRight
              Caption = #1052#1086#1076#1080#1092#1080#1082#1072#1090#1086#1088#1099
              SpeedButtonOptions.CanBeFocused = False
              TabOrder = 1
              Visible = False
              WordWrap = True
            end
          end
          object cxDBLabel6: TcxDBLabel
            AlignWithMargins = True
            Left = 5
            Top = 10
            Margins.Top = 5
            Margins.Bottom = 5
            Align = alTop
            DataBinding.DataField = 'DISH'
            DataBinding.DataSource = dsItems
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.Kind = lfOffice11
            Style.TransparentBorder = True
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.Kind = lfOffice11
            Transparent = True
            Height = 27
            Width = 366
            AnchorY = 24
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
        TabOrder = 2
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
          object cxDBLabel2: TcxDBLabel
            AlignWithMargins = True
            Left = 255
            Top = 3
            Align = alRight
            DataBinding.DataField = 'SUMM'
            DataBinding.DataSource = dsHead
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
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
            Width = 118
            AnchorX = 373
            AnchorY = 14
          end
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
            Width = 246
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
            DataBinding.DataField = 'IDAT'
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
      Left = 385
      Top = 3
      Margins.Left = 0
      Align = alClient
      PanelStyle.Active = True
      PanelStyle.OfficeBackgroundKind = pobkStyleColor
      Style.BorderStyle = ebsNone
      Style.TransparentBorder = False
      TabOrder = 1
      Height = 535
      Width = 713
      object grMenu: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 370
        Height = 453
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object grMenuView: TcxGridDBBandedTableView
          OnCellClick = grMenuViewCellClick
          DataController.DataSource = dsMenu
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ScrollBars = ssVertical
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.RowSeparatorWidth = 3
          OptionsView.BandHeaders = False
          Bands = <
            item
            end>
          object grMenuViewColumnID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Options.Focusing = False
            VisibleForCustomization = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grMenuViewColumnNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Options.Focusing = False
            Styles.Content = cxStyle1
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.LineCount = 2
            Position.RowIndex = 0
          end
        end
        object grMenuCardView: TcxGridDBCardView
          OnCellClick = grMenuViewCellClick
          DataController.DataSource = dsMenu
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsSelection.CardBorderSelection = False
          OptionsView.FocusRect = False
          OptionsView.CaptionSeparator = #0
          OptionsView.CardAutoWidth = True
          OptionsView.CardBorderWidth = 5
          OptionsView.CardIndent = 7
          OptionsView.CardWidth = 250
          OptionsView.CellAutoHeight = True
          OptionsView.LayerSeparatorWidth = 1
          OptionsView.RowCaptionAutoHeight = True
          object grMenuCardViewRowID: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ID'
            Visible = False
            CaptionAlignmentHorz = taRightJustify
            Kind = rkCaption
            Options.Focusing = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
          end
          object grMenuCardViewRowNAME: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NAME'
            Kind = rkCaption
            Options.Focusing = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
            Position.LineCount = 2
            Styles.Content = cxStyle1
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = grMenuCardView
        end
      end
      object cxGroupBox4: TcxGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 462
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
        Width = 707
        object btKORD: TcxButton
          AlignWithMargins = True
          Left = 225
          Top = 5
          Width = 121
          Height = 60
          Align = alRight
          Caption = #1041#1077#1075#1091#1085#1086#1082
          LookAndFeel.Kind = lfOffice11
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 98
        end
        object btMove: TcxButton
          AlignWithMargins = True
          Left = 503
          Top = 5
          Width = 121
          Height = 60
          Align = alRight
          Caption = #1055#1077#1088#1077#1073#1088#1086#1089#1082#1072
          LookAndFeel.Kind = lfOffice11
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 1
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btClose: TcxButton
          AlignWithMargins = True
          Left = 642
          Top = 5
          Width = 60
          Height = 60
          Margins.Left = 15
          Align = alRight
          Caption = #1047#1072#1082#1088#1099#1090#1100
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 2
        end
        object btPayt: TcxButton
          AlignWithMargins = True
          Left = 364
          Top = 5
          Width = 121
          Height = 60
          Margins.Left = 15
          Margins.Right = 15
          Align = alRight
          Caption = #1054#1087#1083#1072#1090#1072
          LookAndFeel.Kind = lfOffice11
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 3
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object grMenuGrp: TcxGrid
        AlignWithMargins = True
        Left = 379
        Top = 3
        Width = 331
        Height = 453
        Align = alRight
        BorderStyle = cxcbsNone
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        object cxGridDBBandedTableView1: TcxGridDBBandedTableView
          OnCellClick = grMenuViewCellClick
          DataController.DataSource = dsMenu
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ScrollBars = ssVertical
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.RowSeparatorWidth = 3
          OptionsView.BandHeaders = False
          Bands = <
            item
            end>
          object cxGridDBBandedColumn1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Options.Focusing = False
            VisibleForCustomization = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Options.Focusing = False
            Styles.Content = cxStyle1
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.LineCount = 2
            Position.RowIndex = 0
          end
        end
        object cxGridDBCardView1: TcxGridDBCardView
          OnCellClick = grMenuGrpViewCellClick
          DataController.DataSource = dsMenuGrp
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsSelection.CardBorderSelection = False
          OptionsView.FocusRect = False
          OptionsView.CaptionSeparator = #0
          OptionsView.CardAutoWidth = True
          OptionsView.CardBorderWidth = 5
          OptionsView.CardIndent = 7
          OptionsView.CardWidth = 150
          OptionsView.CellAutoHeight = True
          OptionsView.LayerSeparatorWidth = 1
          OptionsView.RowCaptionAutoHeight = True
          object cxGridDBCardViewRow1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ID'
            Visible = False
            CaptionAlignmentHorz = taRightJustify
            Kind = rkCaption
            Options.Focusing = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
          end
          object cxGridDBCardViewRow2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NAME'
            Kind = rkCaption
            Options.Focusing = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
            Position.LineCount = 2
            Styles.Content = cxStyle1
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGridDBCardView1
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 798
    Top = 30
  end
  object dsMenuGrp: TDataSource
    Left = 728
    Top = 104
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 832
    Top = 112
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object dsMenu: TDataSource
    Left = 480
    Top = 176
  end
  object dsHead: TDataSource
    Left = 112
    Top = 112
  end
  object dsItems: TDataSource
    Left = 32
    Top = 112
  end
end
