unit u_Organisation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, dblookup,dm_CO2, StdCtrls, ExtCtrls;

type
  Tfrm_Organsiation = class(TForm)
    imgAddCar: TImage;
    ComboBox1: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Organsiation: Tfrm_Organsiation;

implementation

{$R *.dfm}

end.
