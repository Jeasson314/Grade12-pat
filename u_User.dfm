object frm_Users: Tfrm_Users
  Left = 400
  Top = 321
  Caption = 'frm_Users'
  ClientHeight = 316
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 553
    Height = 316
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 561
    ExplicitHeight = 314
    object TabSheet1: TTabSheet
      Caption = 'User update'
      ExplicitLeft = 8
      ExplicitTop = 8
      object btnGraph: TButton
        Left = 280
        Top = 260
        Width = 75
        Height = 25
        Caption = 'Graph'
        TabOrder = 0
      end
      object DBGridUsers: TDBGrid
        Left = 0
        Top = 0
        Width = 257
        Height = 289
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Edit1: TEdit
        Left = 280
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 407
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'Edit2'
      end
      object Panel1: TPanel
        Left = 280
        Top = 17
        Width = 248
        Height = 41
        Caption = 'Panel1'
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 280
        Top = 17
        Width = 248
        Height = 96
        Caption = 'GroupBox1'
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      Enabled = False
      ImageIndex = 1
      ExplicitWidth = 553
      ExplicitHeight = 286
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
