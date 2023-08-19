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
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnAdd: TButton;
    edtUpdate: TButton;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
    procedure edtUpdateClick(Sender: TObject);
  private
    procedure UpdateLookup;
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

procedure Tfrm_Users.btnGraphClick(Sender: TObject);
begin
  frm_Graph.ShowModal;
end;

procedure Tfrm_Users.edtUpdateClick(Sender: TObject);
var
  iElectricity, iKilometer, iEmission: integer;
begin
  iElectricity := strtoint(edtElectricity.Text);
  iKilometer := strtoint(edtMileageMain.Text);

  iEmission := iElectricity * 1060;

end;

procedure Tfrm_Users.FormActivate(Sender: TObject);
begin
  objUserdata := UserData.Usercreate(u_Login.objSignin.AccessUsername);
  objUserdata.LoadCar;
  if objUserdata.isFirstAccess = true then
    pnlFirst.Visible := true
  else
    pnlFirst.Visible := false;
  DMCO2.runSQL(
    'SELECT Distinct EmissionDate,Emission FROM tblFootprint WHERE UserID=' +
      objUserdata.accessUserId);
  UpdateLookup;
end;

procedure Tfrm_Users.UpdateLookup;
begin
  ADOUsersQuery.SQL.Clear;
  ADOUsersQuery.SQL.Add('SELECT tblCarsList.CurrentMileage FROM tblCarList' +
      ' FULL OUTER JOIN tblCars ON tblCarsList.CarID = tblCars.CarID ' +
      'WHERE tblCarsList.UserID = ' + objUserdata.accessUserId);
  ADOUsersQuery.Open;
end;

end.
