object frm_Graph: Tfrm_Graph
  Left = 0
  Top = 0
  Caption = 'frm_Graph'
  ClientHeight = 422
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ChartCo2: TChart
    Left = 0
    Top = -8
    Width = 465
    Height = 433
    Title.Text.Strings = (
      'TChart')
    TabOrder = 0
    object Series1: TBarSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = True
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      Data = {
        02060000000000000000001440000000200000000000205C4000000020000000
        0000405F40FFFFFF1F0000000000605840000000200000000000C04240000000
        200000000000C05C4000000020}
    end
  end
  object GroupBox1: TGroupBox
    Left = 471
    Top = 0
    Width = 202
    Height = 425
    Caption = 'GroupBox1'
    TabOrder = 1
    object btnUpdateGraph: TButton
      Left = 30
      Top = 232
      Width = 83
      Height = 25
      Caption = 'Update Graph'
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 3
      Top = 16
      Width = 196
      Height = 73
      Caption = 'RadioGroup1'
      TabOrder = 1
    end
  end
  object ADOGraphQuery: TADOQuery
    Connection = DMCO2.con
    Parameters = <>
    SQL.Strings = (
      'Select * from tblFootPrint')
    Left = 408
    Top = 320
  end
  object ADOGraphQuerySource: TDataSource
    DataSet = ADOGraphQuery
    Left = 408
    Top = 368
  end
end
