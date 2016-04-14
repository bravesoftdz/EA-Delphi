object MyEA: TMyEA
  Left = 425
  Top = 151
  Width = 1067
  Height = 667
  Caption = 'My Simple EA'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = EAMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BestFitLbl2: TLabel
    Left = 14
    Top = 557
    Width = 90
    Height = 16
    Caption = 'Best Fitness:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BestFitGlobalLbl: TLabel
    Left = 120
    Top = 8
    Width = 6
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object BestFitDescLbl: TLabel
    Left = 8
    Top = 8
    Width = 112
    Height = 20
    Caption = 'Best Fitness: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EACtrl: TPageControl
    Left = 339
    Top = 4
    Width = 713
    Height = 609
    ActivePage = ParamPage
    TabOrder = 0
    OnChange = EACtrlChange
    object ParamPage: TTabSheet
      Caption = 'Parameter Viewer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 4
      ParentFont = False
      object InitStartBox: TGroupBox
        Left = 224
        Top = 16
        Width = 241
        Height = 81
        Caption = 'Initial Starting Conditions'
        TabOrder = 0
        object Label15: TLabel
          Left = 12
          Top = 28
          Width = 101
          Height = 13
          Caption = 'Maximum Position'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 12
          Top = 52
          Width = 98
          Height = 13
          Caption = 'Minimum Position'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MaxEdit: TESBFloatSpinEdit
          Left = 144
          Top = 24
          DecimalPlaces = 2
          Max = 100.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 1.000000000000000000
          Value = 50.000000000000000000
          TabOrder = 0
        end
        object MinEdit: TESBFloatSpinEdit
          Left = 144
          Top = 51
          DecimalPlaces = 2
          Max = 100.000000000000000000
          Min = -100.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 1.000000000000000000
          Value = -50.000000000000000000
          TabOrder = 1
        end
      end
      object PartParamBox: TGroupBox
        Left = 8
        Top = 16
        Width = 209
        Height = 81
        Caption = 'Individual parameters'
        TabOrder = 1
        object EliteBox: TCheckBox
          Left = 16
          Top = 26
          Width = 73
          Height = 17
          Caption = 'Elite(s)'
          Enabled = False
          TabOrder = 0
          OnClick = EliteBoxClick
        end
        object SterileBox: TCheckBox
          Left = 16
          Top = 49
          Width = 97
          Height = 17
          Caption = 'Sterile(s)'
          Enabled = False
          TabOrder = 1
          OnClick = SterileBoxClick
        end
        object EliteEdit: TESBIntSpinEdit
          Left = 88
          Top = 24
          MaxLength = 0
          OnChange = EliteEditChange
          Enabled = False
          TabOrder = 2
          Max = 50
          Value = 1
        end
        object SterileEdit: TESBIntSpinEdit
          Left = 88
          Top = 48
          MaxLength = 0
          OnChange = SterileEditChange
          Enabled = False
          TabOrder = 3
          Max = 50
          Value = 1
        end
      end
      object GroupBox8: TGroupBox
        Left = 8
        Top = 104
        Width = 673
        Height = 129
        Caption = 'Mutation Rate Per Gene'
        TabOrder = 2
        object DefMutRateBtn: TRadioButton
          Left = 8
          Top = 16
          Width = 137
          Height = 17
          Caption = 'Same Mutation Rate'
          Checked = True
          Enabled = False
          TabOrder = 0
          TabStop = True
          OnClick = DefMutRateBtnClick
        end
        object IndMutRateBtn: TRadioButton
          Left = 8
          Top = 32
          Width = 137
          Height = 17
          Caption = 'Individual Mutation Rate'
          Enabled = False
          TabOrder = 1
          OnClick = IndMutRateBtnClick
        end
        object MutRateGrid: TStringGrid
          Left = 8
          Top = 48
          Width = 657
          Height = 73
          Color = clMenu
          ColCount = 2
          Enabled = False
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          TabOrder = 2
          ColWidths = (
            64
            64)
          RowHeights = (
            24
            24)
        end
      end
      object GroupBox10: TGroupBox
        Left = 472
        Top = 16
        Width = 209
        Height = 81
        Caption = 'Tournament Selection'
        TabOrder = 3
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 80
          Height = 13
          Caption = 'Tournament Size'
        end
        object Label2: TLabel
          Left = 10
          Top = 53
          Width = 47
          Height = 13
          Caption = 'Threshold'
        end
        object TournSizeEdit: TESBPosSpinEdit
          Left = 112
          Top = 16
          Min = 1
          MaxLength = 0
          Value = 4
          Enabled = False
          TabOrder = 0
        end
        object TournThresEdit: TESBFloatSpinEdit
          Left = 112
          Top = 48
          Max = 1.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 0.100000000000000000
          Value = 0.900000000000000000
          Enabled = False
          TabOrder = 1
        end
      end
      object CrossRadGrp: TRadioGroup
        Left = 8
        Top = 400
        Width = 153
        Height = 73
        Caption = 'Crossover Types'
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          '1 Point Crossover'
          '2 Point Crossover'
          'Uniform Crossover')
        TabOrder = 4
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 480
        Width = 153
        Height = 49
        Caption = 'Crossover Threshold'
        TabOrder = 5
        object CrossThresEdit: TESBFloatSpinEdit
          Left = 18
          Top = 16
          Max = 1.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 0.100000000000000000
          Value = 0.700000000000000000
          Enabled = False
          TabOrder = 0
        end
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 240
        Width = 673
        Height = 129
        Caption = 'Mutation Distance Per Gene'
        TabOrder = 6
        object DefMutDistBtn: TRadioButton
          Left = 8
          Top = 16
          Width = 137
          Height = 17
          Caption = 'Same Mutation Distance'
          Checked = True
          Enabled = False
          TabOrder = 0
          TabStop = True
          OnClick = DefMutDistBtnClick
        end
        object IndMutDistBtn: TRadioButton
          Left = 8
          Top = 32
          Width = 153
          Height = 17
          Caption = 'Individual Mutation Distance'
          Enabled = False
          TabOrder = 1
          OnClick = IndMutDistBtnClick
        end
        object MutDistGrid: TStringGrid
          Left = 8
          Top = 48
          Width = 657
          Height = 73
          Color = clMenuBar
          ColCount = 2
          Enabled = False
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          TabOrder = 2
          ColWidths = (
            64
            64)
        end
      end
    end
    object LocationPage: TTabSheet
      Caption = 'Location Viewer'
      object LVLbl4: TLabel
        Left = 16
        Top = 32
        Width = 35
        Height = 13
        Caption = 'Y - Axis'
      end
      object LVLbl5: TLabel
        Left = 568
        Top = 560
        Width = 35
        Height = 13
        Caption = 'X - Axis'
      end
      object LVLbl1: TLabel
        Left = 208
        Top = 552
        Width = 87
        Height = 13
        Caption = 'Inidividual Size'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LVLbl2: TLabel
        Left = 304
        Top = 552
        Width = 17
        Height = 13
        Caption = 'Min'
      end
      object LVLbl3: TLabel
        Left = 480
        Top = 552
        Width = 20
        Height = 13
        Caption = 'Max'
      end
      object LocationGrid: TStringGrid
        Left = 80
        Top = 16
        Width = 621
        Height = 521
        DefaultColWidth = 18
        Enabled = False
        TabOrder = 0
        OnDrawCell = LocationGridDrawCell
        ColWidths = (
          18
          18
          18
          18
          18)
      end
      object YAxisEdit: TESBPosSpinEdit
        Left = 8
        Top = 48
        Width = 57
        MaxLength = 0
        Value = 1
        OnChange = YAxisEditChange
        Enabled = False
        TabOrder = 1
      end
      object XAxisEdit: TESBPosSpinEdit
        Left = 616
        Top = 552
        Width = 57
        MaxLength = 0
        OnChange = XAxisEditChange
        Enabled = False
        TabOrder = 2
      end
      object LocationChart: TChart
        Left = 80
        Top = 16
        Width = 625
        Height = 521
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 1048.666666666667000000
        LeftAxis.Minimum = -35.666666666666670000
        Legend.Visible = False
        View3D = False
        Enabled = False
        TabOrder = 3
        object LocationSeries: TBubbleSeries
          Marks.ArrowLength = 0
          Marks.Frame.Visible = False
          Marks.Transparent = True
          Marks.Visible = False
          SeriesColor = clRed
          Pointer.HorizSize = 58
          Pointer.InflateMargins = False
          Pointer.Style = psCircle
          Pointer.VertSize = 58
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          RadiusValues.DateTime = False
          RadiusValues.Name = 'Radius'
          RadiusValues.Multiplier = 1.000000000000000000
          RadiusValues.Order = loNone
        end
      end
      object IndivSizeBar: TTrackBar
        Left = 328
        Top = 544
        Width = 150
        Height = 25
        Enabled = False
        Max = 100
        Position = 10
        TabOrder = 4
        TickStyle = tsNone
        OnChange = IndivSizeBarChange
      end
    end
    object ProgressPage: TTabSheet
      Caption = 'Progress Viewer'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 448
        Width = 705
        Height = 129
        TabOrder = 0
        object Label5: TLabel
          Left = 8
          Top = 16
          Width = 118
          Height = 13
          Caption = 'Best Global Fitness: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BestFitProgLbl: TLabel
          Left = 128
          Top = 16
          Width = 3
          Height = 13
        end
        object BestFitGrid: TStringGrid
          Left = 16
          Top = 40
          Width = 665
          Height = 76
          ColCount = 7
          DefaultColWidth = 24
          Enabled = False
          RowCount = 2
          TabOrder = 0
          ColWidths = (
            24
            24
            24
            24
            24
            24
            24)
          RowHeights = (
            24
            24)
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 0
        Width = 697
        Height = 449
        TabOrder = 1
        object AllFitChart: TChart
          Left = 16
          Top = 16
          Width = 673
          Height = 417
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            '')
          Legend.Alignment = laBottom
          Legend.ShadowSize = 4
          View3D = False
          TabOrder = 0
          object BestFitSeries: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            Title = 'Best Fitness'
            LinePen.Color = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object AvFitSeries: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clGreen
            Title = 'Average Fitness'
            LinePen.Color = clGreen
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object WorstFitSeries: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clYellow
            Title = 'Worst Fitness'
            LinePen.Color = clYellow
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
    end
    object IndivPage: TTabSheet
      Caption = 'Individual Page'
      ImageIndex = 3
      object Label11: TLabel
        Left = 8
        Top = 32
        Width = 107
        Height = 13
        Caption = 'Individual Number:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object IndivGrid: TStringGrid
        Left = 0
        Top = 88
        Width = 161
        Height = 33
        ColCount = 2
        Enabled = False
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
        RowHeights = (
          24)
      end
      object IndivPosGrid: TStringGrid
        Left = 16
        Top = 504
        Width = 673
        Height = 65
        ColCount = 10
        DefaultColWidth = 18
        Enabled = False
        RowCount = 2
        TabOrder = 1
        ColWidths = (
          18
          18
          18
          18
          18
          18
          18
          18
          18
          18)
        RowHeights = (
          24
          24)
      end
      object IndivFitChart: TChart
        Left = 200
        Top = 16
        Width = 481
        Height = 473
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Individual Fitness')
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMinimum = False
        Legend.Visible = False
        View3D = False
        Enabled = False
        TabOrder = 2
        object IndivSeries: TPointSeries
          Marks.ArrowLength = 0
          Marks.BackColor = clWhite
          Marks.Frame.Visible = False
          Marks.Style = smsValue
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Individual Fitness'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object IndivViewEdit: TESBPosSpinEdit
        Left = 120
        Top = 32
        Width = 63
        MaxLength = 0
        OnChange = IndivViewEditChange
        Enabled = False
        TabOrder = 3
      end
    end
    object BatchViewPage: TTabSheet
      Caption = 'Batch Performance'
      ImageIndex = 5
      object BFitChart: TChart
        Left = 8
        Top = 32
        Width = 697
        Height = 257
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Best Fitness in each run')
        Legend.Visible = False
        View3D = False
        TabOrder = 0
        object SBatFit: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Batch Fitness'
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object BRunChart: TChart
        Left = 8
        Top = 296
        Width = 697
        Height = 273
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Average Iterations til termination')
        Legend.Visible = False
        View3D = False
        TabOrder = 1
        object SBatRun: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Batch Iterations'
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object PlotBatch: TCheckBox
        Left = 32
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Plot Charts'
        TabOrder = 2
      end
    end
  end
  object RunCtrl: TPageControl
    Left = 8
    Top = 48
    Width = 321
    Height = 321
    ActivePage = SinglePage
    TabOrder = 1
    OnChange = RunCtrlChange
    object SinglePage: TTabSheet
      Caption = 'Single Run'
      object Label12: TLabel
        Left = 162
        Top = 131
        Width = 25
        Height = 13
        Caption = 'N = '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 170
        Top = 175
        Width = 8
        Height = 13
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 170
        Top = 219
        Width = 8
        Height = 13
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 164
        Top = 264
        Width = 21
        Height = 13
        Caption = 'N ='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object InitPopBtn: TButton
        Left = 16
        Top = 32
        Width = 137
        Height = 25
        Caption = '(Re)-Initialise Population'
        Enabled = False
        TabOrder = 0
        OnClick = InitPopBtnClick
      end
      object OneIterBtn: TButton
        Left = 16
        Top = 77
        Width = 137
        Height = 25
        Caption = 'Do one Iteration'
        Enabled = False
        TabOrder = 1
        OnClick = OneIterBtnClick
      end
      object NIterBtn: TButton
        Left = 16
        Top = 122
        Width = 137
        Height = 25
        Caption = 'Do another N Iterations'
        Enabled = False
        TabOrder = 2
        OnClick = NIterBtnClick
      end
      object IterStpBtn: TButton
        Left = 16
        Top = 168
        Width = 137
        Height = 25
        Caption = 'Do until Iterations'
        Enabled = False
        TabOrder = 3
        OnClick = IterStpBtnClick
      end
      object IterGrp: TGroupBox
        Left = 168
        Top = 8
        Width = 137
        Height = 49
        Caption = 'Iteration Number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object IterLbl: TLabel
          Left = 16
          Top = 15
          Width = 12
          Height = 24
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object ThresBtn: TButton
        Left = 16
        Top = 213
        Width = 137
        Height = 25
        Caption = 'Do until below Threshold'
        Enabled = False
        TabOrder = 5
        OnClick = ThresBtnClick
      end
      object NIterEdit: TESBPosSpinEdit
        Left = 193
        Top = 129
        Max = 100000
        MaxLength = 0
        Step = 500
        Value = 1000
        Enabled = False
        TabOrder = 6
      end
      object IterStpEdit: TESBPosSpinEdit
        Left = 192
        Top = 174
        Max = 1000000
        MaxLength = 0
        Step = 500
        Value = 10000
        Enabled = False
        TabOrder = 7
      end
      object ThresEdit: TESBFloatSpinEdit
        Left = 193
        Top = 220
        Max = 100.000000000000000000
        MaxLength = 0
        PageStep = 10.000000000000000000
        Step = 0.100000000000000000
        Value = 0.100000000000000000
        Enabled = False
        TabOrder = 8
      end
      object GroupBox9: TGroupBox
        Left = 168
        Top = 64
        Width = 137
        Height = 49
        Caption = 'Iterations from change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object ChangeLbl: TLabel
          Left = 16
          Top = 13
          Width = 12
          Height = 24
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object ChangeBtn: TButton
        Left = 16
        Top = 259
        Width = 137
        Height = 25
        Caption = 'N Iterations without Change '
        Enabled = False
        TabOrder = 10
        OnClick = ChangeBtnClick
      end
      object ChangeEdit: TESBPosSpinEdit
        Left = 193
        Top = 261
        Interval = 250
        Max = 1000000
        MaxLength = 0
        Value = 250
        Enabled = False
        TabOrder = 11
      end
    end
    object BatchSetPage: TTabSheet
      Caption = 'Batch'
      ImageIndex = 1
      object Label22: TLabel
        Left = 72
        Top = 251
        Width = 89
        Height = 13
        Caption = 'Batch Number: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BProgLbl: TLabel
        Left = 163
        Top = 251
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 297
        Height = 153
        Caption = 'Batch Run Parameters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label19: TLabel
          Left = 20
          Top = 19
          Width = 72
          Height = 13
          Caption = 'Number of runs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object GroupBox5: TGroupBox
          Left = 8
          Top = 40
          Width = 281
          Height = 97
          Caption = 'Stop Conditions'
          TabOrder = 0
          object BGenBox: TCheckBox
            Left = 9
            Top = 19
            Width = 120
            Height = 17
            Caption = 'After generations'
            Checked = True
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            State = cbChecked
            TabOrder = 0
          end
          object BThresBox: TCheckBox
            Left = 9
            Top = 45
            Width = 169
            Height = 17
            Caption = 'Global Best below'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object BGenEdit: TESBPosSpinEdit
            Left = 176
            Top = 16
            Max = 100000
            MaxLength = 0
            Value = 10000
            Enabled = False
            TabOrder = 2
          end
          object BThresEdit: TESBFloatSpinEdit
            Left = 176
            Top = 41
            Max = 100.000000000000000000
            MaxLength = 0
            PageStep = 10.000000000000000000
            Step = 1.000000000000000000
            Value = 0.100000000000000000
            Enabled = False
            TabOrder = 3
          end
          object BChangeBox: TCheckBox
            Left = 9
            Top = 72
            Width = 264
            Height = 17
            Caption = 'Global Best unchanged for '
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object BChangeEdit: TESBPosSpinEdit
            Left = 175
            Top = 68
            Max = 1000
            MaxLength = 0
            Step = 100
            Value = 1000
            Enabled = False
            TabOrder = 5
          end
        end
        object BRunEdit: TESBPosSpinEdit
          Left = 120
          Top = 16
          MaxLength = 0
          Step = 500
          Value = 100
          Enabled = False
          TabOrder = 1
        end
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 160
        Width = 297
        Height = 65
        Caption = 'Batch Output File'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label20: TLabel
          Left = 8
          Top = 16
          Width = 158
          Height = 13
          Caption = 'File name to save batch results to'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BSaveEdit: TEdit
          Left = 8
          Top = 32
          Width = 281
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'Batch.txt'
        end
      end
      object BRunBtn: TButton
        Left = 32
        Top = 264
        Width = 97
        Height = 25
        Caption = 'Run Batch'
        Enabled = False
        TabOrder = 2
        OnClick = BRunBtnClick
      end
      object BStopBtn: TBitBtn
        Left = 176
        Top = 264
        Width = 81
        Height = 25
        Caption = 'STOP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnClick = BStopBtnClick
        Kind = bkAbort
      end
      object BProgBar: TProgressBar
        Left = 8
        Top = 232
        Width = 289
        Height = 16
        TabOrder = 4
      end
    end
  end
  object StopFlagBtn: TBitBtn
    Left = 232
    Top = 0
    Width = 97
    Height = 33
    Caption = 'Stop!'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = StopFlagBtnClick
    Kind = bkCancel
  end
  object BestFitChart: TChart
    Left = 16
    Top = 380
    Width = 321
    Height = 205
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Global Fitness History')
    Legend.Visible = False
    View3D = False
    TabOrder = 3
    object GlobalFitSeries: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Best Fitness'
      LinePen.Color = clRed
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object EAMenu: TMainMenu
    Left = 296
    Top = 584
    object FMenu: TMenuItem
      Caption = 'Function...'
      OnClick = FMenuClick
    end
    object AMenu: TMenuItem
      Caption = 'About...'
    end
    object ExitMenu: TMenuItem
      Caption = 'Exit'
    end
  end
  object NormalTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = NormalTimerTimer
    Left = 264
    Top = 584
  end
end
