unit u_Cars;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, dblookup, dm_CO2, StdCtrls, ExtCtrls, jpeg, pngimage,
  DBCtrls;

type
  Tfrm_Cars = class(TForm)
    imgAddCars: TImage;
    ComboBox1: TComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
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

procedure Tfrm_Cars.FormActivate(Sender: TObject);
var
  iloop: integer;

begin
  imgAddCars.Picture.LoadFromFile('.\images\Health.png');
  //sSQL := 'SELECT [Make]+'+QuotedStr(' > ')+'[Model] AS ModelTypes FROM tblCar ORDER BY [Make]+'+QuotedStr(',')+'[Model]';
  //dm_CO2.runSQL(sSQL);
  // adoCars



  // for iLoop := 0 to dbgDisplay.Columns.Count - 1 do
  // cmbSearch.Items.ADD(dbgDisplay.Columns[iLoop].Field.FieldName);

end;

end.
