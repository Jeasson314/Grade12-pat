object frm_Cars: Tfrm_Cars
  Left = 0
  Top = 0
  Caption = 'frm_Cars'
  ClientHeight = 449
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 247
    Width = 573
    Height = 105
    Align = alTop
    Padding.Left = 5
    Padding.Right = 5
    TabOrder = 0
    object imgAddCars: TImage
      Left = 439
      Top = 52
      Width = 26
      Height = 29
      OnClick = imgAddCarsClick
    end
    object Label3: TLabel
      Left = 290
      Top = 49
      Width = 83
      Height = 13
      Caption = 'Emmisions(g/km):'
    end
    object Label1: TLabel
      Left = 158
      Top = 49
      Width = 32
      Height = 13
      Caption = 'Model:'
    end
    object Label2: TLabel
      Left = 16
      Top = 49
      Width = 29
      Height = 13
      Caption = 'Make:'
    end
    object Label4: TLabel
      Left = 16
      Top = 7
      Width = 148
      Height = 23
      Caption = 'Add New Vehicle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtEmission: TEdit
      Left = 290
      Top = 68
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = '100'
    end
    object edtModel: TEdit
      Left = 151
      Top = 68
      Width = 121
      Height = 21
      TabOrder = 1
      TextHint = 'Jazz'
    end
    object edtMake: TEdit
      Left = 16
      Top = 68
      Width = 121
      Height = 21
      TabOrder = 2
      TextHint = 'Honda'
    end
  end
  object TGroupBox
    Left = 0
    Top = 0
    Width = 573
    Height = 247
    Align = alTop
    Padding.Left = 5
    Padding.Right = 5
    TabOrder = 1
    object Label5: TLabel
      Left = 7
      Top = 15
      Width = 559
      Height = 23
      Align = alTop
      Caption = 'Select a vehicle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 136
    end
    object Panel1: TPanel
      Left = 7
      Top = 174
      Width = 559
      Height = 71
      Align = alBottom
      TabOrder = 0
      object imgAddV: TImage
        Left = 267
        Top = 32
        Width = 30
        Height = 25
        OnClick = imgAddVClick
      end
      object lookupMake: TDBLookupComboBox
        Left = 5
        Top = 8
        Width = 145
        Height = 21
        KeyField = 'Make'
        ListField = 'Make'
        ListSource = dsListMakes
        TabOrder = 0
      end
      object edtSearch: TEdit
        Left = 5
        Top = 35
        Width = 145
        Height = 21
        TabOrder = 1
      end
      object btnFilterByMake: TButton
        Left = 156
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Filter By'
        TabOrder = 2
        OnClick = btnFilterByMakeClick
      end
      object btnSearch: TButton
        Left = 156
        Top = 35
        Width = 105
        Height = 25
        Caption = 'Search Companies'
        TabOrder = 3
        OnClick = btnSearchClick
      end
    end
    object girdCars: TDBGrid
      Left = 8
      Top = 40
      Width = 545
      Height = 136
      DataSource = DMCO2.DbSourceCar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Make'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Model'
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 352
    Width = 573
    Height = 98
    Align = alTop
    Padding.Left = 5
    Padding.Right = 5
    TabOrder = 2
    DesignSize = (
      573
      98)
    object redoutCars: TRichEdit
      Left = 3
      Top = 3
      Width = 570
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnCompleteCar: TButton
      Left = 0
      Top = 56
      Width = 573
      Height = 38
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Complete Car Selection'
      TabOrder = 1
      OnClick = btnCompleteCarClick
    end
  end
  object adoListMakes: TADOQuery
    Connection = DMCO2.con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT DISTINCT Make FROM tblCar')
    Left = 200
    Top = 32
  end
  object dsListMakes: TDataSource
    DataSet = adoListMakes
    Left = 264
    Top = 32
  end
end
