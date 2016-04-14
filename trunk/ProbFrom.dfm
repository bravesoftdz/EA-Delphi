object PForm: TPForm
  Left = 555
  Top = 181
  Width = 594
  Height = 453
  Caption = 'PForm'
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
  object ProbMemo: TMemo
    Left = 296
    Top = 8
    Width = 281
    Height = 185
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object OkBtn: TBitBtn
    Left = 176
    Top = 392
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object CancelBtn: TBitBtn
    Left = 320
    Top = 392
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object ProbRadGrp: TRadioGroup
    Left = 8
    Top = 8
    Width = 137
    Height = 97
    Caption = 'Select Problem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Origin'
      'Origin Offset'
      'Rastrigin'
      'Schwefel'
      'One Max')
    ParentFont = False
    TabOrder = 3
    OnClick = ProbRadGrpClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 168
    Width = 137
    Height = 49
    Caption = 'Seed Value'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object SeedEdit: TESBIntSpinEdit
      Left = 12
      Top = 20
      MaxLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 152
    Top = 168
    Width = 137
    Height = 49
    Caption = 'Population Size'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object SizeEdit: TESBPosSpinEdit
      Left = 24
      Top = 20
      MaxLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 112
    Width = 137
    Height = 49
    Caption = 'Number of Dimensions'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object DimSpin: TESBPosSpinEdit
      Left = 32
      Top = 16
      Width = 81
      MaxLength = 0
      OnChange = DimSpinChange
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 224
    Width = 569
    Height = 153
    Caption = 'Fitness Evaluator'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object PSFitLbl: TLabel
      Left = 120
      Top = 36
      Width = 67
      Height = 16
      Caption = 'Fitness = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EvalBtn: TButton
      Left = 16
      Top = 32
      Width = 91
      Height = 25
      Caption = 'Evaluate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = EvalBtnClick
    end
    object EvalFitGrid: TStringGrid
      Left = 8
      Top = 64
      Width = 553
      Height = 73
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      ScrollBars = ssHorizontal
      TabOrder = 1
      ColWidths = (
        64
        64
        64
        64
        64)
    end
  end
  object GeneRadGrp: TRadioGroup
    Left = 152
    Top = 8
    Width = 129
    Height = 65
    Caption = 'Select Gene Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Integer'
      'Real'
      'Boolean')
    ParentFont = False
    TabOrder = 8
    OnClick = GeneRadGrpClick
  end
end
