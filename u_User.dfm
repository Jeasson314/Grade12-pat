object frm_Users: Tfrm_Users
  Left = 293
  Top = 165
  Caption = 'frm_Users'
  ClientHeight = 523
  ClientWidth = 1004
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
    Width = 1004
    Height = 523
    ActivePage = tabSheetUser
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object tabSheetUser: TTabSheet
      Caption = 'User update'
      object GroupBox1: TGroupBox
        Left = 271
        Top = 64
        Width = 554
        Height = 382
        Caption = 'User Management'
        TabOrder = 5
        object Label2: TLabel
          Left = 9
          Top = 40
          Width = 127
          Height = 13
          Caption = 'Electricty used this month:'
        end
        object Label4: TLabel
          Left = 9
          Top = 85
          Width = 80
          Height = 13
          Caption = 'Current Mileage:'
        end
        object Label8: TLabel
          Left = 13
          Top = 288
          Width = 28
          Height = 13
          Caption = 'From:'
        end
        object Label5: TLabel
          Left = 13
          Top = 307
          Width = 16
          Height = 13
          Caption = 'To:'
        end
        object btnDelete: TButton
          Left = 9
          Top = 189
          Width = 75
          Height = 25
          Caption = 'Delete'
          TabOrder = 0
          OnClick = btnDeleteClick
        end
        object edtElectricity: TEdit
          Left = 9
          Top = 58
          Width = 185
          Height = 21
          TabOrder = 1
        end
        object edtMileageMain: TEdit
          Left = 9
          Top = 104
          Width = 185
          Height = 21
          TabOrder = 2
        end
        object edtUpdate: TButton
          Left = 9
          Top = 131
          Width = 75
          Height = 25
          Caption = 'Update'
          TabOrder = 3
          OnClick = edtUpdateClick
        end
        object DBEdit1: TDBEdit
          Left = 9
          Top = 162
          Width = 185
          Height = 21
          DataSource = DMCO2.dbSourceFootprint
          TabOrder = 4
        end
        object DateTimeFrom: TDateTimePicker
          Left = 47
          Top = 288
          Width = 226
          Height = 21
          Date = 45158.726671712960000000
          Time = 45158.726671712960000000
          TabOrder = 5
        end
        object DateTimeTo: TDateTimePicker
          Left = 48
          Top = 313
          Width = 225
          Height = 21
          Date = 45158.726992094900000000
          Time = 45158.726992094900000000
          TabOrder = 6
        end
        object btnFilter: TButton
          Left = 0
          Top = 343
          Width = 134
          Height = 39
          Caption = 'Filter'
          TabOrder = 7
          OnClick = btnFilterClick
        end
        object RadioSort: TRadioGroup
          Left = 9
          Top = 220
          Width = 185
          Height = 53
          Caption = 'Sort'
          Color = clBtnFace
          Items.Strings = (
            'Ascending'
            'Descending')
          ParentBackground = False
          ParentColor = False
          TabOrder = 8
        end
        object btnSort: TButton
          Left = 143
          Top = 343
          Width = 144
          Height = 39
          Caption = 'Sort'
          TabOrder = 9
          OnClick = btnSortClick
        end
        object CmbCars: TComboBox
          Left = 3
          Top = 13
          Width = 191
          Height = 21
          TabOrder = 10
        end
      end
      object btnGraph: TButton
        Left = 273
        Top = 452
        Width = 290
        Height = 38
        Caption = 'Graph'
        TabOrder = 0
        OnClick = btnGraphClick
      end
      object DBGridUsers: TDBGrid
        Left = 0
        Top = 0
        Width = 265
        Height = 443
        DataSource = DMCO2.dbSourceFootprint
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'EmissionDate'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Emission'
            Visible = True
          end>
      end
      object pnlWarning: TPanel
        Left = 282
        Top = 17
        Width = 281
        Height = 41
        TabOrder = 2
      end
      object DBNavigator1: TDBNavigator
        Left = 11
        Top = 465
        Width = 240
        Height = 25
        DataSource = DMCO2.dbSourceFootprint
        TabOrder = 4
      end
      object pnlFirst: TPanel
        Left = 63
        Top = 47
        Width = 292
        Height = 337
        TabOrder = 3
        Visible = False
        object Label1: TLabel
          Left = 16
          Top = 17
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
        object btnAdd: TButton
          Left = 207
          Top = 56
          Width = 34
          Height = 25
          Caption = 'ADD'
          TabOrder = 1
          OnClick = btnAddClick
        end
        object cmbCarsAdd: TComboBox
          Left = 16
          Top = 36
          Width = 185
          Height = 21
          TabOrder = 2
          Text = 'cmbCarsAdd'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 993
        Height = 230
        DataSource = DBSourceAdminQuery
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 239
        Width = 230
        Height = 262
        Caption = 'Choose table to display:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object btnDisplay: TButton
          Left = 19
          Top = 132
          Width = 192
          Height = 37
          Caption = 'Display'
          TabOrder = 0
          OnClick = btnDisplayClick
        end
        object RadioDisplay: TRadioGroup
          Left = 19
          Top = 21
          Width = 192
          Height = 105
          Caption = 'RadioDisplay'
          Color = clBtnFace
          ItemIndex = 0
          Items.Strings = (
            'Members'
            'Organisation Footprint'
            'Car List')
          ParentBackground = False
          ParentColor = False
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 239
        Top = 239
        Width = 258
        Height = 260
        Caption = 'Sorting and Filter:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object cmbSort: TComboBox
          Left = 16
          Top = 30
          Width = 225
          Height = 24
          TabOrder = 0
          Text = 'cmbSort'
          Items.Strings = (
            'Username'
            'First Name'
            'Last Name'
            'Last Updated')
        end
        object btnAdminSort: TButton
          Left = 15
          Top = 148
          Width = 225
          Height = 40
          Caption = 'Sort'
          TabOrder = 1
          OnClick = btnAdminSortClick
        end
        object RadioSortAdmin: TRadioGroup
          Left = 15
          Top = 60
          Width = 226
          Height = 82
          Caption = 'RadioSortAdmin'
          ItemIndex = 0
          Items.Strings = (
            'Descending'
            'Ascending')
          TabOrder = 2
        end
      end
      object Database: TGroupBox
        Left = 503
        Top = 239
        Width = 255
        Height = 260
        Caption = 'Database Editing:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Edit1: TEdit
          Left = 38
          Top = 39
          Width = 121
          Height = 24
          TabOrder = 0
          Text = 'Edit1'
        end
      end
      object Statistics: TGroupBox
        Left = 764
        Top = 239
        Width = 235
        Height = 255
        Caption = 'Statistics:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object RadioStatistics: TRadioGroup
          Left = 13
          Top = 16
          Width = 209
          Height = 57
          Caption = 'Choose:'
          Items.Strings = (
            'User'
            'Organsiation')
          TabOrder = 0
        end
        object btnStatistics: TButton
          Left = 13
          Top = 125
          Width = 212
          Height = 36
          Caption = 'Statistics'
          TabOrder = 1
          OnClick = btnStatisticsClick
        end
        object cmbStatistics: TComboBox
          Left = 13
          Top = 95
          Width = 209
          Height = 24
          TabOrder = 2
          Items.Strings = (
            'Average'
            'Minimum'
            'Maximum')
        end
      end
    end
  end
  object DBSourceEmission: TDataSource
    Left = 16
    Top = 312
  end
  object ADOUsersQuery: TADOQuery
    Connection = DMCO2.con
    DataSource = DMCO2.dbSourceCarList
    Parameters = <>
    Left = 16
    Top = 400
  end
  object DBSourceUserQuery: TDataSource
    Left = 16
    Top = 448
  end
  object ADOEmissionQuery: TADOQuery
    Connection = DMCO2.con
    Parameters = <>
    Left = 24
    Top = 152
  end
  object ADOAdminQuery: TADOQuery
    Connection = DMCO2.con
    Parameters = <>
    SQL.Strings = (
      'Select  * from tblUsers')
    Left = 16
    Top = 192
  end
  object DBSourceAdminQuery: TDataSource
    DataSet = ADOAdminQuery
    Left = 16
    Top = 256
  end
end
