unit dm_CO2;

interface

uses
  SysUtils, Classes, DB, ADODB, FMTBcd, SqlExpr, WideStrings, Dialogs;

type
  TDMCO2 = class(TDataModule)
    ConCO2: TADOConnection;
    ADOUsers: TADOTable;
    ADOCars: TADOTable;
    ADOOrganisation: TADOTable;
    DbSourceCar: TDataSource;
    dbSourceOrganisation: TDataSource;
    ADOQuery: TADOQuery;
    dbSourceQuery: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure runSQL(sSql: string);
  end;

var
  DMCO2: TDMCO2;

implementation

{$R *.dfm}
{ TDMCO2 }

procedure TDMCO2.runSQL(sSql: string);
begin
  try
    if (ADOQuery <> Nil) then
    if (ADOQuery.Connection <> Nil) then
    begin
      ADOQuery.Close;
      ADOQuery.SQL.clear;
      ADOQuery.SQL.Add(sSql);
      ADOQuery.Open;
    end;
  except

  end;
end;

end.
