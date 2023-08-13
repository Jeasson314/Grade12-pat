unit u_organisation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, dm_CO2, ExtCtrls, jpeg, pngimage, ComCtrls;

type
  TfrmOrganisation = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    imgSelectOrganisation: TImage;
    btnSearch: TButton;
    edtSearch: TEdit;
    GroupBox2: TGroupBox;
    edtOrganisation: TEdit;
    Label1: TLabel;
    imgCreateOrganisation: TImage;
    edtEmissions: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    btnAddOrganisation: TButton;
    redoutOrgansiation: TRichEdit;
    procedure FormActivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure imgSelectOrganisationClick(Sender: TObject);
    procedure imgCreateOrganisationClick(Sender: TObject);
    procedure btnAddOrganisationClick(Sender: TObject);
  private
    function dbCheck(sOrganisation: string): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Organisation: TfrmOrganisation;

implementation

uses u_Signup;
{$R *.dfm}

procedure TfrmOrganisation.btnAddOrganisationClick(Sender: TObject);
begin
  frm_organisation.Close;
  frmSignup.redoutOrganisation.Lines.Add(objSignup.OrganisationToString)
end;

procedure TfrmOrganisation.btnSearchClick(Sender: TObject);
begin
  try
    dmCO2.ADOOrganisation.Filtered := False;
    dmCO2.ADOOrganisation.Filter := 'OrganisationName like ' +
      (quotedstr(edtSearch.Text));
    dmCO2.ADOOrganisation.Filtered := True;

  except
    begin
      if edtSearch.Text = '' then
        MessageDlg('Please enter a value to search for', mtWarning, [mbOk], 0);
      showmessage('An error has when trying to search');
    end;
  end;
end;

function TfrmOrganisation.dbCheck(sOrganisation: string): boolean;
begin
  result := True;
  with dmCO2 do
  begin
    ADOOrganisation.first;
    while (not ADOOrganisation.eof) and (result = True) do
    begin
      if ADOOrganisation['OrganisationName'] = sOrganisation then
      begin
        result := False;
        exit;
      end
      else
        ADOOrganisation.Next;
    end;
  end;
end;

procedure TfrmOrganisation.FormActivate(Sender: TObject);
begin
  imgSelectOrganisation.Picture.LoadFromFile('.\images\Health.png');
  imgSelectOrganisation.Stretch := True;
  imgCreateOrganisation.Picture.LoadFromFile('.\images\Health.png');
  imgCreateOrganisation.Stretch := True;
end;

procedure TfrmOrganisation.imgCreateOrganisationClick(Sender: TObject);
var
  sOrganisation: string;
  iEmission: integer;
begin
  sOrganisation := edtOrganisation.Text;
  iEmission := strtoint(edtEmissions.Text);
  if dbCheck(sOrganisation) = False then
    showmessage(
      'Organisation already exist, please use the above grid to select it')
  else
    with dmCO2 do
    begin
      // adoCars.Last;
      // adoCars.Close;
      if ADOOrganisation.Active then
      begin
        TRY
          ADOOrganisation.Insert;
          ADOOrganisation['OrganisationName'] := sOrganisation;
          // ADOOrganisation['Model'] := '';
          ADOOrganisation['OrganiastionGoals'] := iEmission;
          ADOOrganisation.Post;
        except
          showmessage('There was an error while tring to insert organisation');
        END;
      end;
      objSignup.addOrganisation(ADOOrganisation['OrganisationID'],
        sOrganisation, True);
      btnAddOrganisation.Enabled := True;
      redoutOrgansiation.Lines.Add(objSignup.OrganisationToString);
    end;

end;

procedure TfrmOrganisation.imgSelectOrganisationClick(Sender: TObject);
begin
  try
    objSignup.addOrganisation(dmCO2.ADOOrganisation['OrganisationID'],
      dmCO2.ADOOrganisation['OrganisationName'], False);
    btnAddOrganisation.Enabled := True;
    redoutOrgansiation.Lines.Add(objSignup.OrganisationToString);
  except
    showmessage('An error has occured when trying to select an Organisation');
  end;
end;

end.
