unit u_Cars;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, dblookup,dm_CO2, StdCtrls, ExtCtrls,jpeg,pngimage,
  DBCtrls;

type
  Tfrm_Cars = class(TForm)
    imgAddCars: TImage;
    ComboBox1: TComboBox;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Cars: Tfrm_Cars;
      sSQL:string;
implementation

{$R *.dfm}

procedure Tfrm_Cars.FormActivate(Sender: TObject);
var iloop:integer;

begin
imgAddCars.Picture.LoadFromFile('.\images\Health.png');
with dm_CO2 do
begin
       sSQL := 'SELECT * FROM tblCars';
       ADOQuery.runSQL(sSQL);
  //adoCars
end;



for iLoop := 0 to dbgDisplay.Columns.Count - 1 do
  cmbSearch.Items.ADD(dbgDisplay.Columns[iLoop].Field.FieldName);

end;

end.