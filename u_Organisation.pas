unit u_organisation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,dm_CO2, ExtCtrls,jpeg, pngimage;

type
  TfrmOrganisation = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    imgAddOrganisation: TImage;
    btnSearch: TButton;
    edtSearch: TEdit;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Organisation: TfrmOrganisation;

implementation

{$R *.dfm}

procedure TfrmOrganisation.btnSearchClick(Sender: TObject);
begin
dmCO2.adoOrganisation.Filtered := False;
    dmCO2.adoOrganisation.Filter := 'OrganisationName like ' + uppercase(quotedstr(edtSearch.Text));
    dmCO2.adoOrganisation.Filtered := True;
end;

procedure TfrmOrganisation.FormActivate(Sender: TObject);
begin
 imgAddOrganisation.Picture.LoadFromFile('.\images\Health.png');
  imgAddOrganisation.Stretch := True;
end;

end.
