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
    Left = 176
    Top = 87
    Width = 65
    Height = 82
  end
  object ComboBox1: TComboBox
    Left = 264
    Top = 39
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'ComboBox1'
  end
  object DBComboBox1: TDBComboBox
    Left = 32
    Top = 39
    Width = 145
    Height = 21
    DataSource = DMCO2.dbSourceQuery
    TabOrder = 1
  end
end
