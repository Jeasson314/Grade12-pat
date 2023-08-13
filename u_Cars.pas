unit u_Cars;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, dblookup, dm_CO2, StdCtrls, ExtCtrls, jpeg, pngimage,
  DBCtrls, DB, ADODB, u_SignIn, ComCtrls;

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
    procedure btnCompleteCarClick(Sender: TObject);
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
    // showmessage(sCarKey);
    objSignup.addCar(inttostr(dmco2.ADOCars['CarID']), dmco2.ADOCars['Make'],
      dmco2.ADOCars['Model']);
    redoutCars.Lines.Add(objSignup.CarsToString);
  except
    showmessage('An error has occured!?!?');
  end;
end;

procedure Tfrm_Cars.btnCompleteCarClick(Sender: TObject);
begin
  frm_Cars.Close;
  frmSignup.redoutCarsSignup.Lines.Add(objSignup.CarsToString)
end;

procedure Tfrm_Cars.btnFilterByMakeClick(Sender: TObject);
begin

  if dmco2.ADOCars.Active then
    showmessage('Applying Filter');
  try
    dmco2.ADOCars.Filtered := False;
    dmco2.ADOCars.Filter := 'Make = ' + quotedstr(lookupMake.Text);
    dmco2.ADOCars.Filtered := True;

  except
    showmessage('Error : Unable to apply filter: ' + dmco2.ADOCars.Filter)
    { else
      showMessage('Cars table is unavailable'); }
  end;
end;

procedure Tfrm_Cars.btnSearchClick(Sender: TObject);
begin
  dmco2.ADOCars.Filtered := False;
  dmco2.ADOCars.Filter := 'Model like ' + uppercase(quotedstr(edtSearch.Text));
  dmco2.ADOCars.Filtered := True;
end;

function Tfrm_Cars.dbcheck(sModel: string): boolean;
begin
result:=true;
  with dmco2 do
  begin
    ADOCars.first;
    while not (ADOCars.eof) and (result = True)do
    begin
      if (ADOCars['Model']= sModel )  then
      begin
        result := False;
        exit;
      end
      else
        ADOCars.Next;
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
    showmessage('Unable to load list of car makes');
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
      with dmco2 do
      begin
        // adoCars.Last;
        // adoCars.Close;
        if ADOCars.Active then
        begin
          TRY
            ADOCars.Insert;
            ADOCars['Make'] := sMake;
            ADOCars['Model'] := sModel;
            ADOCars['CO2 Emissions(g/km)'] := iEmission;
            ADOCars.Post;
            objSignup.addCar(inttostr(dmco2.ADOCars['CarID']),
              dmco2.ADOCars['Make'], dmco2.ADOCars['Model']);
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
