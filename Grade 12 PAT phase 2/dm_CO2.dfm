object DMCO2: TDMCO2
  OldCreateOrder = False
  Height = 221
  Width = 326
  object ConCO2: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\James\Docu' +
      'ments\GitHub\Grade12-pat\Grade 12 PAT phase 2\Database\db_CO2.md' +
      'b;Mode=Share Deny None;Persist Security Info=False;Jet OLEDB:Sys' +
      'tem database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Pa' +
      'ssword="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mod' +
      'e=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Tr' +
      'ansactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create' +
      ' System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLED' +
      'B:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Without R' +
      'eplica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 72
  end
  object ADOUsers: TADOTable
    Active = True
    Connection = ConCO2
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 88
    Top = 24
  end
  object ADOCars: TADOTable
    Active = True
    Connection = ConCO2
    CursorType = ctStatic
    TableName = 'tblCar'
    Left = 88
    Top = 88
  end
  object ADOOrganisation: TADOTable
    Active = True
    Connection = ConCO2
    CursorType = ctStatic
    TableName = 'tblOrganisation'
    Left = 88
    Top = 144
  end
end
