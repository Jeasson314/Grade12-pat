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
    ActivePage = Admin
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object tabSheetUser: TTabSheet
      Caption = 'User update'
      object GroupBox1: TGroupBox
        Left = 271
        Top = 64
        Width = 306
        Height = 382
        Caption = 'User Management'
        TabOrder = 5
        object Label2: TLabel
          Left = 13
          Top = 39
          Width = 127
          Height = 13
          Caption = 'Electricty used this month:'
        end
        object Label4: TLabel
          Left = 13
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
        object imgAddCar: TImage
          Left = 224
          Top = 200
          Width = 33
          Height = 36
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000DE0000
            00E30803000000DD5D5AF60000007B504C5445000000FFFFFFC2C2C2F0F0F0F3
            F3F3EAEAEA252525DCDCDC0E0E0EC5C5C58787874E4E4E3D3D3D1414141C1C1C
            FAFAFAE3E3E37F7F7FB2B2B2D2D2D22C2C2C989898424242A6A6A6ACACACCDCD
            CD767676696969939393BEBEBE5C5C5C3232328B8B8B4949499E9E9E5F5F5F6D
            6D6D5555552828281919193131312AAE1B980000087C4944415478DAED9DFB43
            133910C7775BA0B46C5B29F210E45DCFFBFFFF1AEFA1A777CAE99D2FA4D20A54
            0EAE3549979DC96433DBDDE87C7F10B05BC8673799496626691C47F350B73DBA
            6ABFDF79318A3A6BF593E5F8EAD35CFE6C14178FD7A937DF8DD2FF7938B83CFD
            1EF096B79F02AF24C9B0F0675830DEE6394AD0FAF23560BCD5F7F64BCEC681E2
            7597FEA15CD6FB1024DECE4BE2852BA3E27A685178F51EE9D14DF4E07560784B
            5F9C2EDF74B81715C08B5DBBDBEAC780F01EFEE5FC96EDBF83C15B1EE6785331
            7C05E0398EBB6F5A7F1B045E2DAF9FAE5D8780B70E5BC1F5AFE366ED15F8729D
            DFFFB1E3C1DE7CFFE5FFCD87AD6AF2B9F278C8C0FBF670EEFF0B5DC13FFCB8F1
            D6C016B6943D85C7D8E255B5F19035C2AEEAB5077F40D7ECB93BCCB9E221C6AF
            A956ECBB7F8217ADD9975025E26DBCF1C43B7C5E653CCC73E96541FF37F8AAC6
            4575F1D0B9260D8F796EC68AD7C21C97C6432FEBB2869738F1F0E998B61A28DE
            2E75913F773CCCB09878B063B8D1CA7955F1B03145C6E3ED9D9C78F88C5FE3AD
            A3A187E628E213239E659DA74D3E8EF7F055C42746BC4D3CDE45C57BF47B35F1
            EEE1F1588DB7862E0C3A67D5C4BB63595693AB5BA4C1EDF7CDE85A998C85E9D7
            DB055272BE99F6049CB685116FEFC5CC8FC9881895488FD97B8C993146BC94E1
            A43F8494BFE48C59F3E175666FBA43E039F54E4ECF50189ECBD47FD6947246CC
            0AEB9C2E718500F11C4650109D336ACFD892FE53F21B53B1C36A9A96F44C99FC
            10D22989F21D433D63FA9C6CA4DCFAD13BD43574265F466B27A91716AFA1C117
            AFB87A7C77BC5EFB7C44FC2B49EBE69FE9FAEDE25AD99A9578FB24BA8CF20CB1
            FD850FA72EA17A57BCD541DE588F36A56B7EC1E8BD4BFAE074C3EBC5F95BC686
            77B3A878467D824E784D9F4001231EBD5AC4050F09BF3AE13DFAD51B2F3A7841
            BACC010F0FA558A5B3778B1CA1DA1629C34DC7DBF60C1230E3D1B265643C382B
            E78CD7E659AF5222A254BCDE3BDFD6B0E35192D554BCC43B02A21BF3D32F3C78
            847412112F2363BE9C71193611A1E12D432F64FD6A7BF7A4E1A5B207C9C6AB71
            6620A583CC86351ED213107FD6896BCDB475B3369E86F7C09CF6260D38857AF8
            CC8E87DC83FB9611DE599A3570D68807096FE1D2F80137C80DB07FAA207C172E
            8FB32FF56A6B26D1B2AD008A846706682D2D80EBC9764E327EDBAC8EE1676F34
            C0EC49B6C91905CFEC4DD6FB7B0CC6D0B726F13EA47862811419356F8FADD287
            8267C421095359D82EF6DF9E46DD18FE0DD4288439F7B52CED29787A864F09A0
            E42C0874480D99BDC9F226029ED15E9299752EC59D68E7847CA931C07FC6A708
            043CBDCA23AEB20E2916222DA77A3963F182F74E029EF2C236AFA444AEF1D7DA
            775A4B1ABE05777D763C3D99A6172D38F32575B769B6B62EB833B1E3ED3F9F7E
            B37469BB548BB0BD66E676D0C7DD445BBABA0705B0E32943EFB4D9C0690195A3
            8E538742D15C8D154FDB4DB7AC69FD901CBBC81375D7BE1DBDEB563CB54A77EE
            409BB456F7FFCDB3BAD5BE011D7C56BCC74FA6DFB85743D537EC77647F90AF82
            D370ED18810D4F9B60DA8430F5EE160E988C7327BB744E101B7C363CE5A27396
            9BD41EC00FBDFFC1A3F69636F86C782B83E9375B6FA29CEA0D7733664EC7179F
            BC224ADAF56083CF82A7A3105E7B2816DAA358F7C3A433FEE81DEA34262E0882
            054FAD8538EA106BED61D4FCDC620A03923C9F054F655C0BDB40985B7A5E86B4
            0DC7D37D937D0385B774D81C197C389E1ABF056CEFF1959E762201251C4FADAB
            8ED002DA5254D7FD091E7C289E9E1A70562B704997E8C14E0BC5537DD36DB139
            27E988203C1D46F18EBE458E580B80B9644CD941080C4FF74DE6AD2F3C32425C
            60FB303C15F26A0FA22A4A3B7670F061782ADD4CCCD3CF5BBACA0B1C7C189EBA
            3BDCBBEA98A4A24070F742F0D482B8A27DD38C17438E0BC15386B7A8031D7C65
            E4E5A0C187E0A9BE59DC79239ED23508D0E083F1F49C6E3E677DE5D091CEE800
            6D84F1D46ABFA0C338186464E680C107E3A9BEC9BA258B5546AC18187C209E7E
            6B65FBA6190D04061F88A7D25ECEE1DB394A27561F6757198278AAAE8D77332B
            AF8C347BF6E083F0F2A616E62B2311959D5A85F054868EFD18074E19D1C0ECB4
            3F84A73C66A187C079CBD812900902E0F9A516E6275B921DC0535136D69DACFC
            328A68333D1F80A7520BD5EE9B66123A73F0C5CDAC20E13D65917AC3BC5538F3
            50A3A94DE752FD6E4B1BD59D92B0286E73EEA3AE9A3A8217B0042F64095EC812
            BC902578214BF042D6778F57760B8A557C30AD586A547B59EEA6D5E9CA764305
            233A15AC5CC92D159B5578F5CA158D794855670A5E8012BC902578214BF04296
            E0852CC10B598217B27E5CBCD6E2F9CAF072FDA2FDBA8AE5EF77757871316E0C
            A3B39AB1EF1CC3539B6EEB8BF1DE13D29F284BC703BD11D0EC7E24BC5BD5BADD
            EA6D1F9A68B53653C19E0BEF46D8112BA569FF2CDDA8BC7837AF2DB17E0684BF
            EE7FBE5B429B1F2F8A160EFCCE3FE4556601920F9EF32117050AF8A4533FBCA8
            3BAE46B81EDAF1E38917D5FB55F012E06E285F3CA390AE3CC1A5CFFE789DEBB2
            0B8F913DBCFE78B3A7E995206CC708035EDE43BA98849E45C581377B42DFBC85
            EEBF66C12B334F866F0265C1B37CD057A1C27754F0E0212770162CCBC9074C78
            B98EC8E390A50C8009AFACD1676B17131E72C068A1B21D0DC08597EBF3C6BD65
            3DB6820BAF9CDE693DB6820BCFF768FF7CB21E0DC086578AEDB4964FB1E1E53E
            FDD6431BD60F1420E26D9FDBF812EFD3FDDDD57FEBD2AA1F3708FF3D48F04296
            E0852CC10B598217B2042F64095EC8123C4775B69E7335EEE0B56F9E8D1F8FF3
            28BA2DDF93D1F8F1384F33F30E350A9EE0099EE0099EE0099EE0099EE0099EE0
            091E1B5EEFB4C645F7B5EB5B962EB196902578214BF04296E0852CC10B598217
            B2042F64095EC872C1B397319724B822DF05AF829F393B510B6C98E0099EE009
            9EE0099EE0095E95247882277882570EDE7F05248BCF6276D62F000000004945
            4E44AE426082}
        end
        object btnDelete: TButton
          Left = 13
          Top = 189
          Width = 75
          Height = 25
          Caption = 'Delete'
          TabOrder = 0
          OnClick = btnDeleteClick
        end
        object edtElectricity: TEdit
          Left = 13
          Top = 58
          Width = 185
          Height = 21
          TabOrder = 1
        end
        object edtMileageMain: TEdit
          Left = 13
          Top = 104
          Width = 185
          Height = 21
          TabOrder = 2
        end
        object edtUpdate: TButton
          Left = 13
          Top = 131
          Width = 75
          Height = 25
          Caption = 'Update'
          TabOrder = 3
          OnClick = edtUpdateClick
        end
        object DBEdit1: TDBEdit
          Left = 13
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
          Left = 13
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
          Left = 13
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
        DataSource = DMCO2.dbSourceQueryFootprint
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
        Left = 583
        Top = 64
        Width = 306
        Height = 379
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
    object Admin: TTabSheet
      Caption = 'Admin'
      ImageIndex = 1
      object DBGridAdmin: TDBGrid
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
        OnCellClick = DBGridAdminCellClick
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
        object Label6: TLabel
          Left = 16
          Top = 123
          Width = 214
          Height = 16
          Caption = 'Select a record to delete in the table:'
        end
        object btnAdminEdit: TButton
          Left = 12
          Top = 83
          Width = 221
          Height = 38
          Caption = 'Edit'
          TabOrder = 0
        end
        object DBNavigator2: TDBNavigator
          Left = 3
          Top = 25
          Width = 240
          Height = 25
          DataSource = DBSourceAdminQuery
          TabOrder = 1
        end
        object edtEdit: TEdit
          Left = 14
          Top = 56
          Width = 219
          Height = 24
          TabOrder = 2
          Text = 'edtEdit'
        end
        object btnDeleteAdmin: TButton
          Left = 12
          Top = 145
          Width = 221
          Height = 40
          Caption = 'Delete'
          TabOrder = 3
          OnClick = btnDeleteAdminClick
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
        object btnGraphAdmin: TButton
          Left = 15
          Top = 167
          Width = 209
          Height = 41
          Caption = 'Graph'
          TabOrder = 3
          OnClick = btnGraphAdminClick
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
  object DataSource1: TDataSource
    DataSet = ADOAdminQuery
    Left = 16
    Top = 256
  end
end
