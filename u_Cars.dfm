object frm_Cars: Tfrm_Cars
  Left = 0
  Top = 0
  Caption = 'frm_Cars'
  ClientHeight = 180
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object imgAddCars: TImage
    Left = 431
    Top = 133
    Width = 26
    Height = 29
    OnClick = imgAddCarsClick
  end
  object Label1: TLabel
    Left = 160
    Top = 114
    Width = 32
    Height = 13
    Caption = 'Model:'
  end
  object Label2: TLabel
    Left = 24
    Top = 114
    Width = 29
    Height = 13
    Caption = 'Make:'
  end
  object Label3: TLabel
    Left = 304
    Top = 114
    Width = 83
    Height = 13
    Caption = 'Emmisions(g/km):'
  end
  object Label4: TLabel
    Left = 24
    Top = 85
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
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 32
    Top = 58
    Width = 121
    Height = 21
    DataField = 'Make;Model'
    DataSource = DMCO2.dbSourceQuery
    KeyField = 'CarID'
    ListField = 'Model'
    ListFieldIndex = 2
    ListSource = DMCO2.DbSourceCar
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 32
    Top = 20
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object btnSearch: TButton
    Left = 176
    Top = 54
    Width = 105
    Height = 25
    Caption = 'Search Companies'
    TabOrder = 2
    OnClick = btnSearchClick
  end
  object edtMake: TEdit
    Left = 24
    Top = 133
    Width = 121
    Height = 21
    TabOrder = 3
    TextHint = 'Honda'
  end
  object edtModel: TEdit
    Left = 160
    Top = 133
    Width = 121
    Height = 21
    TabOrder = 4
    TextHint = 'Jazz'
  end
  object edtEmission: TEdit
    Left = 304
    Top = 133
    Width = 121
    Height = 21
    TabOrder = 5
    TextHint = '100'
  end
end
