object Form2: TForm2
  Left = 400
  Top = 321
  Caption = 'Form2'
  ClientHeight = 314
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 561
    Height = 314
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'User update'
      ExplicitWidth = 641
      ExplicitHeight = 389
      object Button2: TButton
        Left = 136
        Top = 80
        Width = 75
        Height = 25
        Caption = 'Button2'
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      Enabled = False
      ImageIndex = 1
      ExplicitWidth = 641
      ExplicitHeight = 389
      object Button1: TButton
        Left = 256
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
      end
    end
  end
end
