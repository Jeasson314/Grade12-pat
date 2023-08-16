object Form1: TForm1
  Left = 342
  Top = 165
  Caption = 'Form1'
  ClientHeight = 301
  ClientWidth = 391
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = -7
    Width = 393
    Height = 312
    Caption = 'GroupBox1'
    TabOrder = 0
    object Label1: TLabel
      Left = 106
      Top = 69
      Width = 72
      Height = 18
      Caption = 'Username:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 106
      Top = 133
      Width = 66
      Height = 18
      Caption = 'Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtUsername: TEdit
      Left = 106
      Top = 88
      Width = 137
      Height = 39
      TabOrder = 0
      OnChange = edtUsernameChange
    end
    object edtPassword: TEdit
      Left = 106
      Top = 157
      Width = 137
      Height = 37
      PasswordChar = '*'
      TabOrder = 1
    end
    object btnSignin: TButton
      Left = 56
      Top = 208
      Width = 116
      Height = 41
      Caption = 'Sign in'
      TabOrder = 2
      OnClick = btnSigninClick
    end
    object Button1: TButton
      Left = 196
      Top = 208
      Width = 117
      Height = 41
      Caption = 'Sign up'
      TabOrder = 3
      OnClick = Button1Click
    end
    object CHKCookie: TCheckBox
      Left = 285
      Top = 177
      Width = 97
      Height = 17
      Caption = 'Remember me?'
      TabOrder = 4
      OnClick = CHKCookieClick
    end
  end
end
