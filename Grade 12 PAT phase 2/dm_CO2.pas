unit dm_CO2;

interface

uses
  SysUtils, Classes, DB, ADODB, FMTBcd, SqlExpr, WideStrings;

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
  end;

var
  DMCO2: TDMCO2;

implementation

{$R *.dfm}

end.
