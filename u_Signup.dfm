object frmSignup: TfrmSignup
  Left = 743
  Top = 579
  Caption = 'frmSignup'
  ClientHeight = 248
  ClientWidth = 508
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
  object Label1: TLabel
    Left = 8
    Top = 21
    Width = 54
    Height = 13
    Caption = 'First name:'
  end
  object edtFirst_name: TEdit
    Left = 8
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtLast_name: TEdit
    Left = 8
    Top = 75
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object pnlUsername: TPanel
    Left = 8
    Top = 133
    Width = 138
    Height = 40
    TabOrder = 2
  end
  object btnGenerate_name: TButton
    Left = 8
    Top = 102
    Width = 121
    Height = 25
    Caption = 'Generate username'
    TabOrder = 3
    OnClick = btnGenerate_nameClick
  end
  object Edit3: TEdit
    Left = 8
    Top = 179
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit3'
  end
  object btnOrganisation: TButton
    Left = 168
    Top = 21
    Width = 121
    Height = 25
    Caption = 'Choose organisation'
    TabOrder = 5
  end
  object Button1: TButton
    Left = 168
    Top = 86
    Width = 121
    Height = 25
    Caption = 'Choose vehicle'
    TabOrder = 6
  end
  object DBMemo1: TDBMemo
    Left = 168
    Top = 117
    Width = 153
    Height = 36
    TabOrder = 7
  end
  object tdb_organisation: TDBEdit
    Left = 168
    Top = 52
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object Edit1: TEdit
    Left = 8
    Top = 206
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'Edit1'
  end
end
