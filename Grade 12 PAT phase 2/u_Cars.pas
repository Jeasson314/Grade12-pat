unit u_Cars;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, dblookup,dm_CO2, StdCtrls, ExtCtrls,jpeg,pngimage;

type
  Tfrm_Cars = class(TForm)
    imgAddorganisation: TImage;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Cars: Tfrm_Cars;

implementation

{$R *.dfm}

procedure Tfrm_Cars.FormActivate(Sender: TObject);
begin
imgAddOrganisation.Picture.LoadFromFile('.\images\Health.png');
end;

end.
