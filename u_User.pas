unit u_User;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, u_SignIn, dm_co2,
  u_UserNormal, u_Signup, u_graph, DBCtrls, DB, ADODB, Mask, DateUtils,
  pngimage;

type
  Tfrm_Users = class(TForm)
    PageControl1: TPageControl;
    tabSheetUser: TTabSheet;
    Admin: TTabSheet;
    btnGraph: TButton;
    DBGridUsers: TDBGrid;
    pnlWarning: TPanel;
    pnlFirst: TPanel;
    edtMileage: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    btnAdd: TButton;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    btnDelete: TButton;
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
    DBSourceEmission: TDataSource;
    ADOUsersQuery: TADOQuery;
    DBSourceUserQuery: TDataSource;
    DBGridAdmin: TDBGrid;
    ADOEmissionQuery: TADOQuery;
    GroupBox2: TGroupBox;
    btnDisplay: TButton;
    RadioDisplay: TRadioGroup;
    ADOAdminQuery: TADOQuery;
    DBSourceAdminQuery: TDataSource;
    GroupBox3: TGroupBox;
    btnAdminSort: TButton;
    cmbSort: TComboBox;
    Database: TGroupBox;
    Statistics: TGroupBox;
    RadioStatistics: TRadioGroup;
    btnStatistics: TButton;
    cmbStatistics: TComboBox;
    RadioSortAdmin: TRadioGroup;
    CmbCars: TComboBox;
    cmbCarsAdd: TComboBox;
    btnAdminEdit: TButton;
    DBNavigator2: TDBNavigator;
    edtEdit: TEdit;
    btnDeleteAdmin: TButton;
    Label6: TLabel;
    DataSource1: TDataSource;
    imgAddCar: TImage;
    btnGraphAdmin: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
    procedure edtUpdateClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnStatisticsClick(Sender: TObject);
    procedure btnAdminSortClick(Sender: TObject);
    procedure DBGridAdminCellClick(Column: TColumn);
    procedure btnDeleteAdminClick(Sender: TObject);
  private
    procedure UpdateLookup(sQuery: string);
    procedure UpdateEmission;
    procedure UpdateUserDate;
    procedure UpdateAdmin(sSQL: string);
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
  sSQL: string;
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
      sSQL := 'WHERE tblCarList.UserID = ' + objUserdata.accessUserId;
      sSQL := sSQL + ' AND Model =' + quotedstr(CmbCars.text)
        + 'AND Mileage = Null;';
      UpdateLookup(sSQL);
      if ADOUsersQuery['CarID'].isNull then
        pnlFirst.visible := false;
    end;

  except
  if CmbCars.text='' then
  showmessage('Please select your car');
  if edtMileage.text='' then


    Showmessage('Their was a failure entering your vehicle first mileage');
  end;
end;

procedure Tfrm_Users.btnAdminSortClick(Sender: TObject);
begin
  case cmbSort.itemindex of
    0:
      begin
        if RadioSortAdmin.itemindex = 0 then
          ADOAdminQuery.sort := 'Username DESC';
        if RadioSortAdmin.itemindex = 1 then
          ADOAdminQuery.sort := 'Username ASC';
      end;
    1:
      begin
        if RadioSortAdmin.itemindex = 0 then
          ADOAdminQuery.sort := 'First_Name DESC';
        if RadioSortAdmin.itemindex = 1 then
          ADOAdminQuery.sort := 'First_Name ASC';
      end;
    2:
      begin
        if RadioSortAdmin.itemindex = 0 then
          ADOAdminQuery.sort := 'Last_Name DESC';
        if RadioSortAdmin.itemindex = 1 then
          ADOAdminQuery.sort := 'Last_Name ASC';
      end;
    3:
      begin
        if RadioSortAdmin.itemindex = 0 then
          ADOAdminQuery.sort := 'Last Updated DESC';
        if RadioSortAdmin.itemindex = 1 then
          ADOAdminQuery.sort := 'Last Updated ASC';
      end;
  end;
end;

procedure Tfrm_Users.btnDeleteAdminClick(Sender: TObject);
var
  idelete: integer;
begin
  { idelete := MessageDlg('Do you want to delete this record', mtWarning,
    mbOKCancel, 0);
    if idelete = mrOK then
    begin
    if objUserdata.CanDelete(DBSourceAdminQuery) = true then
    dmco2.ADOFootprint.delete
    else
    Showmessage(
    'We were unable to delete the message, this may be due to it being out of deleteable time range')
    end; }
end;

procedure Tfrm_Users.btnDeleteClick(Sender: TObject);
var
  idelete: integer;
begin
  // dmco2.ADOCars['CarID']
  idelete := MessageDlg('Do you want to delete this record', mtWarning,
    mbOKCancel, 0);
  if idelete = mrOK then
  begin
    if objUserdata.CanDelete(dmco2.ADOFootprint['EmissionDate']) = true then
      dmco2.ADOFootprint.delete
    else
      Showmessage(
        'We were unable to delete the message, this may be due to it being out of deleteable time range')
  end;
end;

procedure Tfrm_Users.btnDisplayClick(Sender: TObject);
begin
  if RadioDisplay.itemindex = 0 then
    UpdateAdmin(
      'Select Username,First_Name,Last_Name,Carbon_Footprint,[Last Updated],Goal,Email'
        + ' FROM tblUsers WHERE (OrganisationID = ' + inttostr
        (objUserdata.AccessOrganisationID) + ');');
  if RadioDisplay.itemindex = 1 then
    UpdateAdmin(
      'SELECT tblUsers.Username AS Username, tblFootprint.EmissionDate AS [Emission Date], tblFootprint.Emission AS [Emission Amount]'
        +
        ' FROM tblUsers INNER JOIN tblFootprint ON tblUsers.UserID = tblFootprint.UserID'
        + ' WHERE (tblUsers.OrganisationID = ' + inttostr
        (objUserdata.AccessOrganisationID) + ');');
  if RadioDisplay.itemindex = 2 then
    UpdateAdmin(
      'SELECT tblUsers.Username AS username, tblCar.Make AS Make, tblCar.Model AS Model '
        + 'FROM tblCar INNER JOIN (tblUsers INNER JOIN tblCarList ON tblUsers.UserID = tblCarList.UserID) ON tblCar.CarID = tblCarList.CarID ' + 'WHERE (OrganisationID = ' + inttostr(objUserdata.AccessOrganisationID) + ');');

end;

procedure Tfrm_Users.btnFilterClick(Sender: TObject);
begin
  with dmco2 do
  begin
    ADOFootprint.filtered := false;
    ADOFootprint.filter := 'EmissionDate >= ' + quotedstr
      (FormatDateTime('dd/mm/yyyy', DateTimeFrom.Date))
      + ' and EmissionDate < ' + quotedstr(FormatDateTime('dd/mm/yyyy',
        DateTimeTo.Date));
    ADOFootprint.filtered := true;

  end;
end;

procedure Tfrm_Users.btnGraphClick(Sender: TObject);
begin
  frm_Graph.ShowModal;
end;

procedure Tfrm_Users.btnSortClick(Sender: TObject);
begin
  if RadioSort.itemindex = 0 then
    dmco2.ADOFootprint.sort := 'EmissionDate ASC';
  if RadioSort.itemindex = 1 then
    dmco2.ADOFootprint.sort := 'EmissionDate DESC';
end;

procedure Tfrm_Users.btnStatisticsClick(Sender: TObject);
begin
  if RadioStatistics.itemindex = 0 then
  begin
    case cmbStatistics.itemindex of
      0:
        UpdateAdmin('SELECT AVG(Emission) AS Average ' +
            ' FROM tblUsers INNER JOIN tblFootprint ON tblUsers.UserID = tblFootprint.UserID '
            + ' WHERE tblUsers.Username = ' + quotedstr
            (ADOAdminQuery['Username']) + ';');
      1:
        UpdateAdmin('SELECT MIN(Emission) AS Minimum ' +
            ' FROM tblUsers INNER JOIN tblFootprint ON tblUsers.UserID = tblFootprint.UserID '
            + ' WHERE tblUsers.Username = ' + quotedstr
            (ADOAdminQuery['Username']) + ';');
      2:
        UpdateAdmin('SELECT MAX(Emission) AS Maximum ' +
            ' FROM tblUsers INNER JOIN tblFootprint ON tblUsers.UserID = tblFootprint.UserID '
            + ' WHERE tblUsers.Username = ' + quotedstr
            (ADOAdminQuery['Username']) + ';')
    end;

  end;
  if RadioStatistics.itemindex = 1 then
  begin
    case cmbStatistics.itemindex of
      0:
        UpdateAdmin('SELECT AVG(Emission) AS Average ' +
            ' FROM tblUsers INNER JOIN tblFootprint ON tblUsers.UserID = tblFootprint.UserID '
            + ' WHERE tblUsers.OrganisationID = ' + inttostr
            (objUserdata.AccessOrganisationID) + ';');
      1:
        UpdateAdmin('SELECT MIN(Emission) AS Minimum ' +
            ' FROM tblUsers INNER JOIN tblFootprint ON tblUsers.UserID = tblFootprint.UserID '
            + ' WHERE tblUsers.OrganisationID = ' + inttostr
            (objUserdata.AccessOrganisationID) + ';');
      2:
        UpdateAdmin('SELECT MAX(Emission) AS Maximum ' +
            ' FROM tblUsers INNER JOIN tblFootprint ON tblUsers.UserID = tblFootprint.UserID '
            + ' WHERE tblUsers.OrganisationID = ' + inttostr
            (objUserdata.AccessOrganisationID) + ';')
    end;

  end;
end;

procedure Tfrm_Users.DBGridAdminCellClick(Column: TColumn);
begin
  { edtEdit:=DBSourceAdminQuery; }
end;

procedure Tfrm_Users.edtUpdateClick(Sender: TObject);
var
  iElectricity, iKilometer, iEmission: integer;
  sSQL: string;
  bFound: boolean;
  rEmission: real;
begin
  try
    iElectricity := strtoint(edtElectricity.text);
    iKilometer := strtoint(edtMileageMain.text);

    iEmission := iElectricity * 1060;
    sSQL := 'WHERE tblCarList.UserID = ' + objUserdata.accessUserId;
    sSQL := sSQL + ' AND tblCar.Model =' + quotedstr(CmbCars.text) + ';';
    UpdateLookup(sSQL);
    iKilometer := iKilometer - ADOUsersQuery['Mileage'];
    iEmission := (iEmission + (ADOUsersQuery['Emissions'] * iKilometer));
    rEmission := iEmission / 1000;
    with dmco2 do
    begin
      ADOFootprint.insert;
      ADOFootprint['UserID'] := objUserdata.accessUserId;
      ADOFootprint['EmissionDate'] := Date;
      ADOFootprint['Emission'] := rEmission;
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
  {if iElectricity='' then
  showmessage('Please input a value in the edit');}

    Showmessage('Their was an error trying to update your carbon foortprint');
  end;
end;

procedure Tfrm_Users.FormActivate(Sender: TObject);
var
  path: string;
begin
  ADOAdminQuery.active := true;

  objUserdata := UserData.Usercreate(u_Login.objSignin.AccessUsername);

  dmco2.runCar(objUserdata.accessUserId);
  dmco2.runCarAdd(objUserdata.accessUserId);
  dmco2.fillCombobox(CmbCars, dmco2.ADOQueryCar);
  dmco2.fillCombobox(cmbCarsAdd, dmco2.ADOQueryCar);
  // dmco2.dbSourceQueryCar.Enabled := false;
  // dmco2.dbSourceQueryCar.Enabled := true;
  objUserdata.CheckOrganisation;
  if objUserdata.Admin = true then
    Admin.tabVisible := true
  else
    Admin.tabVisible := false;
  if not WithinPastMonths(Date, dmco2.ADOFootprint['EmissionDate'], 1) then
    pnlWarning.Caption := 'Please input your current electricity and Mileage';
  // objUserdata.LoadCar;
  UpdateLookup('WHERE tblCarList.UserID = ' + objUserdata.accessUserId + ';');
  CmbCars.Enabled := true;
  if objUserdata.isFirstAccess = true then
    pnlFirst.visible := true
  else
    pnlFirst.visible := false;
  path := ExpandFileName(ExtractFileDir(Application.ExeName))
    + '\images\AddCar.png';
  imgAddCar.picture.loadfromfile(path);
  UpdateAdmin(
    'Select Username,First_Name,Last_Name,Carbon_Footprint,[Last Updated],Goal,Email'
      + ' FROM tblUsers WHERE (OrganisationID = ' + inttostr
      (objUserdata.AccessOrganisationID) + ');');
end;

procedure Tfrm_Users.PageControl1Change(Sender: TObject);
begin
  frm_Users.width := 996
end;

procedure Tfrm_Users.UpdateAdmin(sSQL: string);
begin
  ADOAdminQuery.sql.clear;
  ADOAdminQuery.sql.add(sSQL);
  ADOAdminQuery.Open;
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
    'SELECT tblCarList.CarListID AS CarListId,tblCarList.CurrentMileage AS Mileage,'
      + 'tblCar.CarID AS CarID, tblCar.Make AS Make, tblCar.Model AS Model, tblCar.[CO2 Emissions(g/km)] AS Emissions' + ' FROM tblCar INNER JOIN tblCarList ON tblCar.CarID = tblCarList.CarID ' + sQuery);
  ADOUsersQuery.Open;
end;

procedure Tfrm_Users.UpdateUserDate;
var
  bFound: boolean;
begin
  with dmco2 do
  begin
    ADOusers.first;
    bFound := false;
    while not(ADOusers.eof) and (bFound = false) do
    begin
      if (ADOusers['UserID'] = objUserdata.accessUserId) then
      begin
        ADOusers.edit;
        ADOusers['Last Updated'] := Date;
        ADOusers.post;
        bFound := true;
      end
      else
        ADOusers.next;
    end;
  end;
end;

end.
