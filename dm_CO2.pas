unit dm_CO2;
interface

uses
  SysUtils, Windows, Classes, DB, ADODB, FMTBcd, SqlExpr, WideStrings, Dialogs, Forms, StdCtrls;

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
    ADOFootprint: TADOTable;
    dbSourceFootprint: TDataSource;
    ADOQueryCar: TADOQuery;
    dbSourceQueryCar: TDataSource;
    dbSourceCarQuerAdd: TDataSource;
    ADOQueryADD: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fillCombobox(toFill : TComboBox; data : TAdoQuery );
    procedure runSQL(sSql: string);
    procedure runCar(sSql: string);
    procedure runCarAdd(sSql: string);

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
  con.Connected := False;
  try
    path := ExpandFileName(ExtractFileDir(Application.ExeName))
      + '\Database\db_CO2.mdb;';
    con.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;' +
      'User ID=Admin;Data Source=' + path;
  except
    showMessage('Error - Unable to find database at: ' + path);
  end;
  con.Connected := True;
  ADOCars.active := True;
  ADOUsers.active := True;
  ADOOrganisation.active := True;
  ADOCarList.active := True;
  ADOFootprint.active := True;
  ADOQuery.active := True;
  ADOQueryCar.active := True;
end;

procedure TDMCO2.fillCombobox(toFill: TComboBox; data: TAdoQuery);
begin
  toFill.Items.Clear;
  data.First;
  while NOT data.Eof do
   begin
    toFill.Items.Add(''+data.FieldByName('Model').AsString);
    data.Next;
   end;
end;

procedure TDMCO2.runCar(sSql: string);
begin
  ADOQueryCar.SQL.Clear;
  ADOQueryCar.SQL.Add('SELECT tblCar.Make AS Make, tblCar.Model AS Model ' +
      'FROM tblCar INNER JOIN tblCarList ON tblCar.CarID = tblCarList.CarID WHERE tblCarList.UserID = ' + sSql);
  ADOQueryCar.Open;
end;

procedure TDMCO2.runCarAdd(sSql: string);
begin
  ADOQueryCar.SQL.Clear;
  ADOQueryCar.SQL.Add('SELECT tblCar.Make AS Make, tblCar.Model AS Model ' +
      'FROM tblCar INNER JOIN tblCarList ON tblCar.CarID = tblCarList.CarID WHERE tblCarList.UserID = ' + sSql);
  ADOQueryCar.Open;
end;

procedure TDMCO2.runSQL(sSql: string);
begin
  showMessage(sSql);

  ADOQuery.close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add(sSql);
  ADOQuery.Open;

end;

end.
