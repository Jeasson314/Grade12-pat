object frmSignup: TfrmSignup
  Left = 598
  Top = 236
  Caption = 'frmSignup'
  ClientHeight = 423
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  DesignSize = (
    717
    423)
  PixelsPerInch = 96
  TextHeight = 13
  object btnSignup: TButton
    Left = 0
    Top = 349
    Width = 717
    Height = 74
    Align = alBottom
    Caption = 'Sign up'
    TabOrder = 0
    OnClick = btnSignupClick
    ExplicitTop = 272
    ExplicitWidth = 650
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 217
    Height = 349
    Align = alLeft
    Caption = 'Username Geeration'
    TabOrder = 1
    ExplicitHeight = 321
    DesignSize = (
      217
      349)
    object Label1: TLabel
      Left = 2
      Top = 15
      Width = 213
      Height = 13
      Align = alTop
      Caption = 'First name:'
      ExplicitLeft = 12
      ExplicitTop = 18
      ExplicitWidth = 54
    end
    object Label2: TLabel
      Left = 3
      Top = 60
      Width = 53
      Height = 13
      Caption = 'Last name:'
    end
    object edtFirst_name: TEdit
      Left = 2
      Top = 28
      Width = 213
      Height = 26
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 149
    end
    object edtLast_name: TEdit
      Left = 3
      Top = 79
      Width = 211
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitWidth = 147
    end
    object btnGenerate_name: TButton
      Left = 3
      Top = 110
      Width = 147
      Height = 35
      Caption = 'Generate username'
      TabOrder = 2
      OnClick = btnGenerate_nameClick
    end
    object pnlUsername: TPanel
      Left = 3
      Top = 151
      Width = 147
      Height = 40
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 221
    Top = 0
    Width = 257
    Height = 343
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Vehicle and Organisation'
    Padding.Left = 20
    Padding.Right = 20
    TabOrder = 2
    object Label3: TLabel
      Left = 23
      Top = 141
      Width = 213
      Height = 14
      Align = alCustom
      Caption = 'Enter Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 21
      Top = 195
      Width = 102
      Height = 14
      Align = alCustom
      Caption = 'Retype  Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnOrganisation: TButton
      Left = 22
      Top = 15
      Width = 213
      Height = 25
      Margins.Bottom = 20
      Align = alTop
      Caption = 'Choose organisation'
      TabOrder = 0
      OnClick = btnOrganisationClick
      ExplicitLeft = 21
      ExplicitTop = 9
      ExplicitWidth = 180
    end
    object Button1: TButton
      Left = 22
      Top = 75
      Width = 213
      Height = 25
      Align = alTop
      Caption = 'Choose vehicle'
      TabOrder = 1
      OnClick = Button1Click
      ExplicitLeft = 64
      ExplicitTop = 79
      ExplicitWidth = 121
    end
    object RichEdit1: TRichEdit
      Left = 22
      Top = 100
      Width = 213
      Height = 35
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'RichEdit1')
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 21
      ExplicitTop = 106
    end
    object RichEdit2: TRichEdit
      Left = 22
      Top = 40
      Width = 213
      Height = 35
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'RichEdit2')
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 2
      ExplicitWidth = 217
    end
    object edtPasswordOriginal: TEdit
      Left = 21
      Top = 161
      Width = 213
      Height = 28
      Align = alCustom
      TabOrder = 4
      Text = 'edtPasswordOriginal'
    end
    object edtPasswordSecond: TEdit
      Left = 21
      Top = 215
      Width = 213
      Height = 26
      Align = alCustom
      TabOrder = 5
      Text = 'edtPasswordSecond'
    end
  end
end
