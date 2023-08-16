object Form1: TForm1
  Left = 342
  Top = 165
  Caption = 'Form1'
  ClientHeight = 257
  ClientWidth = 322
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
  object TGroupBox
    Left = 0
    Top = 0
    Width = 322
    Height = 257
    Align = alClient
    TabOrder = 0
    OnClick = GroupBox1Click
    ExplicitWidth = 313
    ExplicitHeight = 225
    object Label2: TLabel
      Left = 64
      Top = 92
      Width = 50
      Height = 13
      Caption = 'password:'
    end
    object Label1: TLabel
      Left = 64
      Top = 61
      Width = 52
      Height = 13
      Caption = 'Username:'
    end
    object Button1: TButton
      Left = 152
      Top = 216
      Width = 170
      Height = 41
      Caption = 'Sign up'
      TabOrder = 0
      OnClick = Button1Click
    end
    object CHKCookie: TCheckBox
      Left = 88
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Remember me?'
      TabOrder = 1
    end
    object btnSignin: TButton
      Left = 0
      Top = 216
      Width = 153
      Height = 41
      Caption = 'Sign in'
      TabOrder = 2
      OnClick = btnSigninClick
    end
    object edtPassword: TEdit
      Left = 88
      Top = 138
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object edtUsername: TEdit
      Left = 88
      Top = 111
      Width = 121
      Height = 21
      TabOrder = 4
    end
  end
end
