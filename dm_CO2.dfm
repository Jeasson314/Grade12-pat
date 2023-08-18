object DMCO2: TDMCO2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 368
  Width = 422
  object ADOUsers: TADOTable
    Connection = con
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 88
    Top = 24
  end
  object ADOCarsOld: TADOTable
    Connection = con
    CursorType = ctStatic
    TableName = 'tblCar'
    Left = 320
    Top = 224
  end
  object ADOOrganisation: TADOTable
    Connection = con
    CursorType = ctStatic
    TableName = 'tblOrganisation'
    Left = 88
    Top = 144
  end
  object DbSourceCar: TDataSource
    DataSet = ADOCars
    Left = 192
    Top = 80
  end
  object dbSourceOrganisation: TDataSource
    DataSet = ADOOrganisation
    Left = 200
    Top = 144
  end
  object ADOQuery: TADOQuery
    Connection = con
    CursorType = ctStatic
    DataSource = dbSourceCarList
    Parameters = <>
    SQL.Strings = (
      'SELECT CarID from tblCarList')
    Left = 80
    Top = 264
  end
  object dbSourceQuery: TDataSource
    DataSet = ADOQuery
    Left = 200
    Top = 264
  end
  object ADOCars: TADOTable
    Connection = con
    CursorType = ctStatic
    TableName = 'tblCar'
    Left = 88
    Top = 88
  end
  object con: TADOConnection
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 96
  end
  object dbSourceUsers: TDataSource
    DataSet = ADOUsers
    Left = 176
    Top = 32
  end
  object ADOCarList: TADOTable
    Connection = con
    CursorType = ctStatic
    TableName = 'tblCarList'
    Left = 88
    Top = 200
  end
  object dbSourceCarList: TDataSource
    Left = 192
    Top = 208
  end
end
