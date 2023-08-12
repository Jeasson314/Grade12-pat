unit u_Cars;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, dblookup, dm_CO2, StdCtrls, ExtCtrls, jpeg, pngimage,
  DBCtrls, DB, ADODB;

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
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    lookupMake: TDBLookupComboBox;
    Edit1: TEdit;
    btnFilterByMake: TButton;
    btnSearch: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure imgAddCarsClick(Sender: TObject);
    procedure btnFilterByMakeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Cars: Tfrm_Cars;
  sSQL: string;

implementation

{$R *.dfm}

procedure Tfrm_Cars.btnFilterByMakeClick(Sender: TObject);
begin

  if dmCO2.ADOCars.Active then  showMessage('Applying Filter');
 {
    try
      dm_CO2.ADOCars.Filtered := False;
      dm_CO2.ADOCars.Filter := 'Make = ' + lookupMake.Text;
      dm_CO2.ADOCars.Filtered := True;
    except
      showMessage('Error : Unable to apply filter: ' + dm_CO2.ADOCars.Filter);
    end
  else
    showMessage('Cars table is unavailable');
    }
end;

procedure Tfrm_Cars.btnSearchClick(Sender: TObject);
begin
  // DBLookupMakeModel.ListSource.Enabled:=false;
  sSQL := 'SELECT * FROM tblCar';
  dmCO2.runSQL(sSQL);
  // DBLookupMakeModel.ListSource.Enabled:=true;
end;

procedure Tfrm_Cars.FormActivate(Sender: TObject);
var
  iloop: integer;

begin

  // adoCars
  imgAddCars.Picture.LoadFromFile('.\images\Health.png');
  imgAddCars.Stretch := True;
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
begin
  with dmCO2 do
  begin
    // adoCars.Last;
    // adoCars.Close;
    if ADOCars.Active then
      TRY
        ADOCars.Insert;
        ADOCars['Make'] := edtMake.Text;
        ADOCars['Model'] := edtModel.Text;
        ADOCars['CO2 Emissions(g/km)'] := strtoint(edtEmission.Text);
        ADOCars.Post;
      EXCEPT

      END;
    // adoCars.Open;
  end;
end;

end.
