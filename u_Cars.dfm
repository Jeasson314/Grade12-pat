object frm_Cars: Tfrm_Cars
  Left = 0
  Top = 0
  Caption = 'frm_Cars'
  ClientHeight = 242
  ClientWidth = 527
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
    Left = 311
    Top = 95
    Width = 65
    Height = 82
  end
  object ComboBox1: TComboBox
    Left = 246
    Top = 55
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'ComboBox1'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 24
    Top = 55
    Width = 145
    Height = 21
    KeyField = 'CarID'
    ListField = 'Model'
    ListSource = DMCO2.DbSourceCar
    TabOrder = 1
  end
end
