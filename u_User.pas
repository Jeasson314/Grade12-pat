unit u_User;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, u_SignIn, dm_co2,
  u_UserNormal, u_Signup, u_graph, DBCtrls, DB, ADODB;

type
  Tfrm_Users = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    btnGraph: TButton;
    DBGridUsers: TDBGrid;
    edtElectricity: TEdit;
    Panel1: TPanel;
    pnlFirst: TPanel;
    edtMileageMain: TEdit;
    edtMileage: TEdit;
    Label1: TLabel;
    ADOUsersQuery: TADOQuery;
    DBSourceUserQuery: TDataSource;
    LookupAddNew: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnAdd: TButton;
    edtUpdate: TButton;
    lookupUserMake: TDBLookupComboBox;
    ADOEmissionQuery: TADOQuery;
    DBSourceEmission: TDataSource;
    Edit1: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
    procedure edtUpdateClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    procedure UpdateLookup(sQuery: string);
    procedure UpdateEmission;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Users: Tfrm_Users;
  objUser: Signup;
  objUserdata: UserData;

implementation

uses u_Login;
{$R *.dfm}

procedure Tfrm_Users.btnAddClick(Sender: TObject);
var
  bFound: boolean;
begin
  bFound := false;
  with dmco2 do
  begin
    ADOCarList.first;
    while not(ADOCarList.eof) and (bFound = false) do
    begin
      if (ADOCarList['UserID'] = objUserdata.accessUserId)
       and ADOCarList['CarID']=  then
      begin
        ADOCarList.edit;
        ADOCarList['CurrentMileage'] := strtoint(edtMileage.text);
        ADOCarList.post;
        bFound := true;
      end
      else
        ADOCarList.next;
end;
    while not(ADOCarList.eof) and (bFound = false) do
    begin
      if (ADOCarList['UserID'] = objUserdata.accessUserId)
       and (ADOCarList['CarID']= ) then
      begin
        ADOCarList.edit;
        ADOCarList['CurrentMileage'] := strtoint(edtMileage.text);
        ADOCarList.post;
        bFound := true;
      end
      else
        ADOCarList.next;
    end;
  end;
end;

procedure Tfrm_Users.btnGraphClick(Sender: TObject);
begin
  frm_Graph.ShowModal;
end;

procedure Tfrm_Users.edtUpdateClick(Sender: TObject);
var
  iElectricity, iKilometer, iEmission: integer;
  sSql: string;
  bFound: boolean;
begin
  try
    iElectricity := strtoint(edtElectricity.text);
    iKilometer := strtoint(edtMileageMain.text);

    iEmission := iElectricity * 1060;
    sSql := 'WHERE tblCarList.UserID = ' + objUserdata.accessUserId;
    sSql := sSql + ' AND Model =' + quotedstr(lookupUserMake.text) + ';';
    UpdateLookup(sSql);
    iKilometer := iKilometer - ADOUsersQuery['Mileage'];
    iEmission := iEmission + ((ADOUsersQuery['Emissions'] * iKilometer)/1000);
    with dmco2 do
    begin
  ADOFootprint.insert;
  ADOFootprint['UserID']:=objUserdata.accessUserId;
  ADOFootPrint['EmissionDate']:=date;
  ADOFootprint['Emission']:=  iEmission;
  ADOFootprint.post;
    end;
  bFound := false;
  with dmco2 do
  begin
    ADOCarList.first;
    while not(ADOCarList.eof) and (bFound = false) do
    begin
      if (ADOCarList['UserID'] = objUserdata.accessUserId)
      and (ADOCarList['CarID']= ADOUsersQuery['CarID']) then
      begin
        ADOCarList.edit;
        ADOCarList['CurrentMileage'] := strtoint(edtMileageMain.text);
        ADOCarList.post;
        bFound := true;
      end
      else
        ADOCarList.next;
    end;
end;
  except
    showmessage('Their was an error trying to update your carbon foortprint');
  end;
end;

procedure Tfrm_Users.FormActivate(Sender: TObject);
begin
  objUserdata := UserData.Usercreate(u_Login.objSignin.AccessUsername);
  // objUserdata.LoadCar;
  UpdateLookup('WHERE tblCarList.UserID = ' + objUserdata.accessUserId + ';');
  lookupUserMake.enabled := true;
  if objUserdata.isFirstAccess = true then
    pnlFirst.Visible := true
  else
    pnlFirst.Visible := false;

  { DMCO2.runSQL(
    'SELECT Distinct EmissionDate,Emission FROM tblFootprint WHERE UserID=' +
    objUserdata.accessUserId); }

end;

procedure Tfrm_Users.UpdateEmission;
begin
  // ADOEmissionQuery.sql.clear;
  // ADOEmissionQuery.sql.add();
end;

procedure Tfrm_Users.UpdateLookup(sQuery: string);
begin
  ADOUsersQuery.sql.clear;
  ADOUsersQuery.sql.add(
    'SELECT tblCarList.CarListID AS CarListId,tblCarList.CurrentMileage AS Mileage, tblCar.CarID AS CarID, tblCar.Make AS Make, tblCar.Model AS Model, tblCar.[CO2 Emissions(g/km)] AS Emissions'
    + ' FROM tblCar INNER JOIN tblCarList ON tblCar.CarID = tblCarList.CarID '+
    sQuery);
  { ' WHERE tblCarsList.UserID = 12;' + objUserdata.accessUserId+';' }
  ADOUsersQuery.Open;
end;

end.
