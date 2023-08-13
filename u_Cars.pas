unit u_Cars;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, dblookup, dm_CO2, StdCtrls, ExtCtrls, jpeg, pngimage,
  DBCtrls, DB, ADODB,u_SignIn, ComCtrls;

type
  Tfrm_Cars = class(TForm)
    GroupBox1: TGroupBox;
    imgAddCars: TImage;
    edtEmission: TEdit;
    Label3: TLabel;
    edtModel: TEdit;
    Label1: TLabel;
    edtMake: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    adoListMakes: TADOQuery;
    dsListMakes: TDataSource;
    DBGridModel: TDBGrid;
    Panel1: TPanel;
    lookupMake: TDBLookupComboBox;
    edtSearch: TEdit;
    btnFilterByMake: TButton;
    btnSearch: TButton;
    GroupBox3: TGroupBox;
    imgAddV: TImage;
    redoutCars: TRichEdit;
    btnCompleteCar: TButton;
    Label5: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure imgAddCarsClick(Sender: TObject);
    procedure btnFilterByMakeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgAddVClick(Sender: TObject);
  private
    function dbcheck(sModel: string): boolean;
  public
    { Public declarations }
  end;

var
  frm_Cars: Tfrm_Cars;
  sSQL: string;
implementation
uses u_Signup;
{$R *.dfm}

procedure Tfrm_Cars.imgAddVClick(Sender: TObject);
begin
try
//showmessage(sCarKey);
objSignup.addCar(inttostr(dmco2.adoOrganisation['CarID']),dmco2.adoOrganisation['Make'],dmco2.adoOrganisation['Model']);
redoutCars.Lines.Add(objSignup.CarsToString);
except
showmessage('An error has occured!?!?');
end;
end;

procedure Tfrm_Cars.btnFilterByMakeClick(Sender: TObject);
begin

  if dmCO2.adoCars.Active then
    showMessage('Applying Filter');
  try
    dmCO2.adoCars.Filtered := False;
    dmCO2.adoCars.Filter := 'Make = ' + quotedstr(lookupMake.Text);
    dmCO2.adoCars.Filtered := True;

  except
    showMessage('Error : Unable to apply filter: ' + dmCO2.adoOrganisation.Filter)
    { else
      showMessage('Cars table is unavailable'); }
  end;
end;

procedure Tfrm_Cars.btnSearchClick(Sender: TObject);
begin
dmCO2.adoOrganisation.Filtered := False;
    dmCO2.adoOrganisation.Filter := 'Model like ' + uppercase(quotedstr(edtSearch.Text));
    dmCO2.adoOrganisation.Filtered := True;
end;

function Tfrm_Cars.dbcheck(sModel: string): boolean;
begin
  with dmCO2 do
  begin
    ADOUsers.first;
    while not ADOUsers.eof do
    begin
      if (sModel = adoOrganisation['Model']) then
      begin
        result := False;
        exit;
      end
      else
        ADOUsers.Next;
    end;
  end;
end;

procedure Tfrm_Cars.FormActivate(Sender: TObject);
var
  iloop: integer;

begin
 // adoCars
  imgAddCars.Picture.LoadFromFile('.\images\Health.png');
  imgAddCars.Stretch := True;
    imgAddV.Picture.LoadFromFile('.\images\Health.png');
  imgAddV.Stretch := True;
  // showmessage(dm_CO2.ADOCars.IndexFieldNames);

  // for iLoop := 0 to dbgDisplay.Columns.Count - 1 do
  // cmbSearch.Items.ADD(dbgDisplay.Columns[iLoop].Field.FieldName);

end;

procedure Tfrm_Cars.FormShow(Sender: TObject);
begin
  try
    self.adoListMakes.Active := True;
  except
    showMessage('Unable to load list of car makes');
  end;
end;

procedure Tfrm_Cars.imgAddCarsClick(Sender: TObject);
var
  sModel, sMake: string;
  iEmission: integer;
  result: boolean;
begin
  try
    sMake := uppercase(edtMake.Text);
    sModel := uppercase(edtModel.Text);
    iEmission := strtoint(edtEmission.Text);
    result := dbcheck(sMake);
    if result = False then
    begin
      MessageDlg('Car already exist in database,use top down memories',
        mtWarning, [mbOk], 0);
      exit;
    end
    else
      with dmCO2 do
      begin
        // adoCars.Last;
        // adoCars.Close;
        if adoOrganisation.Active then
        begin
          TRY
            adoOrganisation.Insert;
            adoOrganisation['Make'] := sMake;
            adoOrganisation['Model'] := sModel;
            adoOrganisation['CO2 Emissions(g/km)'] := iEmission;
            adoOrganisation.Post;
            objSignup.addCar(inttostr(dmco2.adoOrganisation['CarID']),dmco2.adoOrganisation['Make'],dmco2.adoOrganisation['Model']);
            redoutCars.Lines.Add(objSignup.CarsToString);
          EXCEPT

          END;
          // adoCars.Open;
        end;
      end;

  finally
    if sMake = '' then
      MessageDlg('Please make sure you have a Make', mtWarning, [mbOk], 0);
    if sModel = '' then
      MessageDlg('Please make sure you have a Model', mtWarning, [mbOk], 0);
    { if iEmission =  then
      MessageDlg('Please make sure you have a Emission number', mtWarning, [mbOk], 0); }
  end;
end;

end.
