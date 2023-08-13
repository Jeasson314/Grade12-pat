object frmSignup: TfrmSignup
  Left = 598
  Top = 236
  Caption = 'frmSignup'
  ClientHeight = 418
  ClientWidth = 723
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
  object btnSignup: TButton
    Left = 0
    Top = 344
    Width = 723
    Height = 74
    Align = alBottom
    Caption = 'Sign up'
    TabOrder = 0
    OnClick = btnSignupClick
    ExplicitLeft = -1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 217
    Height = 344
    Align = alLeft
    Caption = 'Username Generation'
    TabOrder = 1
    ExplicitHeight = 349
    DesignSize = (
      217
      344)
    object Label1: TLabel
      Left = 2
      Top = 15
      Width = 213
      Height = 13
      Align = alTop
      Caption = 'First name:'
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
    end
    object edtLast_name: TEdit
      Left = 3
      Top = 79
      Width = 211
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
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
    Left = 217
    Top = 0
    Width = 257
    Height = 344
    Align = alLeft
    Caption = 'Vehicle and Organisation'
    Padding.Left = 20
    Padding.Right = 20
    TabOrder = 2
    ExplicitLeft = 214
    ExplicitTop = -6
    ExplicitHeight = 349
    object Button1: TButton
      Left = 23
      Top = 26
      Width = 213
      Height = 25
      Align = alCustom
      Caption = 'Choose vehicle'
      TabOrder = 0
      OnClick = Button1Click
    end
    object redoutCarsSignup: TRichEdit
      Left = 23
      Top = 57
      Width = 213
      Height = 45
      Align = alCustom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object pnlOrganisation: TPanel
      Left = 2
      Top = 177
      Width = 251
      Height = 161
      Caption = 'pnlOrganisation'
      TabOrder = 2
      Visible = False
      object btnOrganisation: TButton
        Left = 23
        Top = 26
        Width = 213
        Height = 25
        Margins.Bottom = 20
        Align = alCustom
        Caption = 'Choose organisation'
        TabOrder = 0
        OnClick = btnOrganisationClick
      end
      object redoutOrganisation: TRichEdit
        Left = 23
        Top = 57
        Width = 213
        Height = 35
        Align = alCustom
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object ChkOrganisation: TCheckBox
      Left = 23
      Top = 108
      Width = 211
      Height = 17
      Caption = 'Join or Create Organisation'
      TabOrder = 3
      OnClick = ChkOrganisationClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 474
    Top = 0
    Width = 248
    Height = 344
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'GroupBox3'
    TabOrder = 3
    ExplicitLeft = 475
    ExplicitWidth = 242
    ExplicitHeight = 349
    object TPanel
      Left = 2
      Top = 15
      Width = 244
      Height = 138
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitWidth = 257
      object Label3: TLabel
        Left = 23
        Top = 15
        Width = 89
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
        Left = 23
        Top = 70
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
      object edtPasswordOriginal: TEdit
        Left = 20
        Top = 35
        Width = 213
        Height = 29
        Align = alCustom
        TabOrder = 0
      end
      object edtPasswordSecond: TEdit
        Left = 20
        Top = 90
        Width = 213
        Height = 34
        Align = alCustom
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 153
      Width = 244
      Height = 193
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 257
      object Label5: TLabel
        Left = 23
        Top = 11
        Width = 65
        Height = 14
        Align = alCustom
        Caption = 'Enter Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 23
        Top = 70
        Width = 137
        Height = 14
        Align = alCustom
        Caption = 'Enter your personal goal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object edtEmail: TEdit
      Left = 24
      Top = 184
      Width = 209
      Height = 33
      TabOrder = 2
    end
    object edtPersonalgoal: TEdit
      Left = 24
      Top = 243
      Width = 209
      Height = 38
      TabOrder = 3
    end
  end
end
