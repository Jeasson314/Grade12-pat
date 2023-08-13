object DMCO2: TDMCO2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 368
  Width = 422
  object ADOUsers: TADOTable
    Active = True
    Connection = con
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 88
    Top = 24
  end
  object ADOCarsOld: TADOTable
    Active = True
    Connection = con
    CursorType = ctStatic
    TableName = 'tblCar'
    Left = 320
    Top = 224
  end
  object ADOOrganisation: TADOTable
    Active = True
    Connection = con
    CursorType = ctStatic
    TableName = 'tblOrganisation'
    Left = 88
    Top = 144
  end
  object DbSourceCar: TDataSource
    DataSet = adoCars
    Left = 192
    Top = 80
  end
  object dbSourceOrganisation: TDataSource
    DataSet = ADOOrganisation
    Left = 200
    Top = 144
  end
  object ADOQuery: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\13236\Down' +
      'loads\Grade12-pat-main\Grade12-pat-main\Database\db_CO2.mdb;Pers' +
      'ist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT CarID,Make+'#39'  '#39'+Model  as MakeandModel FROM tblCar')
    Left = 88
    Top = 208
  end
  object dbSourceQuery: TDataSource
    DataSet = ADOQuery
    Left = 200
    Top = 224
  end
  object adoCars: TADOTable
    Active = True
    Connection = con
    CursorType = ctStatic
    TableName = 'tblCar'
    Left = 88
    Top = 88
  end
  object con: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\James\Docu' +
      'ments\GitHub\Grade12-pat\Database\db_CO2.mdb;Persist Security In' +
      'fo=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 96
  end
end
