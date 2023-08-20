unit u_User;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, u_SignIn, dm_co2,
  u_UserNormal, u_Signup, u_graph, DBCtrls, DB, ADODB, Mask,DateUtils;

type
  Tfrm_Users = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    btnGraph: TButton;
    DBGridUsers: TDBGrid;
    pnlWarning: TPanel;
    pnlFirst: TPanel;
    edtMileage: TEdit;
    Label1: TLabel;
    ADOUsersQuery: TADOQuery;
    DBSourceUserQuery: TDataSource;
    LookupAddNew: TDBLookupComboBox;
    Label3: TLabel;
    btnAdd: TButton;
    ADOEmissionQuery: TADOQuery;
    DBSourceEmission: TDataSource;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    btnDelete: TButton;
    lookupUserMake: TDBLookupComboBox;
    Label2: TLabel;
    edtElectricity: TEdit;
    Label4: TLabel;
    edtMileageMain: TEdit;
    edtUpdate: TButton;
    DBEdit1: TDBEdit;
    DateTimeFrom: TDateTimePicker;
    DateTimeTo: TDateTimePicker;
    Label8: TLabel;
    Label5: TLabel;
    btnFilter: TButton;
    RadioSort: TRadioGroup;
    btnSort: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
    procedure edtUpdateClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
  private
    procedure UpdateLookup(sQuery: string);
    procedure UpdateEmission;
    procedure UpdateUserDate;
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
  sSql:string;
begin
try
  bFound := false;
  with dmco2 do
  begin
    ADOCarList.first;
    ADOusers.first;
    while not(ADOCarList.eof) and (bFound = false) do
    begin
      if (ADOCarList['UserID'] = objUserdata.accessUserId)
        and ADOCarList['CarID'] = ADOUsersQuery['CarID'] then
      begin
        ADOCarList.edit;
        ADOCarList['CurrentMileage'] := strtoint(edtMileage.text);
        ADOCarList.post;
        bFound := true;
      end
      else
        ADOCarList.next;
    end;
    UpdateUserDate;
     sSql := 'WHERE tblCarList.UserID = ' + objUserdata.accessUserId;
    sSql := sSql + ' AND Model =' + quotedstr(lookupUserMake.text) + 'AND Mileage = Null;';
    UpdateLookup(sSql);
    if ADOUsersQuery['CarID'].isNull then
     pnlFirst.visible:=false;
  end;

except
 Showmessage('Their was a failure entering your vehicle mileage');
end;
end;

procedure Tfrm_Users.btnDeleteClick(Sender: TObject);
begin
 //dmco2.ADOCars['CarID']


 if objUserdata.CanDelete(dmco2.ADOFootprint['EmissionDate'])=true then
    dmco2.ADOFootprint.delete
    else showmessage('We were unable to delete the message, this may be due to it being out of deleteable time range')
end;

procedure Tfrm_Users.btnFilterClick(Sender: TObject);
begin
with dmco2 do
begin
adoFootprint.filtered:=false;
adoFootprint.filter:='(StartDate>=' + quotedStr(DateTimeToStr(DateTimeFrom.Date))
+ ') and (EndDate <' +QuotedStr( DateTimeToStr(DateTimeTo.date)) + ')';
adoFootprint.filtered:=true;

end;
end;

procedure Tfrm_Users.btnGraphClick(Sender: TObject);
begin
  frm_Graph.ShowModal;
end;

procedure Tfrm_Users.btnSortClick(Sender: TObject);
begin
 if RadioSort.itemindex = 0 then
dmco2.adoFootprint.sort:= 'EmissionDate AESC';
if radiosort.itemindex=1 then
dmco2.adoFootprint.sort:= 'EmissionDate DESC';
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
    iEmission := iEmission + ((ADOUsersQuery['Emissions'] * iKilometer) / 1000);
    with dmco2 do
    begin
      ADOFootprint.insert;
      ADOFootprint['UserID'] := objUserdata.accessUserId;
      ADOFootprint['EmissionDate'] := date;
      ADOFootprint['Emission'] := iEmission;
      ADOFootprint.post;
    end;
    bFound := false;
    with dmco2 do
    begin
      ADOCarList.first;
      while not(ADOCarList.eof) and (bFound = false) do
      begin
        if (ADOCarList['UserID'] = objUserdata.accessUserId) and
          (ADOCarList['CarID'] = ADOUsersQuery['CarID']) then
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
    UpdateUserDate;
  except
    showmessage('Their was an error trying to update your carbon foortprint');
  end;
end;

procedure Tfrm_Users.FormActivate(Sender: TObject);
begin
  objUserdata := UserData.Usercreate(u_Login.objSignin.AccessUsername);
  objUserdata.CheckOrganisation;
  if objUserdata.admin=true then
    TabSheet2.tabvisible:=true;
  if not WithinPastMonths(date,dmco2.ADOFootPrint['EmissionDate'],1) then
    pnlWarning.Caption:='Please input your current electricity and Mileage';
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
    'SELECT tblCarList.CarListID AS CarListId,tblCarList.CurrentMileage AS Mileage, tblCar.CarID AS CarID, tblCar.Make AS Make, tblCar.Model AS Model, tblCar.[CO2 Emissions(g/km)] AS Emissions' + ' FROM tblCar INNER JOIN tblCarList ON tblCar.CarID = tblCarList.CarID ' + sQuery);
  { ' WHERE tblCarsList.UserID = 12;' + objUserdata.accessUserId+';' }
  ADOUsersQuery.Open;
end;

procedure Tfrm_Users.UpdateUserDate;
var bFound:boolean;
begin
with dmco2 do
begin
ADOUsers.first;
 bFound := false;
    while not(ADOusers.eof) and (bFound = false) do
    begin
      if (ADOUsers['UserID'] = objUserdata.accessUserId)
         then
      begin
        ADOUsers.edit;
        ADOUsers['Last Updated'] := date;
        ADOUsers.post;
        bFound := true;
      end
      else
        ADOUsers.next;
    end;
end;
end;

end.
