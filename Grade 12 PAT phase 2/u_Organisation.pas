unit U_Organisation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls,dm_CO2, Mask;

type
  Tfrm_Organsiation = class(TForm)
    imgAddOrganisation: TImage;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Organsiation: Tfrm_Organsiation;

implementation

{$R *.dfm}

procedure Tfrm_Organsiation.FormActivate(Sender: TObject);
begin
imgaddOrganisation.Picture.LoadFromFile('.\images\Health.png');
end;

end.
