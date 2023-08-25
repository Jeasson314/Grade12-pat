object frm_Graph: Tfrm_Graph
  Left = 0
  Top = 0
  Caption = 'frm_Graph'
  ClientHeight = 438
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pagecontrol: TPageControl
    Left = 463
    Top = 0
    Width = 223
    Height = 425
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 215
        Height = 397
        Align = alClient
        Caption = 'GroupBox1'
        TabOrder = 0
        object btnUpdateGraph: TButton
          Left = 3
          Top = 175
          Width = 212
          Height = 42
          Caption = 'Update Graph'
          TabOrder = 0
          OnClick = btnUpdateGraphClick
        end
        object RadioGraph: TRadioGroup
          Left = 16
          Top = 22
          Width = 185
          Height = 59
          Caption = 'Choose which data you want output:'
          ItemIndex = 0
          Items.Strings = (
            'Emission Graph'
            'Car Emission')
          TabOrder = 1
          OnClick = RadioGraphClick
        end
        object pnlDate: TPanel
          Left = 3
          Top = 87
          Width = 212
          Height = 82
          TabOrder = 2
          object DateTimeTo: TDateTimePicker
            Left = 7
            Top = 48
            Width = 186
            Height = 21
            Date = 45162.707229641200000000
            Time = 45162.707229641200000000
            TabOrder = 0
          end
          object DateTimeFrom: TDateTimePicker
            Left = 7
            Top = 8
            Width = 186
            Height = 21
            Date = 45162.707342662030000000
            Time = 45162.707342662030000000
            TabOrder = 1
          end
        end
      end
    end
  end
  object DBChart1: TDBChart
    Left = 0
    Top = 0
    Width = 441
    Height = 249
    PrintProportional = False
    Title.Text.Strings = (
      'TDBChart')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 1
    PrintMargins = (
      16
      25
      14
      24)
    object SeriesFootPrint: TBarSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Shadow.Color = 8618883
      Marks.Visible = True
      DataSource = ADOGraphQuery
      BarWidthPercent = 20
      Dark3D = False
      Gradient.Direction = gdTopBottom
      Shadow.Color = 8618883
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
    object SeriesPie: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = True
      DataSource = ADOGraphQuery
      Gradient.Direction = gdRadial
      OtherSlice.Legend.Visible = False
      PieValues.Name = 'Pie'
      PieValues.Order = loNone
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
