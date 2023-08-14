unit dm_CO2;

interface

uses
  SysUtils, Classes, DB, ADODB, FMTBcd, SqlExpr, WideStrings, Dialogs,Forms;

type
  TDMCO2 = class(TDataModule)
    ADOUsers: TADOTable;
    ADOCarsOld: TADOTable;
    ADOCars: TADOTable;
    DbSourceCar: TDataSource;
    dbSourceOrganisation: TDataSource;
    ADOQuery: TADOQuery;
    dbSourceQuery: TDataSource;
    ADOOrganisation: TADOTable;
    con: TADOConnection;
    dbSourceUsers: TDataSource;
    ADOCarList: TADOTable;
    dbSourceCarList: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
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

procedure TDMCO2.DataModuleCreate(Sender: TObject);
var
  path: String;
begin
  {con.Connected := False;
  try
  path := ExpandFileName(ExtractFileDir(Application.ExeName)) + '\Database\db_CO2.mdb;';
  con.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;' +
    'User ID=Admin;Data Source=' + path;
  except
   showMessage('Error - Unable to find database at: '+path);
  end;
  con.Connected := True;
  ADOCars.active := True;
  AdoUsers.Active := True;
  ADOOrganisation.Active:=true;}
end;

procedure TDMCO2.runSQL(sSql: string);
begin
  showmessage(sSql);

  ADOQuery.close;
  ADOQuery.SQL.clear;
  ADOQuery.SQL.Add(sSql);
  ADOQuery.Open;

end;

end.
