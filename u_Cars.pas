unit u_Cars;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, dblookup, dm_CO2, StdCtrls, ExtCtrls, jpeg, pngimage,
  DBCtrls;

type
  Tfrm_Cars = class(TForm)
    imgAddCars: TImage;
    Edit1: TEdit;
    btnSearch: TButton;
    edtMake: TEdit;
    edtModel: TEdit;
    edtEmission: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    ComboBox1: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure imgAddCarsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Cars: Tfrm_Cars;
  dm_CO2: TDMCO2;
  sSQL: string;

implementation

{$R *.dfm}

procedure Tfrm_Cars.btnSearchClick(Sender: TObject);
begin
//DBLookupMakeModel.ListSource.Enabled:=false;
  sSQL := 'SELECT * FROM tblCar';
  dm_CO2.runSQL(sSQL);
  //DBLookupMakeModel.ListSource.Enabled:=true;
end;


procedure Tfrm_Cars.FormActivate(Sender: TObject);
var
  iloop: integer;

begin

   //adoCars
   imgAddCars.Picture.LoadFromFile('.\images\Health.png');
   imgAddCars.Stretch:=true;
   //showmessage(dm_CO2.ADOCars.IndexFieldNames);

  //for iLoop := 0 to dbgDisplay.Columns.Count - 1 do
  //cmbSearch.Items.ADD(dbgDisplay.Columns[iLoop].Field.FieldName);

end;

procedure Tfrm_Cars.imgAddCarsClick(Sender: TObject);
begin
with dm_co2 do
begin
//adoCars.Last;
//adoCars.Close;
adoCars.Insert;
adoCars['Make']:=edtMake.Text;
adoCars['Model']:=edtModel.Text;
adoCars['CO2 Emissions(g/km)']:=strtoint(edtEmission.Text);
adoCars.Post;
//adoCars.Open;
end;
end;

end.
