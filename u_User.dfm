object frm_Users: Tfrm_Users
  Left = 400
  Top = 321
  Caption = 'frm_Users'
  ClientHeight = 388
  ClientWidth = 572
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
  object Label3: TLabel
    Left = 296
    Top = 128
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 572
    Height = 388
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'User update'
      object Label2: TLabel
        Left = 280
        Top = 85
        Width = 127
        Height = 13
        Caption = 'Electricty used this month:'
      end
      object Label4: TLabel
        Left = 280
        Top = 136
        Width = 80
        Height = 13
        Caption = 'Current Mileage:'
      end
      object btnGraph: TButton
        Left = 271
        Top = 328
        Width = 135
        Height = 29
        Caption = 'Graph'
        TabOrder = 0
        OnClick = btnGraphClick
      end
      object DBGridUsers: TDBGrid
        Left = 0
        Top = 0
        Width = 265
        Height = 361
        DataSource = DMCO2.dbSourceFootprint
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object edtElectricity: TEdit
        Left = 280
        Top = 109
        Width = 185
        Height = 21
        TabOrder = 2
      end
      object Panel1: TPanel
        Left = 280
        Top = 17
        Width = 248
        Height = 41
        Caption = 'Panel1'
        TabOrder = 3
      end
      object edtMileageMain: TEdit
        Left = 280
        Top = 155
        Width = 185
        Height = 21
        TabOrder = 5
      end
      object pnlFirst: TPanel
        Left = 3
        Top = 34
        Width = 248
        Height = 96
        TabOrder = 4
        Visible = False
        object Label1: TLabel
          Left = 16
          Top = 14
          Width = 189
          Height = 13
          Caption = 'Please enter your cars current mileage:'
        end
        object edtMileage: TEdit
          Left = 16
          Top = 63
          Width = 185
          Height = 21
          Hint = '123455'
          TabOrder = 0
        end
        object LookupAddNew: TDBLookupComboBox
          Left = 16
          Top = 36
          Width = 145
          Height = 21
          KeyField = 'CarListID'
          ListField = 'Model'
          ListSource = DBSourceUserQuery
          TabOrder = 1
        end
        object btnAdd: TButton
          Left = 207
          Top = 63
          Width = 34
          Height = 25
          Caption = 'ADD'
          TabOrder = 2
          OnClick = btnAddClick
        end
      end
      object edtUpdate: TButton
        Left = 280
        Top = 182
        Width = 75
        Height = 25
        Caption = 'Update'
        TabOrder = 6
        OnClick = edtUpdateClick
      end
      object lookupUserMake: TDBLookupComboBox
        Left = 280
        Top = 64
        Width = 145
        Height = 21
        Enabled = False
        KeyField = 'CarListID'
        ListField = 'Model'
        ListSource = DBSourceUserQuery
        TabOrder = 7
      end
      object Edit1: TEdit
        Left = 271
        Top = 224
        Width = 121
        Height = 21
        TabOrder = 8
        Text = 'Edit1'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      Enabled = False
      ImageIndex = 1
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
  object ADOUsersQuery: TADOQuery
    Connection = DMCO2.con
    DataSource = DMCO2.dbSourceCarList
    Parameters = <>
    Left = 480
    Top = 88
  end
  object DBSourceUserQuery: TDataSource
    DataSet = ADOUsersQuery
    Left = 480
    Top = 136
  end
  object ADOEmissionQuery: TADOQuery
    Connection = DMCO2.con
    Parameters = <>
    Left = 424
    Top = 40
  end
  object DBSourceEmission: TDataSource
    Left = 456
    Top = 32
  end
end
